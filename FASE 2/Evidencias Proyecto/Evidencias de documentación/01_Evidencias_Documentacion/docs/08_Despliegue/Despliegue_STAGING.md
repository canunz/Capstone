# Preparación de STAGING

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


**Estado: despliegue no ejecutado ni certificado.** Esta guía organiza las condiciones previas documentadas por QA015/QA016 y handoff. No convierte esas propuestas en evidencia de un servidor instalado o actualizado.

## Puertas antes de un GO

1. Confirmar versión exacta MySQL, instancia/esquema autorizado y DDL base saneado.
2. Resolver discrepancias de snapshot, integración MySQL y CI entre documentación y checkout.
3. Validar los cinco scripts por sentencia y conservación de datos, especialmente DROP de adjuntos.
4. Reproducir persistencia, FULLTEXT, transacciones y carreras prioritarias en ambiente aislado.
5. Revisar dependencias afectadas y riesgos de archivos/índice, con decisión formal del equipo.
6. Acreditar respaldo/restauración de BD y uploads y compatibilidad semántica del retorno de aplicación.
7. Definir build/release, SHA, checksums y correspondencia entre Angular, backend y esquema.
8. Verificar TLS, proxy SPA/API, límites de archivo, permisos, variables externas y monitoreo.
9. Obtener UAT por perfil y aprobación específica de publicación/SQL.

## Artefactos previstos, no generados aquí

JAR ejecutable, contenido completo del build Angular de producción y configuración externa. No se reutilizan checksums históricos como si fueran archivos actuales. No se incluye .jar.original como entregable ejecutable. Las instrucciones de servicio, rutas del servidor, DNS y responsable quedan [PENDIENTE DE VERIFICACIÓN].

## Retorno

Un rollback de aplicación no deshace DDL ni garantiza compatibilidad con estados/contratos nuevos. No se entrega un DROP de reversión ni una restauración automática. Preferir recuperación hacia adelante cuando corresponda, con DBA y operación autorizados. Nunca ejecutar una migración o despliegue por leer esta guía.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
