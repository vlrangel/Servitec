#!/usr/bin/env python3
"""
Auditoria ligera de la intranet NewSecuryTechnics.

El script pide usuario y password en consola para no dejarlos escritos en
comandos, ficheros ni historiales. Solo hace GET tras el login y no envia
formularios funcionales.
"""

from __future__ import annotations

import argparse
import getpass
import html
import http.cookiejar
import json
import re
import ssl
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from dataclasses import dataclass, field
from html.parser import HTMLParser
from pathlib import Path
from typing import Iterable


DEFAULT_BASE_URL = "https://bc-nav.ns-technic.com/"
DEFAULT_SEEDS = [
    "",
    "principal.php",
    "index.php",
    "incidencias.php",
    "incidencias.php?listar=S&filtroTecnico=",
    "mantenimientos.php?listar=S&filtroTecnico=",
    "obras.php",
    "obras.php?listar=S&filtroTecnico=",
    "partetrabajo.php?norden=",
    "inventarioCentro.php?filtroCentro=",
    "prcPedidoTransferencia.php",
    "mensaje.json",
]

SKIP_EXTENSIONS = (
    ".png",
    ".jpg",
    ".jpeg",
    ".gif",
    ".webp",
    ".svg",
    ".ico",
    ".woff",
    ".woff2",
    ".ttf",
    ".eot",
    ".pdf",
    ".zip",
    ".rar",
    ".7z",
)

SKIP_KEYWORDS = (
    "delete",
    "eliminar",
    "borrar",
    "guardar",
    "save",
    "cancelar",
    "confirmar",
    "recibir",
    "enviar",
    "terminar",
    "registrar",
    "anadir",
    "insertar",
    "subir",
    "upload",
)


@dataclass
class FormInfo:
    method: str
    action: str
    inputs: list[str] = field(default_factory=list)


@dataclass
class PageInfo:
    url: str
    final_url: str
    status: int
    content_type: str
    title: str = ""
    h1: list[str] = field(default_factory=list)
    links: list[str] = field(default_factory=list)
    scripts: list[str] = field(default_factory=list)
    forms: list[FormInfo] = field(default_factory=list)
    php_refs: list[str] = field(default_factory=list)
    error: str = ""


class PageParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.title = ""
        self.h1: list[str] = []
        self.links: list[str] = []
        self.scripts: list[str] = []
        self.forms: list[FormInfo] = []
        self._capture: str | None = None
        self._buffer: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        attr = {k.lower(): v or "" for k, v in attrs}
        tag = tag.lower()
        if tag == "title":
            self._capture = "title"
            self._buffer = []
        elif tag == "h1":
            self._capture = "h1"
            self._buffer = []
        elif tag == "a" and attr.get("href"):
            self.links.append(attr["href"])
        elif tag == "script" and attr.get("src"):
            self.scripts.append(attr["src"])
        elif tag == "form":
            self.forms.append(
                FormInfo(
                    method=(attr.get("method") or "GET").upper(),
                    action=attr.get("action", ""),
                )
            )
        elif tag in {"input", "select", "textarea"} and self.forms:
            name = attr.get("name") or attr.get("id") or tag
            input_type = attr.get("type") or tag
            self.forms[-1].inputs.append(f"{name} ({input_type})")

    def handle_endtag(self, tag: str) -> None:
        tag = tag.lower()
        if self._capture == "title" and tag == "title":
            self.title = clean_text("".join(self._buffer))
            self._capture = None
        elif self._capture == "h1" and tag == "h1":
            text = clean_text("".join(self._buffer))
            if text:
                self.h1.append(text)
            self._capture = None

    def handle_data(self, data: str) -> None:
        if self._capture:
            self._buffer.append(data)


def clean_text(value: str) -> str:
    value = html.unescape(value or "")
    value = re.sub(r"<[^>]+>", " ", value)
    value = re.sub(r"\s+", " ", value)
    return value.strip()


def normalize_url(base_url: str, href: str) -> str | None:
    if not href:
        return None
    href = href.strip()
    if href.startswith(("javascript:", "mailto:", "tel:", "#")):
        return None
    return urllib.parse.urljoin(base_url, href)


def same_host(url: str, base_url: str) -> bool:
    return urllib.parse.urlparse(url).netloc == urllib.parse.urlparse(base_url).netloc


def looks_safe_get(url: str) -> bool:
    parsed = urllib.parse.urlparse(url)
    path = parsed.path.lower()
    query = parsed.query.lower()
    if path.endswith(SKIP_EXTENSIONS):
        return False
    combined = f"{path}?{query}"
    return not any(keyword in combined for keyword in SKIP_KEYWORDS)


def page_key(url: str) -> str:
    parsed = urllib.parse.urlparse(url)
    query = urllib.parse.parse_qsl(parsed.query, keep_blank_values=True)
    query = [(k, v) for k, v in query if k.lower() not in {"sid", "phpsessid"}]
    normalized_query = urllib.parse.urlencode(query)
    return urllib.parse.urlunparse(
        (parsed.scheme, parsed.netloc, parsed.path, "", normalized_query, "")
    )


def request_text(
    opener: urllib.request.OpenerDirector,
    url: str,
    data: bytes | None = None,
    timeout: int = 20,
) -> tuple[int, str, str, str]:
    req = urllib.request.Request(
        url,
        data=data,
        headers={
            "User-Agent": "Mozilla/5.0 audit-intranet/1.0",
            "Accept": "text/html,application/xhtml+xml,application/json,text/javascript,*/*",
        },
    )
    if data is not None:
        req.add_header("Content-Type", "application/x-www-form-urlencoded")

    try:
        with opener.open(req, timeout=timeout) as resp:
            raw = resp.read(1_000_000)
            charset = resp.headers.get_content_charset() or "utf-8"
            return (
                resp.getcode(),
                resp.geturl(),
                resp.headers.get("Content-Type", ""),
                raw.decode(charset, "replace"),
            )
    except urllib.error.HTTPError as exc:
        raw = exc.read(200_000)
        charset = exc.headers.get_content_charset() or "utf-8"
        return (
            exc.code,
            exc.geturl(),
            exc.headers.get("Content-Type", ""),
            raw.decode(charset, "replace"),
        )


def extract_php_refs(text: str) -> list[str]:
    refs = re.findall(
        r"[A-Za-z0-9_./?=&%-]+\.php[A-Za-z0-9_./?=&%-]*",
        text,
        flags=re.IGNORECASE,
    )
    return sorted(set(refs))


def parse_page(url: str, final_url: str, status: int, content_type: str, text: str) -> PageInfo:
    parser = PageParser()
    if "html" in content_type.lower() or "<html" in text.lower():
        parser.feed(text)
    return PageInfo(
        url=url,
        final_url=final_url,
        status=status,
        content_type=content_type,
        title=parser.title,
        h1=parser.h1,
        links=sorted(set(parser.links)),
        scripts=sorted(set(parser.scripts)),
        forms=parser.forms,
        php_refs=extract_php_refs(text),
    )


def make_markdown(pages: Iterable[PageInfo], base_url: str) -> str:
    pages = list(pages)
    ok_pages = [p for p in pages if not p.error]

    lines = [
        "# Auditoria preliminar intranet NewSecuryTechnics",
        "",
        f"URL base: `{base_url}`",
        "",
        "## Resumen",
        "",
        f"- Paginas revisadas: {len(pages)}.",
        f"- Paginas con respuesta util: {len(ok_pages)}.",
        "- Auditoria de solo lectura: no se han enviado formularios funcionales.",
        "",
        "## Pantallas detectadas",
        "",
    ]

    for page in sorted(ok_pages, key=lambda p: p.final_url):
        label = page.title or ", ".join(page.h1) or page.final_url
        lines.append(f"- `{page.final_url}` - {label} - HTTP {page.status}")

    lines.extend(["", "## Formularios detectados", ""])
    any_forms = False
    for page in ok_pages:
        for form in page.forms:
            any_forms = True
            action = normalize_url(page.final_url, form.action) or page.final_url
            inputs = ", ".join(form.inputs) if form.inputs else "sin campos detectados"
            lines.append(f"- `{page.final_url}` -> {form.method} `{action}`: {inputs}")
    if not any_forms:
        lines.append("- No se han detectado formularios en las paginas revisadas.")

    lines.extend(["", "## Referencias PHP detectadas", ""])
    refs: set[str] = set()
    for page in ok_pages:
        for ref in page.php_refs:
            normalized = normalize_url(page.final_url, ref)
            if normalized and same_host(normalized, base_url):
                refs.add(normalized)
    for ref in sorted(refs):
        lines.append(f"- `{ref}`")
    if not refs:
        lines.append("- No se han detectado referencias PHP adicionales.")

    lines.extend(["", "## Errores o bloqueos", ""])
    errors = [p for p in pages if p.error]
    if errors:
        for page in errors:
            lines.append(f"- `{page.url}`: {page.error}")
    else:
        lines.append("- No se han registrado errores durante la auditoria.")

    lines.extend(
        [
            "",
            "## Notas",
            "",
            "- Este inventario debe revisarse manualmente antes de cerrar presupuesto.",
            "- Las rutas de proceso o acciones destructivas se han omitido de forma preventiva.",
            "- Las credenciales usadas no se guardan en este informe.",
            "",
        ]
    )
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description="Audita pantallas de una intranet PHP tras login.")
    parser.add_argument("--base-url", default=DEFAULT_BASE_URL)
    parser.add_argument("--output-dir", default="docs")
    parser.add_argument("--max-pages", type=int, default=80)
    parser.add_argument("--delay", type=float, default=0.4)
    args = parser.parse_args()

    base_url = args.base_url.rstrip("/") + "/"
    username = input("Usuario temporal: ").strip()
    password = getpass.getpass("Password temporal: ")
    if not username or not password:
        print("Usuario y password son obligatorios.", file=sys.stderr)
        return 2

    cookie_jar = http.cookiejar.CookieJar()
    context = ssl.create_default_context()
    opener = urllib.request.build_opener(
        urllib.request.HTTPCookieProcessor(cookie_jar),
        urllib.request.HTTPSHandler(context=context),
    )

    login_data = urllib.parse.urlencode(
        {"usuario": username, "password": password, "entrar": "Acceder a Intranet"}
    ).encode("utf-8")

    print("Iniciando sesion...")
    status, final_url, content_type, text = request_text(opener, base_url, data=login_data)
    if status >= 400:
        print(f"Login devolvio HTTP {status}.", file=sys.stderr)
        return 1
    if "formulario_login" in text and "Acceso a intranet" in text:
        print("El login parece no haber sido aceptado.", file=sys.stderr)
        return 1

    queue: list[str] = [urllib.parse.urljoin(base_url, seed) for seed in DEFAULT_SEEDS]
    seen: set[str] = set()
    pages: list[PageInfo] = []

    while queue and len(seen) < args.max_pages:
        url = queue.pop(0)
        key = page_key(url)
        if key in seen or not same_host(url, base_url) or not looks_safe_get(url):
            continue
        seen.add(key)

        try:
            print(f"GET {url}")
            status, final_url, content_type, body = request_text(opener, url)
            info = parse_page(url, final_url, status, content_type, body)
            pages.append(info)

            candidates = list(info.links) + list(info.scripts) + list(info.php_refs)
            for href in candidates:
                next_url = normalize_url(final_url, href)
                if (
                    next_url
                    and same_host(next_url, base_url)
                    and looks_safe_get(next_url)
                    and page_key(next_url) not in seen
                    and next_url not in queue
                ):
                    queue.append(next_url)
        except Exception as exc:  # noqa: BLE001 - auditoria, interesa registrar el fallo.
            pages.append(
                PageInfo(
                    url=url,
                    final_url=url,
                    status=0,
                    content_type="",
                    error=str(exc),
                )
            )
        time.sleep(args.delay)

    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    json_path = output_dir / "auditoria-intranet-nstechnic.json"
    md_path = output_dir / "Auditoria-Intranet-NewSecuryTechnics.md"

    serializable = [
        {
            "url": page.url,
            "final_url": page.final_url,
            "status": page.status,
            "content_type": page.content_type,
            "title": page.title,
            "h1": page.h1,
            "links": page.links,
            "scripts": page.scripts,
            "forms": [form.__dict__ for form in page.forms],
            "php_refs": page.php_refs,
            "error": page.error,
        }
        for page in pages
    ]
    json_path.write_text(json.dumps(serializable, ensure_ascii=False, indent=2), encoding="utf-8")
    md_path.write_text(make_markdown(pages, base_url), encoding="utf-8")

    print(f"Informe Markdown: {md_path}")
    print(f"Datos JSON: {json_path}")
    print("Credenciales no guardadas.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
