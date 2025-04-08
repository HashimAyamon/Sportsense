-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: sports_vengara
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add facilities',7,'add_facilities'),(26,'Can change facilities',7,'change_facilities'),(27,'Can delete facilities',7,'delete_facilities'),(28,'Can view facilities',7,'view_facilities'),(29,'Can add local match details',8,'add_localmatchdetails'),(30,'Can change local match details',8,'change_localmatchdetails'),(31,'Can delete local match details',8,'delete_localmatchdetails'),(32,'Can view local match details',8,'view_localmatchdetails'),(33,'Can add login',9,'add_login'),(34,'Can change login',9,'change_login'),(35,'Can delete login',9,'delete_login'),(36,'Can view login',9,'view_login'),(37,'Can add management',10,'add_management'),(38,'Can change management',10,'change_management'),(39,'Can delete management',10,'delete_management'),(40,'Can view management',10,'view_management'),(41,'Can add notification news',11,'add_notificationnews'),(42,'Can change notification news',11,'change_notificationnews'),(43,'Can delete notification news',11,'delete_notificationnews'),(44,'Can view notification news',11,'view_notificationnews'),(45,'Can add notification score',12,'add_notificationscore'),(46,'Can change notification score',12,'change_notificationscore'),(47,'Can delete notification score',12,'delete_notificationscore'),(48,'Can view notification score',12,'view_notificationscore'),(49,'Can add sports details',13,'add_sportsdetails'),(50,'Can change sports details',13,'change_sportsdetails'),(51,'Can delete sports details',13,'delete_sportsdetails'),(52,'Can view sports details',13,'view_sportsdetails'),(53,'Can add sports news',14,'add_sportsnews'),(54,'Can change sports news',14,'change_sportsnews'),(55,'Can delete sports news',14,'delete_sportsnews'),(56,'Can view sports news',14,'view_sportsnews'),(57,'Can add user',15,'add_user'),(58,'Can change user',15,'change_user'),(59,'Can delete user',15,'delete_user'),(60,'Can view user',15,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'facilities','facilities'),(8,'local_match_details','localmatchdetails'),(9,'login','login'),(10,'management','management'),(11,'notification_news','notificationnews'),(12,'notification_score','notificationscore'),(6,'sessions','session'),(13,'sports_details','sportsdetails'),(14,'sports_news','sportsnews'),(15,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-02 08:48:00.350512'),(2,'auth','0001_initial','2023-12-02 08:48:00.614159'),(3,'admin','0001_initial','2023-12-02 08:48:00.683589'),(4,'admin','0002_logentry_remove_auto_add','2023-12-02 08:48:00.696056'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-02 08:48:00.702566'),(6,'contenttypes','0002_remove_content_type_name','2023-12-02 08:48:00.742206'),(7,'auth','0002_alter_permission_name_max_length','2023-12-02 08:48:00.762476'),(8,'auth','0003_alter_user_email_max_length','2023-12-02 08:48:00.773931'),(9,'auth','0004_alter_user_username_opts','2023-12-02 08:48:00.773931'),(10,'auth','0005_alter_user_last_login_null','2023-12-02 08:48:00.805268'),(11,'auth','0006_require_contenttypes_0002','2023-12-02 08:48:00.805268'),(12,'auth','0007_alter_validators_add_error_messages','2023-12-02 08:48:00.814350'),(13,'auth','0008_alter_user_username_max_length','2023-12-02 08:48:00.821426'),(14,'auth','0009_alter_user_last_name_max_length','2023-12-02 08:48:00.837133'),(15,'auth','0010_alter_group_name_max_length','2023-12-02 08:48:00.837133'),(16,'auth','0011_update_proxy_permissions','2023-12-02 08:48:00.852767'),(17,'auth','0012_alter_user_first_name_max_length','2023-12-02 08:48:00.870762'),(18,'facilities','0001_initial','2023-12-02 08:48:00.870762'),(19,'local_match_details','0001_initial','2023-12-02 08:48:00.870762'),(20,'login','0001_initial','2023-12-02 08:48:00.884368'),(21,'management','0001_initial','2023-12-02 08:48:00.884368'),(22,'notification_news','0001_initial','2023-12-02 08:48:00.884368'),(23,'notification_score','0001_initial','2023-12-02 08:48:00.884368'),(24,'sessions','0001_initial','2023-12-02 08:48:00.925252'),(25,'sports_details','0001_initial','2023-12-02 08:48:00.931945'),(26,'sports_news','0001_initial','2023-12-02 08:48:00.941204'),(27,'user','0001_initial','2023-12-02 08:48:00.947788');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('22ygg6mbmgkhd2u69td7jzjfp5h1q4xz','eyJ1X2lkIjowfQ:1r9SEw:fL6FbXBLLAvl-Ms9YcbwqJhdMkS49r2wsUilCRcblH0','2023-12-16 15:49:10.155475'),('3ceprnlazehd2ve1yxpevemn43lwez87','eyJ1X2lkIjo4fQ:1rHKYK:NQZgjUNlJM8p_KEu6KFtCFfOxxYldj0b1n8muZ5aNUE','2024-01-07 09:13:44.618660'),('5rdsr33mfswgcm4s4v77qc9oak98on14','eyJ1X2lkIjo4fQ:1rRR1a:6dDYpDpJJvzLBxXXJ7_A2CcEPxS7zXfbOq7m0jy6cHw','2024-02-04 06:09:42.589890'),('7qe6gdmvwsu7c2t82tlbhyuk8ha76tb9','eyJ1X2lkIjoxMH0:1rRUdB:3NOAXDGXYe1LDH5xQ4sXgWyJS8yM-2Sy-8162_usSLk','2024-02-04 10:00:45.286766'),('bp3kveakzelrv727cp581mibrt9ee8cy','eyJ1X2lkIjo4fQ:1rCN7m:XOo7ARVfFQVq0EyrZu6oKJa27a3XjOwQkeAxJifgOrs','2023-12-24 16:57:50.990529'),('ejjmtmlecn7wv6y1jop3u91hpzr7nxmx','eyJ1X2lkIjo4fQ:1rTzcg:v_9WmZBXBe2PH7GzRUseZWCgg2RG7pUDU5J02x97Ric','2024-02-11 07:30:34.700197'),('farjyd59yl7bk7iu5gcizeqif8hl7eaa','eyJ1X2lkIjowfQ:1rTclI:GTMrfzKrbE84OmByw4MRxW-Kql2Vymrc99HkREcrGqc','2024-02-10 07:05:56.293437'),('k5ym4ektm5q9jg0frruch4e37egig2tw','eyJ1X2lkIjo4fQ:1rTeLk:-mC7Y1qmWXsxkU-kNjCV-t7JFYd5g_fYkReIFzaiN44','2024-02-10 08:47:40.559585'),('usvhhq77f1rlap3772v4szcv1wsc1i17','eyJ1X2lkIjowfQ:1rBsgY:1QrABxgvMSCVZCypeu23hIvR_YyYYr4mUw8swX1APJ4','2023-12-23 08:27:42.047677'),('vu3z7p8qw43yp9gehd10f14bv7s20jqu','eyJ1X2lkIjo4fQ:1rTdEm:yfDg3kp1qrgFi6KxeK0OXH740I6hl0JFtTQ91nMsA60','2024-02-10 07:36:24.083862'),('yeg5fg96xqqs22kb2cyqmlqmveky2vwr','eyJ1X2lkIjowfQ:1rBsQ6:8bhkAs5gkZUbVntOetFOp5O42NNJGgWRbURwThiCqZ8','2023-12-23 08:10:42.054798'),('zxwp7761jnszqpfqszwkvii4pot9nw8n','eyJ1X2lkIjowfQ:1r9RLu:pIFK3-L2CZmPElDjCed5fUy2XvV6Zw6Zapz91icI5xw','2023-12-16 14:52:18.476841');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `facilities_id` int(11) NOT NULL AUTO_INCREMENT,
  `seat` varchar(45) NOT NULL,
  `parking` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`facilities_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'4','no','approved'),(2,'4','yes','approved'),(3,'435','yes','');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_match_details`
--

DROP TABLE IF EXISTS `local_match_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_match_details` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `sports_item` varchar(45) NOT NULL,
  `team_name` varchar(45) NOT NULL,
  `score` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `statuss` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `seat_no` varchar(20) NOT NULL,
  `parking` varchar(45) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_match_details`
--

LOCK TABLES `local_match_details` WRITE;
/*!40000 ALTER TABLE `local_match_details` DISABLE KEYS */;
INSERT INTO `local_match_details` VALUES (1,'2023-10-22','12:41:08','foot ball','barzalena vs real matrid','4 : 6','shots','rejected','calicut','',''),(2,'2023-09-09','14:16:42','foot ball','barzalena vs real matrid','4 : 2','gd\r\ngg\r\ngd','rejected','vengara','',''),(3,'2023-09-30','12:51:11','foot ball','barzalena vs real matrid','4 : 2','ryuhouhig\r\nuugih\r\niog','rejected','malappuram','',''),(4,'2024-01-21','14:59:14','foot ball','fifa manjeri vs super studio mlp','4 : 2','csw','','vengara','',''),(5,'2024-01-21','15:00:06','foot ball','fifa manjeri vs super studio mlp','4 : 2','dgsgsf','','kottakkal','',''),(6,'2024-01-21','15:03:37','foot ball','fifa manjeri vs super studio mlp','4 : 2','dgffb\r\ntukfg\r\njhvh','','vengara','',''),(7,'2024-01-27','12:55:48','foot ball','fifa manjeri vs super studio mlp','4 : 6','fghdth\r\ndfgd\r\nghdh\r\ndh','','thirurangadi','673','yes'),(8,'2024-01-27','12:59:11','cricket','ind vs pak','342:837','dvads\r\nads\r\ndsv\r\ndsf','','kottakkal','4566','yes'),(9,'2024-01-27','12:59:25','cricket','ind vs pak','342:837','trer\r\nt\r\nyhr\r\ntr\r\neytr','','kottakkal','4566','yes'),(10,'2024-01-27','13:04:05','cricket','ind vs pak','342:837','thbthhb','','kottakkal','4566','yes'),(11,'2024-01-27','13:06:32','cricket','ind vs pak','342:837','rr','','kottakkal','4566','yes');
/*!40000 ALTER TABLE `local_match_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','admin','admin',0),(2,'njiyas','nijas','local_match_managment',5),(4,'njiyas','hghghg','local_match_managment',7),(5,'hashim','12345678','local_match_managment',8),(6,'Niyas','12345678','user',8),(7,'anu','1234','user',9),(8,'siya','12345','user',10),(9,'nim','1234','user',11),(10,'nimu','1234','user',12),(11,'mannya','12345678','user',13),(12,'nayana','12345678','local_match_managment',9),(13,'midu','1111','local_match_managment',10),(14,'farru','12345678','local_match_managment',11),(15,'shaythya','12345678','user',14),(16,'nayana','12345678','user',15),(17,'nayana','1234','user',16),(18,'niyas','1234','user',17);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `management_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`management_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (1,'','638928','koonartsj@gmail.com','rhybg','asfsdgeh','approved'),(2,'','638928','koonartsj@gmail.com','jyjy','asfsdgeh','rejected'),(3,'njiyas','638928','koonartsj@gmail.com','dgdfg','asfsdgeh','approved'),(4,'njiyas','8888888888','n@gmail.com','nijas','jjj','approved'),(5,'njiyas','8888888888','n@gmail.com','nijas','jjj','approved'),(6,'njiyas','8888888888','n@gmail.com','nijas','jjj',''),(7,'njiyas','8888888888','n@gmail.com','hghghg','jjj',''),(8,'hashim','8888888888','n@gmail.com','12345678','jjj',''),(9,'nayana','3456823412','nayana@gmail.com','12345678','asfsdgeh',''),(10,'midu','8765434567','nayana@gmail.com','1111','75eh',''),(11,'farru','3457623412','farru@gmail.com','12345678','kozhikod','');
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_news`
--

DROP TABLE IF EXISTS `notification_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` datetime NOT NULL,
  `heading` varchar(45) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_news`
--

LOCK TABLES `notification_news` WRITE;
/*!40000 ALTER TABLE `notification_news` DISABLE KEYS */;
INSERT INTO `notification_news` VALUES (1,'2023-09-09','2023-09-09 14:32:06','shfoso[fifd');
/*!40000 ALTER TABLE `notification_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_score`
--

DROP TABLE IF EXISTS `notification_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_score` (
  `score_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `team_name` varchar(45) NOT NULL,
  `score` varchar(45) NOT NULL,
  PRIMARY KEY (`score_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_score`
--

LOCK TABLES `notification_score` WRITE;
/*!40000 ALTER TABLE `notification_score` DISABLE KEYS */;
INSERT INTO `notification_score` VALUES (1,'2023-09-09','14:38:48','g','dhj'),(2,'2024-01-27','13:24:40','fifa manjeri vs super studio mlp','4 : 6');
/*!40000 ALTER TABLE `notification_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_details`
--

DROP TABLE IF EXISTS `sports_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_details` (
  `sports_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `sports_item` varchar(45) NOT NULL,
  `team_name` varchar(45) NOT NULL,
  `score` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `statuss` varchar(45) NOT NULL,
  PRIMARY KEY (`sports_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_details`
--

LOCK TABLES `sports_details` WRITE;
/*!40000 ALTER TABLE `sports_details` DISABLE KEYS */;
INSERT INTO `sports_details` VALUES (1,'2023-09-09','14:46:05','foot ball','barzalena vs real matrid','4 : 2','bv cvvn\r\nbmcfm\r\ncbvvbm','rejected');
/*!40000 ALTER TABLE `sports_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_news`
--

DROP TABLE IF EXISTS `sports_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `heading` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_news`
--

LOCK TABLES `sports_news` WRITE;
/*!40000 ALTER TABLE `sports_news` DISABLE KEYS */;
INSERT INTO `sports_news` VALUES (1,'2023-09-09','14:53:57','ffff','hashim dead in accident','rejected');
/*!40000 ALTER TABLE `sports_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `image` varchar(400) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'njiyas','w','koonartsj@gmail.com','','rejected',''),(2,'njiyas','gfdg','koonartsj@gmail.com','','rejected',''),(3,'njiyas','gdrg','koonartsj@gmail.com','638928','rejected',''),(4,'njiyas','dryrty','koonartsj@gmail.com','','rejected',''),(5,'njiyas','yuhn','koonartsj@gmail.com','638928','rejected',''),(6,'niyas','niyas','n@gmail.com','66565','pending',''),(7,'niyas','rergrggf','koonqrijhcsksj','6235294723','pending',''),(8,'Niyas','12345678','niyas@gmail.com','6235294723','pending',''),(9,'anu','1234','anu@gmail.com','9087677856','pending',''),(10,'siya','12345','si@gmail.com','9087654543','pending',''),(11,'nim','1234','nim@gmail.com','9876543218','pending',''),(12,'nimu','1234','nimu@gmail.com','9876543212','pending','bgnew_re0luVS.jpg'),(13,'mannya','12345678','mannya@gmail.com','3452123456','pending','maa_3YMfTLk.jpg'),(14,'shaythya','12345678','shaythya@gmail.com','2345343456','pending','maa_QeakuTU.jpg'),(15,'nayana','12345678','koonariniyas@gmail.com','6235294723','pending','Screenshot_20240130_154227_WhatsApp.jpg'),(16,'nayana','1234','jhsh@gmail.com','5644872377','pending','IMG-20240130-WA0010.jpg'),(17,'niyas','1234','koonariniyas@gmail.com','6235294723','pending','IMG_20230703_012012_713.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30 17:08:02
