# Presupuesto Migracion Web a Python + Business Central

## Resumen ejecutivo

Se propone rehacer la intranet actual de NewSecuryTechnics, actualmente publicada en `https://bc-nav.ns-technic.com/principal.php`, como una aplicacion web moderna en Python, manteniendo la funcionalidad existente y conectandola con Business Central o NAV mediante servicios estandar.

La propuesta no esta relacionada con la extension AL existente en este repositorio. El alcance se refiere exclusivamente a la migracion de la web/intranet actual y a su integracion con Business Central/NAV.

Importe recomendado para alcance base: 22.000 EUR + IVA.

Plazo estimado: 6 a 8 semanas desde la validacion del alcance funcional y disponibilidad de accesos tecnicos.

## Supuestos de partida

- La web actual es una intranet con autenticacion y entorno de preproduccion.
- La nueva solucion se desarrollara en Python, preferiblemente con Django por su gestion nativa de usuarios, permisos, formularios, panel administrativo y seguridad.
- La integracion con Business Central/NAV se realizara mediante APIs REST, OData o Web Services publicados, segun la version disponible.
- Microsoft documenta Business Central con APIs REST, OData y SOAP, siendo REST/OData la opcion preferente para integraciones modernas: [web services de Business Central](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/webservices/web-services).
- Para Business Central online o entornos con Microsoft Entra ID, la autenticacion recomendada es OAuth2: [autenticacion OAuth en Business Central](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/webservices/authenticate-web-services-using-oauth).
- No se contempla acceso directo a SQL salvo aprobacion expresa, porque aumenta el riesgo de integridad de datos, permisos, auditoria y mantenimiento.

## Alcance base incluido

El presupuesto base incluye:

- Analisis funcional de la intranet actual: pantallas, perfiles, flujos, formularios, listados, permisos y datos intercambiados con Business Central/NAV.
- Desarrollo de una aplicacion web Python con autenticacion, roles de usuario, menus, formularios, validaciones y trazabilidad basica.
- Migracion funcional de las pantallas actuales dentro de un alcance razonable de intranet: hasta 8 pantallas o modulos principales.
- Conector con Business Central/NAV para lectura y escritura de datos mediante servicios publicados.
- Gestion de errores de integracion, logs tecnicos y mensajes comprensibles para el usuario.
- Entorno de preproduccion para validacion funcional.
- Puesta en marcha en produccion.
- Documentacion tecnica basica y formacion breve de uso.

## Integracion con Business Central/NAV

La integracion se planteara por este orden:

1. APIs estandar de Business Central, si cubren las entidades necesarias.
2. OData v4 sobre paginas, consultas o codeunits publicados como web services.
3. SOAP solo si la version de NAV/BC o el objeto publicado lo obliga.
4. Desarrollo adicional en Business Central/NAV solo si no existe endpoint suficiente para el proceso requerido.

Queda pendiente de confirmar:

- Version exacta de Business Central/NAV.
- Si el entorno es online, on-premise o NAV antiguo.
- Tipo de autenticacion disponible: OAuth2, usuario web service, dominio, certificado u otro mecanismo.
- Lista de endpoints existentes y permisos.
- Compania o companias sobre las que debe operar la intranet.

## Fases del proyecto

### Fase 1. Auditoria funcional y tecnica

Duracion estimada: 1 semana.

Actividades:

- Revision navegada de la web actual con usuario autorizado.
- Inventario de pantallas, roles y procesos.
- Identificacion de datos que se leen o escriben en Business Central/NAV.
- Validacion de version, endpoints y autenticacion.
- Cierre del alcance funcional definitivo.

Entregable:

- Documento de alcance cerrado y mapa de integracion.

### Fase 2. Diseno y preparacion tecnica

Duracion estimada: 1 semana.

Actividades:

- Estructura del proyecto Python.
- Modelo de usuarios, permisos y configuracion.
- Diseno de servicios de integracion con BC/NAV.
- Preparacion de entornos y despliegue inicial.

Entregable:

- Aplicacion base desplegada en preproduccion.

### Fase 3. Desarrollo funcional

Duracion estimada: 2 a 3 semanas.

Actividades:

- Desarrollo de pantallas y formularios.
- Validaciones de negocio.
- Listados y busquedas.
- Control de permisos por perfil.
- Registro de actividad y errores relevantes.

Entregable:

- Version funcional para pruebas internas.

### Fase 4. Integracion con Business Central/NAV

Duracion estimada: 1 a 2 semanas.

Actividades:

- Conexion segura con Business Central/NAV.
- Lectura y escritura de datos.
- Gestion de errores de servicios.
- Pruebas de integracion con datos reales de preproduccion.

Entregable:

- Flujos integrados validados con el cliente.

### Fase 5. Pruebas, puesta en marcha y formacion

Duracion estimada: 1 semana.

Actividades:

- Pruebas funcionales con usuarios clave.
- Correcciones finales.
- Despliegue en produccion.
- Documentacion y formacion breve.

Entregable:

- Solucion operativa en produccion.

## Desglose economico

Tarifa usada para la estimacion: 600 EUR/dia.

- Analisis funcional y tecnico: 2 dias, 1.200 EUR.
- Diseno tecnico y preparacion del proyecto: 3 dias, 1.800 EUR.
- Desarrollo aplicacion Python: 12 dias, 7.200 EUR.
- Integracion con Business Central/NAV: 10 dias, 6.000 EUR.
- Pruebas, correcciones y puesta en marcha: 6 dias, 3.600 EUR.
- Documentacion, formacion y gestion del proyecto: 3 dias, 1.800 EUR.
- Margen de ajuste y estabilizacion inicial: 400 EUR.

Total propuesta base: 22.000 EUR + IVA.

## Opciones alternativas

Opcion reducida: 15.000 a 17.000 EUR + IVA.

Aplicable si la intranet tiene pocas pantallas, la integracion es principalmente de consulta y no hay procesos complejos de escritura en Business Central/NAV.

Opcion recomendada: 22.000 EUR + IVA.

Aplicable si hay usuarios, permisos, formularios, listados, escrituras en Business Central/NAV, validaciones y puesta en marcha controlada.

Opcion ampliada: 28.000 a 35.000 EUR + IVA.

Aplicable si hay muchos modulos, adjuntos, informes complejos, flujos de aprobacion, integraciones adicionales o necesidad de desarrollar objetos nuevos en Business Central/NAV.

## Costes recurrentes

- Hosting o servidor gestionado: 30 a 150 EUR/mes, segun infraestructura y requisitos de seguridad.
- Mantenimiento correctivo y evolutivo: bolsa recomendada de 500 a 915 EUR/mes.
- Monitorizacion, copias de seguridad y soporte: a definir segun proveedor.
- Licencias Microsoft, usuarios de Business Central/NAV y certificados: no incluidos salvo acuerdo especifico.

## Exclusiones

- No incluye licencias de Microsoft, hosting, dominios ni certificados.
- No incluye redisenar procesos de negocio que no existan en la intranet actual.
- No incluye migracion historica compleja desde una base de datos propia de la web si no se confirma en la auditoria.
- No incluye desarrollos AL en Business Central/NAV salvo que se contraten como ampliacion.
- No incluye integraciones con terceros distintas de Business Central/NAV.
- No incluye acceso directo a SQL ni modificaciones directas en base de datos.
- No incluye soporte 24x7.

## Condiciones para cerrar el presupuesto

Antes de convertir esta propuesta en contrato cerrado se debe realizar una auditoria inicial con acceso controlado a la intranet y al entorno de Business Central/NAV.

La auditoria debe confirmar:

- Numero real de pantallas y formularios.
- Roles de usuario y permisos.
- Procesos que crean o modifican datos.
- Datos intercambiados con Business Central/NAV.
- Version y modalidad de Business Central/NAV.
- Endpoints disponibles y metodo de autenticacion.
- Necesidad o no de migrar datos historicos.

Si el alcance real supera el alcance base incluido, se presentara una ampliacion antes de iniciar el desarrollo afectado.

## Seguridad

Las credenciales de la intranet no deben aparecer en presupuestos, correos ni documentacion comercial. Si se han compartido por canales no seguros, se recomienda cambiarlas y crear un usuario temporal especifico para la auditoria.

La nueva aplicacion debera usar:

- HTTPS obligatorio.
- Variables de entorno para secretos.
- Usuarios nominativos.
- Control de permisos por rol.
- Registro de accesos y errores relevantes.
- Copias de seguridad y plan basico de restauracion.

## Validez

Esta propuesta es valida durante 30 dias y queda condicionada a la auditoria funcional y tecnica inicial.
