# Contratos DTO y validaciones declaradas

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Contratos fuente

Las siguientes declaraciones record se conservan con sus anotaciones. No se afirman nombres de campo para DTO que no se hayan encontrado. Los alias Jackson y Bean Validation se distinguen de restricciones de BD. Los records anidados adicionales se consultan en el archivo indicado. Los tipos Java de respuesta no prueban una serialización observada en un servidor real.

## CambiarEstadoCatalogoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/web/dto/CambiarEstadoCatalogoRequest.java`.

```java
public record CambiarEstadoCatalogoRequest(@NotNull Boolean activo)
```

## CatalogoAdministrativoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/web/dto/CatalogoAdministrativoResponse.java`.

```java
public record CatalogoAdministrativoResponse(Integer id,String nombre,boolean activo,String sistemaOperativo,
        String descripcion,Integer sistemaId,Integer orden,List<Integer> sistemaIds)
```

## FrecuenciaResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/web/dto/FrecuenciaResponse.java`.

```java
public record FrecuenciaResponse(Integer id, String nombre)
```

## GuardarCatalogoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/web/dto/GuardarCatalogoRequest.java`.

```java
public record GuardarCatalogoRequest(@NotBlank @Size(max=120) String nombre,
        @NotNull Boolean activo, @Size(max=150) String sistemaOperativo,
        @Size(max=255) String descripcion, @Positive Integer sistemaId,
        @Positive Integer orden, List<@NotNull @Positive Integer> sistemaIds)
```

## HardwareResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/web/dto/HardwareResponse.java`.

```java
public record HardwareResponse(Integer id, String nombre, String sistemaOperativo)
```

## ModuloResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/web/dto/ModuloResponse.java`.

```java
public record ModuloResponse(Integer id, Integer sistemaId, String nombre)
```

## SistemaResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/catalogo/infrastructure/web/dto/SistemaResponse.java`.

```java
public record SistemaResponse(Integer id, String nombre, String descripcion)
```

## ActualizarOrdenPruebaRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/ActualizarOrdenPruebaRequest.java`.

```java
public record ActualizarOrdenPruebaRequest(
        @NotNull(message = "orden es obligatorio")
        @Min(value = 1, message = "orden debe ser mayor o igual a 1") Integer orden)
```

## AsociarPruebaRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/AsociarPruebaRequest.java`.

```java
public record AsociarPruebaRequest(
        @NotNull(message = "pruebaId es obligatorio")
        @Min(value = 1, message = "pruebaId debe ser mayor que 0") Integer pruebaId,
        @Min(value = 1, message = "orden debe ser mayor o igual a 1") Integer orden)
```

## BusquedaConocimientoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/BusquedaConocimientoResponse.java`.

```java
public record BusquedaConocimientoResponse(
        Integer id, String titulo,
        Integer hardwareId, String hardwareNombre,
        Integer sistemaId, String sistemaNombre,
        Integer moduloId, String moduloNombre,
        Integer frecuenciaId, String frecuenciaNombre,
        Double relevancia)
```

## CambiarAutoservicioSolucionRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/CambiarAutoservicioSolucionRequest.java`.

```java
public record CambiarAutoservicioSolucionRequest(@NotNull Boolean autoservicio)
```

## CambiarEstadoConocimientoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/CambiarEstadoConocimientoRequest.java`.

```java
public record CambiarEstadoConocimientoRequest(
        @NotNull(message = "El estado es obligatorio") EstadoConocimiento estado)
```

## CambiarEstadoSolucionRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/CambiarEstadoSolucionRequest.java`.

```java
public record CambiarEstadoSolucionRequest(@NotNull Boolean activo)
```

## CausaResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/CausaResponse.java`.

```java
public record CausaResponse(Integer id, String descripcion, Integer orden)
```

## ChatbotResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/ChatbotResponse.java`.

```java
public record ChatbotResponse(String mensaje, List<ChatbotSolucionResponse> soluciones)
```

## ConocimientoPruebaResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/ConocimientoPruebaResponse.java`.

```java
public record ConocimientoPruebaResponse(Integer id, String descripcion, String resultadoEsperado, Integer orden, boolean activa)
```

## ConocimientoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/ConocimientoResponse.java`.

```java
public record ConocimientoResponse(Integer id, String titulo, String descripcion, EstadoConocimiento estado,
        ResumenResponse hardware, ResumenResponse sistema, ResumenResponse modulo,
        ResumenResponse frecuencia, String comentario, ResumenResponse creadoPor,
        LocalDateTime fechaCreacion, ResumenResponse modificadoPor, LocalDateTime fechaModificacion)
```

## ConsultaChatbotRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/ConsultaChatbotRequest.java`.

```java
public record ConsultaChatbotRequest(
        @NotBlank(message = "La consulta es obligatoria")
        @Size(max = 300, message = "La consulta no puede superar 300 caracteres") String consulta)
```

## CopiarSolucionRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/CopiarSolucionRequest.java`.

```java
public record CopiarSolucionRequest(@NotNull @Positive Integer conocimientoOrigenId,
        @NotNull @Positive Integer solucionOrigenId, Boolean confirmarAutoservicio)
```

## EstadoPruebaRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/EstadoPruebaRequest.java`.

```java
public record EstadoPruebaRequest(@NotNull Boolean activa)
```

## GuardarCausaRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/GuardarCausaRequest.java`.

```java
public record GuardarCausaRequest(
        @NotBlank(message = "La descripción es obligatoria")
        @Size(max = 300, message = "La descripción no puede superar 300 caracteres")
        String descripcion,
        Integer orden)
```

## GuardarConocimientoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/GuardarConocimientoRequest.java`.

```java
public record GuardarConocimientoRequest(
        @NotBlank(message = "El título es obligatorio")
        @Size(max = 150, message = "El título no puede superar 150 caracteres") String titulo,
        @NotBlank(message = "La descripción es obligatoria") String descripcion,
        Integer hardwareId,
        Integer sistemaId,
        Integer moduloId,
        Integer frecuenciaId,
        @Size(max = 500) String comentario)
```

## GuardarMaterialApoyoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/GuardarMaterialApoyoRequest.java`.

```java
public record GuardarMaterialApoyoRequest(
        @NotBlank(message = "El nombre es obligatorio")
        @Size(max = 150, message = "El nombre no puede superar 150 caracteres") String nombre,
        @NotNull(message = "El tipo es obligatorio") TipoMaterial tipo,
        @NotBlank(message = "La URL o ruta es obligatoria")
        @Size(max = 500, message = "La URL o ruta no puede superar 500 caracteres")
        @Pattern(regexp = "^(?!file:materiales/).*$",
                message = "Las referencias administradas solo se crean mediante upload")
        String url)
```

## GuardarPruebaAdministrativaRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/GuardarPruebaAdministrativaRequest.java`.

```java
public record GuardarPruebaAdministrativaRequest(@NotBlank @Size(max=500) String descripcion,@Size(max=500) String resultadoEsperado)
```

## GuardarSintomaRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/GuardarSintomaRequest.java`.

```java
public record GuardarSintomaRequest(
        @NotBlank(message = "La descripción es obligatoria")
        @Size(max = 300, message = "La descripción no puede superar 300 caracteres")
        String descripcion,
        Integer orden)
```

## GuardarSolucionAsignacionRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/GuardarSolucionAsignacionRequest.java`.

```java
public record GuardarSolucionAsignacionRequest(
        @Min(value = 1, message = "departamentoId debe ser mayor que 0") Integer departamentoId,
        @Min(value = 1, message = "responsableId debe ser mayor que 0") Integer responsableId,
        Boolean principal)
```

## GuardarSolucionRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/GuardarSolucionRequest.java`.

```java
public record GuardarSolucionRequest(
        @NotBlank(message = "La descripción es obligatoria") String descripcion,
        TipoSolucion tipo,
        @Min(value = 1, message = "orden debe ser mayor o igual a 1") Integer orden,
        @NotBlank(message = "El título es obligatorio")
        @Size(max = 150, message = "El título admite máximo 150 caracteres") String titulo)
```

## MaterialApoyoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/MaterialApoyoResponse.java`.

```java
public record MaterialApoyoResponse(Integer id, String nombre, TipoMaterial tipo, String url)
```

## PruebaResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/PruebaResponse.java`.

```java
public record PruebaResponse(Integer id, String descripcion, String resultadoEsperado)
```

## ReutilizarMaterialRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/ReutilizarMaterialRequest.java`.

```java
public record ReutilizarMaterialRequest(@NotNull @Positive Integer conocimientoOrigenId,@NotNull @Positive Integer materialOrigenId)
```

## SintomaResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/SintomaResponse.java`.

```java
public record SintomaResponse(Integer id, String descripcion, Integer orden)
```

## SolucionAsignacionResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/SolucionAsignacionResponse.java`.

```java
public record SolucionAsignacionResponse(Integer id, Integer responsableId, String responsableNombre,
        Integer departamentoId, String departamentoNombre, boolean principal)
```

## SolucionResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/conocimiento/infrastructure/web/dto/SolucionResponse.java`.

```java
public record SolucionResponse(Integer id, String descripcion, TipoSolucion tipo, Integer orden, String titulo, boolean activo, boolean autoservicio)
```

## ActualizarEjecucionPasoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/ejecucion/infrastructure/web/dto/ActualizarEjecucionPasoRequest.java`.

```java
public record ActualizarEjecucionPasoRequest(Boolean cumplido,
        @Size(max=300,message="La observacion no puede superar 300 caracteres") String observacion)
```

## CancelarEjecucionRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/ejecucion/infrastructure/web/dto/CancelarEjecucionRequest.java`.

```java
public record CancelarEjecucionRequest(String observaciones)
```

## EjecucionPasoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/ejecucion/infrastructure/web/dto/EjecucionPasoResponse.java`.

```java
public record EjecucionPasoResponse(Integer ejecucionPasoId,Integer pasoId,Integer orden,String instruccion,
        boolean esCritico,boolean cumplido,String observacion,LocalDateTime fecha)
```

## EjecucionResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/ejecucion/infrastructure/web/dto/EjecucionResponse.java`.

```java
public record EjecucionResponse(Integer id,Integer procedimientoId,EstadoEjecucion estado,
        LocalDateTime fechaInicio,LocalDateTime fechaFin,String observaciones,EjecucionUsuarioResponse usuario)
```

## EjecucionUsuarioResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/ejecucion/infrastructure/web/dto/EjecucionUsuarioResponse.java`.

```java
public record EjecucionUsuarioResponse(Integer id,String nombre,String email)
```

## CambiarEstadoUsuarioRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/CambiarEstadoUsuarioRequest.java`.

```java
public record CambiarEstadoUsuarioRequest(
        @NotNull(message = "El estado es obligatorio") Boolean activo
)
```

## CambiarPasswordRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/CambiarPasswordRequest.java`.

```java
public record CambiarPasswordRequest(
        @NotBlank(message = "La contraseña es obligatoria")
        @Size(min = 6, message = "La contraseña debe tener al menos 6 caracteres")
        @JsonAlias({"usuarioPassword", "newPassword", "clave", "contrasena"})
        String password
)
```

## ContactoDepartamentoAdminResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/ContactoDepartamentoAdminResponse.java`.

```java
public record ContactoDepartamentoAdminResponse(Integer id,Integer departamentoId,String tipo,String valor,
        boolean activo,boolean departamentoActivo,boolean disponible,Long version)
```

## CrearContactoDepartamentoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/CrearContactoDepartamentoRequest.java`.

```java
public record CrearContactoDepartamentoRequest(@NotBlank @Size(max=50) String tipo, @NotBlank @Size(max=100) String valor, Boolean activo)
```

## CrearDepartamentoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/CrearDepartamentoRequest.java`.

```java
public record CrearDepartamentoRequest(@NotBlank @Size(max=100) String nombre)
```

## CrearResponsableRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/CrearResponsableRequest.java`.

```java
public record CrearResponsableRequest(@NotNull @Positive Integer departamentoId, @NotBlank @Size(max=160) String nombre, @Size(max=120) String cargo, @Size(max=160) String contacto)
```

## CrearUsuarioRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/CrearUsuarioRequest.java`.

```java
public record CrearUsuarioRequest(
        @NotBlank(message = "El nombre es obligatorio") String nombre,
        @NotBlank(message = "El email es obligatorio")
        @Email(message = "El email no es válido") String email,
        @NotBlank(message = "La contraseña es obligatoria") String password,
        @NotNull(message = "El rol es obligatorio") Integer rolId
)
```

## DepartamentoContactoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/DepartamentoContactoResponse.java`.

```java
public record DepartamentoContactoResponse(Integer id, String tipo, String valor)
```

## DepartamentoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/DepartamentoResponse.java`.

```java
public record DepartamentoResponse(Integer id, String nombre)
```

## EditarContactoDepartamentoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/EditarContactoDepartamentoRequest.java`.

```java
public record EditarContactoDepartamentoRequest(@NotBlank @Size(max=50) String tipo, @NotBlank @Size(max=100) String valor, @NotNull @Min(0) Long version)
```

## EditarDepartamentoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/EditarDepartamentoRequest.java`.

```java
public record EditarDepartamentoRequest(@NotBlank @Size(max=100) String nombre, @NotNull @Min(0) Long version)
```

## EditarResponsableRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/EditarResponsableRequest.java`.

```java
public record EditarResponsableRequest(@NotBlank @Size(max=160) String nombre, @Size(max=120) String cargo, @Size(max=160) String contacto, @NotBlank @Pattern(regexp="[0-9a-f]{64}") String revision)
```

## EstadoOrganizacionRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/EstadoOrganizacionRequest.java`.

```java
public record EstadoOrganizacionRequest(@NotNull Boolean activo, @NotNull @Min(0) Long version)
```

## EstadoResponsableRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/EstadoResponsableRequest.java`.

```java
public record EstadoResponsableRequest(@NotNull Boolean activo, @NotBlank @Pattern(regexp="[0-9a-f]{64}") String revision)
```

## LoginRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/LoginRequest.java`.

```java
public record LoginRequest(

        @NotBlank(message = "El usuario o correo es obligatorio")
        @JsonAlias({"usuario", "username", "correo"})
        String email,

        @NotBlank(message = "La contraseña es obligatoria")
        String password

)
```

## LoginResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/LoginResponse.java`.

```java
public record LoginResponse(
        String token,
        Integer usuarioId,
        String nombre,
        String email,
        String rol
)
```

## ModificarUsuarioRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/ModificarUsuarioRequest.java`.

```java
public record ModificarUsuarioRequest(
        @NotBlank(message = "El nombre es obligatorio") String nombre,
        @NotBlank(message = "El email es obligatorio")
        @Email(message = "El email no es válido") String email,
        @NotNull(message = "El rol es obligatorio") Integer rolId,
        @JsonAlias({"usuarioPassword", "newPassword", "clave", "contrasena"})
        String password
)
```

## ResponsableResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/ResponsableResponse.java`.

```java
public record ResponsableResponse(Integer id, String nombre, String cargo, String contacto)
```

## RolResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/RolResponse.java`.

```java
public record RolResponse(Integer id, String nombre, String descripcion)
```

## UsuarioResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/identidad/infrastructure/web/dto/UsuarioResponse.java`.

```java
public record UsuarioResponse(
        Integer id,
        String nombre,
        String email,
        boolean activo,
        Integer rolId,
        String rol
)
```

## CambiarEstadoProcedimientoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/procedimiento/infrastructure/web/dto/CambiarEstadoProcedimientoRequest.java`.

```java
public record CambiarEstadoProcedimientoRequest(
        @NotNull(message="El estado es obligatorio") EstadoProcedimiento estado)
```

## GuardarPasoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/procedimiento/infrastructure/web/dto/GuardarPasoRequest.java`.

```java
public record GuardarPasoRequest(
        @NotNull(message="El orden es obligatorio") @Positive(message="El orden debe ser mayor que cero") Integer orden,
        @NotBlank(message="La instrucción es obligatoria") String instruccion,
        @NotNull(message="esCritico es obligatorio") Boolean esCritico)
```

## GuardarProcedimientoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/procedimiento/infrastructure/web/dto/GuardarProcedimientoRequest.java`.

```java
public record GuardarProcedimientoRequest(
        @NotBlank(message="El nombre es obligatorio")
        @Size(max=150,message="El nombre no puede superar 150 caracteres") String nombre,
        String descripcion)
```

## PasoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/procedimiento/infrastructure/web/dto/PasoResponse.java`.

```java
public record PasoResponse(Integer id,Integer procedimientoId,Integer orden,String instruccion,boolean esCritico)
```

## ProcedimientoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/procedimiento/infrastructure/web/dto/ProcedimientoResponse.java`.

```java
public record ProcedimientoResponse(Integer id,String nombre,String descripcion,EstadoProcedimiento estado,
        UsuarioResumenResponse creadoPor,LocalDateTime fechaCreacion,UsuarioResumenResponse modificadoPor,
        LocalDateTime fechaModificacion)
```

## EfectividadSolucionResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/seguimiento/infrastructure/web/dto/EfectividadSolucionResponse.java`.

```java
public record EfectividadSolucionResponse(Integer solucionId,long totalAplicaciones,long totalFunciono,
        long totalNoFunciono,Double porcentajeEfectividad)
```

## RegistrarResultadoRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/seguimiento/infrastructure/web/dto/RegistrarResultadoRequest.java`.

```java
public record RegistrarResultadoRequest(
        @NotNull(message="funciono es obligatorio") Boolean funciono,
        @Size(max=300,message="El comentario no puede superar 300 caracteres") String comentario)
```

## ResultadoSolucionResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/seguimiento/infrastructure/web/dto/ResultadoSolucionResponse.java`.

```java
public record ResultadoSolucionResponse(Integer id,boolean funciono,String comentario,
        LocalDateTime fecha,ResultadoUsuarioResponse usuario)
```

## ResultadoUsuarioResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/seguimiento/infrastructure/web/dto/ResultadoUsuarioResponse.java`.

```java
public record ResultadoUsuarioResponse(Integer id,String nombre,String email)
```

## AsignarTicketRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/AsignarTicketRequest.java`.

```java
public record AsignarTicketRequest(@NotNull(message = "Debe indicar el técnico asignado") Integer asignadoId)
```

## CambiarEstadoEtiquetaRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/CambiarEstadoEtiquetaRequest.java`.

```java
public record CambiarEstadoEtiquetaRequest(@NotNull(message = "Debe indicar si la etiqueta queda activa") Boolean activa)
```

## CambiarEstadoTicketRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/CambiarEstadoTicketRequest.java`.

```java
public record CambiarEstadoTicketRequest(
        @NotNull(message = "Debe indicar el estado nuevo") EstadoTicket estado,
        @Size(max = 255, message = "El motivo no puede superar 255 caracteres") String motivo)
```

## CambiarPrioridadRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/CambiarPrioridadRequest.java`.

```java
public record CambiarPrioridadRequest(
        @NotNull(message = "Debe indicar la prioridad nueva") PrioridadTicket prioridad,
        @Size(max = 180, message = "El motivo no puede superar 180 caracteres") String motivo)
```

## ComentarTicketRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/ComentarTicketRequest.java`.

```java
public record ComentarTicketRequest(
        @NotBlank(message = "El comentario no puede estar vacío")
        @Size(max = 1000, message = "El comentario no puede superar 1000 caracteres") String texto,
        Boolean interno)
```

## ConocimientoSugeridoResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/ConocimientoSugeridoResponse.java`.

```java
public record ConocimientoSugeridoResponse(Integer id, String titulo, String hardware, String sistema, String modulo)
```

## ConteoTicketsResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/ConteoTicketsResponse.java`.

```java
public record ConteoTicketsResponse(Map<EstadoTicket, Long> porEstado, long total, long criticosActivos,
        long sinTecnico)
```

## CrearTicketRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/CrearTicketRequest.java`.

```java
public record CrearTicketRequest(
        @NotBlank(message = "El título es obligatorio")
        @Size(max = 150, message = "El título no puede superar 150 caracteres") String titulo,
        @NotBlank(message = "La descripción es obligatoria") String descripcion,
        PrioridadTicket prioridad,
        Integer hardwareId,
        Integer sistemaId,
        Integer moduloId)
```

## EtiquetaResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/EtiquetaResponse.java`.

```java
public record EtiquetaResponse(Long id, String nombre, String color, boolean activa, NivelEtiqueta nivel)
```

## EtiquetarTicketRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/EtiquetarTicketRequest.java`.

```java
public record EtiquetarTicketRequest(@NotNull(message = "Debe enviar la lista de etiquetas") List<Long> etiquetaIds)
```

## GuardarEtiquetaRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/GuardarEtiquetaRequest.java`.

```java
public record GuardarEtiquetaRequest(
        @NotBlank(message = "El nombre de la etiqueta es obligatorio")
        @Size(max = 40, message = "El nombre no puede superar 40 caracteres") String nombre,
        @NotBlank(message = "El color es obligatorio")
        @Pattern(regexp = "^#[0-9A-Fa-f]{6}$", message = "El color debe tener formato hexadecimal, por ejemplo #E53935")
        String color,
        /** Opcional: si no viene, queda NORMAL. */
        NivelEtiqueta nivel)
```

## ReferenciaResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/ReferenciaResponse.java`.

```java
public record ReferenciaResponse(Number id, String nombre)
```

## ResolverTicketRequest

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/ResolverTicketRequest.java`.

```java
public record ResolverTicketRequest(
        @NotBlank(message = "Debe describir la solución aplicada") String solucion,
        Integer conocimientoId)
```

## TicketDetalleResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/TicketDetalleResponse.java`.

```java
public record TicketDetalleResponse(Long id, String codigo, String titulo, String descripcion, EstadoTicket estado,
        PrioridadTicket prioridad, ReferenciaResponse solicitante, ReferenciaResponse asignado,
        ReferenciaResponse hardware, ReferenciaResponse sistema, ReferenciaResponse modulo,
        ConocimientoVinculadoResponse conocimiento, String solucion,
        LocalDateTime fechaCreacion, LocalDateTime fechaActualizacion, LocalDateTime fechaResolucion,
        LocalDateTime fechaCierre, List<EtiquetaResponse> etiquetas, List<ComentarioResponse> comentarios,
        List<HistorialResponse> historial, List<AdjuntoResponse> adjuntos)
```

## TicketResumenResponse

Fuente: `dima-bug-backend/src/main/java/cl/casol/backend/tickets/infrastructure/web/dto/TicketResumenResponse.java`.

```java
public record TicketResumenResponse(Long id, String codigo, String titulo, EstadoTicket estado,
        PrioridadTicket prioridad, ReferenciaResponse solicitante, ReferenciaResponse asignado,
        List<EtiquetaResponse> etiquetas, LocalDateTime fechaCreacion, LocalDateTime fechaActualizacion)
```


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
