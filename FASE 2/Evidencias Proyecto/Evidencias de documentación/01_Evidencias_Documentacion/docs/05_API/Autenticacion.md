# Autenticación y autorización API

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Contratos presentes

`POST /api/auth/login` recibe email y password no vacíos. El DTO acepta alias usuario, username y correo para email y recorta identificador/clave. Devuelve `LoginResponse` con token, usuarioId, nombre, email y rol. `GET /api/auth/me` devuelve email y estado de autenticación cuando el request está autenticado. No hay endpoints implementados para `/api/auth/recuperar/*`.

Enviar `Authorization: Bearer <TOKEN>` a endpoints protegidos. El token no debe copiarse en evidencias, capturas, documentación o URLs. No hay un endpoint de refresh o revocación encontrado. Logout frontend elimina la sesión local.

## Comprobaciones del servidor

JJWT valida HMAC, subject y expiración. La clave exige 32 bytes UTF-8 como mínimo y duración positiva. BCrypt compara contraseñas. Actualmente el servicio comprueba usuario activo antes de contraseña; la guía histórica que afirmaba lo contrario no describe este árbol. Los roles se resuelven por usuario/repositorio y caché hasta cinco minutos, no por claims de rol aportados por el navegador.

La cadena distingue administración, consultas, escritura y recursos de Tickets. Los casos de uso agregan controles de propietario, actor y estado. `/error` aparece público en la configuración actual y los handlers usan sendError. El comportamiento Servlet completo debe probarse fuera de MockMvc antes de afirmar equivalencia con una corrección histórica.

## Convención de permisos

A = ADMINISTRADOR, T = TECNICO, S = SOPORTE, U = USUARIO. «Staff» no implica que administrador pueda atender tickets: en Tickets varias acciones reservadas a soporte/técnico rechazan expresamente al administrador. Véase Controles_Seguridad y el manual por perfil.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
