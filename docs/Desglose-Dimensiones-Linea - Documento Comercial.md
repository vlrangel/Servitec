# Desglose de dimensiones por línea — Documento comercial

**Producto:** Campos Servitec (Kuara by MayBeCloud)  
**Funcionalidad:** Desglose de dimensiones por línea al registrar documentos  
**Público:** Dirección, Comercial, Clientes  

---

## ¿Qué es?

Una funcionalidad que **reparte automáticamente el importe de cada línea** de facturas, abonos y diarios (venta y compra) entre las **dimensiones** que usted utilice (departamento, proyecto, centro de coste, etc.). Al registrar, **el propio apunte contable se ve afectado**: en lugar de una sola línea de asiento por línea de documento, el sistema genera **tantas líneas de asiento como desgloses** haya (cada una con su importe y dimensión). El sistema comprueba que el documento cuadre antes de registrar.

---

## Problema que resuelve

- Hoy una línea de documento genera **un solo apunte contable** con un conjunto de dimensiones; no se desglosa **qué parte del importe** corresponde a cada dimensión en el propio asiento.
- Para análisis por departamento, proyecto o centro de coste hacen falta **varios apuntes por dimensión** (o importes desglosados), no un único apunte por línea.
- Hacer este reparto a mano en Excel o en asientos posteriores es lento, propenso a errores y difícil de auditar. Con esta funcionalidad el asiento se genera ya desglosado y el sistema comprueba que cuadre.

---

## Beneficios

| Beneficio | Descripción |
|-----------|-------------|
| **Asiento desglosado** | El apunte contable refleja el desglose: tantas líneas de asiento como desgloses (cada una con su importe y dimensión), no una sola por línea de documento. |
| **Cuadre garantizado** | El sistema comprueba que el documento cuadre antes de registrar; si la suma del desglose no coincide con la línea, no se registra. |
| **Trazabilidad** | Queda registrado cuánto se ha imputado a cada dimensión en cada línea (tabla Desglose Dimensiones Línea) para consultas e informes. |
| **Configuración flexible** | Usted elige en qué documentos se aplica: facturas y/o abonos y/o diarios, de venta y/o de compra. |
| **Reglas por defecto** | Se pueden definir porcentajes por defecto por cuenta y dimensión para que el sistema proponga el reparto automáticamente. |

---

## Para quién es útil

- **Contabilidad y controlling:** Análisis por centros de coste, departamentos o proyectos con importes ya desglosados.
- **Dirección:** Cuadros de mando y reporting por dimensión con datos fiables y auditables.
- **Auditoría:** Comprobación de cómo se han repartido los importes entre dimensiones en facturas y diarios.

---

## Cómo funciona (visión de negocio)

1. **Configuración de documentos**  
   En un configurador se indica en qué documentos se aplica el desglose: facturas de venta, abonos de venta, diarios de venta, facturas de compra, abonos de compra, diarios de compra. Se activa o desactiva cada tipo según necesidad.

2. **Reglas por defecto (opcional)**  
   En otro configurador se definen **porcentajes por defecto** por cuenta contable y dimensión (por ejemplo: cuenta 600000 → 70 % Departamento A, 30 % Departamento B). Así, al registrar, el sistema puede proponer el reparto sin introducir datos línea a línea.

3. **Al registrar el documento**  
   Cuando se registra una factura, abono o asiento de diario (según lo configurado), el sistema:
   - Toma cada línea del documento y aplica el desglose (manual o porcentaje por defecto).
   - **Comprueba que el documento cuadre**: la suma de los importes del desglose debe coincidir con el importe de cada línea; si no cuadra, no se permite el registro.
   - **Genera el asiento desglosado**: en lugar de una línea de apunte por línea de documento, genera **tantas líneas de asiento como desgloses** (cada una con su importe y dimensión).
   - Guarda en **Desglose Dimensiones Línea** el detalle por dimensión para trazabilidad y consultas.

4. **Consulta y reporting**  
   Los datos del desglose están en la propia contabilidad (asientos desglosados) y en la tabla Desglose Dimensiones Línea para listados, informes y análisis por documento, fecha, cuenta, dimensión e importe.

---

## Resumen de la oferta

- **Asiento contable desglosado:** Al registrar, se generan tantas líneas de asiento como desgloses (no una por línea de documento); el apunte contable queda desglosado por dimensión e importe.
- **Comprobación de cuadre:** El sistema verifica que el documento cuadre antes de registrar; si la suma del desglose no coincide con la línea, no se registra.
- **Tabla “Desglose Dimensiones Línea”:** Histórico de importes por dimensión por cada línea registrada (trazabilidad y consultas).
- **Configurador de documentos:** Activar/desactivar el desglose en facturas, abonos y diarios (venta y compra).
- **Configurador de porcentajes por defecto:** Definir el reparto por defecto por cuenta y dimensión para automatizar el desglose al registrar.

---

## Mensaje comercial (elevator pitch)

*“Con el desglose de dimensiones por línea, **el propio apunte contable se desglosa**: cada línea de documento genera tantas líneas de asiento como desgloses (cada una con su importe y dimensión). El sistema comprueba que el documento cuadre antes de registrar. Usted elige en qué documentos se aplica y puede definir reglas por defecto por cuenta. Contabilidad ya desglosada por dimensión, sin trabajo manual ni repartos en Excel.”*

---

**Versión:** 1.0 · Febrero 2025
