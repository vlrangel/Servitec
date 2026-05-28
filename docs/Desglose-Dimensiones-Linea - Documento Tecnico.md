# Documento técnico: Desglose de dimensiones por línea

**Proyecto:** Campos Servitec (Kuara by MayBeCloud)  
**Funcionalidad:** Proceso de desglose de dimensiones por línea al registrar documentos  
**Versión documento:** 1.0  
**Fecha:** Febrero 2025  

---

## 1. Objetivo

Definir técnicamente el desarrollo de un proceso que, **al registrar** un documento (factura, abono, diario), desglose el importe de cada línea entre las dimensiones configuradas de forma que **el apunte contable se vea afectado**: en lugar de una sola línea de asiento por línea de documento, se generan **tantas líneas de asiento como desgloses** (una por cada dimensión/importe del desglose). El sistema comprobará que el documento cuadre antes de registrar. Además se mantendrá la tabla Desglose Dimensiones Línea para trazabilidad y análisis.

---

## 2. Alcance funcional

- **Documentos afectados (configurables):**
  - Facturas de venta
  - Abonos de venta
  - Diarios de venta
  - Facturas de compra
  - Abonos de compra
  - Diarios de compra

- **Momento de ejecución:** Al **registrar** el documento (posting), por cada línea del documento.

- **Efecto en el asiento contable:** El apunte contable se ve afectado por el desglose: por cada línea del documento se generan **tantas líneas en el asiento (G/L Entry u equivalentes) como líneas de desglose** haya (cada una con su importe y dimensión). No se genera una sola línea de asiento por línea de documento, sino N líneas (N = número de desgloses para esa línea).

- **Comprobación de cuadre:** El sistema comprobará que el documento cuadre: la suma de los importes del desglose de cada línea debe coincidir con el importe de la línea, y el documento en su conjunto debe cuadrar antes de permitir el registro.

- **Salida adicional:** Tabla **Desglose Dimensiones Línea** con el importe asignado a cada dimensión por cada línea registrada (trazabilidad y consultas).

---

## 3. Modelo de datos

### 3.1 Tabla: Desglose Dimensiones Línea

Almacena el **importe** asignado a cada dimensión por cada línea de documento registrada. Cada registro de esta tabla corresponde a una de las líneas de desglose que, a su vez, generará (o se refleja en) una línea de apunte contable en el asiento.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| Entry No. | Integer | Clave primaria, autoincremental |
| Document Type | Option | Tipo documento: Factura Venta, Abono Venta, Diario Venta, Factura Compra, Abono Compra, Diario Compra |
| Document No. | Code[20] | Número del documento |
| Document Line No. | Integer | Nº de línea del documento |
| Line No. | Integer | Nº de secuencia dentro del desglose de la línea (si varias dimensiones) |
| Dimension Code | Code[20] | Código de dimensión (ej. DEPARTAMENTO, PROYECTO) |
| Dimension Value Code | Code[20] | Código valor de dimensión |
| Amount | Decimal | Importe asignado a esta dimensión en esta línea |
| Amount (LCY) | Decimal | Importe en moneda local |
| Account No. | Code[20] | Cuenta contable de la línea (si aplica) |
| Posting Date | Date | Fecha contable |
| Document Date | Date | Fecha documento |
| Source No. | Code[20] | Nº cliente/proveedor según tipo documento |
| Description | Text[100] | Descripción (opcional, para trazabilidad) |
| Dimension Set ID | Integer | ID del conjunto de dimensiones de la línea (referencia) |

**Claves:**  
- Primary Key: Entry No.  
- Índices recomendados: Document Type + Document No. + Document Line No.; Dimension Code + Dimension Value Code; Posting Date.

---

### 3.2 Tabla: Configuración Desglose Dimensiones (documentos afectados)

Define **en qué tipos de documento** está activo el desglose.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| Primary Key | Code[20] | Código único de configuración (ej. "DEFAULT") |
| Factura Venta | Boolean | Aplicar desglose al registrar facturas de venta |
| Abono Venta | Boolean | Aplicar desglose al registrar abonos de venta |
| Diario Venta | Boolean | Aplicar desglose en diarios de venta |
| Factura Compra | Boolean | Aplicar desglose al registrar facturas de compra |
| Abono Compra | Boolean | Aplicar desglose al registrar abonos de compra |
| Diario Compra | Boolean | Aplicar desglose en diarios de compra |

**Nota:** Una sola fila de configuración (p. ej. por compañía) o extensión de *General Ledger Setup* / tabla de setup específica.

---

### 3.3 Tabla: Desglose por defecto (porcentajes por cuenta y dimensión)

Define el **reparto porcentual por defecto** por cuenta contable y dimensión, usado cuando no hay desglose manual en la línea.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| Account No. | Code[20] | Cuenta contable (G/L Account) |
| Dimension Code | Code[20] | Código de dimensión |
| Dimension Value Code | Code[20] | Código valor de dimensión |
| Default % | Decimal | Porcentaje por defecto (0–100) para esta cuenta + dimensión |

**Restricción:** La suma de porcentajes por una misma cuenta (y opcionalmente por documento/tipo) no debe superar 100 % (validación en OnValidate o en codeunit).

**Claves:**  
- Primary Key: Account No. + Dimension Code + Dimension Value Code (o variante según reglas de negocio).

---

## 4. Flujo del proceso

1. **Comprobación de configuración**  
   Al registrar, se consulta la **Configuración Desglose Dimensiones** para el tipo de documento actual. Si el desglose no está activo para ese tipo, se sigue el registro estándar (una línea de asiento por línea de documento). Si está activo, se aplica el flujo de desglose.

2. **Cálculo del desglose por línea (antes o durante el posting)**  
   Por cada línea del documento a registrar:
   - Obtener importe de la línea (Amount / Amount (LCY)) y Dimension Set ID (y cuenta si aplica).
   - Determinar desglose:
     - **Opción A:** Si la línea tiene desglose manual (subform/registros temporales), usar esos importes/porcentajes.
     - **Opción B:** Si no hay desglose manual, aplicar **Desglose por defecto** según cuenta y dimensión: usar los porcentajes configurados y calcular importes por dimensión.

3. **Comprobación de cuadre**  
   - Para cada línea: la **suma de los importes del desglose** debe coincidir con el importe de la línea (con la regla de redondeo definida).
   - A nivel documento: el sistema comprobará que el documento cuadre (totales, debe/haber, etc.). Si no cuadra, no se permite el registro y se informa al usuario.

4. **Generación del asiento contable**  
   - El **apunte contable se ve afectado** por el desglose: en lugar de crear una sola línea de asiento por línea de documento, se crean **tantas líneas de asiento como líneas de desglose** (cada una con su importe, cuenta y dimensión correspondiente).
   - Integración en el flujo de posting: hay que intervenir en el momento en que se generan las G/L Entry (o líneas equivalentes) para que, cuando el desglose esté activo, se generen las N líneas (una por desglose) en lugar de una sola. Esto puede requerir eventos OnBefore/OnAfter en las codeunits de posting o lógica propia que reemplace/complemente la creación estándar de apuntes.

5. **Trazabilidad**  
   - Para cada línea de desglose generada (y por tanto cada línea de asiento), se inserta o actualiza el registro correspondiente en la tabla **Desglose Dimensiones Línea** (Document Type, Document No., Document Line No., Dimension Code, Dimension Value Code, Amount, Amount (LCY), Account No., fechas, etc.) para consultas e informes.

---

## 5. Puntos de integración (eventos / codeunits)

- **Venta**
  - Factura: `Codeunit 80 Sales-Post` — intervenir en el flujo que genera G/L entries (p. ej. antes de crear la línea de asiento por línea de documento) para, si desglose activo, generar tantas líneas de asiento como desgloses y comprobar cuadre.
  - Abono: mismo codeunit, documento tipo Credit Memo.
  - Diario venta: codeunit de posting del diario correspondiente (Sales Journal).

- **Compra**
  - Factura: `Codeunit 90 Purch.-Post` — misma lógica: intervenir en la generación de apuntes para desglosar en N líneas y comprobar cuadre.
  - Abono: mismo codeunit, documento tipo Credit Memo.
  - Diario compra: codeunit de posting del diario de compras.

Flujo en cada punto de integración:
1. Comprobar si el desglose está activo para ese tipo de documento.
2. Para cada línea a registrar: calcular desglose (manual o por defecto).
3. **Comprobar que el documento cuadre** (suma desgloses = importe línea; documento balanceado). Si no cuadra, error y no registrar.
4. En el momento de crear las líneas de asiento: generar **tantas líneas de asiento como líneas de desglose** (cada una con su importe y dimensión), no una sola por línea de documento.
5. Insertar/actualizar **Desglose Dimensiones Línea** para trazabilidad.

---

## 6. Páginas (UI)

- **Lista Desglose Dimensiones Línea (Page):** Lista/card de registros de la tabla Desglose Dimensiones Línea con filtros por documento, fecha, dimensión.
- **Configuración documentos (Page):** Página de configuración (o parte del setup existente) para activar/desactivar desglose por tipo de documento (factura/abono/diario venta y compra).
- **Desglose por defecto (Page):** Subform o matriz Cuenta × Dimensión × Valor con porcentaje por defecto.

Opcional: **Subform en líneas** de factura/abono/diario para introducir desglose manual por línea antes de registrar (los importes/porcentajes se guardarían en una tabla temporal o en extensión de línea y se usarían en el proceso al registrar).

---

## 7. Consideraciones técnicas

- **Cuadre:** La comprobación de que el documento cuadre es obligatoria cuando el desglose está activo: suma de importes de desglose por línea = importe de la línea; totales del documento correctos. Sin cuadre no se debe permitir el registro.
- **Moneda:** Mantener Amount y Amount (LCY) en Desglose Dimensiones Línea y en las líneas de asiento generadas para documentos en divisa.
- **Redondeo:** Definir regla de redondeo (última dimensión absorbe diferencia o reparto proporcional) para que la suma de desgloses = importe línea y no haya desviaciones en el asiento.
- **Generación del asiento:** La lógica estándar de BC crea una línea de G/L Entry por línea de documento; hay que interceptar o sustituir esa creación para generar N líneas (una por desglose) cuando el desglose esté activo. Evaluar eventos disponibles en Sales-Post, Purch.-Post y codeunits de diarios.
- **Rendimiento:** Inserción de múltiples líneas de asiento y de Desglose Dimensiones Línea; valorar commits por documento.
- **Permisos:** Incluir nuevas tablas/páginas en el Permission Set de la extensión (Campos Servitec).

---

## 8. Resumen de objetos a crear/modificar

| Tipo | Objeto | Descripción |
|------|--------|-------------|
| Table | Desglose Dimensiones Línea | Registros de importe por dimensión por línea registrada |
| Table | Config. Desglose Dimensiones | Documentos en los que aplicar desglose |
| Table | Desglose por defecto (cuenta/dimensión/%) | Porcentajes por defecto por cuenta y dimensión |
| Page | Lista Desglose Dimensiones Línea | Consulta de desgloses |
| Page | Config. documentos desglose | Configurador documentos afectados |
| Page | Desglose por defecto | Configurador porcentajes por cuenta/dimensión |
| Codeunit | Desglose Dimensiones Mgt (o similar) | Lógica de cálculo e inserción |
| Event Subscribers | En Sales-Post / Purch.-Post (y diarios) | Llamada al proceso tras registrar |

---

## 9. Criterios de aceptación (resumen)

- Al registrar factura/abono/diario (venta/compra) con desglose activo, **el apunte contable se ve afectado**: se generan **tantas líneas de asiento como líneas de desglose** (no una sola por línea de documento).
- El sistema **comprueba que el documento cuadre** antes de registrar: suma de importes del desglose = importe de la línea; documento balanceado. Si no cuadra, no se registra y se informa al usuario.
- La configuración permite activar/desactivar el desglose por tipo de documento.
- El desglose por defecto se aplica por cuenta y dimensión cuando no hay desglose manual.
- La suma de importes por línea en Desglose Dimensiones Línea coincide con el importe de la línea del documento (considerando redondeo), y cada línea de asiento generada corresponde a una línea de desglose.
