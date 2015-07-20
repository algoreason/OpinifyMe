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
-- Table structure for table `polls_choice`
--

DROP TABLE IF EXISTS `polls_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_7aa0f6ee` (`question_id`),
  CONSTRAINT `polls_choice_question_id_6c1dc2b1cb51b4b7_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
INSERT INTO `polls_choice` VALUES (1,'Stay back , forget and move on!',0,1),(2,'Stay friends and be normal again!',1,1),(3,'Get angry on him/her for the rest of your life!',0,1),(4,'Stay friends , still keep loving and caring for them.',0,1),(5,'Awesome and happy always',0,2),(6,'Hell sad',0,2),(7,'Not very happy mostly',1,2),(8,'Not consistent enough to say',0,2),(13,'Silently walk away an do nothin!',0,4),(14,'Gut them all like pigs!',0,4),(15,'Argue back at that very instance.',0,4),(16,'Walk away and plan revenge!',0,4),(17,'A Beautiful mind',0,5),(18,'Whiplash',1,5),(19,'Slumdog Millionare',0,5),(20,'Theory of everything',0,5),(21,'beyond repair!',0,6),(22,'He will definately be back',1,6),(23,'I\'m confused',0,6),(24,'I dont give a shit!',0,6),(25,'The Big Bang Theory',0,7),(26,'F.R.I.E.N.D.S',1,7),(27,'Two and a half men',0,7),(28,'How I met your mother',0,7),(29,'Python',1,8),(30,'Java',1,8),(31,'C++',0,8),(32,'Ruby',0,8),(33,'Google',0,9),(34,'Facebook',0,9),(35,'Microsoft',0,9),(36,'Amazon',0,9),(37,'Mark Zuckerberg',0,10),(38,'Bill Gates',0,10),(39,'Steve Jobs',0,10),(40,'Elon Musk',0,10),(41,'Deepika Paukone',0,11),(42,'Priyanka Chopra',0,11),(43,'Alia Bhatt',1,11),(44,'Anushka Sharma',0,11),(45,'Red',0,12),(46,'Green',0,12),(47,'Blue',0,12),(48,'Yellow',0,12);
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-20 21:51:59
