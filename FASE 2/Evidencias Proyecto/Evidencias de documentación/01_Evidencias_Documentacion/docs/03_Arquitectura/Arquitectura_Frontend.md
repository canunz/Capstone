# Arquitectura del frontend

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Organización

`src/app/features` contiene pantallas standalone. `core` agrupa modelos, HTTP, sesión, cachés, servicios y guards. `shared` contiene layout y UI reutilizada. Se identificaron 39 archivos component y 33 specs en la auditoría. Tickets y Chatbot cargan componentes de forma diferida; no toda la aplicación usa lazy loading.

## Rutas y permisos

`app.routes.ts` registra login/recuperar públicos mediante guestGuard y un shell con authGuard. adminGuard restringe Usuarios/Administración y staffGuard acciones operacionales. Hay redirecciones específicas de Tickets. `cambiosProcedimientoGuard` protege salida de editores. La API es responsable de la autorización definitiva.

## HTTP

`app.config.ts` registra HttpClient y authInterceptor. `api.ts` construye `/api` durante desarrollo y utiliza mismo origen en producción por defecto. `proxy.conf.json` apunta a 9090. El interceptor solo envía JWT a la API reconocida y conserva el rechazo de destinos externos.

## Estado y persistencia local

Se usan signals/computed y RxJS según el servicio. La sesión JWT vive en localStorage. Notificaciones y Tickets usan distintas cachés y marcas locales; no equivalen a una cola de notificaciones backend. Favoritos y caché de usuarios no tienen partición uniforme por cuenta. Un logout local no demuestra revocación del token en servidor.

## Funciones parciales

Recuperación envía requests a endpoints ausentes; los reportes incluyen datos literales y Nuevo error usa almacenamiento local. El asistente Chatbot recupera soluciones autoservicio mediante la API, sin SDK LLM. Los manuales conservan estas diferencias.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
