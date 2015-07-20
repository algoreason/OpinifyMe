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
-- Table structure for table `polls_question`
--

DROP TABLE IF EXISTS `polls_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  `category_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_question_2d5f8f90` (`category_id_id`),
  CONSTRAINT `polls_quest_category_id_id_6f71ac5ada492120_fk_polls_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `polls_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_question`
--

LOCK TABLES `polls_question` WRITE;
/*!40000 ALTER TABLE `polls_question` DISABLE KEYS */;
INSERT INTO `polls_question` VALUES (1,'What would you do if you got rejected by your crush?','2015-07-13 07:40:04',1),(2,'What is your mood in general ?','2015-07-13 07:45:39',5),(4,'On a scale of 1-10 , what are you most likely to do when your anger is at 9.','2015-07-13 07:56:05',1),(5,'Which is the most inspiring movie ?','2015-07-13 07:57:28',3),(6,'Is John Snow (G.O.T) really dead ?','2015-07-13 08:00:02',2),(7,'Which is the best SITCOM ?','2015-07-13 08:01:22',2),(8,'What is your Favourite Programming Language ?','2015-07-13 08:02:37',6),(9,'Which is your favourite Tech Company ?','2015-07-13 08:04:00',6),(10,'Which of the following is your Role Model ?','2015-07-13 08:05:37',4),(11,'Which of the following is Your favourite Actress ?','2015-07-13 08:06:58',4),(12,'Which of the following colors is the best suited to you >','2015-07-13 08:08:24',4);
/*!40000 ALTER TABLE `polls_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-20 21:52:03
