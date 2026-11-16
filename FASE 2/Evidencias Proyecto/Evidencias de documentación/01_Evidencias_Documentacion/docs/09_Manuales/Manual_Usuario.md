# Manual de usuario

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Acceso y sesión

Entrar por /login con cuenta habilitada. El sistema conserva una sesión local con JWT. Cerrar sesión al terminar, especialmente en un equipo compartido. La pantalla /recuperar existe, pero el backend de recuperación no está implementado: contactar a la administración por el canal que defina el equipo, [PENDIENTE DE VERIFICACIÓN].

## Usuario

1. Abrir Conocimiento y buscar por texto o clasificación. Consultar los contenidos publicados y sus soluciones disponibles.
2. Usar Chatbot para consultar soluciones autoservicio. Sus respuestas recuperan contenido existente, no proceden de un modelo generativo externo.
3. Marcar favoritos si resulta útil. Se guardan en ese navegador y no se acredita sincronización entre equipos o cuentas.
4. Crear un ticket desde Tickets/Nuevo: ingresar título (máximo 150), descripción, prioridad y clasificación si corresponde. El código de seguimiento lo genera el servidor.
5. Abrir su ticket, leer/responder conversación y adjuntar archivos admitidos. Las notas internas de soporte no son visibles para el usuario.
6. Cuando soporte lo resuelva, revisar solución y confirmar cierre o solicitar reapertura según las acciones habilitadas. No puede acceder a tickets de otra persona.

## Técnico y soporte

Trabajar desde la bandeja, consultar filtros/prioridades, tomar/asignar según el caso de uso, registrar conversación, notas internas y solución. Los estados del dominio incluyen ABIERTO, EN_PROGRESO, EN_ESPERA, RESUELTO, CERRADO y CANCELADO; el servidor valida actor y transición. El técnico asignado puede confirmar cierre de un resuelto según el contrato actual. No interpretar un comentario antiguo o una etiqueta visual como autorización del servidor.

Mantener conocimiento y borradores de procedimientos según permisos. En un procedimiento, primero guardar cabecera BORRADOR y luego cada paso. Si un paso falla, los anteriores confirmados permanecen. Usar las opciones de consulta/recuperación de la pantalla antes de repetir una creación incierta. Los pasos usan orden positivo y pueden tener saltos; posición y orden no son lo mismo.

Iniciar una ejecución solo sobre un procedimiento PUBLICADO con pasos. Marcar checklist y completar cuando todos estén cumplidos; cancelar si corresponde. El propietario/admin puede acceder según el contrato; la definición publicada es inmutable. No se ofrece snapshot histórico independiente de las instrucciones actuales.

## Administración

Gestionar usuarios/roles asignados, estados y catálogos; mantener departamentos/contactos/responsables y pruebas desde las pantallas administrativas. Publicar conocimiento/procedimientos solo con el rol autorizado. El sistema protege al último administrador activo y rechaza escrituras de definición de procedimientos PUBLICADOS.

En Tickets el administrador supervisa y puede asignar por el contrato correspondiente, pero no es un técnico de atención: crear o resolver tickets y otras acciones operacionales pueden rechazarlo. Los controles concretos provienen del caso de uso, no solo del menú visible.

## Avisos, reportes y otras pantallas

Los avisos se calculan a partir de consultas y marcas de lectura del navegador; no se acredita correo, push o entrega instantánea. Reportes contiene una serie mensual demostrativa y debe interpretarse con ese límite. Nuevo error conserva registros locales y no garantiza que otra sesión de soporte los reciba: para una solicitud compartida usar Tickets.

## Mensajes y recuperación

Ante 400, corregir datos; ante 403, revisar permiso; ante 409, recargar y conciliar. No ocultar filas ni anunciar éxito después de una operación rechazada. Si una respuesta de creación se pierde, comprobar si se guardó antes de repetir. Ante error de limpieza de archivos, el registro BD puede haberse confirmado y requerir mantenimiento operacional.

Los tamaños de código son hasta 10 MB en materiales y 25 MB en Tickets, sujetos a límites multipart/proxy efectivos no verificados. El sistema rechaza formato/tamaño no permitido. No se incluyen capturas ficticias: la UAT visual y accesibilidad en dispositivos reales siguen pendientes.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
