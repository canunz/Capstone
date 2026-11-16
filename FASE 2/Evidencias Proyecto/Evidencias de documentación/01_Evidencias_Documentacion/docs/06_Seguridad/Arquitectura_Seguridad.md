# Arquitectura de seguridad

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Límites de confianza

Navegador, API autenticada, persistencia y almacenamiento de archivos son límites distintos. Los guards protegen navegación y el interceptor restringe destino de JWT. La API valida token y aplica reglas HTTP, visibilidad y propietario/actor. BD y filesystem requieren permisos y protección operacional no acreditados por el código.

Las sesiones son STATELESS con Bearer JWT. CSRF se desactiva en esa configuración. No hay CORS explícito encontrado; desarrollo usa proxy y producción mismo origen por defecto. No se declara CORS abierto ni seguridad de TLS/firewall sin consultar el entorno autorizado.

## Roles

ADMINISTRADOR gestiona cuentas y recursos administrativos y publica conocimiento/procedimientos. TECNICO y SOPORTE mantienen operaciones habilitadas y atienden Tickets. USUARIO consulta publicados y opera sus tickets. Las excepciones de método y estado se detallan en Controles_Seguridad y manual. El registro de rol activo no se comprueba explícitamente en el filtro JWT.

## Riesgos vigentes

Enumeración de cuenta inactiva; token persistente sin revocación; cachés entre cuentas/aliases; logs DEBUG con email si se habilitan; inconsistencias BD/archivos/proyección; dependencias npm afectadas. No se corrigieron como parte documental. Los avisos públicos y su contexto están en la auditoría, no son prueba de explotación del sistema.

No se publica un volcado de variables, credenciales o respuestas de login. La inspección documental no acredita ausencia de secretos en todo el historial Git o sistemas externos.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
