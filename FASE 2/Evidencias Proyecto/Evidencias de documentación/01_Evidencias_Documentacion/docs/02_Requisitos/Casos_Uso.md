# Casos de uso documentados

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## CU-D01. Inicio de sesión

Actor: persona con cuenta. Precondición: API/configuración disponibles. Flujo: ingresar identificador/clave, frontend envía login, servicio resuelve usuario y valida activo/contraseña, adaptador genera JWT y frontend conserva sesión. Alternativas: datos inválidos, usuario inexistente o inactivo, contraseña incorrecta y fallo de conexión. No se acredita recuperación automática ni refresh/revocación.

## CU-D02. Crear y atender un ticket

Actor inicial: usuario u otro actor de creación permitido; administrador rechazado en el servicio de alta. Precondición: autenticación y clasificación válida cuando se informa. Flujo: completar datos, POST /api/tickets, validar DTO/actor, generar código y guardar ABIERTO/historial, abrir detalle. Soporte/técnico trabaja desde bandeja y ejecuta acciones permitidas de asignación, espera, conversación y resolución. El solicitante o técnico asignado puede confirmar cierre según contrato. Reapertura/cancelación tienen reglas de actor/estado específicas.

Alternativas: 400/403/404/409, respuesta de creación incierta y archivo rechazado. No repetir alta por un fallo posterior de adjuntos o navegación. La auditoría no certifica dos altas/ediciones simultáneas en MySQL.

## CU-D03. Mantener y publicar conocimiento

Actor editor: perfil operacional autorizado. Flujo: crear borrador, completar clasificación y elementos asociados, mantener soluciones activas y publicar con administrador. La publicación exige reglas del servicio y las soluciones activas necesarias. Borrado de conocimiento es lógico mediante DELETE autorizado, no borrado físico de hijos. Lecturas de borrador/eliminado se filtran por política; resultados históricos tienen excepciones acotadas.

## CU-D04. Definir y ejecutar un procedimiento

Actor editor: staff autorizado; publicación: administrador. Cabecera y pasos se guardan en requests independientes. Una falla intermedia conserva los confirmados y permite recuperar el borrador. Al publicar se impide edición posterior de la definición. Iniciar ejecución requiere PUBLICADO con pasos; completar exige todos cumplidos. No se implementa captura de snapshot histórico ni cierre concurrente certificado. Publicar vacío e iniciar vacío son reglas diferentes: el inicio lo rechaza aunque el servicio de publicación no exija mínimo.

## CU-D05. Consulta autoservicio

Actor: A/T/S/U autenticado. Introducir consulta, llamar POST /api/chatbot/consultas, buscar conocimientos elegibles y recuperar hasta cinco soluciones autoservicio. Si no encuentra resultados, mostrar respuesta del contrato. No se ejecuta un proveedor LLM ni lectura NFC.

Las precondiciones/alternativas son reconstrucciones de código, no actas de aceptación. UAT y criterios oficiales quedan [PENDIENTE DE VERIFICACIÓN].


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
