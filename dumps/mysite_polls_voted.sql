CREATE DATABASE  IF NOT EXISTS `mysite` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mysite`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: mysite
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `polls_voted`
--

DROP TABLE IF EXISTS `polls_voted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_voted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id_id` int(11) NOT NULL,
  `username_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `voted_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_voted_question_id_id_28ff1650efd7501e_fk_polls_question_id` (`question_id_id`),
  KEY `polls_voted_username_id_596116ccac72ff40_fk_auth_user_id` (`username_id`),
  KEY `polls_voted_428bb064` (`choice_id`),
  CONSTRAINT `polls_voted_choice_id_796557a73280bfe5_fk_polls_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `polls_choice` (`id`),
  CONSTRAINT `polls_voted_question_id_id_28ff1650efd7501e_fk_polls_question_id` FOREIGN KEY (`question_id_id`) REFERENCES `polls_question` (`id`),
  CONSTRAINT `polls_voted_username_id_596116ccac72ff40_fk_auth_user_id` FOREIGN KEY (`username_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_voted`
--

LOCK TABLES `polls_voted` WRITE;
/*!40000 ALTER TABLE `polls_voted` DISABLE KEYS */;
INSERT INTO `polls_voted` VALUES (1,8,1,29,'2015-07-13 08:13:05'),(2,5,1,18,'2015-07-15 18:35:13'),(3,11,1,43,'2015-07-15 18:35:49'),(4,7,1,26,'2015-07-16 14:15:56'),(5,6,1,22,'2015-07-17 14:35:07'),(6,8,3,30,'2015-07-17 18:13:24'),(7,1,1,2,'2015-07-19 15:16:08'),(8,2,1,7,'2015-07-19 15:17:17');
/*!40000 ALTER TABLE `polls_voted` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-20 21:52:04
