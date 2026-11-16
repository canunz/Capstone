# Variables y configuración

Estado documental: actualizado desde el código auditado el 2026-11-06. Los resultados de pruebas citados corresponden a esa auditoría.


## Origen de configuración comprobado

Solo existe application-staging.properties como configuración funcional fuente. Su cambio previo se preservó. No hay carga automática comprobada de archivos .env arbitrarios. Un servicio debe heredar las variables desde el mecanismo que opere el equipo; no se presume systemd, Docker o IDE específico instalado.

| Propiedad / variable | Uso | Valor o límite documentable |
|---|---|---|
| spring.datasource.url / SPRING_DATASOURCE_URL | URL JDBC | Sin URL real en la documentación |
| spring.datasource.username / SPRING_DATASOURCE_USERNAME | Usuario BD | Mínimo privilegio a definir por DBA |
| spring.datasource.password / SPRING_DATASOURCE_PASSWORD | Credencial BD | Secreto externo, nunca en evidencias |
| DB_URL, DB_USERNAME, DB_PASSWORD | Placeholders del perfil staging | No hay recurso compartido que los mapee fuera de ese perfil |
| jwt.secret / JWT_SECRET | Clave HMAC | Obligatoria, al menos 32 bytes UTF-8 |
| jwt.expiration / JWT_EXPIRATION | Vigencia | Valor positivo en milisegundos; no consta default funcional en properties actuales |
| server.port / SERVER_PORT | Puerto HTTP | Perfil staging declara 9090 |
| dimabug.storage.materiales-dir / DIMABUG_STORAGE_MATERIALES_DIR | Archivos de materiales | Adaptador declara default relativo ./uploads/materiales |
| dimabug.storage.tickets-dir / DIMABUG_STORAGE_TICKETS_DIR | Adjuntos de Tickets | Adaptador declara default relativo ./uploads/tickets |
| spring.jpa.hibernate.ddl-auto | Política DDL | none propuesto para ejecución revisada, no fijado por el archivo staging presente |
| spring.sql.init.mode | Inicialización SQL | never propuesto para ejecución revisada, no prueba de configuración desplegada |

Los defaults de adaptador no acreditan permisos de disco ni aislamiento entre entornos. Las rutas relativas dependen del directorio de trabajo. Multipart, límites de proxy, TLS, logs y orígenes efectivos del despliegue quedan [PENDIENTE DE VERIFICACIÓN].

No se inspeccionan o copian valores del entorno del usuario, archivos .env reales o credenciales. La guía distingue configuración actual de recomendaciones para un arranque futuro.


## Referencias

[Índice vigente](../README.md) · Auditoría de origen (fuente en repositorio: `docs/auditoria/AUDITORIA_DOCUMENTAL.md`)
