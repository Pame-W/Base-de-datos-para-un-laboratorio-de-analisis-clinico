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
-- Temporary view structure for view `pacientedetalles`
--

DROP TABLE IF EXISTS `pacientedetalles`;
/*!50001 DROP VIEW IF EXISTS `pacientedetalles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pacientedetalles` AS SELECT 
 1 AS `ID_Paciente`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `FechaNacimiento`,
 1 AS `Genero`,
 1 AS `ID_Resultado`,
 1 AS `ID_Prueba`,
 1 AS `FechaRealizacion`,
 1 AS `Resultado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pacientemaspruebas`
--

DROP TABLE IF EXISTS `pacientemaspruebas`;
/*!50001 DROP VIEW IF EXISTS `pacientemaspruebas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pacientemaspruebas` AS SELECT 
 1 AS `ID_Paciente`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `CantidadPruebas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pruebascostopromedio`
--

DROP TABLE IF EXISTS `pruebascostopromedio`;
/*!50001 DROP VIEW IF EXISTS `pruebascostopromedio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pruebascostopromedio` AS SELECT 
 1 AS `ID_Prueba`,
 1 AS `NombrePrueba`,
 1 AS `CostoPromedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `resultadosanormales`
--

DROP TABLE IF EXISTS `resultadosanormales`;
/*!50001 DROP VIEW IF EXISTS `resultadosanormales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `resultadosanormales` AS SELECT 
 1 AS `ID_Resultado`,
 1 AS `ID_Paciente`,
 1 AS `NombrePaciente`,
 1 AS `ApellidoPaciente`,
 1 AS `ID_Prueba`,
 1 AS `NombrePrueba`,
 1 AS `FechaRealizacion`,
 1 AS `Resultado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `medicopruebas`
--

DROP TABLE IF EXISTS `medicopruebas`;
/*!50001 DROP VIEW IF EXISTS `medicopruebas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `medicopruebas` AS SELECT 
 1 AS `ID_Medico`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Especialidad`,
 1 AS `CantidadPruebas`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `pacientedetalles`
--

/*!50001 DROP VIEW IF EXISTS `pacientedetalles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pacientedetalles` AS select `p`.`ID_Paciente` AS `ID_Paciente`,`p`.`Nombre` AS `Nombre`,`p`.`Apellido` AS `Apellido`,`p`.`FechaNacimiento` AS `FechaNacimiento`,`p`.`Genero` AS `Genero`,`r`.`ID_Resultado` AS `ID_Resultado`,`r`.`ID_Prueba` AS `ID_Prueba`,`r`.`FechaRealizacion` AS `FechaRealizacion`,`r`.`Resultado` AS `Resultado` from (`paciente` `p` left join `resultado` `r` on((`p`.`ID_Paciente` = `r`.`ID_Paciente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pacientemaspruebas`
--

/*!50001 DROP VIEW IF EXISTS `pacientemaspruebas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pacientemaspruebas` AS select `p`.`ID_Paciente` AS `ID_Paciente`,`p`.`Nombre` AS `Nombre`,`p`.`Apellido` AS `Apellido`,count(`r`.`ID_Resultado`) AS `CantidadPruebas` from (`paciente` `p` left join `resultado` `r` on((`p`.`ID_Paciente` = `r`.`ID_Paciente`))) group by `p`.`ID_Paciente`,`p`.`Nombre`,`p`.`Apellido` order by `CantidadPruebas` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pruebascostopromedio`
--

/*!50001 DROP VIEW IF EXISTS `pruebascostopromedio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pruebascostopromedio` AS select `p`.`ID_Prueba` AS `ID_Prueba`,`p`.`NombrePrueba` AS `NombrePrueba`,avg(`p`.`Costo`) AS `CostoPromedio` from `prueba` `p` group by `p`.`ID_Prueba`,`p`.`NombrePrueba` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `resultadosanormales`
--

/*!50001 DROP VIEW IF EXISTS `resultadosanormales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `resultadosanormales` AS select `r`.`ID_Resultado` AS `ID_Resultado`,`r`.`ID_Paciente` AS `ID_Paciente`,`p`.`Nombre` AS `NombrePaciente`,`p`.`Apellido` AS `ApellidoPaciente`,`r`.`ID_Prueba` AS `ID_Prueba`,`pr`.`NombrePrueba` AS `NombrePrueba`,`r`.`FechaRealizacion` AS `FechaRealizacion`,`r`.`Resultado` AS `Resultado` from ((`resultado` `r` join `prueba` `pr` on((`r`.`ID_Prueba` = `pr`.`ID_Prueba`))) join `paciente` `p` on((`r`.`ID_Paciente` = `p`.`ID_Paciente`))) where (not((`r`.`Resultado` like 'Dentro de los rangos normales'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `medicopruebas`
--

/*!50001 DROP VIEW IF EXISTS `medicopruebas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `medicopruebas` AS select `m`.`ID_Medico` AS `ID_Medico`,`m`.`Nombre` AS `Nombre`,`m`.`Apellido` AS `Apellido`,`m`.`Especialidad` AS `Especialidad`,count(`o`.`ID_Orden`) AS `CantidadPruebas` from (`medico` `m` left join `orden` `o` on((`m`.`ID_Medico` = `o`.`ID_Medico`))) group by `m`.`ID_Medico`,`m`.`Nombre`,`m`.`Apellido`,`m`.`Especialidad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-12 18:15:54
