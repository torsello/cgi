CREATE DATABASE  IF NOT EXISTS `rappioeste` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `rappioeste`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: rappioeste
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `state_code` varchar(100) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `baja` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'AEP','aeroparque','buenos aires',NULL,NULL,NULL),(2,'EZE','ezeiza','buenos aires',NULL,NULL,_binary ''),(3,'BRC','san carlos de bariloche','río negro',NULL,NULL,NULL),(4,'CTC','catamarca','catamarca',NULL,NULL,NULL),(5,'CRD','comodoro rivadavia','chubut',NULL,NULL,NULL),(6,'COR','córdoba','córdoba',NULL,NULL,NULL),(7,'EPA','el palomar','buenos aires',NULL,NULL,NULL),(8,'FMA','formosa','formosa',NULL,NULL,NULL),(9,'EQS','esquel','chubut',NULL,NULL,NULL),(10,'CPO','general pico','la pampa',NULL,NULL,NULL),(11,'IGR','iguazú','misiones',NULL,NULL,NULL),(12,'JUJ','jujuy','jujuy',NULL,NULL,NULL),(13,'IRJ','la rioja','la rioja',NULL,NULL,NULL),(14,'LGS','malargue','mendoza',NULL,NULL,NULL),(15,'MDQ','mar del plata','buenos aires',NULL,NULL,NULL),(16,'MDZ','mendoza','mendoza',NULL,NULL,NULL),(17,'PRA','paraná','entre ríos',NULL,NULL,NULL),(18,'PSS','posadas','misiones',NULL,NULL,NULL),(19,'PMY','puerto madryn','chubut',NULL,NULL,NULL),(20,'RCQ','reconquista','santa fé',NULL,NULL,NULL),(21,'RES','resistencias','chaco',NULL,NULL,NULL),(22,'RCU','río cuarto','córdoba',NULL,NULL,NULL),(23,'RGL','río gallegos','santa cruz',NULL,NULL,NULL),(24,'RGA','río grande','tierra del fuego',NULL,NULL,NULL),(25,'RHD','río hondo','santiago del estero',NULL,NULL,NULL),(26,'SLA','salta','salta',NULL,NULL,NULL),(27,'FDO','san fernando','buenos aires',NULL,NULL,NULL),(28,'UAQ','san juan','san juan',NULL,NULL,NULL),(29,'LUQ','san luis','san luis',NULL,NULL,NULL),(30,'AFA','san rafael','mendoza',NULL,NULL,NULL),(31,'RSA','santa rosa','la pampa',NULL,NULL,NULL),(32,'SDE','santiago del estero','santiago del estero',NULL,NULL,NULL),(33,'TUC','tucumán','tucumán',NULL,NULL,NULL),(34,'VDM','viedma','río negro',NULL,NULL,NULL),(35,'VME','villa mercedes','san luis',NULL,NULL,NULL),(37,'AAA','asasd','AAA','AAA','AAA',_binary '');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'cryptocurrency'),(2,'cash'),(3,'credit card'),(4,'miles');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `passage_code` char(36) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `origin_place` varchar(50) DEFAULT NULL,
  `destination_place` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `payment_way` int(11) DEFAULT NULL,
  `payment_way_company` varchar(50) DEFAULT NULL,
  UNIQUE KEY `ticket_id_uindex` (`id`),
  UNIQUE KEY `passage_passage_code_uindex` (`passage_code`),
  KEY `user_id__fk` (`user_id`),
  KEY `payment___fk` (`payment_way`),
  CONSTRAINT `payment___fk` FOREIGN KEY (`payment_way`) REFERENCES `payment` (`id`),
  CONSTRAINT `user_id__fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,2,'d8cb2532-ad1e-464d-9b6f-556cd4c7b47a','2020-01-02 00:00:00','2020-01-12 00:00:00','buenos aires, argentina','barcelona, españa',1600,1,'ethereum'),(2,1,'d890744c-7672-4bdf-b9b2-371bdc026b39','2020-01-02 00:00:00','2020-01-12 00:00:00','mendoza, argentina','berlin, alemania',700,2,'dollar');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `dni_passport` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `about` varchar(300) DEFAULT NULL,
  `miles` mediumtext,
  `registered` tinyint(1) DEFAULT NULL,
  `root` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'36864160','maccubex','101010','adrian','cañete','adri@ainvio.com','1533191472','castro barros 868, banfield','buenos aires','argentina','argentino',NULL,'32123.12',1,0),(2,'34963958','amaterazu7','linux7','diego','leonel','diego@company.edu','1524123231','levalle 1292, lanús','buenos aires','argentina','alemania','Do not be scared of the truth because we need to restart the human foundation in truth And I love you..','5231333',1,1),(3,'49263958','lucio','lala123','lucio','trucco','lucio@gmail.com','1523113124','maipú 122, lomas de zamora','buenos aires','argentina','italia',NULL,'2123.12',1,1),(4,'349639458','','','matias','torsello','mati@lacho.edu','1524125231','','','','',NULL,'1231',0,0),(5,'22333444','sdsf','sdfsdfsdf','sdfsf','sdfsdfsdf','sdf','sdfsdf','sdf','sdf','sdf','sdfsf','sfdsfasfs','123',1,NULL),(6,'123123123123','perroLooco','a123123sd','asdada','asdasdf','diego_diacero@hotmail.com','123131313123','asdasd asda13','asdad','asdads','asdadad','Do not be scared of the truth because we need to restart the human foundation in truth And I love you..','5231312.05',1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rappioeste'
--

--
-- Dumping routines for database 'rappioeste'
--
/*!50003 DROP PROCEDURE IF EXISTS `altaCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `altaCiudad`(xcode varchar(10), xdescription varchar(50), xstate varchar(50), xstate_code varchar(100), xaddress varchar(50))
BEGIN
    insert into airport(code, description, state, state_code, address, baja) values (xcode, xdescription, xstate, xstate_code, xaddress, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bajaCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bajaCiudad`(xcode varchar(10))
BEGIN
    UPDATE airport SET baja = 1 WHERE airport.code = xcode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificarMillas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarMillas`(xid int(11), xmiles mediumtext)
BEGIN
UPDATE user SET user.miles=xmiles WHERE id=xid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-24 12:51:39
