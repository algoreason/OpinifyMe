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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_3f6418c52d8f1723_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_574bda3d3c32dbb7_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_574bda3d3c32dbb7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_3f6418c52d8f1723_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-07-13 07:34:21','1','PHIL',1,'',9,2),(2,'2015-07-13 07:34:41','2','TV',1,'',9,2),(3,'2015-07-13 07:35:00','3','MOV',1,'',9,2),(4,'2015-07-13 07:35:48','4','PERPREF',1,'',9,2),(5,'2015-07-13 07:36:31','5','GEN',1,'',9,2),(6,'2015-07-13 07:36:46','6','CS',1,'',9,2),(7,'2015-07-13 07:40:09','1','What would you do if you got rejected by your crush?',1,'',7,2),(8,'2015-07-13 07:46:54','2','What is your mood in general ?',1,'',7,2),(9,'2015-07-13 07:52:10','3','What would you do if you got rejected by your crush?',1,'',7,2),(10,'2015-07-13 07:54:02','3','What would you do if you got rejected by your crush?',3,'',7,2),(11,'2015-07-13 07:56:09','4','On a scale of 1-10 , what are you most likely to do when your anger is at 9.',1,'',7,2),(12,'2015-07-13 07:57:33','5','Which is the most inspiring movie ?',1,'',7,2),(13,'2015-07-13 08:00:08','6','Is John Snow (G.O.T) really dead ?',1,'',7,2),(14,'2015-07-13 08:01:32','7','Which is the best SITCOM ?',1,'',7,2),(15,'2015-07-13 08:02:41','8','What is your Favourite Programming Language ?',1,'',7,2),(16,'2015-07-13 08:04:06','9','Which is your favourite Tech Company ?',1,'',7,2),(17,'2015-07-13 08:05:41','10','Which of the following is your Role Model ?',1,'',7,2),(18,'2015-07-13 08:07:03','11','Which of the following is Your favourite Actress ?',1,'',7,2),(19,'2015-07-13 08:08:31','12','Which of the following colors is the best suited to you >',1,'',7,2),(20,'2015-07-15 19:39:16','6','CS',2,'Changed category_color.',9,2),(21,'2015-07-15 19:40:04','2','TV',2,'Changed category_color.',9,2),(22,'2015-07-15 19:40:34','3','MOV',2,'Changed category_color.',9,2),(23,'2015-07-15 19:41:19','4','PERPREF',2,'Changed category_color.',9,2),(24,'2015-07-15 19:41:46','5','GEN',2,'Changed category_color.',9,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-20 21:51:52
