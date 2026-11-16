# Diccionario de datos

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Origen y lectura

Este diccionario describe **31 tablas requeridas**: 28 entidades, dos uniones y una proyección JDBC. Es un diccionario lógico/técnico del código, no un export del servidor. La columna Java y los atributos JPA se leen de las entidades; el SQL se copia como declaración de los scripts existentes. No se transforma una anotación en una restricción física confirmada.

PK = clave declarada por el modelo; JPA = JoinColumn/relación del mapeo; SQL = FOREIGN KEY explícita en un script; REF = ID sin FK SQL confirmada; JDBC = uso en consultas sin DDL disponible. Para co_conocimiento_busqueda se conocen dos columnas usadas por el adaptador, pero PK, tipos físicos, nulabilidad e índice FULLTEXT quedan [PENDIENTE DE VERIFICACIÓN]. La asociación única por conocimiento es una expectativa del upsert, no un UNIQUE instalado acreditado.

`String` sin length explícito se mantiene como String/JPA por defecto, sin adivinar VARCHAR físico. `columnDefinition` y length son declaración JPA, no tipo del servidor. Los tipos ENUM de Java se documentan desde su enum y no se convierten automáticamente en ENUM MySQL. El registro no incluye datos de usuarios ni hashes de contraseñas.

Los identificadores @Id/@EmbeddedId no admiten nulos en el contrato de identidad, aunque su @Column omita nullable=false. En cl_hardware_sistema no se certifican PK ni nulabilidad física a partir del Set y JoinTable. La tabla de etiquetas de Tickets sí tiene PK compuesta/NOT NULL en el script. Estos niveles se identifican sin afirmar ejecución del DDL.

## cl_frecuencia

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/persistence/entity/FrecuenciaEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `frecuencia_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `frecuencia_nombre` | String | No | — | length=50 | [PENDIENTE DE VERIFICACIÓN] |
| `frecuencia_orden` | Integer | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `frecuencia_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## cl_hardware

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/persistence/entity/HardwareEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `hardware_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `hardware_nombre` | String | No | — | length=100, unique=true | [PENDIENTE DE VERIFICACIÓN] |
| `hardware_sistema_operativo` | String | Sí | — | length=150 | [PENDIENTE DE VERIFICACIÓN] |
| `hardware_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## cl_hardware_sistema

Origen: Unión JPA. Fuente: `mapeo HardwareEntity / TicketEntity`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `hardware_id` | Integer | No determinado | JPA a cl_hardware | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `sistema_id` | Integer | No determinado | JPA a cl_sistema | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## cl_modulo

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/persistence/entity/ModuloEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `modulo_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `sistema_id` | SistemaEntity | Sí | JPA a cl_sistema | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `modulo_nombre` | String | No | — | length=120 | [PENDIENTE DE VERIFICACIÓN] |
| `modulo_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## cl_sistema

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/persistence/entity/SistemaEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `sistema_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `sistema_nombre` | String | No | — | length=100, unique=true | [PENDIENTE DE VERIFICACIÓN] |
| `sistema_descripcion` | String | Sí | — | length=255 | [PENDIENTE DE VERIFICACIÓN] |
| `sistema_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## co_causa

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/entity/CausaEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `causa_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `conocimiento_id` | Integer | No | REF a co_conocimiento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `causa_descripcion` | String | No | — | length=300 | [PENDIENTE DE VERIFICACIÓN] |
| `causa_orden` | Integer | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## co_conocimiento

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/entity/ConocimientoEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `conocimiento_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `conocimiento_titulo` | String | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `conocimiento_descripcion` | String | No | — | columnDefinition=TEXT | [PENDIENTE DE VERIFICACIÓN] |
| `conocimiento_estado` | EstadoConocimiento | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `hardware_id` | HardwareEntity | Sí | JPA a cl_hardware | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `sistema_id` | SistemaEntity | Sí | JPA a cl_sistema | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `modulo_id` | ModuloEntity | Sí | JPA a cl_modulo | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `frecuencia_id` | FrecuenciaEntity | Sí | JPA a cl_frecuencia | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `conocimiento_comentario` | String | Sí | — | length=500 | [PENDIENTE DE VERIFICACIÓN] |
| `creado_por` | UsuarioEntity | No | JPA a u_usuario | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `fecha_creacion` | LocalDateTime | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `modificado_por` | UsuarioEntity | Sí | JPA a u_usuario | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `fecha_modificacion` | LocalDateTime | Sí | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## co_conocimiento_busqueda

Origen: JDBC. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/adapter/BusquedaConocimientoJdbcAdapter.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `conocimiento_id` | Integer (parámetro JDBC) | No determinado | JDBC a co_conocimiento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `contenido_busqueda` | String (parámetro JDBC) | No determinado | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## co_conocimiento_prueba

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/entity/ConocimientoPruebaEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `conocimiento_id` | Integer | No | PK; REF a co_conocimiento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `prueba_id` | Integer | No | PK; JPA a co_prueba | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `prueba_orden` | Integer | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## co_material_apoyo

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/entity/MaterialApoyoEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `material_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `conocimiento_id` | Integer | Sí | REF a co_conocimiento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `paso_id` | Integer | Sí | REF a pr_paso | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `material_nombre` | String | No | — | length=150 | [PENDIENTE DE VERIFICACIÓN] |
| `material_tipo` | TipoMaterial | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `material_url` | String | No | — | length=500 | [PENDIENTE DE VERIFICACIÓN] |

## co_prueba

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/entity/PruebaEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `prueba_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `prueba_descripcion` | String | No | — | length=500, unique=true | [PENDIENTE DE VERIFICACIÓN] |
| `prueba_resultado_esperado` | String | Sí | — | length=500 | [PENDIENTE DE VERIFICACIÓN] |
| `prueba_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## co_sintoma

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/entity/SintomaEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `sintoma_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `conocimiento_id` | Integer | No | REF a co_conocimiento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `sintoma_descripcion` | String | No | — | length=300 | [PENDIENTE DE VERIFICACIÓN] |
| `sintoma_orden` | Integer | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## co_solucion

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/entity/SolucionEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `solucion_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `conocimiento_id` | Integer | No | REF a co_conocimiento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `solucion_descripcion` | String | No | — | columnDefinition=TEXT | [PENDIENTE DE VERIFICACIÓN] |
| `solucion_tipo` | TipoSolucion | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `solucion_orden` | Integer | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `solucion_titulo` | String | Sí | — | length=150 | ADD COLUMN solucion_titulo VARCHAR(150) NULL |
| `solucion_estado` | boolean | No | — | Sin atributo adicional extraído | ADD COLUMN solucion_estado TINYINT(1) NOT NULL DEFAULT 1 |
| `solucion_autoservicio` | boolean | No | — | Sin atributo adicional extraído | ADD COLUMN solucion_autoservicio TINYINT(1) NOT NULL DEFAULT 0 |

## co_solucion_asignacion

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/persistence/entity/SolucionAsignacionEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `asignacion_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `solucion_id` | SolucionEntity | No | JPA a co_solucion | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `responsable_id` | ResponsableEntity | Sí | JPA a u_responsable | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `departamento_id` | DepartamentoEntity | Sí | JPA a u_departamento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `asignacion_principal` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## pr_paso

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/procedimiento/infrastructure/persistence/entity/PasoEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `paso_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `procedimiento_id` | Integer | No | REF a pr_procedimiento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `paso_orden` | Integer | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `paso_instruccion` | String | No | — | columnDefinition=TEXT | [PENDIENTE DE VERIFICACIÓN] |
| `paso_es_critico` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## pr_procedimiento

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/procedimiento/infrastructure/persistence/entity/ProcedimientoEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `procedimiento_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `procedimiento_nombre` | String | No | — | length=150 | [PENDIENTE DE VERIFICACIÓN] |
| `procedimiento_descripcion` | String | Sí | — | columnDefinition=TEXT | [PENDIENTE DE VERIFICACIÓN] |
| `procedimiento_estado` | EstadoProcedimiento | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `creado_por` | UsuarioEntity | No | JPA a u_usuario | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `fecha_creacion` | LocalDateTime | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `modificado_por` | UsuarioEntity | Sí | JPA a u_usuario | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `fecha_modificacion` | LocalDateTime | Sí | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## se_ejecucion

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/ejecucion/infrastructure/persistence/entity/EjecucionEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `ejecucion_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `procedimiento_id` | Integer | No | REF a pr_procedimiento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `usuario_id` | UsuarioEntity | No | JPA a u_usuario | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `ejecucion_fecha_inicio` | LocalDateTime | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `ejecucion_fecha_fin` | LocalDateTime | Sí | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `ejecucion_estado` | EstadoEjecucion | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `ejecucion_observaciones` | String | Sí | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## se_ejecucion_paso

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/ejecucion/infrastructure/persistence/entity/EjecucionPasoEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `ejecucion_paso_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `ejecucion_id` | Integer | No | REF a se_ejecucion | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `paso_id` | Integer | No | REF a pr_paso | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `ejecucion_paso_cumplido` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `ejecucion_paso_observacion` | String | Sí | — | length=300 | [PENDIENTE DE VERIFICACIÓN] |
| `ejecucion_paso_fecha` | LocalDateTime | Sí | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## se_resultado

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/seguimiento/infrastructure/persistence/entity/ResultadoSolucionEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `resultado_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `solucion_id` | Integer | No | REF a co_solucion | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `usuario_id` | Integer | No | REF a u_usuario | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `resultado_funciono` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `resultado_comentario` | String | Sí | — | length=300 | [PENDIENTE DE VERIFICACIÓN] |
| `resultado_fecha` | LocalDateTime | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## ticket

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/persistence/entity/TicketEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `id` | Long | No | PK | Sin atributo adicional extraído | id                  BIGINT       NOT NULL AUTO_INCREMENT |
| `codigo` | String | No | — | length=20, unique=true | codigo              VARCHAR(20)  NOT NULL |
| `titulo` | String | No | — | length=150 | titulo              VARCHAR(150) NOT NULL |
| `descripcion` | String | No | — | columnDefinition=TEXT | descripcion         TEXT         NOT NULL |
| `estado` | EstadoTicket | No | — | length=20 | estado              VARCHAR(20)  NOT NULL DEFAULT 'ABIERTO' |
| `prioridad` | PrioridadTicket | No | — | length=10 | prioridad           VARCHAR(10)  NOT NULL DEFAULT 'MEDIA' |
| `solicitante_id` | Integer | No | REF a u_usuario | Sin atributo adicional extraído | solicitante_id      INT          NOT NULL |
| `asignado_id` | Integer | Sí | REF a u_usuario | Sin atributo adicional extraído | asignado_id         INT          NULL |
| `hardware_id` | Integer | Sí | REF a cl_hardware | Sin atributo adicional extraído | hardware_id         INT          NULL |
| `sistema_id` | Integer | Sí | REF a cl_sistema | Sin atributo adicional extraído | sistema_id          INT          NULL |
| `modulo_id` | Integer | Sí | REF a cl_modulo | Sin atributo adicional extraído | modulo_id           INT          NULL |
| `conocimiento_id` | Integer | Sí | REF a co_conocimiento | Sin atributo adicional extraído | conocimiento_id     INT          NULL |
| `solucion` | String | Sí | — | columnDefinition=TEXT | solucion            TEXT         NULL |
| `fecha_creacion` | LocalDateTime | No | — | Sin atributo adicional extraído | fecha_creacion      DATETIME     NOT NULL |
| `fecha_actualizacion` | LocalDateTime | No | — | Sin atributo adicional extraído | fecha_actualizacion DATETIME     NOT NULL |
| `fecha_resolucion` | LocalDateTime | Sí | — | Sin atributo adicional extraído | fecha_resolucion    DATETIME     NULL |
| `fecha_cierre` | LocalDateTime | Sí | — | Sin atributo adicional extraído | fecha_cierre        DATETIME     NULL |

## ticket_adjunto

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/persistence/entity/AdjuntoTicketEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `id` | Long | No | PK | Sin atributo adicional extraído | id            BIGINT       NOT NULL AUTO_INCREMENT |
| `ticket_id` | Long | No | SQL a ticket | Sin atributo adicional extraído | ticket_id     BIGINT       NOT NULL |
| `comentario_id` | Long | Sí | SQL a ticket_comentario | Sin atributo adicional extraído | comentario_id BIGINT       NULL |
| `nombre` | String | No | — | length=150 | nombre        VARCHAR(150) NOT NULL |
| `mime` | String | No | — | length=60 | mime          VARCHAR(60)  NOT NULL |
| `tamano` | long | No | — | Sin atributo adicional extraído | tamano        BIGINT       NOT NULL |
| `referencia` | String | No | — | length=80, unique=true | referencia    VARCHAR(80)  NOT NULL |
| `autor_id` | Integer | No | REF a u_usuario | Sin atributo adicional extraído | autor_id      INT          NOT NULL |
| `fecha` | LocalDateTime | No | — | Sin atributo adicional extraído | fecha         DATETIME     NOT NULL |

## ticket_comentario

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/persistence/entity/ComentarioTicketEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `id` | Long | No | PK | Sin atributo adicional extraído | id        BIGINT        NOT NULL AUTO_INCREMENT |
| `ticket_id` | Long | No | SQL a ticket | Sin atributo adicional extraído | ticket_id BIGINT        NOT NULL |
| `autor_id` | Integer | No | REF a u_usuario | Sin atributo adicional extraído | autor_id  INT           NOT NULL |
| `texto` | String | No | — | length=1000 | texto     VARCHAR(1000) NOT NULL |
| `interno` | boolean | No | — | Sin atributo adicional extraído | interno   BOOLEAN       NOT NULL DEFAULT FALSE |
| `fecha` | LocalDateTime | No | — | Sin atributo adicional extraído | fecha     DATETIME      NOT NULL |

## ticket_etiqueta

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/persistence/entity/EtiquetaEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `id` | Long | No | PK | Sin atributo adicional extraído | id     BIGINT      NOT NULL AUTO_INCREMENT |
| `nombre` | String | No | — | length=40, unique=true | nombre VARCHAR(40) NOT NULL |
| `color` | String | No | — | length=7 | color  VARCHAR(7)  NOT NULL |
| `activa` | boolean | No | — | Sin atributo adicional extraído | activa BOOLEAN     NOT NULL DEFAULT TRUE |
| `nivel` | NivelEtiqueta | No | — | length=15 | ADD COLUMN nivel VARCHAR(15) NOT NULL DEFAULT 'NORMAL' AFTER color |

## ticket_historial_estado

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/persistence/entity/HistorialEstadoTicketEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `id` | Long | No | PK | Sin atributo adicional extraído | id              BIGINT       NOT NULL AUTO_INCREMENT |
| `ticket_id` | Long | No | SQL a ticket | Sin atributo adicional extraído | ticket_id       BIGINT       NOT NULL |
| `estado_anterior` | EstadoTicket | Sí | — | length=20 | estado_anterior VARCHAR(20)  NULL |
| `estado_nuevo` | EstadoTicket | No | — | length=20 | estado_nuevo    VARCHAR(20)  NOT NULL |
| `usuario_id` | Integer | No | REF a u_usuario | Sin atributo adicional extraído | usuario_id      INT          NOT NULL |
| `motivo` | String | Sí | — | length=255 | motivo          VARCHAR(255) NULL |
| `fecha` | LocalDateTime | No | — | Sin atributo adicional extraído | fecha           DATETIME     NOT NULL |

## ticket_ticket_etiqueta

Origen: Unión JPA. Fuente: `mapeo HardwareEntity / TicketEntity`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `ticket_id` | Long | No | PK; SQL a ticket | Sin atributo adicional extraído | ticket_id   BIGINT NOT NULL |
| `etiqueta_id` | Long | No | PK; SQL a ticket_etiqueta | Sin atributo adicional extraído | etiqueta_id BIGINT NOT NULL |

## u_departamento

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/persistence/entity/DepartamentoEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `departamento_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `departamento_nombre` | String | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `departamento_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `departamento_version` | Long | No | — | @Version | ADD COLUMN departamento_version BIGINT NOT NULL DEFAULT 0 |

## u_departamento_contacto

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/persistence/entity/DepartamentoContactoEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `contacto_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `departamento_id` | Integer | No | REF a u_departamento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `contacto_tipo` | String | No | — | length=50 | [PENDIENTE DE VERIFICACIÓN] |
| `contacto_valor` | String | No | — | length=100 | [PENDIENTE DE VERIFICACIÓN] |
| `contacto_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `contacto_version` | Long | No | — | @Version | ADD COLUMN contacto_version BIGINT NOT NULL DEFAULT 0 |

## u_organizacion_control

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/persistence/entity/OrganizacionControlEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `control_id` | Integer | No | PK | Sin atributo adicional extraído | control_id INT NOT NULL PRIMARY KEY |

## u_responsable

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/persistence/entity/ResponsableEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `responsable_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `departamento_id` | Integer | No | REF a u_departamento | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `responsable_nombre` | String | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `responsable_cargo` | String | Sí | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `responsable_contacto` | String | Sí | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `responsable_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## u_rol

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/persistence/entity/RolEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `rol_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `rol_nombre` | String | No | — | length=50, unique=true | [PENDIENTE DE VERIFICACIÓN] |
| `rol_descripcion` | String | Sí | — | length=200 | [PENDIENTE DE VERIFICACIÓN] |
| `rol_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `rol_fecha_creacion` | LocalDateTime | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `rol_fecha_actualizacion` | LocalDateTime | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## u_usuario

Origen: JPA. Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/persistence/entity/UsuarioEntity.java`.

| Columna | Tipo Java / JPA | Nulo en modelo o SQL declarado | Clave o referencia declarada | Atributos JPA | SQL disponible, no ejecutado |
|---|---|---|---|---|---|
| `usuario_id` | Integer | No | PK | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `rol_id` | RolEntity | No | JPA a u_rol | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `usuario_nombre` | String | No | — | length=100 | [PENDIENTE DE VERIFICACIÓN] |
| `usuario_email` | String | No | — | length=120, unique=true | [PENDIENTE DE VERIFICACIÓN] |
| `usuario_password_hash` | String | No | — | length=255 | [PENDIENTE DE VERIFICACIÓN] |
| `usuario_estado` | boolean | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `usuario_fecha_creacion` | LocalDateTime | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |
| `usuario_fecha_actualizacion` | LocalDateTime | No | — | Sin atributo adicional extraído | [PENDIENTE DE VERIFICACIÓN] |

## Restricciones de conjunto

pr_paso declara UNIQUE(procedimiento_id, paso_orden); se_ejecucion_paso declara UNIQUE(ejecucion_id, paso_id); ConocimientoPruebaId declara PK compuesta. cl_hardware_sistema usa columnas de unión; no se certifica una PK física por inferirla del Set JPA. ticket_ticket_etiqueta tiene PK compuesta explícita en el SQL presente. Las seis FK SQL internas de Tickets están listadas en Modelo_Relacional. No se dispone de índices/collation/defaults completos del servidor.


## Referencias

[Índice vigente](../../../01_Evidencias_Documentacion/docs/README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
