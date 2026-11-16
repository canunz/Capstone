# Arquitectura del backend

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Responsabilidades

| Módulo | Contratos y comportamiento |
|---|---|
| identidad | Login, usuarios/roles, departamentos/contactos/responsables y API pública para integración |
| catalogo | Hardware, sistemas, módulos, frecuencias y asociaciones |
| conocimiento | Conocimiento, síntomas, causas, pruebas, soluciones/asignaciones, materiales, búsqueda y asistente autoservicio |
| procedimiento | Definiciones BORRADOR/PUBLICADO, pasos y materiales |
| ejecucion | Inicio, checklist, consulta por propietario/admin, completar y cancelar |
| seguimiento | Resultados y efectividad de soluciones |
| tickets | Agregado Ticket, casos de uso, comentarios, historial, etiquetas y adjuntos |
| shared | Seguridad HTTP, errores, visibilidad y contratos/adaptadores compartidos |

## Dependencias comprobadas

Domain no importa Spring/JPA ni Application/Infrastructure en la inspección realizada. Application consume puertos, pero utiliza anotaciones Spring y transacciones. Infrastructure implementa puertos y convierte DTO, dominio y entidades. Tickets expone puertos de entrada e integra otros módulos mediante sus paquetes `api`; el control ArchUnit es específico de este módulo.

Procedimiento reutiliza DTO de Conocimiento. Mappers/entidades y adaptadores de varios módulos comparten tipos de persistencia. Los controllers fuera de Tickets no tienen un puerto de entrada uniforme. Estos límites se conservan, sin rediseño documental ficticio.

## Recorrido real de creación de ticket

`TicketController.crear` valida `CrearTicketRequest` y llama a `CrearTicketUseCase`. `CrearTicketService` obtiene actor, rechaza administrador, valida clasificación, calcula código y crea el agregado. `TicketRepositoryAdapter` persiste cabecera e historial mediante Spring Data. El controller devuelve `TicketDetalleResponse` y declara HTTP 201.

La transacción de aplicación no elimina la carrera MAX+1 ni reemplaza control de edición concurrente. No hay snapshot de instrucciones en checklist actual. Los riesgos H-05/H-06 permanecen abiertos.

## Archivos y búsqueda

JPA/JDBC comparten transacciones cuando los servicios y DataSource lo permiten, pero no se comprobó MySQL en esta entrega. Filesystem queda fuera de la transacción BD. Materiales usa compensación; reindexaciones de organización/pruebas pueden ocurrir AFTER_COMMIT y quedar pendientes ante fallo, sin outbox durable identificado.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
