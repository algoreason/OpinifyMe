-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mysite
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add question',7,'add_question'),(20,'Can change question',7,'change_question'),(21,'Can delete question',7,'delete_question'),(22,'Can add choice',8,'add_choice'),(23,'Can change choice',8,'change_choice'),(24,'Can delete choice',8,'delete_choice'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(28,'Can add voted',10,'add_voted'),(29,'Can change voted',10,'change_voted'),(30,'Can delete voted',10,'delete_voted'),(31,'Can add comments',11,'add_comments'),(32,'Can change comments',11,'change_comments'),(33,'Can delete comments',11,'delete_comments');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$lscrS9Axi4KR$opiKjhSIkyiWZrsLQ0ZqQ7WRp6QsTeUf1dxGI6KSR7A=','2015-10-11 13:52:44',0,'markz@fb.com','Mark','Zuckerberg','mark@facebook.com',0,1,'2015-07-20 16:00:24'),(2,'pbkdf2_sha256$20000$BUxNhLZcqBrB$5z022tJA8H0EfUKM7vM0GCTsq2m0SRD9/3Ih9K43aMw=','2015-11-08 18:20:29',1,'Sharad','Sharad','Dargan','sharaddargan@gmail.com',1,1,'2015-07-20 16:44:36'),(3,'pbkdf2_sha256$20000$RipbLGs0S52S$+eheLL/B5GKLMjncOrrZftxX2iM8DgGfT0TpzePgOYY=','2015-10-23 10:32:25',0,'shivam','Shivam','Dargan','shivamdargan@gmail.com',0,1,'2015-07-21 10:21:47'),(4,'pbkdf2_sha256$20000$6F2wHoQKJO20$6iiwfo/qwbPhZlks3yEbCOJ86i9LEMvSMtkOmyDkhEc=','2015-09-30 06:29:21',0,'jyotman94','Jyotman','Singh','jyotman94@gmail.com',0,1,'2015-07-21 18:07:16'),(5,'pbkdf2_sha256$20000$9YBqKc0sLKP2$9qV5z4J6HQzazd3qPq0mne6icQHEhFMZcdLnDygcfw8=','2015-07-22 05:17:35',0,'shashank','shashank','joshi','shashank.joshi30@gmail.com',0,1,'2015-07-22 05:17:15'),(6,'pbkdf2_sha256$20000$pxUALKbcr1Wx$e2uGuOP4TmTK2qcXf1Yz5/PYQ8xbrKHUvrsEuXSO/TM=','2015-07-22 08:06:57',0,'sahil216sharma','sahil','sharma','sahil216sharma@gmail.com',0,1,'2015-07-22 08:06:15'),(7,'pbkdf2_sha256$20000$eFqeZcTBc4Ah$D3pimyKMt6FT3BVm3q3ZPq2YQ6k6Hg+qDqjINSfNlaM=','2015-07-28 08:26:31',0,'$','Dollar','Bling','asdf@asdf.asdf',0,1,'2015-07-22 17:43:28'),(8,'pbkdf2_sha256$20000$YosOkrOIDx7L$TlTeaHsnWNssFcdlX3MX29bnkbg4v2vrzTeT4HoaAH4=','2015-08-12 19:06:02',0,'sarthak221995','sarthak','dargan','sarthak221995@gmail.com',0,1,'2015-07-29 07:15:33'),(9,'pbkdf2_sha256$20000$kPfHQHm1flAp$oKNG0xBCCW2Hqzmlt7JR0lgjqXWc0doeScXVx0UE2mY=',NULL,0,'Ankushjindal2007@gmail.com ','Ankush','jindal','ankushjindal42@gmail.com',0,1,'2015-08-15 06:52:43'),(10,'pbkdf2_sha256$20000$Iiqfyt5Ao50g$B7Mx4L85oF2EZgKHufNUrLq0MGbkg+ZdRlekdprGGAI=','2015-10-28 12:01:40',0,'jindalabhishek20','Abhishek','Jindal','jindalabhishek786@gmail.com',0,1,'2015-08-16 08:46:07'),(11,'pbkdf2_sha256$20000$cdPBGlFUCwit$z+YMK2V5QckL7CCYzHXFZx2FjPLSgD7ibdZexaXVXv4=',NULL,0,'testuser1','testname','testlastname','test@test.com',0,1,'2015-08-21 14:54:41'),(12,'pbkdf2_sha256$20000$tdfrKq0uanfU$R2En/QP2vdAUe1mmUK6zafBTLNPZlvM02ZWiwbawNhc=','2015-09-06 12:07:23',0,'noddyisbest','Prasant','Naudiyal','noddyisbest@gmail.com',0,1,'2015-09-06 12:07:08'),(13,'pbkdf2_sha256$20000$aYD0F0SOPLNb$x2pMHmkmPr+//M+jjdOY7nERKB4yK1484/0XGNgxtl0=','2015-09-30 12:04:55',0,'sroohul656','rahul','verma','sroohul656@gmail.com',0,1,'2015-09-30 12:04:42'),(14,'pbkdf2_sha256$20000$vt92rMhXQ1KW$iIYZTP60NUK/dL2Ip3DGps9pGdhkzn7jNVhdxFx9p4Y=','2015-10-30 18:28:26',0,' ',' ',' ','xxx@xx.xx',0,1,'2015-10-26 15:30:36'),(15,'pbkdf2_sha256$20000$CmHx5yz7JHGn$YmoPj+Nf8JUXOH9Hwm/YAAzOIsLVQpmRimby56QrAu4=','2015-10-26 18:18:16',0,'ashish','ashish','goel','ashishg656@gmail.com',0,1,'2015-10-26 18:18:09'),(16,'pbkdf2_sha256$20000$94WnERECNSlR$VtJHp3D30vgaKmMJq2DNmtJRGhhX04XdH9kkJLNi1vQ=','2015-10-27 06:32:38',1,'abhishek-jindal','Abhishek','Jindal','jindalabhishek20@gmail.com',1,1,'2015-10-26 18:22:13'),(18,'pbkdf2_sha256$20000$a3qQ4VgGp5l9$bhVZMpFcBMhRio9vXbkJEs0VEFvTi2tyrwySqSridlI=','2015-10-28 15:50:56',0,'shivam22','shivam','DARGAN','shivamdargan@gmail.com',0,1,'2015-10-28 15:50:31'),(19,'pbkdf2_sha256$20000$pHZWaGWL5vSd$U78mK3AUfw+fHfC9gaej/IUuWm4Gi4kmfQa8OuRLM9k=','2015-10-29 04:13:38',0,'ross-geller','Ross','Geller','rossgeller@gmail.com',0,1,'2015-10-28 18:09:39');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-07-20 16:47:00','1','CS',1,'',9,2),(2,'2015-07-20 16:47:38','2','TV',1,'',9,2),(3,'2015-07-20 16:48:07','3','MOV',1,'',9,2),(4,'2015-07-20 16:48:42','4','GEN',1,'',9,2),(5,'2015-07-20 16:49:30','5','PERPREF',1,'',9,2),(6,'2015-07-20 16:50:03','6','PHIL',1,'',9,2),(7,'2015-07-20 16:52:02','1','Which is the best SITCOM ?',1,'',7,2),(8,'2015-07-20 16:59:42','2','Which is your favourite Tech Company ?',1,'',7,2),(9,'2015-07-20 17:01:02','3','What is your Favourite Programming Language ?',1,'',7,2),(10,'2015-07-20 17:02:21','4','Which of the following is your Role Model ?',1,'',7,2),(11,'2015-07-20 17:03:31','5','Which of the following colors is the best suited to you >',1,'',7,2),(12,'2015-07-20 17:05:29','6','Which of the following Bollywood actresses is Your favourite ?',1,'',7,2),(13,'2015-07-20 17:06:12','7','Is John Snow (G.O.T) really dead ?',1,'',7,2),(14,'2015-07-20 17:07:24','8','Which of the following is the most inspiring movie ?',1,'',7,2),(15,'2015-07-20 17:08:46','9','On a scale of 1-10 , what are you most likely to do when your anger is at 9.',1,'',7,2),(16,'2015-07-20 17:09:35','10','What is your mood in general ?',1,'',7,2),(17,'2015-07-20 17:10:55','11','What would you do if you got rejected by your crush?',1,'',7,2),(18,'2015-09-28 11:41:58','1','markz@fb.com',2,'Changed username.',4,2),(19,'2015-10-26 18:22:13','16','abhishek-jindal',1,'',4,2),(20,'2015-10-26 18:23:02','16','abhishek-jindal',2,'Changed first_name, last_name, email, is_staff, is_superuser and last_login.',4,2),(21,'2015-10-26 18:23:16','16','abhishek-jindal',2,'No fields changed.',4,2),(22,'2015-10-27 06:33:32','15','\'.MOV\' extension refers usually to what kind of file?',1,'',7,16),(23,'2015-10-27 18:05:01','2','Sharad',2,'Changed first_name and last_name.',4,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'polls','category'),(8,'polls','choice'),(11,'polls','comments'),(7,'polls','question'),(10,'polls','voted'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-07-20 15:45:32'),(2,'auth','0001_initial','2015-07-20 15:45:32'),(3,'admin','0001_initial','2015-07-20 15:45:33'),(4,'contenttypes','0002_remove_content_type_name','2015-07-20 15:45:33'),(5,'auth','0002_alter_permission_name_max_length','2015-07-20 15:45:33'),(6,'auth','0003_alter_user_email_max_length','2015-07-20 15:45:33'),(7,'auth','0004_alter_user_username_opts','2015-07-20 15:45:33'),(8,'auth','0005_alter_user_last_login_null','2015-07-20 15:45:33'),(9,'auth','0006_require_contenttypes_0002','2015-07-20 15:45:33'),(10,'polls','0001_initial','2015-07-20 15:45:33'),(11,'polls','0002_user','2015-07-20 15:45:33'),(12,'polls','0003_user_user_name','2015-07-20 15:45:33'),(13,'polls','0004_delete_user','2015-07-20 15:45:33'),(14,'polls','0005_category','2015-07-20 15:45:33'),(15,'polls','0006_question_category_id','2015-07-20 15:45:33'),(16,'polls','0007_voted','2015-07-20 15:45:33'),(17,'polls','0008_voted_choice','2015-07-20 15:45:33'),(18,'polls','0009_voted_voted_date','2015-07-20 15:45:33'),(19,'polls','0010_auto_20150712_2157','2015-07-20 15:45:33'),(20,'polls','0011_auto_20150712_2358','2015-07-20 15:45:33'),(21,'polls','0012_auto_20150716_0102','2015-07-20 15:45:33'),(22,'polls','0013_auto_20150720_1545','2015-07-20 15:45:33'),(23,'sessions','0001_initial','2015-07-20 15:45:33'),(24,'polls','0014_auto_20151023_0809','2015-10-23 08:09:38');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('027hobm1r5nd344ks16myu0049hktjyk','MWIxZmI1YTVhODI1YWY5MjRlYmViZjc3OTkzMjhlNTc5NmFmNDZhYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjYxNzM3MmVhNTMwM2JmZmQwZDNjMTM4MThlNzhhNjc2N2UzNGNlMTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSIsInVzZXJfaWRuYW1lIjoiYXNoaXNoIn0=','2015-11-09 18:18:16'),('17vspbtjuxfyeupcn0ymix45rcbxqwb4','M2E0OTFiZmNjZWY3MDAwODg3MDMxZGJjMTFjYWY0OWQzZTFiMzI5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxODllM2Y0ZTgzZjJhYTUxOTg4ZmNlOTZiZjlmNDYyNmNhMDY0ZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiIsInVzZXJfaWRuYW1lIjoibm9kZHlpc2Jlc3QifQ==','2015-09-20 12:07:23'),('3nxbm9rfiqwww4py1r83yuq4muj5zyh6','ZjdiYmRhN2U1Zjg2ZmQzMWU0MzhkYWUwY2E3MGRkOTE4ZjEzZDMxNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjIwYmMxN2JkM2E5ZmM3NmVjZTgzZDE1YWM1N2NlMzU3OTg2ZGMxN2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCIsInVzZXJfaWRuYW1lIjoic2hpdmFtMjIifQ==','2015-11-11 15:50:56'),('3rat3js3a73tecgijs719cstjjjlmsit','ODQwNGYyZmZlZjMzMGM3YTkzNWZmZjRlNWQzMjg5NjI2ZDRhOGRiZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ0YjU3N2IzYTk0Y2VhYzkxYjYyNWRhODYzNGY0YzlmMTk2NDkyNGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwidXNlcl9pZG5hbWUiOiJqeW90bWFuOTQifQ==','2015-08-04 18:07:44'),('4pk66m014c4jmyxuadmh5f69gg70ay0g','NDczY2QyZTVkZTdmZDlmNDI2OWZhYjNkNmU4NjQwMTdmZjI0ZWI4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlYjM4MDFiM2JmYzZmNTMyZjRkZDQ5NjEwNjc1NDlhZTQ4NjI5ZDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2015-11-11 18:11:51'),('6gayidwl11quu3274va1e0umkg7fx7wp','ZGZiMjIzMDJiNjA0MjcxM2FjYTVjOGI5Y2M2NDFiMzNmYmVjY2RlNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjIzNzUxNWEyNGE1MjYyODU4MzkzMGFhNzM2MTk4ZWYyYjZiNTI2ZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwidXNlcl9pZG5hbWUiOiJtYXJreiJ9','2015-08-03 16:52:43'),('7cw5rmrkrv2vxz6jwrnb0nssoqozs3az','OTM1MDRmOGQzYzJhMjFlMjg3M2E4ZmJiNmFhNjY5ODRkMWFiYTM4MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5MDIzMjBmYjQ2OTVkMDdjZTI1NzNlOGE1OGQyYmYxYzA3ODdlYzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwidXNlcl9pZG5hbWUiOiJzaGl2YW0ifQ==','2015-08-08 20:16:20'),('7hi4pdlpb2ktzl9kq4xgmpc4aw38cztr','YTg2NjYxY2MxYmZlZDY3ZjNmZGFiMGE0MDg5YmQxMTkzZTYyOGE0MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRlODE3MjNkYjE0ODAyZTZlNWIzNmVmMDE2ZTRhZTYzOGYxZWI2YTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyIsInVzZXJfaWRuYW1lIjoic3Jvb2h1bDY1NiJ9','2015-10-14 12:04:55'),('7ze2ifbmj7gy9lignf473eb10siifdmz','OWU0YTRkODVhNWVkY2NmMTM4MzQzZjQ1N2ZjYmQ2ZjM3MjVjZDExMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjRlODI2NDI5ODk5ZjZkMDdkN2M4NTRkZGQ5MjI3MmQ5ZmY4Y2U2M2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3IiwidXNlcl9pZG5hbWUiOiIkIn0=','2015-08-11 08:26:31'),('8iuh8ezykf6kz5vzq2v51ylwm1oi80v0','OTM1MDRmOGQzYzJhMjFlMjg3M2E4ZmJiNmFhNjY5ODRkMWFiYTM4MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5MDIzMjBmYjQ2OTVkMDdjZTI1NzNlOGE1OGQyYmYxYzA3ODdlYzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwidXNlcl9pZG5hbWUiOiJzaGl2YW0ifQ==','2015-09-22 17:59:25'),('a77n4pcqhd3j8wvl8yrnjgo9m5k42tgr','Mjc3MTc5YjMyNGRlMGIwN2QyOWYwZDM2YjhkN2I5NGFkODU1NzExNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxMDA2ZGNmZDViMGMzMmM2ZDhiZDY4N2ZjODZkODRkYmI5MzA3OGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCIsInVzZXJfaWRuYW1lIjoiamluZGFsYWJoaXNoZWsyMCJ9','2015-11-11 11:25:57'),('b73qnxfzab06js90ahdciuq77uoc5qxr','Mjc3MTc5YjMyNGRlMGIwN2QyOWYwZDM2YjhkN2I5NGFkODU1NzExNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxMDA2ZGNmZDViMGMzMmM2ZDhiZDY4N2ZjODZkODRkYmI5MzA3OGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCIsInVzZXJfaWRuYW1lIjoiamluZGFsYWJoaXNoZWsyMCJ9','2015-10-17 18:31:33'),('cv9sbk7n79dpisoph03i2yk13rm5ag9y','Mjc3MTc5YjMyNGRlMGIwN2QyOWYwZDM2YjhkN2I5NGFkODU1NzExNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxMDA2ZGNmZDViMGMzMmM2ZDhiZDY4N2ZjODZkODRkYmI5MzA3OGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCIsInVzZXJfaWRuYW1lIjoiamluZGFsYWJoaXNoZWsyMCJ9','2015-11-06 17:35:27'),('d9s7752ncxyv639e6voj7urede7347rf','ZWQxMTU2YjFhYjVkZTg1MDg1MmNlNzMxM2FkYmRiZDJmNjJhY2M2NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlODMzMDAzZDI5MTU0ZjA3N2UxMjgzNjYxYmNhYTVjNzRjZDQ3NGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4IiwidXNlcl9pZG5hbWUiOiJzYXJ0aGFrMjIxOTk1In0=','2015-08-26 19:06:02'),('e7yl7mfmwok04qwjasrbh13r0berum60','Mjc3MTc5YjMyNGRlMGIwN2QyOWYwZDM2YjhkN2I5NGFkODU1NzExNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxMDA2ZGNmZDViMGMzMmM2ZDhiZDY4N2ZjODZkODRkYmI5MzA3OGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCIsInVzZXJfaWRuYW1lIjoiamluZGFsYWJoaXNoZWsyMCJ9','2015-10-03 12:23:36'),('eceb8j3vxfvlop4to82cw44vcxkqeeis','MTc3M2YyZTU2NGU3Y2UxYzgzY2U5Yzg2Y2ExZDk2N2ZlOWUyMzE1NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZjRhOWI0NTc3NGU3OTc1YjJiM2ZkZWNiOGQwYzA5ODU5NmFlZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2IiwidXNlcl9pZG5hbWUiOiJzYWhpbDIxNnNoYXJtYSJ9','2015-08-05 08:06:57'),('eqkn8p9vowjj5yqo7gntxt1i7w5mrw4t','ZWQxMTU2YjFhYjVkZTg1MDg1MmNlNzMxM2FkYmRiZDJmNjJhY2M2NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlODMzMDAzZDI5MTU0ZjA3N2UxMjgzNjYxYmNhYTVjNzRjZDQ3NGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4IiwidXNlcl9pZG5hbWUiOiJzYXJ0aGFrMjIxOTk1In0=','2015-08-12 07:15:50'),('je6x70sa6lrfsa6aqgqegfu8jdtnin4d','ODQwNGYyZmZlZjMzMGM3YTkzNWZmZjRlNWQzMjg5NjI2ZDRhOGRiZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ0YjU3N2IzYTk0Y2VhYzkxYjYyNWRhODYzNGY0YzlmMTk2NDkyNGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwidXNlcl9pZG5hbWUiOiJqeW90bWFuOTQifQ==','2015-10-14 06:29:21'),('nnz1o5fetl781buf0in36l767zsxjep2','OTM1MDRmOGQzYzJhMjFlMjg3M2E4ZmJiNmFhNjY5ODRkMWFiYTM4MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5MDIzMjBmYjQ2OTVkMDdjZTI1NzNlOGE1OGQyYmYxYzA3ODdlYzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwidXNlcl9pZG5hbWUiOiJzaGl2YW0ifQ==','2015-11-06 10:32:25'),('o64unhps5joxmps3gm3f3wwwde3i25kl','NDczY2QyZTVkZTdmZDlmNDI2OWZhYjNkNmU4NjQwMTdmZjI0ZWI4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlYjM4MDFiM2JmYzZmNTMyZjRkZDQ5NjEwNjc1NDlhZTQ4NjI5ZDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2015-08-03 16:44:54'),('p79qyzb0bcd9oplb4c5kfhkui3qw0c04','Mjc3MTc5YjMyNGRlMGIwN2QyOWYwZDM2YjhkN2I5NGFkODU1NzExNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxMDA2ZGNmZDViMGMzMmM2ZDhiZDY4N2ZjODZkODRkYmI5MzA3OGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCIsInVzZXJfaWRuYW1lIjoiamluZGFsYWJoaXNoZWsyMCJ9','2015-11-11 12:01:40'),('ppemexyslhotp4etaudr4dpvsi9dpejl','ODQwNGYyZmZlZjMzMGM3YTkzNWZmZjRlNWQzMjg5NjI2ZDRhOGRiZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ0YjU3N2IzYTk0Y2VhYzkxYjYyNWRhODYzNGY0YzlmMTk2NDkyNGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwidXNlcl9pZG5hbWUiOiJqeW90bWFuOTQifQ==','2015-09-08 15:30:22'),('q860pl5v48nsttrapifrp6lhggkb2vqz','MzFiYjQzODk1ZjhmZWQxOTgzNzYxOWU5ZDNiYmQ4NzJhN2VlNDMzYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0MDIzNDNiOTcyODJmMDYyMzNjNDM2OTQwZjI3Y2VhMTFiMmE5YWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1IiwidXNlcl9pZG5hbWUiOiJzaGFzaGFuayJ9','2015-08-05 05:17:35'),('qbvyio8kjhwnxn6wb2obphtjjytu055l','Mjc3MTc5YjMyNGRlMGIwN2QyOWYwZDM2YjhkN2I5NGFkODU1NzExNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxMDA2ZGNmZDViMGMzMmM2ZDhiZDY4N2ZjODZkODRkYmI5MzA3OGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCIsInVzZXJfaWRuYW1lIjoiamluZGFsYWJoaXNoZWsyMCJ9','2015-08-30 08:46:19'),('r3ck7gf3tvdt0utroh4nk9tt8erl4oie','ZWQxMTU2YjFhYjVkZTg1MDg1MmNlNzMxM2FkYmRiZDJmNjJhY2M2NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlODMzMDAzZDI5MTU0ZjA3N2UxMjgzNjYxYmNhYTVjNzRjZDQ3NGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4IiwidXNlcl9pZG5hbWUiOiJzYXJ0aGFrMjIxOTk1In0=','2015-08-12 07:22:52'),('rub3238j5x7kc3di1akozntcc2wzt5gk','OTM1MDRmOGQzYzJhMjFlMjg3M2E4ZmJiNmFhNjY5ODRkMWFiYTM4MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5MDIzMjBmYjQ2OTVkMDdjZTI1NzNlOGE1OGQyYmYxYzA3ODdlYzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwidXNlcl9pZG5hbWUiOiJzaGl2YW0ifQ==','2015-08-12 07:21:28'),('snjj43qet3upgzdqj9otp452e1cnd2qo','YjVmNWU4ODMyNWI0ZTZlZjYxZmNhMDYzNDE5NzAwMzI5ZWE0MzQxYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2MDMzMWRiMjg4MDUwZDU4ZGRkNjk0YzdlNGIzNTFiMmNhNDU3ZTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOSIsInVzZXJfaWRuYW1lIjoicm9zcy1nZWxsZXIifQ==','2015-11-12 04:13:38'),('w0gpf7pl2mmvv4tea6k4yp8wlyvangu5','YWUzZmU5Y2UzZDg5MmRiODIwNWUxZmE2MTQ5YmYzNTUxNzBiZDgyNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0YzBmNDUwNTZmZDg5NjYzZDFhYTFmYzEyNDdjMGE3NDg4MTVmMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNCIsInVzZXJfaWRuYW1lIjoiICJ9','2015-11-13 18:28:26'),('wc56jfmzxxp17136ez60sd3ozfkwvnv9','OTM1MDRmOGQzYzJhMjFlMjg3M2E4ZmJiNmFhNjY5ODRkMWFiYTM4MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5MDIzMjBmYjQ2OTVkMDdjZTI1NzNlOGE1OGQyYmYxYzA3ODdlYzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwidXNlcl9pZG5hbWUiOiJzaGl2YW0ifQ==','2015-08-31 13:33:58'),('xev3qirrtt8rv8rnxdyft6auzh1jsbgg','OTM1MDRmOGQzYzJhMjFlMjg3M2E4ZmJiNmFhNjY5ODRkMWFiYTM4MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5MDIzMjBmYjQ2OTVkMDdjZTI1NzNlOGE1OGQyYmYxYzA3ODdlYzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwidXNlcl9pZG5hbWUiOiJzaGl2YW0ifQ==','2015-09-08 11:24:45');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_category`
--

DROP TABLE IF EXISTS `polls_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(200) NOT NULL,
  `category_name` varchar(400) NOT NULL,
  `category_color` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_category`
--

LOCK TABLES `polls_category` WRITE;
/*!40000 ALTER TABLE `polls_category` DISABLE KEYS */;
INSERT INTO `polls_category` VALUES (1,'CS','Technology','#46B6AC'),(2,'TV','TV','#FFD54F'),(3,'MOV','Movies','#4CAF50'),(4,'GEN','General Discussions','#673AB7'),(5,'PERPREF','Personal Perspective','#03A9F4'),(6,'PHIL','Social Concerns','#F44336');
/*!40000 ALTER TABLE `polls_category` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `polls_choice_question_id_246c99a640fbbd72_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
INSERT INTO `polls_choice` VALUES (1,'The Big Bang Theory',12,1),(2,'F.R.I.E.N.D.S',14,1),(3,'Two and a half men',4,1),(4,'How I met your mother',1,1),(5,'Google',21,2),(6,'Facebook',14,2),(7,'Microsoft',10,2),(8,'Amazon',5,2),(9,'Python',20,3),(10,'Java',16,3),(11,'C++',15,3),(12,'Ruby',6,3),(13,'Mark Zuckerberg',15,4),(14,'Bill Gates',11,4),(15,'Steve Jobs',18,4),(16,'Elon Musk',5,4),(17,'Red',10,5),(18,'Green',10,5),(19,'Blue',10,5),(20,'Yellow',11,5),(21,'Deepika Paukone',9,6),(22,'Priyanka Chopra',7,6),(23,'Alia Bhatt',13,6),(24,'Anushka Sharma',4,6),(25,'beyond repair!',2,7),(26,'He will definately be back',4,7),(27,'I\'m confused',0,7),(28,'I dont give a shit!',0,7),(29,'A Beautiful mind',6,8),(30,'Whiplash',8,8),(31,'Slumdog Millionare',4,8),(32,'Theory of everything',5,8),(33,'Silently walk away an do nothin!',1,9),(34,'Gut them all like pigs!',0,9),(35,'Argue back at that very instance.',0,9),(36,'Walk away and plan revenge!',0,9),(37,'Awesome and happy always',0,10),(38,'Hell sad',0,10),(39,'Not very happy mostly',0,10),(40,'Not consistent enough to say',2,10),(41,'Stay back , forget and move on!',0,11),(42,'Stay friends and be normal again!',1,11),(43,'Get angry on him/her for the rest of your life!',2,11),(44,'Stay friends , still keep loving and caring for them.',0,11),(45,'Yes',1,12),(46,'No',0,12),(47,'Doesnt Matter',0,12),(48,'Maybe !',0,12),(49,'Z S Associates',0,13),(50,'Accenture',1,13),(51,'',0,13),(52,'',1,13),(53,'daeth note ',0,14),(54,'',0,14),(55,'',0,14),(56,'',1,14),(57,'audio',0,15),(58,'animation/movie file',2,15),(59,'MS office document',0,15),(60,'image file',0,15),(61,'In a great way',1,16),(62,'No',0,16),(63,'Maybe',0,16),(64,'Both are Equal',0,16),(65,'android app development',0,17),(66,'web development',0,17),(67,'windows app development',0,17),(68,'desktop application',0,17),(69,'c',0,18),(70,'c++',0,18),(71,'java',0,18),(72,'python',0,18),(73,'dragon ball z',0,19),(74,'code geass',0,19),(75,'death note',0,19),(76,'naruto',0,19),(77,'Breaking Bad',0,20),(78,'Mad men',0,20),(79,'Game of thrones',1,20),(80,'The walking dead',0,20),(81,'Pursuit of happyness',0,21),(82,'Good will hunting',0,21),(83,'3 idiots',0,21),(84,'October sky',0,21),(85,'Sherlock holmes',0,22),(86,'Mad men',0,22),(87,'Homeland',0,22),(88,'GOT',0,22),(89,'The dark knight',0,23),(90,'star wars',0,23),(91,'die hard',0,23),(92,'Mad Max :fury road',0,23),(93,'titanic',0,24),(94,'when harry met sally',0,24),(95,'the notebook',0,24),(96,'love actually',0,24),(97,'Micromax',0,25),(98,'Moto',0,25),(99,'Xiaomi',0,25),(100,'Lenovo',0,25),(101,'Hyundai',0,26),(102,'Maruti',0,26),(103,'Chevrolet',0,26),(104,'volkswagen',1,26),(105,'redmi note',0,27),(106,'redmi prime',0,27),(107,'Lenovo vibe',0,27),(108,'micromax unite 2',0,27),(109,'Django',1,28),(110,'Ruby',0,28),(111,'Java',0,28),(112,'CPP',0,28);
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_comments`
--

DROP TABLE IF EXISTS `polls_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `comment_date` datetime NOT NULL,
  `author_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_comments_author_id_20abb022256e4f1c_fk_auth_user_id` (`author_id`),
  KEY `polls_comments_7aa0f6ee` (`question_id`),
  CONSTRAINT `polls_comments_question_id_4792777072bce4d3_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`),
  CONSTRAINT `polls_comments_author_id_20abb022256e4f1c_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_comments`
--

LOCK TABLES `polls_comments` WRITE;
/*!40000 ALTER TABLE `polls_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_comments` ENABLE KEYS */;
UNLOCK TABLES;

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
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_question_2d5f8f90` (`category_id_id`),
  KEY `polls_question_4f331e2f` (`author_id`),
  CONSTRAINT `polls_question_author_id_4d1d71907459e50a_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `polls_quest_category_id_id_10fb9b6237e4c71a_fk_polls_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `polls_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_question`
--

LOCK TABLES `polls_question` WRITE;
/*!40000 ALTER TABLE `polls_question` DISABLE KEYS */;
INSERT INTO `polls_question` VALUES (1,'Which is the best SITCOM ?','2015-07-20 16:50:54',2,1),(2,'Which is your favourite Tech Company ?','2015-07-20 16:59:37',1,1),(3,'What is your Favourite Programming Language ?','2015-07-20 17:00:59',1,1),(4,'Which of the following is your Role Model ?','2015-07-20 17:01:35',5,1),(5,'Which of the following colors is the best suited to you >','2015-07-20 17:03:18',5,1),(6,'Which of the following Bollywood actresses is Your favourite ?','2015-07-20 17:05:27',5,1),(7,'Is John Snow (G.O.T) really dead ?','2015-07-20 17:06:07',2,1),(8,'Which of the following is the most inspiring movie ?','2015-07-20 17:07:21',3,1),(9,'On a scale of 1-10 , what are you most likely to do when your anger is at 9.','2015-07-20 17:08:43',6,1),(10,'What is your mood in general ?','2015-07-20 17:09:31',4,1),(11,'What would you do if you got rejected by your crush?','2015-07-20 17:10:52',6,1),(12,'Is Python better than Java ?','2015-10-26 18:16:02',1,1),(13,'which company is better?','2015-10-27 05:16:29',1,1),(14,'best tv series from the following?','2015-10-27 05:17:49',4,1),(15,'\'.MOV\' extension refers usually to what kind of file?','2015-10-27 06:32:39',1,1),(16,'Is Python better than Java in terms of data processing capability ?','2015-10-27 18:07:08',1,2),(17,'Which field have more scope in future?','2015-10-28 16:22:18',1,10),(18,'which language should be preferred for competitive coding?','2015-10-28 16:23:46',1,10),(19,'which is better anime series?','2015-10-28 16:27:01',2,10),(20,'best drama tv series?','2015-10-28 16:29:22',2,10),(21,'Which is best inspirational movie?','2015-10-28 16:32:13',3,10),(22,'which is most popular TV series ?','2015-10-28 16:35:34',2,10),(23,'which is top action movie?','2015-10-28 16:37:32',3,10),(24,'which is better romantic movie?','2015-10-28 16:39:45',3,10),(25,'which company produces best smartphones','2015-10-28 16:41:03',4,10),(26,'Which company\'s cars  are better?','2015-10-28 16:43:28',4,10),(27,'Which phone is better','2015-10-28 16:44:37',4,10),(28,'Which is the best Web Technology','2015-10-29 04:16:55',1,19);
/*!40000 ALTER TABLE `polls_question` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `polls_voted_question_id_id_1311bc3002f7d8dd_fk_polls_question_id` (`question_id_id`),
  KEY `polls_voted_username_id_36bb0b1e4337c776_fk_auth_user_id` (`username_id`),
  KEY `polls_voted_428bb064` (`choice_id`),
  CONSTRAINT `polls_voted_choice_id_23e72123007e75b5_fk_polls_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `polls_choice` (`id`),
  CONSTRAINT `polls_voted_question_id_id_1311bc3002f7d8dd_fk_polls_question_id` FOREIGN KEY (`question_id_id`) REFERENCES `polls_question` (`id`),
  CONSTRAINT `polls_voted_username_id_36bb0b1e4337c776_fk_auth_user_id` FOREIGN KEY (`username_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_voted`
--

LOCK TABLES `polls_voted` WRITE;
/*!40000 ALTER TABLE `polls_voted` DISABLE KEYS */;
INSERT INTO `polls_voted` VALUES (1,1,1,1,'2015-07-20 16:53:09'),(2,2,1,5,'2015-07-20 17:11:15'),(3,3,1,9,'2015-07-21 07:14:04'),(4,2,3,5,'2015-07-21 10:22:51'),(5,1,3,2,'2015-07-21 10:23:57'),(6,3,3,9,'2015-07-21 10:24:40'),(7,10,3,40,'2015-07-21 10:24:59'),(8,1,4,1,'2015-07-21 18:09:07'),(9,5,7,20,'2015-07-22 17:46:58'),(10,7,3,25,'2015-07-25 20:17:01'),(11,3,7,12,'2015-07-28 08:26:53'),(12,2,8,5,'2015-07-29 07:23:26'),(13,9,10,33,'2015-08-16 08:54:40'),(14,2,4,5,'2015-08-25 15:30:53'),(15,2,12,5,'2015-09-06 12:07:47'),(16,3,12,10,'2015-09-06 12:08:14'),(17,1,12,3,'2015-09-06 12:08:38'),(18,7,12,26,'2015-09-06 12:09:06'),(19,2,10,5,'2015-09-19 12:24:23'),(20,7,1,26,'2015-10-23 08:09:57'),(21,1,10,2,'2015-10-23 17:38:03'),(22,8,10,29,'2015-10-23 18:07:40'),(23,1,15,3,'2015-10-26 18:19:04'),(24,13,10,50,'2015-10-27 05:16:38'),(25,14,10,56,'2015-10-27 05:17:56'),(26,7,10,26,'2015-10-27 05:26:47'),(27,4,10,14,'2015-10-27 05:37:56'),(28,6,10,22,'2015-10-27 05:42:01'),(29,6,10,23,'2015-10-27 05:42:17'),(30,15,10,58,'2015-10-27 06:34:29'),(31,7,2,25,'2015-10-27 18:02:20'),(32,16,2,61,'2015-10-27 18:07:13'),(33,3,10,11,'2015-10-28 12:07:23'),(34,13,18,52,'2015-10-28 15:51:14'),(35,6,18,23,'2015-10-28 15:51:48'),(36,11,18,43,'2015-10-28 15:52:05'),(37,4,18,13,'2015-10-28 15:52:30'),(38,8,18,29,'2015-10-28 15:52:40'),(39,10,18,40,'2015-10-28 15:53:15'),(40,15,2,58,'2015-10-28 17:01:02'),(41,26,2,104,'2015-10-28 17:38:45'),(42,12,19,45,'2015-10-28 18:10:29'),(43,1,19,1,'2015-10-29 04:15:04'),(44,28,19,109,'2015-10-29 04:17:05'),(45,11,14,43,'2015-10-30 18:29:05'),(46,20,2,79,'2015-11-08 18:23:23');
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

-- Dump completed on 2015-11-11  6:24:09
