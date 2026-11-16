# Manual técnico

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Punto de entrada

Usar el índice vigente para arquitectura, instalación, configuración, API y datos. El repositorio contiene frontend-dimabug y dima-bug-backend bajo una sola raíz. El backend usa Maven Wrapper/Java 21; frontend Angular CLI con lockfile. Las versiones exactas auditadas están en README y resultados.

## Ejecución y configuración

Seguir Instalacion_Local y Variables_Entorno. El recurso compartido application.properties falta en el checkout; el perfil staging y las propiedades estándar son rutas de configuración diferentes. No llenar esa ausencia con credenciales por defecto. Revisar instancia, esquema, uploads y puerto antes de un arranque autorizado. No se ejecuta el backend contra una base para descubrir a cuál conecta.

## Contratos de mantenimiento

No confundir entidades JPA con el DDL físico. El diccionario indica origen y límites por columna. La búsqueda requiere una proyección JDBC y FULLTEXT cuyo DDL no está incluido. Scripts parciales no son un procedimiento de provisión completo. No usar create/update de Hibernate para hacer pasar una verificación física.

Los controllers convierten DTO y delegan a casos de uso/servicios. Cambios futuros deben conservar puertos y límites de Tickets y revisar acoplamientos existentes. No existe control ArchUnit global del monolito. Respetar inmutabilidad de PUBLICADOS, permisos y pertenencia de hijos.

## Diagnóstico

Usar errores HTTP seguros y trazas restringidas. DEBUG de JWT puede contener email/URI/rol: confirmar nivel antes de compartir logs. No adjuntar tokens, passwords, hashes de cuentas reales, env, dumps o reportes sin saneamiento. Una excepción SQL no debe publicarse como mensaje de usuario.

Archivos y BD requieren recuperación coordinada. La compensación no equivale a una transacción distribuida; una limpieza/reindexación postcommit puede quedar pendiente. Definir reconciliación y registrar incidencias sin borrar datos para ocultar fallos. Ninguna tarea destructiva está automatizada por esta documentación.

## Pruebas y releases

Consultar Estrategia_Pruebas y Resultados_Pruebas. La suite local aprobada no prueba MySQL, carga o el despliegue. Una entrega posterior debe relacionar commit/working tree, build limpio, lockfile, JAR/Angular/esquema, checksums, ensayos y UAT. No hay workflow ejecutable de CI en este árbol aunque existan guías históricas.

## Pendientes operacionales

Propietarios del sistema, canal de incidentes, RPO/RTO, rotación de claves, backups/restauración, límites de producción, observabilidad y aprobaciones académicas: [PENDIENTE DE VERIFICACIÓN]. No se inventan runbooks con nombres de unidades/rutas/servidores no confirmados.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
