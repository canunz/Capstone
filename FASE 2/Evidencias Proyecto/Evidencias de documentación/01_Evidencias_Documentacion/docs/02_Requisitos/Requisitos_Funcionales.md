# Requisitos funcionales reconstruidos

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Estado de aprobación

Los identificadores RF de esta guía son una **reconstrucción documental para trazabilidad**, derivados del código. No se presentan como requisitos originales aprobados por Duoc, el cliente o un Product Owner. La equivalencia con requisitos oficiales queda [PENDIENTE DE VERIFICACIÓN].

| ID documental | Capacidad observada | Evidencia fuente | Estado |
|---|---|---|---|
| RF-01 | Autenticar y consultar sesión | `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/AuthController.java` | Implementada y verificada en escenarios locales |
| RF-02 | Administrar usuarios y consultar roles | `dima-bug-backend/src/main/java/cl/casol/backend/identidad/application/service/AdministrarUsuariosService.java` | Implementada y verificada en escenarios locales |
| RF-03 | Administrar catálogos y asociaciones | `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/application/service/AdministrarCatalogosService.java` | Implementada y verificada en escenarios locales |
| RF-04 | Administrar departamentos y contactos | `dima-bug-backend/src/main/java/cl/casol/backend/identidad/application/service/AdministrarOrganizacionService.java` | Implementada y verificada en escenarios locales |
| RF-05 | Administrar responsables | `dima-bug-backend/src/main/java/cl/casol/backend/identidad/application/service/AdministrarResponsablesService.java` | Implementada y verificada en escenarios locales |
| RF-06 | Mantener conocimiento y visibilidad | `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/application/service/MantenerConocimientoService.java` | Implementada y verificada en escenarios locales |
| RF-07 | Buscar contenido publicado mediante índice | `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/adapter/BusquedaConocimientoJdbcAdapter.java` | Implementada, pero no verificada en MySQL |
| RF-08 | Mantener soluciones y autoservicio | `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/application/service/AdministrarSolucionService.java` | Implementada y verificada en escenarios locales |
| RF-09 | Administrar y asociar pruebas | `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/application/service/AdministrarPruebasService.java` | Implementada y verificada en escenarios locales |
| RF-10 | Definir y publicar procedimientos con pasos | `dima-bug-backend/src/main/java/cl/casol/backend/procedimiento/application/service/MantenerProcedimientoService.java` | Implementada y verificada en escenarios locales |
| RF-11 | Registrar ejecución y cumplimiento | `dima-bug-backend/src/main/java/cl/casol/backend/ejecucion/application/service/GestionarEjecucionService.java` | Implementada y verificada en escenarios locales; concurrencia pendiente |
| RF-12 | Registrar resultados y efectividad | `dima-bug-backend/src/main/java/cl/casol/backend/seguimiento/application/service/RegistrarEfectividadSolucionService.java` | Implementada y verificada en escenarios locales |
| RF-13 | Gestionar materiales y archivos | `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/application/service/ArchivoMaterialService.java` | Implementada y verificada en escenarios locales; recuperación pendiente |
| RF-14 | Gestionar ciclo de tickets | `dima-bug-backend/src/main/java/cl/casol/backend/tickets/domain/Ticket.java` | Implementada y verificada en escenarios locales; MySQL pendiente |
| RF-15 | Consultar soluciones autoservicio con asistente | `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/application/service/ConsultarChatbotService.java` | Implementada y verificada como búsqueda, no LLM |

## Capacidades parciales y ausencias

Avisos: derivados de consultas y caché local, entrega integrada pendiente. Favoritos: navegador local, sin sincronización backend acreditada. Reportes: serie mensual literal. Nuevo error: persistencia local distinta de Tickets. Recuperación de contraseña: frontend y requests, sin endpoints. Snapshot de pasos: documentado históricamente, no encontrado. NFC, LLM externo, email y push: sin implementación o requisito aprobado encontrado; no se reclasifican como plan oficial.

La aceptación funcional integral y el cierre de cada RF requieren datos/ambiente y criterio formal, no solo presencia de clases. Los roles y transiciones actuales se documentan en manual y controles de seguridad.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
