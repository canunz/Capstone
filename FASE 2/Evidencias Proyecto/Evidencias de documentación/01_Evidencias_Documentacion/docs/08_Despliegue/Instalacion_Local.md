# Instalación y ejecución local

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Requisitos

Java 21 y Maven Wrapper del repositorio; Node/npm compatibles con Angular 19 y el lockfile; paquetes descargados si se pretende modo offline; esquema MySQL revisado y directorios privados de almacenamiento. Versiones usadas por la auditoría: Java 21.0.12.1, Maven 3.9.16 y Node 24.15.0. Son versiones observadas, no una matriz completa de soporte certificada.

## Preparación

Trabajar desde la raíz del repositorio confirmado. Las instrucciones de instalación no fueron ejecutadas durante la fase documental. La autorización de documentación no incluye instalar paquetes o crear una base. No ejecutar npm install/ci o una descarga Maven sin el permiso correspondiente en un entorno restringido.

## Backend

El archivo compartido application.properties no está presente y sigue ignorado. El perfil staging sí mapea DB_URL, DB_USERNAME, DB_PASSWORD, JWT_SECRET, JWT_EXPIRATION y fija server.port=9090. No usar credenciales de staging para desarrollo.

Para una ejecución local aprobada se pueden suministrar directamente las propiedades estándar por el proceso/IDE, evitando modificar archivos:

```text
SPRING_DATASOURCE_URL=<JDBC_LOCAL_AUTORIZADO>
SPRING_DATASOURCE_USERNAME=<USUARIO_LOCAL>
SPRING_DATASOURCE_PASSWORD=<SECRETO_LOCAL_NO_VERSIONADO>
JWT_SECRET=<CLAVE_LOCAL_DE_AL_MENOS_32_BYTES>
JWT_EXPIRATION=<MILISEGUNDOS_POSITIVOS>
SERVER_PORT=9090
SPRING_JPA_HIBERNATE_DDL_AUTO=none
SPRING_SQL_INIT_MODE=never
DIMABUG_STORAGE_MATERIALES_DIR=<RUTA_PRIVADA_LOCAL>
DIMABUG_STORAGE_TICKETS_DIR=<RUTA_PRIVADA_LOCAL>
```

JWT_SECRET y JWT_EXPIRATION enlazan con jwt.secret/jwt.expiration por resolución de propiedades de Spring. Los nombres DB_* solo se mapean en el perfil presente; no equivalen por sí solos a spring.datasource.* en un arranque sin ese recurso. Los secretos se definen en el proceso/IDE por un mecanismo seguro, no en esta guía ni en argv.

Con esquema y destino local aprobados, el comando de arranque sería `mvnw.cmd spring-boot:run` desde dima-bug-backend. No fue ejecutado en esta fase ni se acredita el arranque completo. Nunca cambiar ddl-auto a create/update para ocultar un esquema faltante.

## Frontend

Con dependencias existentes, ejecutar `npm start` desde frontend-dimabug y abrir localhost:4200. `/api` se reenvía a localhost:9090. Verificar que proxy y puerto real coincidan. Producción usa configuración diferente y no depende del proxy de ng serve.

## Comprobaciones

El health del código no sustituye una prueba de todas las tablas/índices. Revisar login, consultas y escritura con datos sintéticos únicamente cuando se autorice el ambiente. Para pruebas aisladas existentes, ver la estrategia y resultados; no iniciar MySQL real para probar que el comando compila.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
