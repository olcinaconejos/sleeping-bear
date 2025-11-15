-- MySQL dump 10.13  Distrib 9.5.0, for Linux (x86_64)
--
-- Host: localhost    Database: hibernateProj
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
Warning: A partial dump from a server that has GTIDs will by default include the GTIDs of all transactions, even those that changed suppressed parts of the database. If you don't want to restore GTIDs, pass --set-gtid-purged=OFF. To make a complete dump, pass --all-databases --triggers --routines --events.
Warning: A dump from a server that has GTIDs enabled will by default include the GTIDs of all transactions, even those that were executed during its extraction and might not be represented in the dumped data. This might result in an inconsistent data dump.
In order to ensure a consistent backup of the database, pass --single-transaction or --lock-all-tables or --source-data.
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '92c995fb-bd64-11f0-8cf9-6a28c19add51:1-65';

--
-- Table structure for table `Amistad`
--

DROP TABLE IF EXISTS `Amistad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amistad` (
  `id_amistad` bigint NOT NULL,
  `fecha_amistad` date NOT NULL,
  `id_usuario1` bigint DEFAULT NULL,
  `id_usuario2` bigint DEFAULT NULL,
  PRIMARY KEY (`id_amistad`),
  UNIQUE KEY `UKkawg9keoo44m67gqjw99vuygp` (`id_usuario1`),
  UNIQUE KEY `UKnfqmtndu6hqbjpi3nj61yqvbv` (`id_usuario2`),
  CONSTRAINT `FK1sj1qcied005v89poiosr5y30` FOREIGN KEY (`id_usuario2`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `FKkoulu6vu7hlemtovld46g6vs8` FOREIGN KEY (`id_usuario1`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amistad`
--

LOCK TABLES `Amistad` WRITE;
/*!40000 ALTER TABLE `Amistad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Amistad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Etiqueta`
--

DROP TABLE IF EXISTS `Etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Etiqueta` (
  `id_etiqueta` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_etiqueta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Etiqueta`
--

LOCK TABLES `Etiqueta` WRITE;
/*!40000 ALTER TABLE `Etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Perfil`
--

DROP TABLE IF EXISTS `Perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Perfil` (
  `id_perfil` bigint NOT NULL AUTO_INCREMENT,
  `biografia` varchar(255) NOT NULL,
  `fecha_registro` date NOT NULL,
  `foto_url` varchar(255) NOT NULL,
  `id_usuario` bigint DEFAULT NULL,
  PRIMARY KEY (`id_perfil`),
  UNIQUE KEY `UKqoe0hm2jl1e4bbn3cs8yye6eg` (`id_usuario`),
  CONSTRAINT `FKf6rmvwdl9bw8qxfemm3jjt762` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Perfil`
--

LOCK TABLES `Perfil` WRITE;
/*!40000 ALTER TABLE `Perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `Perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publicacion`
--

DROP TABLE IF EXISTS `Publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Publicacion` (
  `id_publicacion` bigint NOT NULL AUTO_INCREMENT,
  `contenido` varchar(255) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `id_usuario` bigint DEFAULT NULL,
  PRIMARY KEY (`id_publicacion`),
  KEY `FKdx0rqcabhbw6fanew99twy2pr` (`id_usuario`),
  CONSTRAINT `FKdx0rqcabhbw6fanew99twy2pr` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publicacion`
--

LOCK TABLES `Publicacion` WRITE;
/*!40000 ALTER TABLE `Publicacion` DISABLE KEYS */;
INSERT INTO `Publicacion` VALUES (1,'hola hola','2020-11-15','publicacion ejemplo',1),(2,'pan pan pan','2025-11-05','panaderia pepe',3),(3,'hola ho','2018-02-01','hola hola',3);
/*!40000 ALTER TABLE `Publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PublicacionEtiqueta`
--

DROP TABLE IF EXISTS `PublicacionEtiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PublicacionEtiqueta` (
  `id_publicacion_etiqueta` bigint NOT NULL,
  `id_etiqueta` bigint DEFAULT NULL,
  `id_publicacion` bigint DEFAULT NULL,
  PRIMARY KEY (`id_publicacion_etiqueta`),
  UNIQUE KEY `UKrfxjatiyqgceo1puqmgbe3aqm` (`id_etiqueta`),
  UNIQUE KEY `UKb938uqr341bc2sfkh9jtjpxc3` (`id_publicacion`),
  CONSTRAINT `FK66jpk95howkl7ef1fhlqq0cmo` FOREIGN KEY (`id_publicacion`) REFERENCES `Publicacion` (`id_publicacion`),
  CONSTRAINT `FKcj9aw66glx8cv4u4j35ncfab9` FOREIGN KEY (`id_etiqueta`) REFERENCES `Etiqueta` (`id_etiqueta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PublicacionEtiqueta`
--

LOCK TABLES `PublicacionEtiqueta` WRITE;
/*!40000 ALTER TABLE `PublicacionEtiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `PublicacionEtiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `fecha_registro` date NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'juan@example.com','2025-11-27','Juan'),(3,'pepe@example.com','2025-11-15','Pepe');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-10 23:33:42