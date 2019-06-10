-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: vc
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `user_transaction`
--

DROP TABLE IF EXISTS `user_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_transaction` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(6) unsigned DEFAULT NULL,
  `group_id` int(6) unsigned DEFAULT NULL,
  `Credit_Debit` varchar(5) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `user_transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `vc_users` (`id`),
  CONSTRAINT `user_transaction_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `vc_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_transaction`
--

LOCK TABLES `user_transaction` WRITE;
/*!40000 ALTER TABLE `user_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vc_groups`
--

DROP TABLE IF EXISTS `vc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vc_groups` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `Group_Name` varchar(30) NOT NULL,
  `TYPE` varchar(30) DEFAULT NULL,
  `ACTIVE` varchar(2) DEFAULT NULL,
  `BALANCE` decimal(10,0) DEFAULT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `UPDATED_DATE` date DEFAULT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vc_groups`
--

LOCK TABLES `vc_groups` WRITE;
/*!40000 ALTER TABLE `vc_groups` DISABLE KEYS */;
INSERT INTO `vc_groups` VALUES (1,'TCSGNR','IT',NULL,NULL,NULL,NULL,NULL,NULL,'CS'),(2,'Shia','Community',NULL,NULL,NULL,NULL,NULL,NULL,'Islam');
/*!40000 ALTER TABLE `vc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vc_users`
--

DROP TABLE IF EXISTS `vc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vc_users` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `GROUPS_ID` int(6) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `User_password` varchar(50) DEFAULT NULL,
  `Occupation` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Email_Address` varchar(50) DEFAULT NULL,
  `Active` varchar(50) DEFAULT NULL,
  `BALANCE` decimal(10,0) DEFAULT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `UPDATED_DATE` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_group` (`GROUPS_ID`),
  CONSTRAINT `vc_users_ibfk_1` FOREIGN KEY (`GROUPS_ID`) REFERENCES `vc_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vc_users`
--

LOCK TABLES `vc_users` WRITE;
/*!40000 ALTER TABLE `vc_users` DISABLE KEYS */;
INSERT INTO `vc_users` VALUES (2,1,'tst,tst','tst',NULL,'tst','tst','tst','tst','tst',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vc_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-23 19:36:26
