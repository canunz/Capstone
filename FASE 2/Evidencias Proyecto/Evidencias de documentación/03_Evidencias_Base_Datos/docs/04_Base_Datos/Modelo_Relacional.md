# Modelo relacional y origen de relaciones

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Alcance

El modelo distingue JPA, FK explícitas en SQL y referencias por ID. Incluye co_conocimiento_busqueda (JDBC), omitida en el entregable previo. No se conectó a MySQL ni se modificó el esquema. Los archivos anteriores de entregables se conservan como versión histórica.

La cardinalidad es una lectura del contrato: un padre puede tener cero o muchos hijos; cada hijo requiere uno o admite cero/uno según nulabilidad declarada. No expresa filas existentes. La proyección JDBC espera como máximo un documento por conocimiento, sin certificar unicidad física.

Archivos: [Draw.io editable](../../Diagramas/DimaBug_Modelo_Relacional_v2.drawio), [imagen PNG](../../Diagramas/DimaBug_Modelo_Relacional_v2.png) y [SVG ampliable](../../Diagramas/DimaBug_Modelo_Relacional_v2.svg).

## Relaciones y opcionalidad

| Padre | Hija | Columna hija | Evidencia | Padre por fila hija | Hijos por padre |
|---|---|---|---|---|---|
| u_rol | u_usuario | rol_id | JPA | 1 | 0..N |
| u_departamento | u_responsable | departamento_id | REF | 1 | 0..N |
| u_departamento | u_departamento_contacto | departamento_id | REF | 1 | 0..N |
| cl_hardware | cl_hardware_sistema | hardware_id | JPA | No confirmado | 0..N |
| cl_sistema | cl_hardware_sistema | sistema_id | JPA | No confirmado | 0..N |
| cl_sistema | cl_modulo | sistema_id | JPA | 0..1 | 0..N |
| cl_hardware | co_conocimiento | hardware_id | JPA | 0..1 | 0..N |
| cl_sistema | co_conocimiento | sistema_id | JPA | 0..1 | 0..N |
| cl_modulo | co_conocimiento | modulo_id | JPA | 0..1 | 0..N |
| cl_frecuencia | co_conocimiento | frecuencia_id | JPA | 0..1 | 0..N |
| u_usuario | co_conocimiento | creado_por | JPA | 1 | 0..N |
| u_usuario | co_conocimiento | modificado_por | JPA | 0..1 | 0..N |
| u_usuario | pr_procedimiento | creado_por | JPA | 1 | 0..N |
| u_usuario | pr_procedimiento | modificado_por | JPA | 0..1 | 0..N |
| co_conocimiento | co_sintoma | conocimiento_id | REF | 1 | 0..N |
| co_conocimiento | co_causa | conocimiento_id | REF | 1 | 0..N |
| co_conocimiento | co_solucion | conocimiento_id | REF | 1 | 0..N |
| co_conocimiento | co_material_apoyo | conocimiento_id | REF | 0..1 | 0..N |
| co_conocimiento | co_conocimiento_prueba | conocimiento_id | REF | 1 | 0..N |
| co_prueba | co_conocimiento_prueba | prueba_id | JPA | 1 | 0..N |
| co_solucion | co_solucion_asignacion | solucion_id | JPA | 1 | 0..N |
| u_responsable | co_solucion_asignacion | responsable_id | JPA | 0..1 | 0..N |
| u_departamento | co_solucion_asignacion | departamento_id | JPA | 0..1 | 0..N |
| pr_procedimiento | pr_paso | procedimiento_id | REF | 1 | 0..N |
| pr_procedimiento | se_ejecucion | procedimiento_id | REF | 1 | 0..N |
| u_usuario | se_ejecucion | usuario_id | JPA | 1 | 0..N |
| se_ejecucion | se_ejecucion_paso | ejecucion_id | REF | 1 | 0..N |
| pr_paso | se_ejecucion_paso | paso_id | REF | 1 | 0..N |
| pr_paso | co_material_apoyo | paso_id | REF | 0..1 | 0..N |
| co_solucion | se_resultado | solucion_id | REF | 1 | 0..N |
| u_usuario | se_resultado | usuario_id | REF | 1 | 0..N |
| u_usuario | ticket | solicitante_id | REF | 1 | 0..N |
| u_usuario | ticket | asignado_id | REF | 0..1 | 0..N |
| cl_hardware | ticket | hardware_id | REF | 0..1 | 0..N |
| cl_sistema | ticket | sistema_id | REF | 0..1 | 0..N |
| cl_modulo | ticket | modulo_id | REF | 0..1 | 0..N |
| co_conocimiento | ticket | conocimiento_id | REF | 0..1 | 0..N |
| ticket | ticket_comentario | ticket_id | SQL | 1 | 0..N |
| ticket | ticket_historial_estado | ticket_id | SQL | 1 | 0..N |
| ticket | ticket_adjunto | ticket_id | SQL | 1 | 0..N |
| ticket | ticket_ticket_etiqueta | ticket_id | SQL | 1 | 0..N |
| u_usuario | ticket_comentario | autor_id | REF | 1 | 0..N |
| u_usuario | ticket_adjunto | autor_id | REF | 1 | 0..N |
| u_usuario | ticket_historial_estado | usuario_id | REF | 1 | 0..N |
| ticket_comentario | ticket_adjunto | comentario_id | SQL | 0..1 | 0..N |
| ticket_etiqueta | ticket_ticket_etiqueta | etiqueta_id | SQL | 1 | 0..N |
| co_conocimiento | co_conocimiento_busqueda | conocimiento_id | JDBC | No confirmado | 0..1 esperado, no DDL |

## FK explícitas en los scripts

| Hija y columna | Padre | Constraint | Fuente |
|---|---|---|---|
| ticket_adjunto.comentario_id | ticket_comentario.id | fk_ticket_adjunto_comentario | `dima-bug-backend/src/main/resources/db/migration/V20261017_02__tickets_adjuntos_y_nivel_etiqueta.sql` |
| ticket_adjunto.ticket_id | ticket.id | fk_ticket_adjunto_ticket | `dima-bug-backend/src/main/resources/db/migration/V20261017_02__tickets_adjuntos_y_nivel_etiqueta.sql` |
| ticket_comentario.ticket_id | ticket.id | fk_ticket_comentario_ticket | `dima-bug-backend/src/main/resources/db/migration/V20261017_01__modulo_tickets.sql` |
| ticket_historial_estado.ticket_id | ticket.id | fk_ticket_historial_ticket | `dima-bug-backend/src/main/resources/db/migration/V20261017_01__modulo_tickets.sql` |
| ticket_ticket_etiqueta.etiqueta_id | ticket_etiqueta.id | fk_tte_etiqueta | `dima-bug-backend/src/main/resources/db/migration/V20261017_01__modulo_tickets.sql` |
| ticket_ticket_etiqueta.ticket_id | ticket.id | fk_tte_ticket | `dima-bug-backend/src/main/resources/db/migration/V20261017_01__modulo_tickets.sql` |

No hay FK SQL hacia usuarios/catálogos/conocimiento en los scripts de Tickets. La relación Conocimiento–Prueba y Hardware–Sistema son N:M mediante tablas puente. La relación Solución–Procedimiento directa no se encuentra mapeada. La definición de pasos no tiene snapshot capturado por ejecución en este árbol.


## Referencias

[Índice vigente](../../../01_Evidencias_Documentacion/docs/README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
