# Resultados verificables de pruebas

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


Fecha del ensayo: 2026-11-06, America/Santiago. Rama `codex/integracion-mvp`, HEAD `e0d63d961b87c33d77937821c53802e6387a783e`, con cambios locales anteriores descritos en auditoría. No es resultado de CI remoto ni certificación del artefacto desplegado.

| Comprobación | Resultado | Evidencia |
|---|---|---|
| Backend, Maven offline | 920 ejecutadas, 0 fallos, 0 errores, 0 omitidas | 92 XML Surefire y resumen COMPROBACIONES.json |
| Angular, Chrome Headless 157 | TOTAL: 284 SUCCESS, salida 0 | Salida de herramienta resumida en COMPROBACIONES.json |
| TypeScript aplicación | Salida 0 | tsc noEmit, tsconfig.app.json |
| TypeScript specs | Salida 0 | tsc noEmit, tsconfig.spec.json |
| npm audit | 54 entradas afectadas: 4 críticas, 20 altas, 28 moderadas, 2 bajas | DEPENDENCIAS_NPM.json |

Backend terminó 23:11:44 -03:00 con BUILD SUCCESS, tiempo Maven 02:13. Usó target incremental existente; no se declara compilación limpia. Java 21.0.12.1, Maven 3.9.16, Boot 4.1.1. Los intentos iniciales restringidos se interrumpieron por el agente JVM/lanzador de navegador; no cuentan como PASS o defecto funcional. La repetición autorizada fuera del sandbox completó las suites.

Los logs originales pueden contener valores sintéticos de autenticación: no se distribuyen. Se entrega un resumen saneado con conteos y hashes; la evidencia de frontend es un resumen de salida, no un XML JUnit inventado. Los XML backend generados se conservaron en target local, fuera de la entrega académica.

No se ensayó MySQL, STAGING, UAT, carga, pentest, restauración o despliegue. No hay porcentaje de cobertura calculado. Warnings de Mockito y 404 del logo en Karma no alteraron el resultado final; siguen documentados como límites.

## Detalle por clase backend

| Clase | Ejecutadas | Fallos | Errores | Omitidas |
|---|---|---|---|---|
| cl.casol.backend.AdminCatalogoSecurityIntegrationTest | 7 | 0 | 0 | 0 |
| cl.casol.backend.AdminOrganizacionSecurityIntegrationTest | 12 | 0 | 0 | 0 |
| cl.casol.backend.AdminPruebasSecurityIntegrationTest | 8 | 0 | 0 | 0 |
| cl.casol.backend.AdminSolucionCopiaSecurityTest | 9 | 0 | 0 | 0 |
| cl.casol.backend.catalogo.application.service.AdministrarCatalogosServiceTest | 14 | 0 | 0 | 0 |
| cl.casol.backend.catalogo.application.service.ConsultarSistemasServiceTest | 2 | 0 | 0 | 0 |
| cl.casol.backend.catalogo.application.service.ModulosQa011ServiceTest | 12 | 0 | 0 | 0 |
| cl.casol.backend.catalogo.infrastructure.persistence.adapter.ModuloReferenciasQa011Test | 1 | 0 | 0 | 0 |
| cl.casol.backend.CatalogoSecurityIntegrationTest | 5 | 0 | 0 | 0 |
| cl.casol.backend.CatalogosOrganizacionSecurityIntegrationTest | 13 | 0 | 0 | 0 |
| cl.casol.backend.CausaSecurityIntegrationTest | 14 | 0 | 0 | 0 |
| cl.casol.backend.ChatbotSecurityIntegrationTest | 8 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.AdministrarPruebasServiceTest | 14 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.AdministrarSolucionServiceTest | 10 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.ArchivoMaterialServiceTest | 25 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.BuscarConocimientoServiceTest | 2 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.ConsultarChatbotServiceTest | 3 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.CopiarSolucionServiceTest | 16 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.GestionarAsignacionSolucionServiceTest | 16 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.GestionarPruebasConocimientoServiceTest | 14 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.IndexarConocimientoServiceTest | 12 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.MantenerCausaServiceTest | 10 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.MantenerConocimientoServiceTest | 15 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.MantenerMaterialApoyoServiceTest | 9 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.MantenerSintomaServiceTest | 9 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.MantenerSolucionServiceTest | 16 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.ReutilizarMaterialServiceTest | 16 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.application.service.SolucionConcurrenciaQa009Test | 2 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.infrastructure.persistence.adapter.BusquedaAutoservicioTest | 2 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.infrastructure.persistence.adapter.BusquedaConocimientoJdbcAdapterTest | 4 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.infrastructure.persistence.adapter.BusquedaSolucionQa009Test | 1 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.infrastructure.persistence.adapter.MaterialApoyoRepositoryAdapterTest | 5 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.infrastructure.persistence.adapter.PruebaRepositoryAdapterTest | 2 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.infrastructure.persistence.adapter.PruebasPersistenciaQa013Test | 6 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.infrastructure.persistence.adapter.SolucionPersistenciaQa009Test | 5 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.infrastructure.persistence.CopiarSolucionJpaConcurrencyTest | 9 | 0 | 0 | 0 |
| cl.casol.backend.conocimiento.infrastructure.persistence.MaterialesSinOsivJpaTest | 5 | 0 | 0 | 0 |
| cl.casol.backend.ContenidoRestringidoSecurityIntegrationTest | 12 | 0 | 0 | 0 |
| cl.casol.backend.ejecucion.application.service.GestionarEjecucionServiceTest | 22 | 0 | 0 | 0 |
| cl.casol.backend.EliminarMaterialApoyoTest | 26 | 0 | 0 | 0 |
| cl.casol.backend.Hu01SecurityIntegrationTest | 8 | 0 | 0 | 0 |
| cl.casol.backend.Hu02SecurityIntegrationTest | 14 | 0 | 0 | 0 |
| cl.casol.backend.Hu03SecurityIntegrationTest | 14 | 0 | 0 | 0 |
| cl.casol.backend.Hu04SecurityIntegrationTest | 5 | 0 | 0 | 0 |
| cl.casol.backend.Hu05SecurityIntegrationTest | 10 | 0 | 0 | 0 |
| cl.casol.backend.Hu06SecurityIntegrationTest | 7 | 0 | 0 | 0 |
| cl.casol.backend.Hu07SecurityIntegrationTest | 14 | 0 | 0 | 0 |
| cl.casol.backend.identidad.application.service.AdministrarOrganizacionServiceTest | 24 | 0 | 0 | 0 |
| cl.casol.backend.identidad.application.service.AdministrarResponsablesServiceTest | 18 | 0 | 0 | 0 |
| cl.casol.backend.identidad.application.service.AdministrarUsuariosServiceTest | 13 | 0 | 0 | 0 |
| cl.casol.backend.identidad.application.service.AutenticarUsuarioServiceTest | 4 | 0 | 0 | 0 |
| cl.casol.backend.identidad.application.service.ConsultarOrganizacionServiceTest | 5 | 0 | 0 | 0 |
| cl.casol.backend.identidad.application.service.OrganizacionConcurrenciaTest | 3 | 0 | 0 | 0 |
| cl.casol.backend.identidad.application.service.OrganizacionOperacionalQa012Test | 2 | 0 | 0 | 0 |
| cl.casol.backend.identidad.application.service.ReindexarOrganizacionTest | 4 | 0 | 0 | 0 |
| cl.casol.backend.identidad.infrastructure.persistence.adapter.AdministracionOrganizacionRepositoryAdapterTest | 6 | 0 | 0 | 0 |
| cl.casol.backend.identidad.infrastructure.persistence.adapter.AdministracionResponsableRepositoryAdapterTest | 3 | 0 | 0 | 0 |
| cl.casol.backend.identidad.infrastructure.persistence.adapter.DepartamentoContactoRepositoryAdapterTest | 1 | 0 | 0 | 0 |
| cl.casol.backend.identidad.infrastructure.security.BCryptPasswordEncoderAdapterTest | 1 | 0 | 0 | 0 |
| cl.casol.backend.identidad.infrastructure.security.JwtTokenServiceAdapterTest | 4 | 0 | 0 | 0 |
| cl.casol.backend.LimitesCompatibilidadStagingTest | 10 | 0 | 0 | 0 |
| cl.casol.backend.LimitesMvpP0Test | 2 | 0 | 0 | 0 |
| cl.casol.backend.MaterialApoyoSecurityIntegrationTest | 20 | 0 | 0 | 0 |
| cl.casol.backend.MaterialArchivoDestinoTest | 13 | 0 | 0 | 0 |
| cl.casol.backend.MaterialArchivoSecurityIntegrationTest | 18 | 0 | 0 | 0 |
| cl.casol.backend.procedimiento.application.service.MantenerMaterialPasoServiceTest | 7 | 0 | 0 | 0 |
| cl.casol.backend.procedimiento.application.service.MantenerPasoServiceTest | 12 | 0 | 0 | 0 |
| cl.casol.backend.procedimiento.application.service.MantenerProcedimientoServiceTest | 8 | 0 | 0 | 0 |
| cl.casol.backend.PruebaSecurityIntegrationTest | 19 | 0 | 0 | 0 |
| cl.casol.backend.ReutilizarMaterialSecurityTest | 8 | 0 | 0 | 0 |
| cl.casol.backend.seguimiento.application.service.RegistrarEfectividadSolucionServiceTest | 19 | 0 | 0 | 0 |
| cl.casol.backend.seguimiento.infrastructure.persistence.adapter.ResultadoSolucionRepositoryAdapterTest | 8 | 0 | 0 | 0 |
| cl.casol.backend.shared.application.service.VisibilidadContenidoServiceTest | 4 | 0 | 0 | 0 |
| cl.casol.backend.shared.infrastructure.config.DataSourceEnvironmentTest | 3 | 0 | 0 | 0 |
| cl.casol.backend.shared.infrastructure.storage.AlmacenamientoArchivoFilesystemAdapterTest | 11 | 0 | 0 | 0 |
| cl.casol.backend.SintomaSecurityIntegrationTest | 13 | 0 | 0 | 0 |
| cl.casol.backend.SolucionSecurityIntegrationTest | 41 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.AdjuntarArchivoTicketServiceTest | 7 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.AsignarTicketServiceTest | 8 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.CambiarEstadoTicketServiceTest | 15 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.CambiarPrioridadTicketServiceTest | 6 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.ComentarTicketServiceTest | 6 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.ConsultarTicketsServiceTest | 7 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.CrearTicketServiceTest | 5 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.EtiquetarTicketServiceTest | 4 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.GestionarEtiquetasServiceTest | 6 | 0 | 0 | 0 |
| cl.casol.backend.tickets.application.service.ResolverTicketServiceTest | 6 | 0 | 0 | 0 |
| cl.casol.backend.tickets.arquitectura.TicketsArquitecturaTest | 6 | 0 | 0 | 0 |
| cl.casol.backend.tickets.domain.AdjuntoTicketTest | 4 | 0 | 0 | 0 |
| cl.casol.backend.tickets.domain.EtiquetaTest | 3 | 0 | 0 | 0 |
| cl.casol.backend.tickets.domain.TicketTest | 56 | 0 | 0 | 0 |
| cl.casol.backend.TicketSecurityIntegrationTest | 12 | 0 | 0 | 0 |


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
