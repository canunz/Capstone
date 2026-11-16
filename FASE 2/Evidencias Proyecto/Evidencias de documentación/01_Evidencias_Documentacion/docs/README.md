# Documentación vigente de DimaBug

Fecha de referencia: 2026-11-06. Este índice reúne las guías basadas en el checkout auditado. Los documentos de dima-bug-backend/docs y frontend-dimabug/docs conservan su valor histórico y no sustituyen estas guías actualizadas.

## Consulta

| Documento | Uso |
|---|---|
| [Proyecto y alcance](01_Proyecto/Descripcion_Proyecto.md) | Proyecto y alcance |
| [Objetivos y exclusiones](01_Proyecto/Objetivos_Alcance.md) | Objetivos y exclusiones |
| [Método y procedencia](01_Proyecto/Metodologia.md) | Método y procedencia |
| [RF reconstruidos](02_Requisitos/Requisitos_Funcionales.md) | RF reconstruidos |
| [RNF y criterios pendientes](02_Requisitos/Requisitos_No_Funcionales.md) | RNF y criterios pendientes |
| [HU documentales](02_Requisitos/Historias_Usuario.md) | HU documentales |
| [Casos de uso](02_Requisitos/Casos_Uso.md) | Casos de uso |
| [Arquitectura general](03_Arquitectura/Arquitectura_General.md) | Arquitectura general |
| [Backend](03_Arquitectura/Arquitectura_Backend.md) | Backend |
| [Frontend](03_Arquitectura/Arquitectura_Frontend.md) | Frontend |
| [Modelo relacional](../../03_Evidencias_Base_Datos/docs/04_Base_Datos/Modelo_Relacional.md) | Modelo relacional |
| [Diccionario de datos](../../03_Evidencias_Base_Datos/docs/04_Base_Datos/Diccionario_Datos.md) | Diccionario de datos |
| [Migraciones](../../03_Evidencias_Base_Datos/docs/04_Base_Datos/Migraciones.md) | Migraciones |
| [124 mappings REST](05_API/Endpoints.md) | 124 mappings REST |
| [DTO y validaciones](05_API/Contratos_DTO.md) | DTO y validaciones |
| [Autenticación](05_API/Autenticacion.md) | Autenticación |
| [Errores HTTP](05_API/Errores_HTTP.md) | Errores HTTP |
| [Seguridad](06_Seguridad/Arquitectura_Seguridad.md) | Seguridad |
| [Controles y pendientes](06_Seguridad/Controles_Seguridad.md) | Controles y pendientes |
| [Estrategia de pruebas](07_Pruebas/Estrategia_Pruebas.md) | Estrategia de pruebas |
| [Resultados verificados](07_Pruebas/Resultados_Pruebas.md) | Resultados verificados |
| [Ejecución local](08_Despliegue/Instalacion_Local.md) | Ejecución local |
| [Configuración sin secretos](08_Despliegue/Variables_Entorno.md) | Configuración sin secretos |
| [Preparación STAGING](08_Despliegue/Despliegue_STAGING.md) | Preparación STAGING |
| [Manual de usuario](09_Manuales/Manual_Usuario.md) | Manual de usuario |
| [Manual técnico](09_Manuales/Manual_Tecnico.md) | Manual técnico |
| [Trazabilidad](auditoria/MATRIZ_TRAZABILIDAD.md) | Trazabilidad |
| Auditoría inicial (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`) | Auditoría inicial |
| [Cierre documental y pendientes](auditoria/REPORTE_FINAL_DOCUMENTACION.md) | Cierre documental y pendientes |

## Qué está acreditado

920 pruebas backend y 284 Angular aprobadas en la auditoría, más comprobaciones TypeScript. Arquitectura de monolito modular con puertos/adaptadores y ArchUnit específico de Tickets. Modelo lógico de 31 tablas, sin certificación de esquema físico. Los resultados no se volvieron a ejecutar por cambios exclusivamente documentales.

## Límites vigentes

Sin MySQL real, E2E/UAT, CI remoto, despliegue o restauración certificados. Snapshot de pasos ausente en este árbol; recuperación de contraseña parcial; avisos/favoritos locales y reportes demostrativos. Dependencias afectadas y riesgos funcionales no fueron corregidos. La entrega documental no es un GO de producción.

## Historia y conservación

- [Referencias históricas ausentes](auditoria/REFERENCIAS_HISTORICAS.md).
- Registro de conservación de originales (fuente en repositorio: `docs/auditoria/historico/README.md`).
- Las 43 fuentes documentales iniciales constan en la auditoría original, que permanece intacta.
- Carpeta de entrega académica (fuente en repositorio: `entrega_duoc/README.md`).
