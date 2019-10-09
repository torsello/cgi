CREATE DATABASE  IF NOT EXISTS `rappioeste` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `rappioeste`;
-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: rappioeste
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `state_code` varchar(100) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `show` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `airport_code_uindex` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'AEP','aeroparque','buenos aires',NULL,NULL,0),(2,'EZE','ezeiza','buenos aires',NULL,NULL,1),(3,'BRC','san carlos de bariloche','río negro',NULL,NULL,1),(4,'CTC','catamarca','catamarca',NULL,NULL,1),(5,'CRD','comodoro rivadavia','chubut',NULL,NULL,1),(6,'COR','córdoba','córdoba',NULL,NULL,1),(7,'EPA','el palomar','buenos aires',NULL,NULL,1),(8,'FMA','formosa','formosa',NULL,NULL,1),(9,'EQS','esquel','chubut',NULL,NULL,1),(10,'CPO','general pico','la pampa',NULL,NULL,1),(11,'IGR','iguazú','misiones',NULL,NULL,1),(12,'JUJ','jujuy','jujuy',NULL,NULL,1),(13,'IRJ','la rioja','la rioja',NULL,NULL,1),(14,'LGS','malargue','mendoza',NULL,NULL,1),(15,'MDQ','mar del plata','buenos aires',NULL,NULL,1),(16,'MDZ','mendoza','mendoza',NULL,NULL,1),(17,'PRA','paraná','entre ríos',NULL,NULL,1),(18,'PSS','posadas','misiones',NULL,NULL,1),(19,'PMY','puerto madryn','chubut',NULL,NULL,1),(20,'RCQ','reconquista','santa fé',NULL,NULL,1),(21,'RES','resistencias','chaco',NULL,NULL,1),(22,'RCU','río cuarto','córdoba',NULL,NULL,1),(23,'RGL','río gallegos','santa cruz',NULL,NULL,1),(24,'RGA','río grande','tierra del fuego',NULL,NULL,1),(25,'RHD','río hondo','santiago del estero',NULL,NULL,1),(26,'SLA','salta','salta',NULL,NULL,1),(27,'FDO','san fernando','buenos aires',NULL,NULL,1),(28,'UAQ','san juan','san juan',NULL,NULL,1),(29,'LUQ','san luis','san luis',NULL,NULL,1),(30,'AFA','san rafael','mendoza',NULL,NULL,1),(31,'RSA','santa rosa','la pampa',NULL,NULL,1),(32,'SDE','santiago del estero','santiago del estero',NULL,NULL,1),(33,'TUC','tucumán','tucumán',NULL,NULL,1),(34,'VDM','viedma','río negro',NULL,NULL,1),(35,'VME','villa mercedes','san luis',NULL,NULL,1);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `id` char(36) NOT NULL,
  `airport_code_from` varchar(10) DEFAULT NULL,
  `airport_code_to` varchar(10) DEFAULT NULL,
  `available_economy` int(11) DEFAULT NULL,
  `available_economy_premium` int(11) DEFAULT NULL,
  `available_business` int(11) DEFAULT NULL,
  `available_business_premium` int(11) DEFAULT NULL,
  `flight_date` datetime DEFAULT NULL,
  `time` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flight_airport_from_code_fk` (`airport_code_from`),
  KEY `flight_airport_to_code_fk` (`airport_code_to`),
  CONSTRAINT `flight_airport_from_code_fk` FOREIGN KEY (`airport_code_from`) REFERENCES `airport` (`code`),
  CONSTRAINT `flight_airport_to_code_fk` FOREIGN KEY (`airport_code_to`) REFERENCES `airport` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('1e55621e-6032-447d-8ca7-271237948091','AEP','AFA',2,1,0,2,'2019-06-05 15:20:00',1.46,3400),('1e56621e-6032-447d-8ca7-271237948091','AFA','AEP',1,0,1,1,'2019-06-27 07:20:00',2,2700),('1e75621e-6032-447d-8ca7-271237948090','BRC','EZE',123,12,23,7,'2019-10-05 12:30:00',1.35,1500),('1e76621e-6032-447d-8ca7-271237948090','EZE','BRC',238,43,14,7,'2019-10-15 12:30:00',1.5,1500),('2e75621e-6032-447d-8ca7-271237948090','BRC','EZE',28,14,32,5,'2019-10-05 21:30:00',1.35,2000),('2e76621e-6032-447d-8ca7-271237948090','EZE','BRC',328,122,14,7,'2019-10-15 15:20:00',1.5,2000),('3e75621e-6032-447d-8ca7-271237948090','BRC','EZE',18,53,5,4,'2019-10-05 15:20:00',1.35,1200),('3e76621e-6032-447d-8ca7-271237948090','EZE','BRC',128,43,5,6,'2019-10-15 06:10:00',1.25,1200),('4e75621e-6032-447d-8ca7-271237948090','BRC','EZE',132,21,12,4,'2019-10-05 06:10:00',1.35,700),('4e76621e-6032-447d-8ca7-271237948090','EZE','BRC',318,53,14,7,'2019-10-15 07:20:00',2.5,700),('5e75621e-6032-447d-8ca7-271237948090','COR','EZE',24,21,3,3,'2019-10-05 16:10:00',1,900),('5e76621e-6032-447d-8ca7-271237948090','EZE','COR',128,43,5,6,'2019-10-15 13:10:00',2,900),('6e75621e-6032-447d-8ca7-271237948090','COR','EZE',2,122,14,6,'2019-10-05 15:20:00',1.5,1800),('6e76621e-6032-447d-8ca7-271237948090','EZE','COR',218,53,5,6,'2019-10-15 10:20:00',2.05,1800),('7e75621e-6032-447d-8ca7-271237948090','EZE','RGA',122,4,15,4,'2019-11-02 18:40:00',2.3,2600),('8e75621e-6032-447d-8ca7-271237948090','RGA','EZE',211,43,23,2,'2019-11-15 00:20:00',3.3,3500),('8e76621e-6032-447d-8ca7-271237948090','EZE','RGA',238,37,11,4,'2019-11-02 00:00:00',3,2500),('9e75621e-6032-447d-8ca7-271237948090','RGA','EZE',24,37,12,6,'2019-11-15 13:00:00',1.5,2700),('ae75621e-6032-447d-8ca7-271237948090','EZE','RGA',245,31,12,3,'2019-11-03 20:05:00',2.45,4500),('be75621e-6032-447d-8ca7-271237948090','RGA','EZE',35,35,12,7,'2019-11-16 14:15:00',1.45,2100);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miles`
--

DROP TABLE IF EXISTS `miles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` char(36) DEFAULT NULL,
  `ticket_id` int(11) NOT NULL,
  `relationship_id` char(36) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `miles_ticket_id_fk` (`ticket_id`),
  KEY `miles_user_id_fk` (`user_id`),
  KEY `miles_miles_relationship_id_fk` (`relationship_id`),
  CONSTRAINT `miles_miles_relationship_id_fk` FOREIGN KEY (`relationship_id`) REFERENCES `miles_relationship` (`id`),
  CONSTRAINT `miles_ticket_id_fk` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `miles_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miles`
--

LOCK TABLES `miles` WRITE;
/*!40000 ALTER TABLE `miles` DISABLE KEYS */;
INSERT INTO `miles` VALUES (1,'2',1,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(2,'2',2,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(3,'2',11,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(4,'2',12,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(5,'2',13,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(6,'2',14,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(7,'2',15,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(8,'2',16,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(9,'2',17,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(10,'bbd6f410-0db4-404c-9343-7a0995a55db7',30,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(11,'bbd6f410-0db4-404c-9343-7a0995a55db7',31,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(12,'5006a5a9-f547-4733-aef2-090db36b6ad3',32,'6e75621e-6032-447d-8ca7-27123794','REGISTERED'),(13,'5006a5a9-f547-4733-aef2-090db36b6ad3',33,'6e75621e-6032-447d-8ca7-27123794','REGISTERED');
/*!40000 ALTER TABLE `miles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miles_relationship`
--

DROP TABLE IF EXISTS `miles_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miles_relationship` (
  `id` char(36) NOT NULL,
  `miles_price` float DEFAULT NULL,
  `miles_ticket` float DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `season` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miles_relationship`
--

LOCK TABLES `miles_relationship` WRITE;
/*!40000 ALTER TABLE `miles_relationship` DISABLE KEYS */;
INSERT INTO `miles_relationship` VALUES ('1a4ba073-e7b6-11e9-8c39-fcaa14c0fe67',3,0.6,3,'10/2019'),('6e74621e-6032-447d-8ca7-27123794',2,0.4,0,'04/2019'),('6e75621e-6032-447d-8ca7-27123794',3,0.5,1,'08/2019'),('8ad560d7-e7a0-11e9-8c39-fcaa14c0fe67',3,0.6,2,'10/2019');
/*!40000 ALTER TABLE `miles_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `permission` tinyint(1) DEFAULT NULL,
  `role_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_id_fk` (`user_id`),
  CONSTRAINT `role_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'2',1,'admin'),(2,'1',1,'user'),(3,'3',1,'user'),(4,'4',1,'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `code` char(36) DEFAULT NULL,
  `cancellation_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `payment_way` int(11) DEFAULT NULL,
  `payment_way_company` varchar(50) DEFAULT NULL,
  `refund` float DEFAULT NULL,
  UNIQUE KEY `ticket_id_uindex` (`id`),
  UNIQUE KEY `passage_passage_code_uindex` (`code`),
  KEY `payment___fk` (`payment_way`),
  KEY `ticket_user_id_fk` (`user_id`),
  KEY `ticket_flight_id_fk` (`flight_id`),
  CONSTRAINT `payment___fk` FOREIGN KEY (`payment_way`) REFERENCES `payment` (`id`),
  CONSTRAINT `ticket_flight_id_fk` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`),
  CONSTRAINT `ticket_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'1e55621e-6032-447d-8ca7-271237948091','2','d8cb2532-ad1e-464d-9b6f-556cd4c7b47a','2019-11-02 18:40:00','REGISTERED',NULL,3,'VISA',10),(2,'1e56621e-6032-447d-8ca7-271237948091','2','d890744c-7672-4bdf-b9b2-371bdc026b39','2019-11-02 18:40:00','REGISTERED',NULL,2,'dollar',11),(3,'1e75621e-6032-447d-8ca7-271237948090','2','6e1260de-6032-447d-8ca7-271237941065','2019-11-02 18:40:00','REGISTERED',NULL,1,'ethereum',12),(4,'1e75621e-6032-447d-8ca7-271237948090','2','6e7460de-6032-447d-8ca7-271287941079',NULL,'REGISTERED',NULL,3,'VISA',NULL),(5,'1e75621e-6032-447d-8ca7-271237948090','2','6e7360de-6032-447d-8ca7-271237941012',NULL,'REGISTERED',NULL,3,'MasterCard',NULL),(6,'1e75621e-6032-447d-8ca7-271237948090','2','6e7160de-6032-447d-8ca7-271237941433',NULL,'REGISTERED',NULL,3,'VISA',NULL),(7,'1e75621e-6032-447d-8ca7-271237948090','2','6e7562de-6032-447d-8ca7-271237912323',NULL,'REGISTERED',NULL,3,'AmericanExpress',NULL),(8,'1e75621e-6032-447d-8ca7-271237948090','2','6e75621e-6032-447d-8ca7-271237948090',NULL,'REGISTERED',NULL,3,'VISA',NULL),(9,'ae75621e-6032-447d-8ca7-271237948090','2','cd77621e-8032-447d-8ca7-271237948088',NULL,'REGISTERED',NULL,3,'VISA',NULL),(11,'ae75621e-6032-447d-8ca7-271237948090','2','cd77621e-9032-447d-8ca7-271237948088',NULL,'REGISTERED','2019-10-02 07:44:06',3,'VISA',NULL),(12,'2e75621e-6032-447d-8ca7-271237948090','2','de47998c-f70d-4046-a771-7cde3d1bffa0',NULL,'REGISTERED','2019-10-02 08:36:37',3,'AmericanExpress',NULL),(13,'2e76621e-6032-447d-8ca7-271237948090','2','75557457-7dd1-4506-a1f8-b476af1ab67c',NULL,'REGISTERED','2019-10-02 08:36:52',3,'VISA',NULL),(14,'1e75621e-6032-447d-8ca7-271237948090','2','038d297f-b389-44fd-9204-bbd607b3d775',NULL,'REGISTERED','2019-10-02 09:46:27',3,'AmericanExpress',NULL),(15,'1e76621e-6032-447d-8ca7-271237948090','2','416826cc-8b7c-446f-b971-2aa2fcb58582',NULL,'REGISTERED','2019-10-02 09:46:34',3,'AmericanExpress',NULL),(16,'2e75621e-6032-447d-8ca7-271237948090','2','d0730582-48db-4aa7-bf74-f5d9602ef73d',NULL,'REGISTERED','2019-10-02 12:35:27',3,'AmericanExpress',NULL),(17,'2e76621e-6032-447d-8ca7-271237948090','2','f13e9a50-44da-43cb-bcae-93403fbbd1ec',NULL,'REGISTERED','2019-10-02 12:35:36',3,'AmericanExpress',NULL),(30,'1e75621e-6032-447d-8ca7-271237948090','bbd6f410-0db4-404c-9343-7a0995a55db7','22ae6713-f461-4ba7-a11c-74d68b5f28f1',NULL,'REGISTERED','2019-10-04 01:55:55',3,'VISA',NULL),(31,'1e76621e-6032-447d-8ca7-271237948090','bbd6f410-0db4-404c-9343-7a0995a55db7','a003fecd-13ac-4f2c-a742-c8b594f70d1d',NULL,'REGISTERED','2019-10-04 01:55:56',3,'VISA',NULL),(32,'1e75621e-6032-447d-8ca7-271237948090','5006a5a9-f547-4733-aef2-090db36b6ad3','5f27b43e-55d8-491b-9189-10f035306273',NULL,'REGISTERED','2019-10-04 02:23:57',3,'MasterCard',NULL),(33,'1e76621e-6032-447d-8ca7-271237948090','5006a5a9-f547-4733-aef2-090db36b6ad3','12d443e2-cd5c-42da-823e-21e592f41a67',NULL,'REGISTERED','2019-10-04 02:24:00',3,'MasterCard',NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` char(36) NOT NULL,
  `dni_passport` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` text,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `about` varchar(300) DEFAULT NULL,
  `registered` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `user_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('086b4613-f852-4828-b280-49f8fd6934df','2342424','testDemo','cGVycm9Mb2NvMTIz','diego','caéte','asdjnajds@sdfasd','123123123','banfield','banfield','argentina','argentino','Hola test',0),('1','36864160','maccubex','cGVycm9Mb2NvMTIz','adrian','cañete','adri@ainvio.com','1533191475','castro barros 868, banfield','buenos aires','argentina','argentino','argentinoooo garca argentinoooooooooo',1),('2','34963958','amaterazu7','cGVycm9Mb2NvMTIz','diego','leonel','diego@company.edu','1524123231','levalle 1292, lanús','buenos aires','argentina','alemania','Do not be scared of the truth because we need to restart the human foundation in truth And I love you..',1),('3','49263958','lucius1','cGVycm9Mb2NvMTIz','luciana','trucca','lucia@gmail.com','1523113124','maipú 122, lomas de zamora','buenos aires','argentina','italia','I love the life enjoying it with a very beautiful people. ',1),('4','349639458','lucio','lala123','matias','torsello','mati@lacho.edu','1524125231','','','','',NULL,1),('5','49263958','lucius2','cGVycm9Mb2NvMTIz','lucio','trucco','lucio@gmail.com','1523113124','maipú 122, lomas de zamora','buenos aires','argentina','italia','Do not be scared of the truth because we need asda asd.',1),('5006a5a9-f547-4733-aef2-090db36b6ad3','12313234',NULL,NULL,'asdasd','asd','evxqw@monsanto.com','12314124123',NULL,NULL,NULL,'argentina',NULL,0),('6','34963958','amaterazu1','cGVycm9Mb2NvMTIz','diego','leonel','diego@company.edu','1524123231','levalle 1292, lanús','buenos aires','argentina','alemania','Do not be scared of the truth because we need to restart the human foundation in truth And I love you..',1),('61f7002a-2867-428a-b2c8-94ddd38bac15','348234239','maikel','cGVycm9Mb2NvMTIz','Micaela','Crescini','micacrescini@gmail.com','11331912817','Los tres arrollos 2787','Buenos aires, Bulogne','Argentina','Árabe','I like travel a lot!, And meet interesting people on my way.',1),('7','34963958','amaterazu2','cGVycm9Mb2NvMTIz','diego','leonel','diego@company.edu','1524123231','levalle 1292, lanús','buenos aires','argentina','alemania','Do not be scared of the truth because we need to restart the human foundation in truth And I love you..',1),('7a7fd3a2-2cc8-459a-8e1e-a95842c9feb1','12313234',NULL,NULL,'asdasd','asd','evxqw@monsanto.com','12314124123',NULL,NULL,NULL,'argentina',NULL,0),('bbd6f410-0db4-404c-9343-7a0995a55db7','12313234',NULL,NULL,'asdasd','asd','evxqw@monsanto.com','12314124123',NULL,NULL,NULL,'argentina',NULL,0),('fd3b79ac-0cd0-4605-914e-fdd1bcb46e85','36864160','maccubex2','cGVycm9Mb2NvMTIz','adrian','cañete','adri@ainvio.com','1533191472','castro barros 868, banfield','buenos aires','argentina','argentino','buenos airesbuenos airesbuenos airesbuenos aires',1);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `altaCiudad`(xcode varchar(10), xdescription varchar(50), xstate varchar(50), xstate_code varchar(100), xaddress varchar(50))
BEGIN
    DECLARE xcount int default 0;
    
    select count(*) into xcount from airport where airport.code=xcode;
    
	IF (xcount>0) THEN
		UPDATE airport SET airport.show = 1 WHERE airport.code = xcode;
    ELSE
		insert into airport(code, description, state, state_code, address, airport.show) values (xcode, xdescription, xstate, xstate_code, xaddress, 0);
	END IF;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bajaCiudad`(xcode varchar(10))
BEGIN
    UPDATE airport SET airport.show = 0 WHERE airport.code = xcode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_ticket_by_cash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rapiuser`@`%` PROCEDURE `create_ticket_by_cash`(IN `p_flight_id` VARCHAR(36), IN `p_user_id` VARCHAR(36), IN `p_code` VARCHAR(36), IN `p_payment_way` INT(11), IN `p_payment_way_company` VARCHAR(50), IN `p_version` INT(11))
BEGIN

    ## Ticket -> INSERT
    INSERT INTO ticket (flight_id, user_id, code, status, creation_date, payment_way, payment_way_company)
    VALUES(p_flight_id, p_user_id, p_code, 'REGISTERED', now(), p_payment_way, p_payment_way_company);

    ## Miles Amount -> INSERT
    INSERT INTO miles (user_id, ticket_id, relationship_id, status)
    VALUES (p_user_id, (SELECT LAST_INSERT_ID()), (SELECT id FROM miles_relationship WHERE version = p_version), 'REGISTERED');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rapiuser`@`%` PROCEDURE `create_user`(`p_id` CHAR(36), `p_dni_passport` VARCHAR(50), `p_user_name` VARCHAR(50), `p_password` TEXT, `p_name` VARCHAR(50), `p_surname` VARCHAR(50), `p_email` VARCHAR(50), `p_phone` VARCHAR(50), `p_address` VARCHAR(50), `p_city` VARCHAR(50), `p_country` VARCHAR(50), `p_nationality` VARCHAR(50), `p_about` VARCHAR(300), `p_registered` TINYINT(1))
BEGIN

    ## User -> INSERT
    INSERT INTO user (id, dni_passport, user_name, password, name, surname, email, phone, address, city, country, nationality, about, registered)
    VALUES(p_id, p_dni_passport, p_user_name, p_password, p_name, p_surname, p_email, p_phone, p_address, p_city, p_country, p_nationality, p_about, p_registered);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `emitirReporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `emitirReporte`(IN xinicio date, IN xfin date, IN xorigen varchar(50), IN xdestino varchar(50))
BEGIN

DECLARE cantCancelados int default 0;
DECLARE reintegrado float default 0;

CASE
	WHEN (xorigen="NULO" and xdestino="NULO") THEN
		select count(*) INTO cantCancelados from ticket where DATE(cancellation_date) between xinicio and xfin;
		select sum(refund) INTO reintegrado from ticket where DATE(cancellation_date) between xinicio and xfin;
	WHEN (xorigen="NULO") THEN
		select count INTO cantCancelados from ticket INNER JOIN flight on ticket.flight_id=flight.id where flight.airport_code_to=xdestino and DATE(cancellation_date) between xinicio and xfin;
		select sum(refund) INTO reintegrado from ticket INNER JOIN flight on ticket.flight_id=flight.id where flight.airport_code_to=xdestino and DATE(cancellation_date) between xinicio and xfin;
	WHEN (xdestino="NULO") THEN
		select count INTO cantCancelados from ticket INNER JOIN flight on ticket.flight_id=flight.id where flight.airport_code_from=xorigen and DATE(cancellation_date) between xinicio and xfin;
		select sum(refund) INTO reintegrado from ticket INNER JOIN flight on ticket.flight_id=flight.id where flight.airport_code_from=xorigen and DATE(cancellation_date) between xinicio and xfin;
	ELSE
		select count(*) INTO cantCancelados from ticket INNER JOIN flight on ticket.flight_id=flight.id where flight.airport_code_from=xorigen and flight.airport_code_to=xdestino and DATE(cancellation_date) between xinicio and xfin;
		select sum(refund) INTO reintegrado from ticket INNER JOIN flight on ticket.flight_id=flight.id where flight.airport_code_from=xorigen and flight.airport_code_to=xdestino and DATE(cancellation_date) between xinicio and xfin;
END CASE;

if(reintegrado is null) then
	set reintegrado := 0;
end if;

SELECT xinicio as 'Fecha inicio', xfin as 'Fecha fin', xorigen as 'Origen', xdestino as 'Destino', cantCancelados as 'Cantidad cancelados',reintegrado as 'Reintegro';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_ticket_by_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rapiuser`@`%` PROCEDURE `get_ticket_by_code`(IN `p_code` VARCHAR(36))
BEGIN

    ## Ticket -> SELECT
    SELECT * FROM ticket WHERE code = p_code;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_ticket_flight_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rapiuser`@`%` PROCEDURE `get_ticket_flight_by_id`(IN `p_flight_id` VARCHAR(36), IN `p_from` VARCHAR(50), IN `p_to` VARCHAR(50), IN `p_start_date` VARCHAR(100), IN `p_end_date` VARCHAR(100))
BEGIN
    DECLARE _selectStmt VARCHAR(2500);
    DECLARE _status VARCHAR(50);
    SET _status = 'REGISTERED';

    SET _selectStmt = CONCAT('SELECT t.flight_id, f.airport_code_from, f.airport_code_to, f.flight_date, f.time, f.price, t.code, t.payment_way_company
                               FROM flight f, ticket t
                              WHERE f.id = t.flight_id AND t.user_id = ', p_flight_id);

    IF (p_from IS NOT NULL && p_to IS NOT NULL) THEN
        SET _selectStmt = CONCAT(_selectStmt, ' AND f.airport_code_from = ', p_from, ' AND f.airport_code_to = ', p_to);
    END IF;

    IF (p_start_date IS NOT NULL && p_end_date IS NOT NULL) THEN
        SET _selectStmt = CONCAT(_selectStmt, ' AND f.flight_date > ', p_start_date, ' AND f.flight_date < ', p_end_date);
    END IF;

    SET _selectStmt = CONCAT(_selectStmt, ' AND t.status = ', _status, ' ORDER BY f.flight_date ;');

    SET @statement = _selectStmt;
    PREPARE dynquery FROM @statement;
    EXECUTE dynquery;
    DEALLOCATE PREPARE dynquery;

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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarMillas`(xmiles FLOAT, xmes INT, xanio INT)
BEGIN
    DECLARE xversion INT DEFAULT 0;
	DECLARE xseason VARCHAR(50);
	
    SELECT CONCAT(xmes, "/", xanio) into xseason;
    
    select max(miles_relationship.version) into xversion from miles_relationship;
	
    
	insert into miles_relationship (id, miles_price, miles_ticket, version, season) values ( UUID(), 3, xmiles, xversion+1,xseason);
    
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

-- Dump completed on 2019-10-08 23:50:25
