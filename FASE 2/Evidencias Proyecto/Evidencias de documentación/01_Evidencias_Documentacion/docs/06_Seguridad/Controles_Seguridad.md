# Controles y riesgos de seguridad

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Matriz de controles implementados

| Recurso/acción | Control del código |
|---|---|
| /api/admin/** | ADMINISTRADOR antes de reglas generales |
| GET conocimiento, hardware, sistemas, frecuencias y procedimientos | A/T/S/U; visibilidad adicional de borradores/eliminados |
| Escritura operacional de catálogos/conocimiento/procedimientos y ejecuciones | A/T/S según matchers; publicación de conocimiento/procedimiento exige A |
| DELETE de conocimiento | Solo A, borrado lógico |
| /api/usuarios/** y /api/roles/** | A |
| POST /api/chatbot/consultas | A/T/S/U |
| /api/tickets y descendientes | A/T/S/U a nivel HTTP, actor/propietario/estado se valida en casos de uso |
| GET /api/etiquetas | A/T/S/U |
| Escritura /api/etiquetas/** | S/T |
| GET /, /api/health, /api/auth/login y /error según matcher | Rutas públicas declaradas; método real depende del controller |

La matriz de matchers no autoriza todas las acciones al mismo perfil. El administrador supervisa Tickets; las acciones de atención pueden rechazarlo. Un usuario ve sus tickets y no las notas internas del personal.

## Archivos

Materiales verifica MIME/firma y límite de 10 MB en código; Tickets admite hasta 25 MB en su contrato. No se comprobó que límites multipart/proxy desplegados permitan esos tamaños. Las descargas pasan por controles de pertenencia/visibilidad. Se mantiene riesgo operativo de huérfanos, crash y limpieza fallida.

## Dependencias y OWASP

La auditoría npm del 06-11-2026 informó 54 entradas afectadas, cuatro críticas en dependencias transitivas dev. Revisar paquete/ruta, versión y exposición antes de decidir actualizaciones. No se ejecutó audit fix ni se modificó el lockfile. No hay escaneo SCA Maven completo. Referencia de taxonomía: OWASP Top 10:2025, enlazada en la auditoría original.

## Validaciones pendientes

HTTP real y redespacho de errores, revocación/cambio de rol entre instancias, expiración visible en frontend, limpieza/partición de caché, rate limiting externo, TLS/CORS efectivo, mínimo privilegio MySQL y almacenamiento, revisión de secretos y restauración probada. [PENDIENTE DE VERIFICACIÓN] donde dependa del entorno o de decisiones del equipo.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
