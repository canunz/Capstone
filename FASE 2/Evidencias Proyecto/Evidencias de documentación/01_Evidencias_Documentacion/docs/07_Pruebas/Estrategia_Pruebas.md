# Estrategia y alcance de pruebas

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Capas existentes

| Clase de evidencia | Herramientas/escenario | Alcance |
|---|---|---|
| Unitarias backend | JUnit/Mockito y puertos simulados | Reglas, interacción y casos de uso |
| Slices web | WebMvcTest/MockMvc con servicios o puertos simulados | DTO, controllers y cadena de seguridad en contexto de test |
| Arquitectura | ArchUnit, seis reglas Tickets | Dependencias específicas del módulo |
| Persistencia local | Dos clases JPA H2 en memoria | Copia concurrente de solución y materiales sin OSIV, no InnoDB/FULLTEXT |
| Frontend | Jasmine/Karma/ChromeHeadless | Componentes, servicios, HTTP simulado, guards y navegación probada |
| Compilación | TypeScript noEmit | Tipado de aplicación y specs |
| Funcionales E2E / UAT | No disponibles en este árbol | [PENDIENTE DE VERIFICACIÓN] |

La palabra IntegrationTest en un nombre no prueba que se conecte a MySQL. Las cinco IT Testcontainers citadas en guías históricas no están presentes.

## Ejecución local de referencia

Backend: `mvnw.cmd -o test`, desde su carpeta, con dependencias Maven ya existentes y Java 21. Frontend: `npm.cmd test -- --watch=false --browsers=ChromeHeadless`, con paquetes ya instalados. Los comandos fueron ejecutados en la auditoría, no se repitieron por cambios exclusivamente documentales.

## Próximos ensayos necesarios

Checkout limpio/configuración reproducible, MySQL aislado con DDL revisado, FULLTEXT, correlativo/edición simultánea Tickets, cierre/checklist, conservación de historia, reindexación postcommit, recuperación BD/filesystem, UAT por perfil y accesibilidad. No hay autorización implícita de crear bases o ejecutar migraciones.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
