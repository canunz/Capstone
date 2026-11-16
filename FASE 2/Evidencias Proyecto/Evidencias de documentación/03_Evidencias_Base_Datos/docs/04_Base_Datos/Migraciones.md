# Migraciones y provisión

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


Los cinco SQL de `dima-bug-backend/src/main/resources/db/migration/` son archivos de ejecución manual. No hay runner Flyway/Liquibase ni DDL inicial completo en el checkout. No se ejecutaron durante la auditoría o la organización documental.

| Orden por nombre | Propósito | Precaución |
|---|---|---|
| V20260925_01 | Estado ELIMINADO de conocimiento | Requiere tabla y definición previa compatibles |
| V20261013_01 | Título, estado y autoservicio de solución | ALTER INSTANT sujeto a versión/motor/esquema |
| V20261014_01 | Versionado departamento/contacto y control organizacional | Revisar aplicación por sentencia; la fila de control es requisito del servicio |
| V20261017_01 | Tickets y relaciones internas | IF NOT EXISTS no compara una estructura existente |
| V20261017_02 | Nivel de etiqueta y adjuntos | Contiene DROP TABLE IF EXISTS ticket_adjunto: puede borrar metadatos existentes |

No se entrega un comando de aplicación masiva. La existencia de un archivo no demuestra que se haya aplicado ni que el esquema sea correcto.

## Procedimiento pendiente del DBA

Confirmar instancia autorizada, versión, esquema, procedencia del DDL base y copia de estructura saneada. Registrar restricciones y datos de ensayo, revisar cada sentencia y las que ya estén aplicadas, planificar conservación de adjuntos y probar restauración. Ejecutar únicamente en entorno aislado tras autorización independiente. No generar una falsa prueba de paridad creando esquema desde JPA y validándolo contra esas mismas entidades.

`V20261008_01__agregar_fk_usuarios_autoria_seguimiento.sql` y `V20261009_01__snapshot_pasos_ejecucion.sql` son referencias de documentos históricos y no están presentes. No se reconstruyen ni se marcan aplicadas.


## Referencias

[Índice vigente](../../../01_Evidencias_Documentacion/docs/README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
