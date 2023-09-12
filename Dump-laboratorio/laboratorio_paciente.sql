-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: laboratorio
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Juan','Pérez','1980-05-15','M','Calle 123, Ciudad','555-123-4567','juan.perez@example.com'),(2,'María','Gómez','1995-11-30','F','Av. Principal, Pueblo','555-987-6543','maria.gomez@example.com'),(3,'Pedro','López','1975-09-22','M','Plaza Mayor, Villa','555-222-3333','pedro.lopez@example.com'),(4,'Laura','Rodríguez','1988-03-10','F','Calle Secundaria, Ciudad','555-444-7777','laura.rodriguez@example.com'),(5,'Carlos','Martínez','1999-07-02','M','Avenida Norte, Pueblo','555-666-9999','carlos.martinez@example.com'),(6,'Laura','Pérez','1992-07-30','F','Avenida Sur,Pueblo','555-444-4444','laura.perez@example.com'),(7,'Ricardo','Morales','2000-02-18','M','Plaza Central, Ciudad','555-999-9999','ricardo.morales@example.com'),(8,'Ignacio','Murk','1975-09-22','M','Plaza Mayor, Villa','555-456-3333','ignacio.murk@example.com'),(9,'Patricia','Rodríguez','1993-03-10','F','Calle Natal, Ciudad','555-123-7777','patricia.rodriguez@example.com'),(10,'Carlos','Ramirez','1999-07-02','M','Avenida Norte, Villa','555-656-8899','carlos.ramirez@example.com'),(11,'Isabel','García','1990-08-20','F','Calle 456, Ciudad','555-555-5555','isabel.garcia@example.com'),(12,'Antonio','Martínez','1978-04-12','M','Avenida Central, Pueblo','555-777-7777','antonio.martinez@example.com'),(13,'Sofia','Fernández','1985-11-02','F','Calle 789, Villa','555-888-8888','sofia.fernandez@example.com');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-12 18:15:54
