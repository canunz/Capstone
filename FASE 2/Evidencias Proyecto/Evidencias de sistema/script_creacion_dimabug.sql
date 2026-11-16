CREATE DATABASE  IF NOT EXISTS `dima_bug_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dima_bug_dev`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dima_bug_dev
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cl_frecuencia`
--

DROP TABLE IF EXISTS `cl_frecuencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_frecuencia` (
  `frecuencia_id` int NOT NULL AUTO_INCREMENT,
  `frecuencia_nombre` varchar(50) NOT NULL,
  `frecuencia_orden` int NOT NULL DEFAULT '0',
  `frecuencia_estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`frecuencia_id`),
  UNIQUE KEY `frecuencia_nombre` (`frecuencia_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cl_hardware`
--

DROP TABLE IF EXISTS `cl_hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_hardware` (
  `hardware_id` int NOT NULL AUTO_INCREMENT,
  `hardware_nombre` varchar(100) NOT NULL,
  `hardware_sistema_operativo` varchar(150) DEFAULT NULL,
  `hardware_estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`hardware_id`),
  UNIQUE KEY `hardware_nombre` (`hardware_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cl_hardware_sistema`
--

DROP TABLE IF EXISTS `cl_hardware_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_hardware_sistema` (
  `hardware_id` int NOT NULL,
  `sistema_id` int NOT NULL,
  PRIMARY KEY (`hardware_id`,`sistema_id`),
  KEY `fk_hardware_sistema_sistema` (`sistema_id`),
  CONSTRAINT `fk_hardware_sistema_hardware` FOREIGN KEY (`hardware_id`) REFERENCES `cl_hardware` (`hardware_id`),
  CONSTRAINT `fk_hardware_sistema_sistema` FOREIGN KEY (`sistema_id`) REFERENCES `cl_sistema` (`sistema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cl_modulo`
--

DROP TABLE IF EXISTS `cl_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_modulo` (
  `modulo_id` int NOT NULL AUTO_INCREMENT,
  `sistema_id` int DEFAULT NULL,
  `modulo_nombre` varchar(120) NOT NULL,
  `modulo_estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`modulo_id`),
  UNIQUE KEY `uq_modulo` (`sistema_id`,`modulo_nombre`),
  CONSTRAINT `fk_modulo_sistema` FOREIGN KEY (`sistema_id`) REFERENCES `cl_sistema` (`sistema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cl_sistema`
--

DROP TABLE IF EXISTS `cl_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_sistema` (
  `sistema_id` int NOT NULL AUTO_INCREMENT,
  `sistema_nombre` varchar(100) NOT NULL,
  `sistema_descripcion` varchar(255) DEFAULT NULL,
  `sistema_estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sistema_id`),
  UNIQUE KEY `sistema_nombre` (`sistema_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `co_causa`
--

DROP TABLE IF EXISTS `co_causa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_causa` (
  `causa_id` int NOT NULL AUTO_INCREMENT,
  `conocimiento_id` int NOT NULL,
  `causa_descripcion` varchar(300) NOT NULL,
  `causa_orden` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`causa_id`),
  KEY `fk_causa_conocimiento` (`conocimiento_id`),
  CONSTRAINT `fk_causa_conocimiento` FOREIGN KEY (`conocimiento_id`) REFERENCES `co_conocimiento` (`conocimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `co_conocimiento`
--

DROP TABLE IF EXISTS `co_conocimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_conocimiento` (
  `conocimiento_id` int NOT NULL AUTO_INCREMENT,
  `conocimiento_titulo` varchar(150) NOT NULL,
  `conocimiento_descripcion` text,
  `conocimiento_estado` enum('BORRADOR','PUBLICADO','ELIMINADO') NOT NULL DEFAULT 'BORRADOR',
  `hardware_id` int DEFAULT NULL,
  `sistema_id` int DEFAULT NULL,
  `modulo_id` int DEFAULT NULL,
  `frecuencia_id` int DEFAULT NULL,
  `conocimiento_comentario` varchar(500) DEFAULT NULL,
  `creado_por` int NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_por` int DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`conocimiento_id`),
  KEY `fk_conocimiento_sistema` (`sistema_id`),
  KEY `fk_conocimiento_modulo` (`modulo_id`),
  KEY `fk_conocimiento_frecuencia` (`frecuencia_id`),
  KEY `fk_conocimiento_modificador` (`modificado_por`),
  KEY `fk_conocimiento_hardware` (`hardware_id`),
  KEY `fk_conocimiento_creador` (`creado_por`),
  FULLTEXT KEY `ft_conocimiento` (`conocimiento_titulo`,`conocimiento_descripcion`),
  CONSTRAINT `fk_conocimiento_creador` FOREIGN KEY (`creado_por`) REFERENCES `u_usuario` (`usuario_id`),
  CONSTRAINT `fk_conocimiento_frecuencia` FOREIGN KEY (`frecuencia_id`) REFERENCES `cl_frecuencia` (`frecuencia_id`),
  CONSTRAINT `fk_conocimiento_hardware` FOREIGN KEY (`hardware_id`) REFERENCES `cl_hardware` (`hardware_id`),
  CONSTRAINT `fk_conocimiento_modulo` FOREIGN KEY (`modulo_id`) REFERENCES `cl_modulo` (`modulo_id`),
  CONSTRAINT `fk_conocimiento_sistema` FOREIGN KEY (`sistema_id`) REFERENCES `cl_sistema` (`sistema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `co_conocimiento_busqueda`
--

DROP TABLE IF EXISTS `co_conocimiento_busqueda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_conocimiento_busqueda` (
  `conocimiento_id` int NOT NULL,
  `contenido_busqueda` longtext NOT NULL,
  PRIMARY KEY (`conocimiento_id`),
  FULLTEXT KEY `ft_conocimiento_busqueda` (`contenido_busqueda`),
  CONSTRAINT `fk_busqueda_conocimiento` FOREIGN KEY (`conocimiento_id`) REFERENCES `co_conocimiento` (`conocimiento_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `co_conocimiento_prueba`
--

DROP TABLE IF EXISTS `co_conocimiento_prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_conocimiento_prueba` (
  `conocimiento_id` int NOT NULL,
  `prueba_id` int NOT NULL,
  `prueba_orden` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`conocimiento_id`,`prueba_id`),
  KEY `fk_conocimiento_prueba_prueba` (`prueba_id`),
  CONSTRAINT `fk_conocimiento_prueba_conocimiento` FOREIGN KEY (`conocimiento_id`) REFERENCES `co_conocimiento` (`conocimiento_id`),
  CONSTRAINT `fk_conocimiento_prueba_prueba` FOREIGN KEY (`prueba_id`) REFERENCES `co_prueba` (`prueba_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `co_material_apoyo`
--

DROP TABLE IF EXISTS `co_material_apoyo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_material_apoyo` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `conocimiento_id` int DEFAULT NULL,
  `paso_id` int DEFAULT NULL,
  `material_nombre` varchar(150) NOT NULL,
  `material_tipo` enum('IMAGEN','PDF','VIDEO','ENLACE') NOT NULL,
  `material_url` varchar(500) NOT NULL,
  PRIMARY KEY (`material_id`),
  KEY `fk_material_conocimiento` (`conocimiento_id`),
  KEY `fk_material_paso` (`paso_id`),
  CONSTRAINT `fk_material_conocimiento` FOREIGN KEY (`conocimiento_id`) REFERENCES `co_conocimiento` (`conocimiento_id`),
  CONSTRAINT `fk_material_paso` FOREIGN KEY (`paso_id`) REFERENCES `pr_paso` (`paso_id`),
  CONSTRAINT `chk_material_destino` CHECK ((((`conocimiento_id` is not null) and (`paso_id` is null)) or ((`conocimiento_id` is null) and (`paso_id` is not null))))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `co_prueba`
--

DROP TABLE IF EXISTS `co_prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_prueba` (
  `prueba_id` int NOT NULL AUTO_INCREMENT,
  `prueba_descripcion` varchar(500) NOT NULL,
  `prueba_resultado_esperado` varchar(500) DEFAULT NULL,
  `prueba_estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`prueba_id`),
  UNIQUE KEY `uk_prueba_descripcion` (`prueba_descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `co_sintoma`
--

DROP TABLE IF EXISTS `co_sintoma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_sintoma` (
  `sintoma_id` int NOT NULL AUTO_INCREMENT,
  `conocimiento_id` int NOT NULL,
  `sintoma_descripcion` varchar(300) NOT NULL,
  `sintoma_orden` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`sintoma_id`),
  KEY `fk_sintoma_conocimiento` (`conocimiento_id`),
  CONSTRAINT `fk_sintoma_conocimiento` FOREIGN KEY (`conocimiento_id`) REFERENCES `co_conocimiento` (`conocimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `co_solucion`
--

DROP TABLE IF EXISTS `co_solucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_solucion` (
  `solucion_id` int NOT NULL AUTO_INCREMENT,
  `conocimiento_id` int NOT NULL,
  `solucion_descripcion` text NOT NULL,
  `solucion_tipo` enum('PASOS','DERIVACION') NOT NULL DEFAULT 'PASOS',
  `solucion_orden` int NOT NULL DEFAULT '1',
  `solucion_titulo` varchar(150) DEFAULT NULL,
  `solucion_estado` tinyint(1) NOT NULL DEFAULT '1',
  `solucion_autoservicio` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solucion_id`),
  KEY `fk_solucion_conocimiento` (`conocimiento_id`),
  CONSTRAINT `fk_solucion_conocimiento` FOREIGN KEY (`conocimiento_id`) REFERENCES `co_conocimiento` (`conocimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `co_solucion_asignacion`
--

DROP TABLE IF EXISTS `co_solucion_asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_solucion_asignacion` (
  `asignacion_id` int NOT NULL AUTO_INCREMENT,
  `solucion_id` int NOT NULL,
  `responsable_id` int DEFAULT NULL,
  `departamento_id` int DEFAULT NULL,
  `asignacion_principal` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`asignacion_id`),
  KEY `idx_asignacion_solucion` (`solucion_id`),
  KEY `idx_asignacion_responsable` (`responsable_id`),
  KEY `idx_asignacion_departamento` (`departamento_id`),
  CONSTRAINT `fk_asignacion_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `u_departamento` (`departamento_id`),
  CONSTRAINT `fk_asignacion_responsable` FOREIGN KEY (`responsable_id`) REFERENCES `u_responsable` (`responsable_id`),
  CONSTRAINT `fk_asignacion_solucion` FOREIGN KEY (`solucion_id`) REFERENCES `co_solucion` (`solucion_id`),
  CONSTRAINT `chk_asignacion_destino` CHECK (((`responsable_id` is not null) or (`departamento_id` is not null)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pr_paso`
--

DROP TABLE IF EXISTS `pr_paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pr_paso` (
  `paso_id` int NOT NULL AUTO_INCREMENT,
  `procedimiento_id` int NOT NULL,
  `paso_orden` int NOT NULL,
  `paso_instruccion` text NOT NULL,
  `paso_es_critico` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paso_id`),
  UNIQUE KEY `uq_paso_orden` (`procedimiento_id`,`paso_orden`),
  CONSTRAINT `fk_paso_procedimiento` FOREIGN KEY (`procedimiento_id`) REFERENCES `pr_procedimiento` (`procedimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pr_procedimiento`
--

DROP TABLE IF EXISTS `pr_procedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pr_procedimiento` (
  `procedimiento_id` int NOT NULL AUTO_INCREMENT,
  `procedimiento_nombre` varchar(150) NOT NULL,
  `procedimiento_descripcion` text,
  `procedimiento_estado` enum('BORRADOR','PUBLICADO') NOT NULL DEFAULT 'BORRADOR',
  `creado_por` int NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_por` int DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`procedimiento_id`),
  KEY `fk_procedimiento_creador` (`creado_por`),
  KEY `fk_procedimiento_modificador` (`modificado_por`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `se_ejecucion`
--

DROP TABLE IF EXISTS `se_ejecucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_ejecucion` (
  `ejecucion_id` int NOT NULL AUTO_INCREMENT,
  `procedimiento_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `ejecucion_fecha_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ejecucion_fecha_fin` datetime DEFAULT NULL,
  `ejecucion_estado` enum('EN_CURSO','COMPLETADA','CANCELADA') NOT NULL DEFAULT 'EN_CURSO',
  `ejecucion_observaciones` text,
  PRIMARY KEY (`ejecucion_id`),
  KEY `fk_ejecucion_procedimiento` (`procedimiento_id`),
  KEY `fk_ejecucion_usuario` (`usuario_id`),
  CONSTRAINT `fk_ejecucion_procedimiento` FOREIGN KEY (`procedimiento_id`) REFERENCES `pr_procedimiento` (`procedimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `se_ejecucion_paso`
--

DROP TABLE IF EXISTS `se_ejecucion_paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_ejecucion_paso` (
  `ejecucion_paso_id` int NOT NULL AUTO_INCREMENT,
  `ejecucion_id` int NOT NULL,
  `paso_id` int NOT NULL,
  `ejecucion_paso_cumplido` tinyint(1) NOT NULL DEFAULT '0',
  `ejecucion_paso_observacion` varchar(300) DEFAULT NULL,
  `ejecucion_paso_fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`ejecucion_paso_id`),
  UNIQUE KEY `uq_ejecucion_paso` (`ejecucion_id`,`paso_id`),
  KEY `fk_ejecucionpaso_paso` (`paso_id`),
  CONSTRAINT `fk_ejecucionpaso_ejecucion` FOREIGN KEY (`ejecucion_id`) REFERENCES `se_ejecucion` (`ejecucion_id`),
  CONSTRAINT `fk_ejecucionpaso_paso` FOREIGN KEY (`paso_id`) REFERENCES `pr_paso` (`paso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `se_resultado`
--

DROP TABLE IF EXISTS `se_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_resultado` (
  `resultado_id` int NOT NULL AUTO_INCREMENT,
  `solucion_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `resultado_funciono` tinyint(1) NOT NULL,
  `resultado_comentario` varchar(300) DEFAULT NULL,
  `resultado_fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`resultado_id`),
  KEY `fk_resultado_solucion` (`solucion_id`),
  KEY `fk_resultado_usuario` (`usuario_id`),
  CONSTRAINT `fk_resultado_solucion` FOREIGN KEY (`solucion_id`) REFERENCES `co_solucion` (`solucion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ABIERTO',
  `prioridad` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'MEDIA',
  `solicitante_id` int NOT NULL,
  `asignado_id` int DEFAULT NULL,
  `hardware_id` int DEFAULT NULL,
  `sistema_id` int DEFAULT NULL,
  `modulo_id` int DEFAULT NULL,
  `conocimiento_id` int DEFAULT NULL,
  `solucion` text COLLATE utf8mb4_unicode_ci,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `fecha_resolucion` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_ticket_codigo` (`codigo`),
  KEY `idx_ticket_estado` (`estado`),
  KEY `idx_ticket_prioridad` (`prioridad`),
  KEY `idx_ticket_solicitante` (`solicitante_id`),
  KEY `idx_ticket_asignado` (`asignado_id`),
  KEY `idx_ticket_fecha_creacion` (`fecha_creacion`),
  CONSTRAINT `ck_ticket_estado` CHECK ((`estado` in (_utf8mb4'ABIERTO',_utf8mb4'EN_PROGRESO',_utf8mb4'EN_ESPERA',_utf8mb4'RESUELTO',_utf8mb4'CERRADO',_utf8mb4'CANCELADO'))),
  CONSTRAINT `ck_ticket_prioridad` CHECK ((`prioridad` in (_utf8mb4'BAJA',_utf8mb4'MEDIA',_utf8mb4'ALTA',_utf8mb4'CRITICA')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_adjunto`
--

DROP TABLE IF EXISTS `ticket_adjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_adjunto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint NOT NULL,
  `comentario_id` bigint DEFAULT NULL,
  `nombre` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamano` bigint NOT NULL DEFAULT '0',
  `referencia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor_id` int DEFAULT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ticket_adjunto_ticket` (`ticket_id`),
  KEY `idx_ticket_adjunto_comentario` (`comentario_id`),
  CONSTRAINT `fk_ticket_adjunto_comentario` FOREIGN KEY (`comentario_id`) REFERENCES `ticket_comentario` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ticket_adjunto_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_comentario`
--

DROP TABLE IF EXISTS `ticket_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_comentario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint NOT NULL,
  `autor_id` int NOT NULL,
  `texto` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interno` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ticket_comentario_ticket` (`ticket_id`,`fecha`),
  CONSTRAINT `fk_ticket_comentario_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_etiqueta`
--

DROP TABLE IF EXISTS `ticket_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_etiqueta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NORMAL',
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_ticket_etiqueta_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_historial_estado`
--

DROP TABLE IF EXISTS `ticket_historial_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_historial_estado` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint NOT NULL,
  `estado_anterior` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_nuevo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_id` int NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ticket_historial_ticket` (`ticket_id`,`fecha`),
  CONSTRAINT `fk_ticket_historial_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_ticket_etiqueta`
--

DROP TABLE IF EXISTS `ticket_ticket_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_ticket_etiqueta` (
  `ticket_id` bigint NOT NULL,
  `etiqueta_id` bigint NOT NULL,
  PRIMARY KEY (`ticket_id`,`etiqueta_id`),
  KEY `idx_tte_etiqueta` (`etiqueta_id`),
  CONSTRAINT `fk_tte_etiqueta` FOREIGN KEY (`etiqueta_id`) REFERENCES `ticket_etiqueta` (`id`),
  CONSTRAINT `fk_tte_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_codigo_acceso`
--

DROP TABLE IF EXISTS `u_codigo_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_codigo_acceso` (
  `codigo_id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `codigo_hash` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creado_en` datetime NOT NULL,
  `expira_en` datetime NOT NULL,
  `intentos` int NOT NULL DEFAULT '0',
  `usado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_id`),
  KEY `idx_codigo_acceso_usuario` (`usuario_id`,`usado`),
  CONSTRAINT `fk_codigo_acceso_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `u_usuario` (`usuario_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_departamento`
--

DROP TABLE IF EXISTS `u_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_departamento` (
  `departamento_id` int NOT NULL AUTO_INCREMENT,
  `departamento_nombre` varchar(100) NOT NULL,
  `departamento_estado` tinyint(1) NOT NULL DEFAULT '1',
  `departamento_version` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`departamento_id`),
  UNIQUE KEY `uk_departamento_nombre` (`departamento_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_departamento_contacto`
--

DROP TABLE IF EXISTS `u_departamento_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_departamento_contacto` (
  `contacto_id` int NOT NULL AUTO_INCREMENT,
  `departamento_id` int NOT NULL,
  `contacto_tipo` varchar(50) NOT NULL,
  `contacto_valor` varchar(100) NOT NULL,
  `contacto_estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`contacto_id`),
  KEY `idx_departamento_contacto_departamento` (`departamento_id`),
  CONSTRAINT `fk_departamento_contacto_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `u_departamento` (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_responsable`
--

DROP TABLE IF EXISTS `u_responsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_responsable` (
  `responsable_id` int NOT NULL AUTO_INCREMENT,
  `departamento_id` int DEFAULT NULL,
  `responsable_nombre` varchar(160) NOT NULL,
  `responsable_cargo` varchar(120) DEFAULT NULL,
  `responsable_contacto` varchar(160) DEFAULT NULL,
  `responsable_estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`responsable_id`),
  KEY `idx_responsable_departamento` (`departamento_id`),
  CONSTRAINT `fk_responsable_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `u_departamento` (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_rol`
--

DROP TABLE IF EXISTS `u_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_rol` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_descripcion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol_estado` tinyint(1) NOT NULL DEFAULT '1',
  `rol_fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rol_fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rol_id`),
  UNIQUE KEY `rol_nombre` (`rol_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_usuario`
--

DROP TABLE IF EXISTS `u_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_usuario` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `rol_id` int NOT NULL,
  `usuario_nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_estado` tinyint(1) NOT NULL DEFAULT '1',
  `usuario_fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_ultimo_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_email` (`usuario_email`),
  KEY `fk_usuario_rol` (`rol_id`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `u_rol` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-04 12:58:56
