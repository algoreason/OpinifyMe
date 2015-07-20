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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-07-12 18:28:55'),(2,'auth','0001_initial','2015-07-12 18:28:55'),(3,'admin','0001_initial','2015-07-12 18:28:55'),(4,'contenttypes','0002_remove_content_type_name','2015-07-12 18:28:55'),(5,'auth','0002_alter_permission_name_max_length','2015-07-12 18:28:55'),(6,'auth','0003_alter_user_email_max_length','2015-07-12 18:28:55'),(7,'auth','0004_alter_user_username_opts','2015-07-12 18:28:55'),(8,'auth','0005_alter_user_last_login_null','2015-07-12 18:28:55'),(9,'auth','0006_require_contenttypes_0002','2015-07-12 18:28:55'),(10,'polls','0001_initial','2015-07-12 18:28:56'),(11,'polls','0002_user','2015-07-12 18:28:56'),(12,'polls','0003_user_user_name','2015-07-12 18:28:56'),(13,'polls','0004_delete_user','2015-07-12 18:28:56'),(14,'polls','0005_category','2015-07-12 18:28:56'),(15,'polls','0006_question_category_id','2015-07-12 18:28:56'),(16,'polls','0007_voted','2015-07-12 18:28:56'),(17,'polls','0008_voted_choice','2015-07-12 18:28:56'),(18,'polls','0009_voted_voted_date','2015-07-12 18:28:56'),(19,'polls','0010_auto_20150712_2157','2015-07-12 18:28:56'),(20,'polls','0011_auto_20150712_2358','2015-07-12 18:28:56'),(21,'sessions','0001_initial','2015-07-12 18:28:56'),(22,'polls','0012_auto_20150716_0102','2015-07-15 19:32:44');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-20 21:52:02
