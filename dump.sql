-- MySQL dump 10.13  Distrib 8.0.14, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.14

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communities_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (13,'ad'),(34,'alias'),(94,'alias'),(12,'animi'),(48,'animi'),(31,'aperiam'),(73,'architecto'),(99,'atque'),(10,'aut'),(38,'consequatur'),(7,'consequuntur'),(53,'corporis'),(77,'corporis'),(18,'corrupti'),(61,'corrupti'),(70,'deserunt'),(72,'dignissimos'),(29,'distinctio'),(88,'distinctio'),(2,'dolor'),(81,'dolorem'),(17,'dolores'),(30,'eaque'),(54,'earum'),(96,'earum'),(50,'eius'),(11,'eligendi'),(60,'eligendi'),(93,'enim'),(100,'enim'),(26,'est'),(59,'est'),(85,'est'),(47,'et'),(52,'et'),(62,'et'),(78,'et'),(51,'eum'),(97,'eum'),(37,'eveniet'),(20,'expedita'),(57,'expedita'),(6,'explicabo'),(23,'harum'),(25,'harum'),(68,'hic'),(56,'impedit'),(41,'ipsam'),(42,'maiores'),(33,'molestiae'),(39,'molestiae'),(63,'molestias'),(76,'necessitatibus'),(36,'nemo'),(46,'nemo'),(4,'nesciunt'),(27,'nihil'),(1,'non'),(82,'occaecati'),(24,'omnis'),(55,'omnis'),(21,'perferendis'),(65,'provident'),(9,'quaerat'),(28,'quam'),(44,'quasi'),(32,'qui'),(40,'qui'),(90,'qui'),(95,'qui'),(22,'quis'),(92,'rerum'),(49,'saepe'),(91,'sed'),(14,'similique'),(43,'similique'),(35,'sint'),(69,'sit'),(83,'soluta'),(16,'suscipit'),(19,'temporibus'),(67,'temporibus'),(8,'totam'),(15,'totam'),(75,'ullam'),(84,'unde'),(66,'ut'),(71,'ut'),(79,'ut'),(86,'ut'),(58,'vel'),(64,'veritatis'),(89,'veritatis'),(3,'voluptas'),(87,'voluptas'),(5,'voluptate'),(98,'voluptate'),(45,'voluptatem'),(74,'voluptatem'),(80,'voluptatum');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,1,'approved','1970-08-21 06:40:37','2003-12-29 23:20:55'),(2,2,'requested','1987-10-10 07:33:23','1983-01-18 01:56:05'),(3,3,'requested','2015-02-07 01:53:07','2015-09-14 16:17:12'),(4,4,'requested','1983-04-08 15:57:26','1976-12-28 23:54:58'),(5,5,'unfriended','1976-03-03 18:22:00','1996-12-03 11:29:04'),(6,6,'unfriended','2008-12-06 17:07:59','2015-11-01 08:03:23'),(7,7,'requested','1989-10-26 06:20:23','2001-08-05 16:01:03'),(8,8,'unfriended','1987-12-30 01:50:03','2001-07-09 07:39:50'),(9,9,'requested','2003-12-27 22:52:09','1998-04-18 04:41:46'),(10,10,'declined','1970-05-08 00:32:15','2007-03-22 21:08:16'),(11,11,'approved','1988-05-02 10:55:41','1985-02-09 05:04:27'),(12,12,'unfriended','1975-07-25 20:11:02','1993-06-30 12:51:09'),(13,13,'declined','2000-06-24 13:17:54','1982-04-16 16:12:48'),(14,14,'declined','2007-12-09 17:17:48','1991-05-31 12:38:33'),(15,15,'unfriended','2016-07-21 20:48:02','1982-10-06 14:54:41'),(16,16,'requested','1992-10-04 04:16:38','2001-01-24 13:54:16'),(17,17,'approved','1984-11-20 10:33:06','2018-10-07 19:43:11'),(18,18,'approved','1992-07-31 16:34:16','2008-08-03 10:13:44'),(19,19,'requested','1993-06-18 14:21:32','1976-01-16 15:57:24'),(20,20,'declined','2007-03-22 18:13:14','2010-01-06 00:06:18'),(21,21,'requested','2015-09-17 12:10:37','1986-06-30 22:29:41'),(22,22,'approved','2004-09-21 23:23:19','2003-01-27 16:11:05'),(23,23,'requested','1972-04-26 20:13:41','1991-01-03 06:58:39'),(24,24,'unfriended','2017-08-08 05:38:20','2007-09-27 03:07:27'),(25,25,'approved','2001-01-16 08:07:31','1995-04-25 06:23:27'),(26,26,'declined','2004-07-31 10:12:37','2001-06-28 18:49:10'),(27,27,'declined','2004-11-01 19:13:46','1978-05-16 19:08:26'),(28,28,'requested','1989-07-10 17:02:49','2007-03-16 20:42:05'),(29,29,'unfriended','1984-08-12 11:38:13','1971-07-07 10:40:59'),(30,30,'unfriended','1997-03-01 23:22:31','1974-08-30 23:16:26'),(31,31,'approved','2003-02-19 05:45:39','2015-02-04 15:26:16'),(32,32,'declined','2017-01-08 12:24:37','2019-02-23 04:25:58'),(33,33,'requested','2018-08-15 10:50:34','1984-08-24 14:00:01'),(34,34,'unfriended','1988-06-12 03:29:45','1998-11-28 12:07:32'),(35,35,'unfriended','1988-01-30 09:10:41','2004-06-02 14:04:53'),(36,36,'declined','1993-03-10 12:19:15','2007-05-17 03:24:16'),(37,37,'requested','1999-06-21 09:26:23','2011-08-28 05:29:49'),(38,38,'requested','1977-03-14 20:26:41','1975-09-03 17:01:54'),(39,39,'approved','2017-09-08 20:11:20','1989-12-10 18:38:58'),(40,40,'approved','2001-08-16 04:34:33','1999-01-01 14:33:52'),(41,41,'unfriended','1982-07-18 15:48:44','1989-10-14 05:48:07'),(42,42,'requested','1973-10-29 10:38:00','1973-11-02 18:26:40'),(43,43,'requested','1979-12-17 11:27:04','2004-09-28 04:54:42'),(44,44,'approved','2013-10-01 07:28:04','2006-12-12 05:43:06'),(45,45,'requested','2011-07-27 12:46:23','1988-05-07 21:59:11'),(46,46,'declined','1999-11-13 00:33:38','2016-05-02 19:19:15'),(47,47,'approved','1980-03-02 03:50:22','2010-09-22 18:58:47'),(48,48,'requested','2003-11-15 23:04:36','1991-08-05 16:56:51'),(49,49,'approved','2006-03-24 23:01:39','2010-08-04 15:00:32'),(50,50,'approved','2008-07-18 00:34:41','2016-12-25 03:18:49'),(51,51,'approved','2001-10-14 18:49:19','2012-06-08 01:36:28'),(52,52,'requested','2000-06-08 04:08:36','2010-10-12 10:27:39'),(53,53,'approved','1972-07-01 10:35:33','1972-03-03 01:26:27'),(54,54,'declined','2007-07-24 20:49:26','2014-03-10 04:56:59'),(55,55,'approved','1981-09-25 09:50:15','1991-04-22 04:24:22'),(56,56,'approved','2015-03-08 22:23:52','1996-02-08 09:41:57'),(57,57,'declined','2012-07-18 20:25:26','2008-06-10 16:46:01'),(58,58,'declined','1970-08-26 14:39:24','2010-12-04 22:36:12'),(59,59,'unfriended','1982-12-03 07:57:43','1992-11-21 14:42:00'),(60,60,'declined','2003-03-28 09:11:22','1984-10-22 00:34:58'),(61,61,'declined','1999-07-10 23:11:51','2016-11-13 17:37:38'),(62,62,'requested','2003-01-28 02:05:26','2007-04-05 08:23:12'),(63,63,'approved','2004-02-02 18:43:03','2011-01-21 02:56:34'),(64,64,'requested','1988-01-09 02:49:57','2008-01-20 12:16:32'),(65,65,'requested','1985-02-18 21:49:13','1997-05-05 19:51:35'),(66,66,'unfriended','2003-03-12 23:37:48','1981-06-02 18:57:58'),(67,67,'approved','1987-04-29 03:09:14','1981-04-22 22:37:00'),(68,68,'unfriended','1973-03-24 00:49:50','1970-09-26 11:43:50'),(69,69,'requested','1992-12-20 08:26:38','1976-04-04 09:45:20'),(70,70,'approved','2006-05-10 10:11:35','2003-04-21 05:25:00'),(71,71,'declined','1990-03-23 11:25:43','1976-04-17 18:02:41'),(72,72,'approved','2009-05-31 10:51:20','1994-09-30 13:31:10'),(73,73,'approved','2005-02-04 20:33:02','1971-09-23 14:35:57'),(74,74,'approved','1986-09-13 08:48:49','1988-12-02 16:21:38'),(75,75,'unfriended','1989-02-06 16:18:25','1976-05-24 22:04:37'),(76,76,'approved','1993-08-02 16:15:43','1999-11-26 10:51:17'),(77,77,'requested','2004-11-21 21:28:50','2004-04-23 05:17:42'),(78,78,'approved','2012-12-11 06:36:18','1980-10-24 16:32:22'),(79,79,'requested','1986-08-30 22:54:34','2016-01-01 06:31:29'),(80,80,'declined','2007-05-29 23:21:09','1992-09-03 17:16:53'),(81,81,'requested','1976-02-15 09:53:51','2004-12-08 14:47:08'),(82,82,'declined','1999-05-17 08:04:49','2019-03-22 06:34:06'),(83,83,'declined','2010-02-24 05:14:27','1972-08-06 04:29:05'),(84,84,'approved','1992-04-26 10:05:19','2017-09-27 15:43:41'),(85,85,'declined','2002-12-25 19:06:54','2019-01-09 02:28:17'),(86,86,'unfriended','1994-12-11 13:04:17','2010-12-04 16:48:56'),(87,87,'unfriended','1974-12-20 22:49:43','1998-10-02 10:34:13'),(88,88,'declined','1975-03-30 09:04:32','2016-12-29 12:20:58'),(89,89,'requested','2014-08-19 07:08:27','2016-05-31 21:29:04'),(90,90,'unfriended','1974-04-01 05:16:29','2014-06-07 13:46:11'),(91,91,'declined','2007-03-29 05:19:59','1985-01-03 07:56:35'),(92,92,'approved','1999-08-21 23:14:35','1977-12-06 05:11:59'),(93,93,'declined','2004-10-02 22:42:42','1982-04-06 07:11:36'),(94,94,'approved','2010-01-27 13:47:32','2010-11-28 12:28:30'),(95,95,'declined','1982-10-21 11:22:05','2007-11-01 23:06:50'),(96,96,'unfriended','1973-07-23 11:16:46','2014-03-26 18:21:48'),(97,97,'declined','1975-12-28 08:09:37','2004-05-24 01:22:07'),(98,98,'requested','2018-12-11 00:54:59','1980-07-11 05:38:28'),(99,99,'declined','1989-11-01 20:02:13','1999-01-27 21:54:35'),(100,100,'requested','1974-06-17 05:16:27','1979-07-25 04:56:27');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'1988-10-14 18:47:39'),(2,2,2,'1988-09-04 16:08:30'),(3,3,3,'1994-07-10 22:07:03'),(4,4,4,'1991-05-12 20:32:08'),(5,5,5,'1978-09-10 14:36:01'),(6,6,6,'1992-04-15 01:27:31'),(7,7,7,'2003-02-03 04:56:27'),(8,8,8,'2017-04-24 09:30:19'),(9,9,9,'1974-02-07 20:53:55'),(10,10,10,'1973-05-11 03:21:40'),(11,11,11,'2008-12-17 13:03:56'),(12,12,12,'1995-07-17 21:22:38'),(13,13,13,'1985-09-07 23:34:21'),(14,14,14,'1973-01-27 23:11:53'),(15,15,15,'2003-07-26 13:04:20'),(16,16,16,'1980-11-21 22:17:38'),(17,17,17,'1970-07-26 12:34:00'),(18,18,18,'1973-10-28 18:05:14'),(19,19,19,'2007-01-03 20:25:42'),(20,20,20,'2000-07-18 08:04:28'),(21,21,21,'2013-08-23 04:24:48'),(22,22,22,'2007-11-21 00:23:39'),(23,23,23,'1991-12-20 19:26:15'),(24,24,24,'1995-08-15 08:20:37'),(25,25,25,'1991-05-22 04:57:12'),(26,26,26,'1984-03-04 03:14:59'),(27,27,27,'1997-12-27 11:34:17'),(28,28,28,'2002-04-05 20:20:59'),(29,29,29,'1994-07-03 10:23:16'),(30,30,30,'1987-08-02 12:23:44'),(31,31,31,'1990-08-26 21:14:20'),(32,32,32,'2001-10-09 12:21:41'),(33,33,33,'2014-03-23 07:22:37'),(34,34,34,'1984-06-21 14:44:42'),(35,35,35,'2016-07-06 03:39:46'),(36,36,36,'1976-08-08 19:28:34'),(37,37,37,'2006-06-25 17:16:24'),(38,38,38,'1983-08-18 20:08:51'),(39,39,39,'1994-08-10 00:41:57'),(40,40,40,'1983-07-02 13:46:55'),(41,41,41,'1980-03-12 02:28:43'),(42,42,42,'2016-02-26 23:55:09'),(43,43,43,'2005-07-25 18:23:22'),(44,44,44,'2015-06-02 06:03:05'),(45,45,45,'1986-02-10 17:21:49'),(46,46,46,'1995-04-13 23:39:41'),(47,47,47,'2008-08-18 08:16:58'),(48,48,48,'2015-04-15 12:50:10'),(49,49,49,'2004-06-04 22:10:18'),(50,50,50,'1998-02-12 14:20:07'),(51,51,51,'1973-07-24 11:34:16'),(52,52,52,'2018-05-26 20:54:15'),(53,53,53,'1978-12-20 07:52:16'),(54,54,54,'2007-04-22 15:33:44'),(55,55,55,'1979-09-27 23:37:49'),(56,56,56,'2014-05-13 16:49:56'),(57,57,57,'2005-04-13 09:52:25'),(58,58,58,'2010-08-21 18:49:25'),(59,59,59,'1983-04-06 03:43:47'),(60,60,60,'1984-10-17 11:22:01'),(61,61,61,'2011-04-23 21:09:02'),(62,62,62,'2004-03-08 21:26:14'),(63,63,63,'2014-07-02 04:20:15'),(64,64,64,'2018-03-03 14:09:38'),(65,65,65,'2015-09-07 22:04:17'),(66,66,66,'2003-06-21 17:21:54'),(67,67,67,'1989-12-26 05:50:54'),(68,68,68,'1987-05-25 19:25:26'),(69,69,69,'1998-07-08 10:16:29'),(70,70,70,'2005-02-21 17:22:04'),(71,71,71,'2008-04-06 15:11:19'),(72,72,72,'2012-11-26 10:23:39'),(73,73,73,'1990-06-15 21:00:35'),(74,74,74,'2013-01-31 06:51:53'),(75,75,75,'2009-06-26 22:50:08'),(76,76,76,'2004-05-24 17:22:26'),(77,77,77,'1971-09-14 03:28:10'),(78,78,78,'1971-05-18 01:58:40'),(79,79,79,'2016-05-15 22:22:37'),(80,80,80,'1998-07-04 22:37:30'),(81,81,81,'1983-07-03 08:57:24'),(82,82,82,'2009-08-28 08:25:04'),(83,83,83,'1994-11-30 17:40:25'),(84,84,84,'1978-05-18 08:59:19'),(85,85,85,'1970-10-13 07:31:00'),(86,86,86,'1978-04-17 13:08:12'),(87,87,87,'1972-10-05 21:18:52'),(88,88,88,'2016-03-20 07:13:38'),(89,89,89,'1975-09-30 04:23:19'),(90,90,90,'2011-05-22 19:44:27'),(91,91,91,'2002-02-02 17:47:22'),(92,92,92,'1983-02-09 03:26:57'),(93,93,93,'2019-06-01 22:24:54'),(94,94,94,'2015-04-29 10:18:49'),(95,95,95,'1985-09-30 07:47:55'),(96,96,96,'2000-12-14 04:45:02'),(97,97,97,'1983-02-28 06:56:01'),(98,98,98,'2018-04-14 23:46:36'),(99,99,99,'2019-05-02 11:19:31'),(100,100,100,'2007-04-26 11:11:55');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Est aut aliquid est. Soluta eveniet doloribus ipsam ut id assumenda quam. Consequuntur et velit aperiam error corporis rem corporis. Est similique quisquam quia maxime eaque possimus facere officiis. Odio magni atque dicta voluptatibus hic iste delectus.','a',5,NULL,'1991-11-16 03:14:38','2014-12-23 03:58:10'),(2,2,2,'Laborum dolorem magni unde vero sit hic. Pariatur quia voluptas magnam. Blanditiis dolorem et molestias veniam facere provident.','asperiores',4510,NULL,'1986-12-10 13:34:26','1974-09-26 02:38:00'),(3,3,3,'A quam ea ullam reiciendis vel et reiciendis. Delectus iure mollitia est. Eum dolores dolores sed officia vitae qui. Sed repudiandae voluptatem voluptatibus libero culpa quo.','sapiente',763116,NULL,'1978-09-18 11:07:49','1998-02-28 08:22:30'),(4,4,4,'Velit commodi in veniam occaecati. Tenetur temporibus ullam enim officiis aut illum. In maiores velit nobis soluta molestias maiores tempora. Quisquam et ut et sequi.','rerum',740,NULL,'1984-10-20 22:41:15','1991-12-03 09:02:18'),(5,1,5,'Est eaque est qui et omnis rerum. Expedita porro nesciunt inventore consequatur quos. Inventore aut rerum voluptas. Dicta vel ut quibusdam cupiditate tempore.','a',40813,NULL,'2014-06-19 20:34:11','2018-07-31 05:33:40'),(6,2,6,'Atque et nam nulla et aliquid. Vel repellendus aut natus odit quibusdam quis atque et. Laudantium minima velit dolores eos voluptate nostrum.','quasi',119422,NULL,'1991-11-02 02:50:45','1989-10-17 17:18:29'),(7,3,7,'Nihil ut et reprehenderit et. Numquam veniam quis impedit. Voluptas saepe rerum illo vel omnis. Aliquam illum ut quo saepe ea unde est.','non',704558,NULL,'1988-09-17 13:56:38','1990-06-04 02:08:33'),(8,4,8,'Sint quod fugit molestiae dolore repellendus est. Quis corporis necessitatibus commodi placeat temporibus doloremque voluptatem. Nemo maxime sit dolorem perferendis repellat. Et impedit deleniti eaque pariatur ut quia voluptatibus.','earum',65108,NULL,'1995-10-07 04:19:53','2015-07-11 18:56:19'),(9,1,9,'Optio sed aperiam veniam eum. Rerum placeat soluta iusto perspiciatis quibusdam dolorem eos. Ea pariatur optio est ut.','ullam',83717449,NULL,'2003-08-04 22:55:25','1993-09-12 03:53:11'),(10,2,10,'Facere nostrum facilis aperiam quisquam dolor. Minima omnis est nam.','maiores',75,NULL,'1984-05-17 00:37:30','1972-08-12 20:05:34'),(11,3,11,'A omnis ratione non. Et velit sed incidunt corporis ut rerum nemo. Ut pariatur tempora ea incidunt praesentium ut. Eligendi et et rerum sequi ut.','non',0,NULL,'2010-05-07 12:13:09','2017-09-18 08:30:28'),(12,4,12,'Quo minus harum debitis debitis quis sunt. Dolores suscipit placeat dolorum non voluptate et. Non eos odio esse tempore. Illum minus quidem temporibus porro.','earum',1826766,NULL,'2013-08-25 15:49:45','1972-03-30 00:35:17'),(13,1,13,'Et aliquid sit natus vitae fuga enim repudiandae. Quis ab et debitis est accusantium labore. Exercitationem delectus eaque necessitatibus.','hic',979,NULL,'2015-11-01 18:11:31','2014-02-04 13:33:02'),(14,2,14,'Nobis est sed blanditiis assumenda incidunt explicabo. Facere rem assumenda odio explicabo ad enim repellat quia. Dolor mollitia fugiat officia nihil animi.','iste',18,NULL,'2006-05-11 05:11:06','1978-05-27 14:48:33'),(15,3,15,'Tempora ad et aspernatur laborum ut dolor et. Exercitationem quaerat corporis placeat et.','quia',7,NULL,'2000-03-28 21:01:57','1975-05-07 08:16:57'),(16,4,16,'Accusantium est ea fuga omnis mollitia. Dolores officia et consequatur iste est quo. Ullam laborum qui ut quo delectus temporibus.','omnis',2058670,NULL,'1971-10-08 00:43:32','1983-04-02 04:55:13'),(17,1,17,'Quasi itaque atque ut aliquam debitis. Qui consequuntur maiores sit ad perspiciatis quaerat assumenda repudiandae. Necessitatibus placeat quaerat aut voluptatem ratione voluptate expedita. Nulla doloremque aut molestiae nam.','aperiam',3489253,NULL,'1973-12-19 03:20:43','2002-05-02 13:49:04'),(18,2,18,'Deserunt voluptatem quia voluptatem sit. Qui omnis distinctio optio voluptatem veniam atque dolorem. Repellat laboriosam illo consequatur nesciunt voluptas magni rerum. Saepe quos qui doloremque.','commodi',8,NULL,'1989-03-01 11:19:42','2016-01-22 18:15:32'),(19,3,19,'Fugiat consequuntur voluptatem odit omnis. Quia aut voluptate officia rerum. Cumque voluptatem eaque dolorum voluptas sed. Et autem atque est minus veritatis explicabo eos.','id',1,NULL,'1970-11-03 21:06:33','1990-09-08 14:13:06'),(20,4,20,'Autem dolore beatae aut corporis fugit ratione. Ex beatae qui at. Est deleniti asperiores temporibus perferendis est.','fugiat',82,NULL,'2017-06-07 21:23:04','2005-05-24 00:49:07'),(21,1,21,'Provident eligendi animi quidem qui ipsum. Accusamus dolor sint est qui magnam. Omnis enim quis dolore magni facilis repudiandae deserunt. Consequatur eum at recusandae id tenetur voluptas amet.','ipsa',1,NULL,'1986-12-30 17:42:20','2007-08-13 12:53:43'),(22,2,22,'Animi ut labore dolore atque consequuntur maxime fugit. Sunt et et facere sint. Recusandae numquam accusamus a. Non quia dolorem reiciendis earum et officiis iure.','adipisci',4582,NULL,'2017-07-19 03:44:31','1995-09-13 03:52:26'),(23,3,23,'Sint officiis a ipsa quaerat rerum ea totam. Aut perferendis deleniti error ipsa ducimus ipsam. Ipsum a sunt quis placeat.','qui',8302441,NULL,'1985-01-28 07:54:18','1972-04-19 02:50:54'),(24,4,24,'Et accusamus a et adipisci dolore. Blanditiis sit vitae dolorem voluptas temporibus numquam ab. Aut temporibus accusantium consectetur.','maxime',91764,NULL,'2006-08-07 08:24:03','1974-09-07 06:04:10'),(25,1,25,'Consequuntur animi sed ea perferendis ad magnam. Aut libero alias sequi iste qui est. Ut quo dignissimos quibusdam doloremque est est incidunt.','qui',90944,NULL,'2000-11-07 09:35:46','1984-03-04 19:48:35'),(26,2,26,'Accusantium sit praesentium voluptatem molestias architecto. Excepturi doloremque ab eligendi eum ullam voluptas qui. Inventore expedita distinctio omnis laborum laboriosam.','eveniet',317340,NULL,'1999-07-09 18:22:03','2002-01-23 10:53:33'),(27,3,27,'Et iure cupiditate expedita ut earum et illum. Cum sed assumenda velit officia. Voluptas harum ea magni aspernatur aut ea vel.','incidunt',0,NULL,'1996-06-23 22:20:00','1974-05-09 02:46:11'),(28,4,28,'A culpa nostrum et quis. Id ipsum ipsum deserunt earum eaque aut earum. Blanditiis et commodi voluptas.','eaque',9525,NULL,'1973-07-27 08:27:31','1985-10-24 20:28:06'),(29,1,29,'Cumque quod provident provident fugit cumque numquam. Fuga totam delectus a aut quaerat nemo dignissimos eos. Ratione harum et laborum qui dolore aliquam facilis numquam. At quas nam sapiente porro nesciunt voluptatum.','non',20697427,NULL,'1999-02-12 10:23:02','1978-04-23 19:27:34'),(30,2,30,'Provident quia fuga et consequatur reprehenderit repellat. Et aut cum nostrum ut beatae animi aut alias.','et',263408,NULL,'1977-02-20 04:38:19','1973-12-13 05:04:07'),(31,3,31,'Voluptatem est recusandae molestias quod. Voluptatem velit omnis asperiores dolorum est vero. Quo doloribus aut natus rem. Dolor sapiente libero quis sit.','et',4391,NULL,'1976-08-28 19:30:58','2016-01-02 04:29:15'),(32,4,32,'Et commodi tempora voluptate perferendis. Ullam ratione sequi in eveniet accusantium consequatur. Quod quis ipsum consectetur fuga numquam.','odio',90,NULL,'2011-05-04 08:25:34','1991-05-01 22:20:57'),(33,1,33,'Similique qui quibusdam vitae et. Voluptas nihil nesciunt reiciendis et. Incidunt necessitatibus illo asperiores quidem ipsa quam. Amet quisquam amet aut facere totam fuga quasi.','expedita',87,NULL,'2004-12-04 14:41:26','1978-02-02 04:32:25'),(34,2,34,'Eos id culpa inventore voluptatem aut placeat dolorem. Ex sunt rem esse aspernatur. Est ut ut quidem est esse. Possimus quia nisi neque.','beatae',694461,NULL,'2009-07-13 19:12:15','2011-11-23 13:58:26'),(35,3,35,'Libero ut qui dicta impedit. Consequatur earum neque quis consequatur numquam consequatur. Voluptatibus eos vel ex quis sed cum.','et',154603,NULL,'1982-03-22 14:11:50','2003-04-07 16:17:28'),(36,4,36,'Sapiente in totam sed aliquam rem qui occaecati. Dolor dignissimos omnis mollitia temporibus repellendus ut. Est esse facilis deleniti eum dolorem ex distinctio. Est nisi rerum aut optio. Quod dolor occaecati expedita quia incidunt debitis.','tenetur',6392040,NULL,'2002-02-25 12:09:15','2010-09-11 23:52:54'),(37,1,37,'Ut praesentium soluta facere sunt. Eveniet in voluptatem optio neque cumque quis ut. Dolores assumenda ullam error quis atque magni ut. Quia at aut et aliquid consectetur.','accusantium',0,NULL,'2001-12-10 18:20:19','1979-12-21 04:42:14'),(38,2,38,'Ut ab libero dolor eum deleniti porro facilis. Quo iusto perspiciatis fugiat voluptatem nam sint. Ut nisi sed et dicta eos explicabo quos.','corrupti',3,NULL,'1985-09-26 03:28:43','1991-05-12 14:55:12'),(39,3,39,'Nam voluptas omnis in quas aut. Nihil perspiciatis magni voluptatum mollitia aut nulla. Consequuntur nostrum atque nihil omnis. Velit hic eum sapiente quis molestiae deleniti.','tempore',2896602,NULL,'1986-09-26 13:25:54','1986-08-07 15:30:13'),(40,4,40,'Ea odio eveniet totam asperiores aut vel. Nihil dolores natus magnam aut delectus perspiciatis eum ullam. Magnam est cupiditate earum fuga aut numquam. Delectus modi ut occaecati est et aut.','necessitatibus',0,NULL,'1992-02-13 16:01:03','1983-07-19 23:55:19'),(41,1,41,'Dolorem molestias similique laboriosam et. Incidunt earum voluptatem magnam voluptas eligendi quos. Cum voluptatem quia odio sed. Ut voluptatum ex sint illum molestias perferendis laborum.','sapiente',816152694,NULL,'1990-10-06 02:14:28','2002-12-12 15:56:30'),(42,2,42,'Id illo quia corporis. Magni id illo commodi natus. Eos porro error nihil optio quia.','dolorem',7095,NULL,'1997-02-27 15:12:18','2013-08-18 14:47:12'),(43,3,43,'Eos omnis error quis est debitis. Itaque adipisci voluptatibus velit autem. Tempora quo saepe nesciunt sapiente sequi hic.','illo',1520673,NULL,'1986-07-05 15:35:21','1979-06-12 16:40:39'),(44,4,44,'Dolore non repellat mollitia dolor ut sequi. Excepturi enim dolorem mollitia eaque sit porro ab. Eos consequatur hic dolore itaque quia animi ea.','dignissimos',548,NULL,'2002-12-20 21:54:14','1972-09-13 17:45:56'),(45,1,45,'Cupiditate modi molestiae culpa delectus est et voluptatem. Eius non impedit asperiores praesentium repellendus tempore. Minus natus quod eos quidem.','qui',7380,NULL,'2016-05-23 07:35:39','2016-10-25 14:56:39'),(46,2,46,'Provident dignissimos necessitatibus ut et esse. Excepturi et iste facere id suscipit ut. Voluptatem est ex et dolor nobis facilis et. Ut voluptatibus sunt et ut.','aut',14685,NULL,'2009-12-01 19:42:24','1985-04-17 06:08:45'),(47,3,47,'In mollitia consequatur aspernatur atque. Alias illum voluptatem et nemo et exercitationem. Voluptatem in ut quia similique quis. Saepe cupiditate sunt tenetur minima.','laborum',3,NULL,'2010-12-16 03:47:22','1978-12-17 17:32:19'),(48,4,48,'Quidem ad libero voluptas et veniam. Dolores dolores quia voluptatem soluta. Voluptatibus facere saepe non nulla.','consequatur',490,NULL,'1977-01-13 19:24:52','1983-04-09 21:32:18'),(49,1,49,'Esse eveniet similique sit temporibus aliquam. Sequi consequatur excepturi enim aut. Mollitia voluptas facilis velit omnis animi ea numquam. Accusamus nostrum aspernatur ullam itaque et eveniet quia. Corrupti tempora fugit rerum architecto voluptatem pariatur.','quae',26430194,NULL,'1990-08-08 17:43:45','1979-04-22 09:23:37'),(50,2,50,'Molestiae excepturi quia necessitatibus id voluptatem laudantium. Et ut ea mollitia quisquam. Vel consequatur quas excepturi totam sit suscipit. Aut tempora ratione eos ipsam quae possimus libero. Architecto et quia voluptatem et tempora alias sequi.','nulla',0,NULL,'1995-04-23 00:55:46','1985-09-06 19:56:23'),(51,3,51,'Omnis quaerat minus inventore quaerat. Ut sunt optio similique laboriosam. Fugit voluptas nesciunt debitis possimus tempore. Architecto sunt maiores laborum quod laboriosam.','dolorem',38,NULL,'1976-09-18 04:50:57','1986-02-16 00:27:21'),(52,4,52,'Ullam unde earum dolorem. Vel doloremque harum optio deserunt iure. Voluptate at animi veniam suscipit quisquam.','dolorum',447,NULL,'2015-10-19 19:11:46','2013-05-12 17:55:38'),(53,1,53,'Ut distinctio non vero qui. Accusantium a consectetur magnam eum quisquam molestias. Sequi et quam fuga ut sint.','impedit',874783484,NULL,'1988-08-22 03:39:27','1993-09-25 02:51:19'),(54,2,54,'Fugiat rem eveniet laborum eius ipsa. Soluta provident nihil dolor aliquid ut modi magnam delectus. Ratione amet dolores quam molestiae blanditiis.','voluptas',86837,NULL,'2010-01-19 15:57:21','2007-09-17 16:40:07'),(55,3,55,'Consequatur voluptatem et sequi voluptatibus ut accusamus perferendis. Aut perspiciatis laboriosam ut consectetur. Ducimus omnis rem ut unde nobis sit rerum laborum. Reiciendis quaerat amet consequatur velit excepturi deserunt atque. Sed natus quibusdam quidem pariatur.','et',868,NULL,'2014-09-09 12:10:38','2015-12-29 19:56:19'),(56,4,56,'Non est quia doloribus sed. Voluptates vitae necessitatibus molestiae quo dolorum mollitia at. Quos rem omnis porro nulla vero tempore similique ratione. Mollitia quo quo et et non laboriosam perferendis sit.','aliquid',10461638,NULL,'1988-06-15 18:16:35','1997-01-08 02:34:54'),(57,1,57,'Quia provident autem nisi quisquam rerum. Inventore nostrum dolores eum explicabo hic ipsum deserunt. Eos et eum aut.','maiores',482028,NULL,'2016-05-20 14:16:27','2017-07-25 19:46:31'),(58,2,58,'Repellat minima animi iure explicabo blanditiis sed. Incidunt vel animi reprehenderit quisquam reprehenderit. Dolor ut ipsum deleniti ut officia. Velit sequi consequatur nemo nam sed rerum.','dolorem',142917961,NULL,'1974-05-05 14:37:58','1982-01-31 04:02:33'),(59,3,59,'Assumenda ipsum officiis fuga unde itaque eveniet magni. Quasi assumenda qui sed quod quis. Amet sit dolores accusantium voluptatem omnis unde soluta.','unde',6099,NULL,'1972-08-23 23:37:28','2003-01-01 06:28:14'),(60,4,60,'Non est animi consequatur. Neque aliquid aut voluptatem aut inventore ut. Maiores hic voluptas nesciunt. Nulla vel facilis deleniti tempore.','dignissimos',783631045,NULL,'2006-11-01 09:16:53','1984-11-01 16:56:52'),(61,1,61,'Debitis neque est ratione. Quia quod ab ut sit et neque quam. Illum suscipit voluptas est amet dolores sit perspiciatis cumque. Eos est et veritatis non esse.','nisi',914587,NULL,'1983-12-22 15:47:23','1999-07-24 05:23:05'),(62,2,62,'Nihil quasi doloremque rerum velit non libero. Non veritatis perspiciatis autem. Expedita rerum nihil aliquam.','sint',86964,NULL,'2011-09-12 04:05:53','1973-07-03 22:53:03'),(63,3,63,'Nesciunt aut sint nam dolor facilis ut est. Odit dolores assumenda dolore.','ipsum',689891921,NULL,'2008-05-09 22:19:10','1989-05-16 00:33:18'),(64,4,64,'Aliquid facere dignissimos quidem quo et beatae. Non qui dolore velit. Nemo non asperiores architecto corporis ratione.','velit',767,NULL,'1981-11-27 18:43:00','2007-02-13 08:00:47'),(65,1,65,'Id quos rerum delectus quas porro eos. Qui in accusantium nihil et possimus. Qui doloribus dolores a deserunt illo.','ducimus',663,NULL,'2005-01-30 20:53:19','1991-09-10 21:19:55'),(66,2,66,'Ipsa odit ut sed et. Eos vero aut veritatis doloribus ipsam et at repellendus. Fugiat sequi sint aliquam nostrum voluptate. Omnis quaerat consequatur cum.','mollitia',66726632,NULL,'1970-10-07 16:45:18','1994-10-28 09:20:08'),(67,3,67,'Placeat aut consequatur unde sed qui voluptatum. Harum ut quasi reprehenderit nostrum et. Facilis magnam consectetur ea suscipit accusantium.','enim',213578,NULL,'2015-06-20 09:21:47','1992-04-14 19:43:13'),(68,4,68,'Quod assumenda impedit aut odio consequatur aut quisquam. In officia mollitia nobis. Non accusantium ut tempore.','iure',0,NULL,'1996-05-23 22:33:17','2006-04-16 19:05:34'),(69,1,69,'Nemo eum et placeat non et repellat consequuntur. Rem vitae rerum sed aut numquam voluptatum quia. Magni itaque rerum laboriosam saepe molestias a.','voluptas',8488,NULL,'1973-03-05 22:36:40','1999-09-27 21:11:54'),(70,2,70,'Alias qui dolores tempore est. Molestiae necessitatibus debitis nihil qui. Et molestiae voluptatem doloribus tempore enim veritatis tenetur. Consequatur qui non debitis voluptas et in soluta.','aut',96,NULL,'2001-09-09 15:19:46','1972-11-13 06:05:57'),(71,3,71,'Ipsam velit maiores sit expedita distinctio. Nostrum corrupti similique officiis et et dolor. Quasi autem voluptas voluptas id molestias.','dicta',968311915,NULL,'1979-02-24 05:29:37','1988-12-17 03:44:14'),(72,4,72,'Natus vel est aspernatur qui velit adipisci sunt. Qui facilis cupiditate accusantium ut excepturi sequi esse. Numquam ipsam eos exercitationem qui perspiciatis. Sint quia consectetur recusandae in deserunt.','voluptate',985362,NULL,'2018-05-05 11:56:57','1980-08-25 16:44:26'),(73,1,73,'Atque et sint quam maxime. Beatae necessitatibus soluta quos qui qui explicabo aut. Cupiditate quisquam quis ab modi. Modi aut explicabo voluptates rerum ut quaerat.','modi',3,NULL,'2000-10-06 02:42:23','2011-04-26 07:15:28'),(74,2,74,'Sint nemo quasi est. Nulla vitae aut eveniet id exercitationem. Culpa eveniet neque ut minus ea eos.','possimus',17341,NULL,'1988-09-11 05:40:20','1974-05-21 05:13:15'),(75,3,75,'Sed sed ad eum commodi quam nulla perspiciatis doloremque. Corporis debitis nostrum harum consequuntur molestiae aut et. Voluptatibus in eos consequatur commodi molestiae.','eaque',778,NULL,'2012-12-31 01:29:33','1998-04-04 05:34:54'),(76,4,76,'Quisquam consequuntur deleniti rerum et dolorum sapiente voluptatem. Laudantium voluptatibus rem repudiandae omnis voluptas harum sed. Nam officiis dignissimos ut similique ipsum et architecto ullam. Ipsa illo veniam fuga ullam.','iste',6,NULL,'1998-12-20 17:58:27','2007-09-17 04:05:31'),(77,1,77,'Sequi vero nostrum sint dolores ratione aut et. Iure qui voluptas molestiae recusandae. Ut perferendis consequatur sed dolorum deleniti nobis exercitationem. Voluptas cumque laudantium aut quibusdam quia ex.','est',86,NULL,'1981-08-11 09:46:58','1985-11-21 04:30:46'),(78,2,78,'Similique sit deserunt assumenda inventore sunt dolorem. Nihil quo rerum vel assumenda. Saepe dolorum reiciendis et esse ipsam amet quod. Et nam et earum eveniet debitis et nesciunt.','omnis',8603,NULL,'1981-11-02 05:26:06','2016-11-11 07:42:26'),(79,3,79,'Sed qui ad quibusdam eaque dolores. Quia earum quis corporis non. Tempore consequatur qui a cupiditate.','ad',5346,NULL,'1996-01-26 11:47:20','2006-08-16 11:21:26'),(80,4,80,'Facilis a ducimus ad. Ipsam rerum iure assumenda veniam dolorem consequatur quasi occaecati. Aut sed est et sapiente aspernatur illo accusamus. Voluptatem asperiores quaerat sit sit.','dignissimos',58481,NULL,'1989-09-23 04:33:51','1995-05-23 13:25:52'),(81,1,81,'Quidem et eius doloremque ratione. Qui modi ipsum est officia et dolores. Molestias porro non velit totam.','rerum',5209165,NULL,'1990-06-19 13:06:13','1976-01-17 08:03:16'),(82,2,82,'Perferendis et et enim beatae ut voluptas velit. Officiis perspiciatis sed quaerat rem. Fuga laborum quia sed amet laboriosam voluptatem.','dolores',47161319,NULL,'1974-09-03 07:54:26','1991-09-30 05:10:28'),(83,3,83,'Delectus expedita libero fuga accusamus qui. Accusantium dolores iste nihil mollitia voluptatum. Eum error repellendus suscipit quia nisi culpa ut reiciendis. Tempore et reiciendis quaerat culpa.','quos',39321,NULL,'1995-07-10 12:13:21','1991-05-15 01:32:55'),(84,4,84,'Repudiandae dolor illum est maxime sapiente aut perspiciatis. Sunt reiciendis molestiae commodi at odit est. Qui fuga voluptatibus sunt animi velit non et.','et',2,NULL,'1971-04-15 11:44:35','2001-10-01 05:51:18'),(85,1,85,'Nisi iusto cum sed quam est cupiditate. Et praesentium necessitatibus ipsam maiores expedita. Velit autem possimus et labore.','deserunt',5929496,NULL,'2004-04-29 13:55:06','1979-07-11 13:41:08'),(86,2,86,'Ea sapiente voluptatem dolores a temporibus enim. Rerum quasi quo atque modi. Autem repellendus vitae esse aspernatur iure natus reprehenderit. Quo aut fugit dolorem atque qui voluptate atque ullam.','possimus',92,NULL,'2019-02-23 14:58:44','1971-04-19 07:08:45'),(87,3,87,'Dignissimos non qui est eligendi in. Et hic ea quidem et facilis.','sint',141,NULL,'2015-08-30 01:22:54','1977-05-07 13:53:19'),(88,4,88,'Ipsa dolores voluptatem maxime rem dolores dolores. Cupiditate doloribus porro in fuga ut. Aut aut nihil repellendus nisi asperiores. Ut voluptas id in veniam voluptatem veritatis.','rem',74236435,NULL,'1971-12-03 15:35:48','1976-03-01 14:02:43'),(89,1,89,'Doloremque rerum placeat dolores ut error. Assumenda dolores voluptatem nihil consequatur et aspernatur ab. Ducimus rerum et minus doloribus at ullam.','quo',258,NULL,'1984-01-05 13:50:11','1973-05-02 15:31:16'),(90,2,90,'Aliquid rerum sit natus deserunt. Nihil sint in ut facere eum. Quibusdam magnam ut qui officia quod dolore.','odio',163,NULL,'1978-08-29 14:13:55','1982-05-30 20:12:58'),(91,3,91,'Laboriosam non quia et blanditiis. Nihil ut est non autem voluptatibus. Molestiae reprehenderit at est sed sint enim. Voluptatibus ex eligendi doloribus non quaerat nostrum dignissimos. Architecto in veniam laboriosam inventore beatae.','autem',1,NULL,'1988-11-12 16:11:24','1974-11-28 14:05:18'),(92,4,92,'Vero esse suscipit non quis sed temporibus. Consectetur sit vel distinctio repellendus deleniti veniam qui. Eius veritatis at tempore quia.','neque',2,NULL,'2009-05-27 02:49:55','2005-01-27 07:18:36'),(93,1,93,'Repellat delectus nulla est nulla cum. Voluptas eum aut necessitatibus sit animi illo impedit aut. Consectetur aut et excepturi porro esse. Sint praesentium autem deleniti omnis et harum vitae. Minima error dolores voluptas provident cupiditate officiis.','et',93,NULL,'1987-09-12 14:34:04','2001-10-13 14:24:57'),(94,2,94,'Tempore corrupti vel nemo doloremque quibusdam expedita. Similique sit quam quis dolorum non excepturi. Rem voluptas laborum quos voluptas vel et. Error eveniet ea cum minus nihil officia dolorum. Ullam qui voluptatem autem ut.','quisquam',5591,NULL,'1998-08-05 01:54:38','1998-02-27 05:54:08'),(95,3,95,'Labore velit ipsam et sint voluptas. Necessitatibus maxime nihil repellendus quo cupiditate. Sit ad qui nemo. Sed magnam quia eos dignissimos in quo iusto.','maiores',0,NULL,'2007-08-09 17:40:53','1978-01-26 05:46:04'),(96,4,96,'Ducimus possimus dolorem quia corrupti dolore. Omnis nam ea eum culpa distinctio ex optio aut. Voluptas non facilis quo natus corrupti perferendis. Illo rerum ut explicabo sit.','ipsum',667274,NULL,'2011-03-10 17:39:19','2000-11-28 03:32:01'),(97,1,97,'Voluptatem corrupti exercitationem nulla est itaque. Ipsum quaerat similique ut dolorum. Qui aliquid neque labore alias ut placeat.','non',62,NULL,'1996-01-17 20:10:58','1981-06-13 17:41:29'),(98,2,98,'Qui aspernatur aut sit veniam. Aliquam nisi fuga facere. Asperiores aut beatae laboriosam libero. Fugiat id perspiciatis a dolores voluptatem ad earum.','aut',801927073,NULL,'1980-01-09 00:19:44','1988-02-25 17:22:37'),(99,3,99,'Assumenda iure delectus optio blanditiis atque occaecati. Ea assumenda dolor quibusdam nemo aut. Fugiat omnis velit quod. Sequi nihil quis consequatur sit et.','est',707,NULL,'1985-07-16 03:26:38','1997-04-24 07:20:57'),(100,4,100,'Deserunt accusantium laudantium ab soluta facilis assumenda. Et temporibus ab corporis dolorum rem qui. Ipsa veritatis amet voluptas quod. Ut incidunt illo ullam fugit optio recusandae.','doloribus',4,NULL,'2011-08-04 02:10:30','1997-09-15 00:49:47');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'et','2002-07-01 13:27:26','2006-05-23 15:05:19'),(2,'ut','2019-09-29 14:09:15','2012-09-15 03:31:22'),(3,'ut','2015-12-24 21:57:20','1975-05-12 22:13:20'),(4,'autem','2004-07-11 15:56:28','2015-04-11 02:46:39'),(5,'saepe','1970-04-02 19:25:32','1979-11-06 17:49:16'),(6,'harum','2017-06-04 12:59:32','2000-01-16 13:50:52'),(7,'ad','1973-12-13 07:37:30','1978-10-23 19:24:41'),(8,'corporis','1989-12-24 21:52:25','1978-02-24 05:59:40'),(9,'maiores','1976-03-21 05:19:59','2005-11-20 21:48:10'),(10,'voluptas','1972-04-27 12:43:19','1995-10-16 09:11:06'),(11,'consectetur','2014-07-25 08:56:05','1973-03-25 22:11:19'),(12,'dolor','2007-02-21 08:08:11','1986-11-21 00:40:01'),(13,'sint','2004-05-10 23:23:10','1970-11-02 13:49:54'),(14,'praesentium','2000-03-12 15:22:48','2000-11-22 20:13:10'),(15,'quibusdam','2007-04-04 07:51:14','1981-02-08 17:16:48'),(16,'corporis','1985-07-30 10:44:22','1973-11-05 08:38:10'),(17,'laboriosam','1987-05-07 01:40:20','2009-03-31 08:09:23'),(18,'est','2001-07-22 18:07:26','2004-05-23 19:19:17'),(19,'non','1986-02-11 19:45:29','2016-03-15 06:44:57'),(20,'temporibus','2016-11-21 03:50:29','1995-06-27 00:44:14'),(21,'nihil','1977-03-31 07:26:27','2016-01-02 09:44:51'),(22,'omnis','1976-12-24 17:03:01','1983-06-01 22:31:30'),(23,'numquam','1975-10-22 00:41:31','1976-08-11 11:53:47'),(24,'est','1976-06-26 09:33:57','2012-10-20 07:59:28'),(25,'soluta','1972-03-10 10:24:22','2016-06-17 20:37:39'),(26,'sit','1996-04-13 20:16:54','1998-06-22 20:30:17'),(27,'asperiores','1993-04-02 14:22:59','2005-11-19 04:21:03'),(28,'possimus','1993-09-24 05:47:36','2003-04-25 01:48:47'),(29,'cumque','2010-04-04 13:52:24','1998-05-22 06:52:38'),(30,'non','2014-11-07 22:31:43','2019-08-31 03:28:20'),(31,'et','1993-08-14 23:41:02','2003-04-30 04:06:36'),(32,'et','1981-12-06 23:51:00','1999-04-21 12:01:29'),(33,'est','2012-08-19 11:50:48','2016-11-15 00:17:40'),(34,'repudiandae','1984-04-10 03:31:43','2009-09-16 21:23:50'),(35,'recusandae','2019-04-02 06:09:47','1979-09-16 21:39:59'),(36,'deserunt','2001-11-22 03:40:55','1988-07-25 19:49:41'),(37,'est','2007-09-21 18:42:24','1976-02-11 06:59:50'),(38,'tempore','1980-09-25 16:05:22','2004-02-28 03:16:17'),(39,'est','1997-03-21 20:15:33','1997-07-02 18:08:39'),(40,'et','2017-06-10 05:03:23','2013-01-28 04:03:09'),(41,'dolorem','1995-07-07 19:39:24','1997-12-26 14:18:02'),(42,'aliquid','1984-05-02 09:09:07','1970-08-01 19:35:59'),(43,'eum','2008-02-07 07:08:32','2008-01-17 20:19:42'),(44,'illo','1977-05-03 08:21:58','2008-10-24 03:12:08'),(45,'esse','1997-11-29 00:18:36','2005-12-08 15:06:41'),(46,'facilis','1993-11-03 07:32:06','1974-08-21 01:21:32'),(47,'reiciendis','1978-05-28 20:10:49','2000-10-28 06:56:42'),(48,'harum','2005-09-15 01:09:57','2006-05-28 12:34:36'),(49,'repellendus','1997-11-21 05:18:44','1978-01-08 16:00:39'),(50,'quia','1982-06-02 23:32:48','1974-05-27 09:16:39'),(51,'eaque','1988-03-02 21:03:18','1973-01-04 07:34:00'),(52,'quia','2018-01-19 20:36:52','1987-06-15 03:14:17'),(53,'molestiae','1976-03-13 10:41:26','1972-11-10 15:25:32'),(54,'consequatur','2001-04-10 22:08:35','2006-02-22 03:34:10'),(55,'est','2002-03-04 04:41:34','2015-11-22 04:14:50'),(56,'non','2013-05-14 22:58:01','1994-05-08 03:21:44'),(57,'reprehenderit','1984-07-27 16:07:46','1989-12-07 15:12:07'),(58,'voluptate','1975-10-24 22:34:37','1971-03-29 04:41:12'),(59,'eos','1985-09-28 05:26:01','2017-09-24 00:24:16'),(60,'expedita','2015-01-25 08:49:35','1987-08-04 22:17:00'),(61,'molestiae','1993-12-31 15:27:18','1992-01-12 09:24:43'),(62,'dolorem','1974-04-13 04:03:28','1983-06-15 02:25:59'),(63,'nobis','1981-08-14 20:35:58','2007-01-14 22:12:21'),(64,'et','2015-01-08 10:08:47','2015-10-27 02:48:12'),(65,'id','2008-08-14 04:23:42','2011-01-06 11:29:15'),(66,'dolorem','1975-05-28 16:51:58','1980-01-19 12:29:54'),(67,'voluptas','2007-10-30 21:54:01','1976-04-22 18:01:20'),(68,'ipsa','1972-06-03 11:29:21','1994-12-25 10:52:20'),(69,'culpa','1972-11-25 03:05:23','2014-12-12 07:23:48'),(70,'aut','1995-11-05 08:15:25','2008-08-05 19:31:21'),(71,'quo','1991-05-02 16:35:13','1985-04-26 21:47:16'),(72,'et','2005-05-11 11:15:45','2011-10-01 10:44:37'),(73,'animi','1984-05-29 05:48:15','1981-10-17 16:26:14'),(74,'veritatis','2017-07-21 20:23:36','1988-01-18 11:32:56'),(75,'maxime','2004-07-03 19:50:41','2006-09-12 00:45:59'),(76,'nostrum','1988-03-25 21:32:59','2003-10-24 08:22:36'),(77,'autem','2013-01-08 23:57:53','1978-03-16 12:03:25'),(78,'ut','1980-03-03 18:20:28','1996-12-25 10:51:05'),(79,'adipisci','1971-01-14 06:11:25','1971-07-18 02:55:34'),(80,'impedit','1984-11-27 10:39:25','2016-08-27 16:37:29'),(81,'facilis','2002-02-08 17:23:59','2018-09-15 10:28:35'),(82,'quia','1975-11-13 17:09:10','1982-10-28 15:39:30'),(83,'dolorem','1980-03-19 01:05:20','1998-09-16 20:40:42'),(84,'sed','1984-12-21 04:47:32','1984-12-31 08:25:15'),(85,'dolor','1986-02-02 19:44:21','1984-05-16 04:59:30'),(86,'totam','1976-06-06 09:36:42','1970-04-22 10:40:59'),(87,'consequatur','2019-05-10 06:29:47','1999-04-21 23:46:14'),(88,'quibusdam','2010-10-13 07:30:12','2006-05-08 00:07:46'),(89,'perspiciatis','2012-12-10 00:51:28','2002-05-29 02:52:20'),(90,'numquam','1971-08-01 13:51:03','2007-01-30 09:14:19'),(91,'iste','1979-08-04 13:38:17','1985-10-01 21:24:09'),(92,'similique','1994-07-27 08:29:13','2015-09-10 21:16:16'),(93,'laborum','1989-11-24 05:41:36','1975-01-23 22:57:29'),(94,'dicta','1999-12-13 16:50:11','2018-07-25 11:36:31'),(95,'delectus','1974-07-05 01:07:33','2017-10-29 15:17:24'),(96,'ea','1986-09-17 11:55:19','1978-05-15 05:45:00'),(97,'et','1980-06-27 11:21:00','1973-02-23 23:12:34'),(98,'sunt','1982-10-03 07:01:35','2002-01-25 20:01:27'),(99,'excepturi','2001-03-31 15:59:15','2000-04-07 13:55:39'),(100,'dicta','2009-06-30 05:10:33','1978-09-16 03:47:09');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id` (`from_user_id`),
  KEY `messages_to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,2,'Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et. Nam accusantium aut qui quae nesciunt non.','1995-08-28 22:44:29'),(2,2,1,'Sint dolores et debitis est ducimus. Aut et quia beatae minus. Ipsa rerum totam modi sunt sed. Voluptas atque eum et odio ea molestias ipsam architecto.','2019-10-20 16:05:33'),(3,3,1,'Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi. Et tempora repudiandae saepe quo.','1993-09-14 19:45:58'),(4,1,3,'Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit. Facere eum distinctio assumenda omnis est delectus magnam.','1985-11-25 16:56:25'),(5,1,5,'Voluptas omnis enim quia porro debitis facilis eaque ut. Id inventore non corrupti doloremque consequuntur. Molestiae molestiae deleniti exercitationem sunt qui ea accusamus deserunt.','1999-09-19 04:35:46');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'quis',1),(2,'ipsa',2),(3,'omnis',3),(4,'quasi',4),(5,'cumque',5),(6,'blanditiis',6),(7,'iure',7),(8,'nemo',8),(9,'aut',9),(10,'explicabo',10),(11,'asperiores',11),(12,'vel',12),(13,'voluptas',13),(14,'porro',14),(15,'delectus',15),(16,'expedita',16),(17,'et',17),(18,'optio',18),(19,'et',19),(20,'sint',20),(21,'enim',21),(22,'sequi',22),(23,'laboriosam',23),(24,'quia',24),(25,'explicabo',25),(26,'ipsum',26),(27,'ea',27),(28,'non',28),(29,'eum',29),(30,'repellendus',30),(31,'rerum',31),(32,'numquam',32),(33,'incidunt',33),(34,'quia',34),(35,'corporis',35),(36,'consequatur',36),(37,'et',37),(38,'necessitatibus',38),(39,'aut',39),(40,'nulla',40),(41,'optio',41),(42,'ipsa',42),(43,'aspernatur',43),(44,'cumque',44),(45,'incidunt',45),(46,'aperiam',46),(47,'ut',47),(48,'voluptas',48),(49,'consequatur',49),(50,'esse',50),(51,'blanditiis',51),(52,'aliquid',52),(53,'accusamus',53),(54,'libero',54),(55,'adipisci',55),(56,'culpa',56),(57,'eos',57),(58,'non',58),(59,'quis',59),(60,'minima',60),(61,'quia',61),(62,'reiciendis',62),(63,'quasi',63),(64,'fugiat',64),(65,'quia',65),(66,'harum',66),(67,'rerum',67),(68,'ipsa',68),(69,'laborum',69),(70,'molestiae',70),(71,'a',71),(72,'cumque',72),(73,'delectus',73),(74,'reprehenderit',74),(75,'asperiores',75),(76,'animi',76),(77,'optio',77),(78,'commodi',78),(79,'culpa',79),(80,'aut',80),(81,'adipisci',81),(82,'quo',82),(83,'debitis',83),(84,'corrupti',84),(85,'aperiam',85),(86,'et',86),(87,'eligendi',87),(88,'quas',88),(89,'ea',89),(90,'iste',90),(91,'aut',91),(92,'ut',92),(93,'eaque',93),(94,'vel',94),(95,'eos',95),(96,'ducimus',96),(97,'omnis',97),(98,'similique',98),(99,'suscipit',99),(100,'totam',100);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50),(51,51,51),(52,52,52),(53,53,53),(54,54,54),(55,55,55),(56,56,56),(57,57,57),(58,58,58),(59,59,59),(60,60,60),(61,61,61),(62,62,62),(63,63,63),(64,64,64),(65,65,65),(66,66,66),(67,67,67),(68,68,68),(69,69,69),(70,70,70),(71,71,71),(72,72,72),(73,73,73),(74,74,74),(75,75,75),(76,76,76),(77,77,77),(78,78,78),(79,79,79),(80,80,80),(81,81,81),(82,82,82),(83,83,83),(84,84,84),(85,85,85),(86,86,86),(87,87,87),(88,88,88),(89,89,89),(90,90,90),(91,91,91),(92,92,92),(93,93,93),(94,94,94),(95,95,95),(96,96,96),(97,97,97),(98,98,98),(99,99,99),(100,100,100);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `hometown` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `profiles_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1976-11-08',1,'1970-01-18 03:54:01','Adriannaport'),(2,'f','2011-12-20',2,'1994-11-06 23:56:10','North Nettieton'),(3,'m','1994-06-15',3,'1975-11-27 02:27:11','Padbergtown'),(4,'f','1979-11-07',4,'1994-04-12 04:31:49','Port Rupertville'),(5,'f','1976-04-19',5,'1976-07-05 02:25:30','Spencerfort'),(6,'f','1983-09-07',6,'1981-06-20 15:54:43','South Woodrowmouth'),(7,'m','2014-07-31',7,'1997-06-21 07:52:05','South Jeffereyshire'),(8,'f','1975-03-26',8,'2008-08-18 18:23:25','Howeside'),(9,'f','1982-11-01',9,'2014-09-29 01:22:26','Loweborough'),(10,'m','1977-05-14',10,'1980-03-17 18:17:45','New Nellaside'),(11,'m','1988-10-28',11,'2011-08-22 08:31:06','New Skylar'),(12,'f','1994-02-07',12,'2015-08-04 16:34:50','South Dameontown'),(13,'f','1998-08-08',13,'1978-02-12 03:14:55','North Terencemouth'),(14,'f','1973-11-16',14,'2015-03-13 03:01:16','West Wilfordshire'),(15,'m','1979-08-20',15,'1983-08-13 03:48:56','North Xavier'),(16,'m','1997-03-17',16,'1989-09-08 23:17:00','Port Kayton'),(17,'m','2015-02-25',17,'1992-10-29 05:38:24','New Odie'),(18,'f','2011-04-05',18,'1981-08-22 06:53:53','South Newton'),(19,'f','1981-01-24',19,'1975-08-17 04:48:38','Port Jovanyview'),(20,'f','2010-03-12',20,'2008-02-11 09:39:28','Port Adolfoville'),(21,'f','1971-02-01',21,'1972-09-21 21:31:09','Kleinbury'),(22,'f','2000-08-30',22,'1977-03-15 13:44:30','South Ciara'),(23,'f','1991-08-17',23,'1991-10-15 01:01:05','Magdalenahaven'),(24,'m','2008-08-26',24,'2016-06-23 23:04:39','Port Jettchester'),(25,'f','2005-03-19',25,'2002-11-21 22:26:09','West Juneview'),(26,'m','1970-03-17',26,'1995-06-07 00:37:46','South Jose'),(27,'m','2011-01-12',27,'1992-03-18 22:28:05','Christinahaven'),(28,'m','2000-01-22',28,'2003-06-16 16:15:57','Lednerstad'),(29,'f','1988-02-16',29,'1988-02-09 12:47:21','Lisandrofort'),(30,'m','1977-08-16',30,'1977-03-09 23:28:37','Sethfort'),(31,'f','1978-11-28',31,'2008-01-31 16:16:06','Tessieport'),(32,'f','2004-02-06',32,'1995-11-19 13:46:21','Lake Reilly'),(33,'f','2000-05-07',33,'1991-11-21 16:14:32','East Rosalinda'),(34,'f','1988-11-22',34,'2008-08-17 22:20:26','Lake Henderson'),(35,'f','2008-08-28',35,'1991-07-07 07:37:17','Melanyport'),(36,'m','2004-02-05',36,'1973-11-04 03:21:50','Bryanaland'),(37,'m','2012-01-21',37,'2014-11-25 14:47:51','South Lorenstad'),(38,'f','1999-10-17',38,'1990-04-29 04:32:11','Rocioport'),(39,'f','1991-02-16',39,'1976-09-18 06:18:30','New Petra'),(40,'m','1993-08-26',40,'1976-10-03 19:24:42','Wizabury'),(41,'m','2005-07-31',41,'1997-04-11 10:03:16','Port Elton'),(42,'m','2000-01-08',42,'1971-02-20 18:14:51','New Hannahchester'),(43,'f','1996-01-09',43,'1999-05-18 06:05:39','North Deion'),(44,'f','1976-02-16',44,'1997-09-01 08:44:31','Lake Johnpaulport'),(45,'f','2018-10-20',45,'1995-04-02 18:37:27','East Ivybury'),(46,'m','1981-03-05',46,'1978-01-04 19:53:38','West Zula'),(47,'m','1973-06-27',47,'1992-08-24 13:18:15','Medatown'),(48,'f','1974-11-15',48,'1992-12-01 00:54:49','Medhursthaven'),(49,'f','1987-11-04',49,'1973-10-23 18:53:51','Kileyton'),(50,'m','1971-05-09',50,'1974-01-17 03:57:15','East Electaland'),(51,'m','1985-01-12',51,'1998-06-20 11:06:11','Isabellaland'),(52,'m','1989-06-05',52,'1986-09-23 20:01:28','Lake Houston'),(53,'f','2010-12-11',53,'2002-08-02 09:00:39','Lake Mohammad'),(54,'m','1975-05-29',54,'1973-09-21 12:52:05','Odessaside'),(55,'m','1996-06-27',55,'1974-07-07 05:47:32','West Jordy'),(56,'m','1976-08-28',56,'1994-10-13 21:37:38','Laceybury'),(57,'f','2016-05-22',57,'2007-10-31 21:36:34','Port Zelmastad'),(58,'f','1999-10-10',58,'2003-06-03 17:27:10','Vivienberg'),(59,'m','2008-12-12',59,'2015-11-19 11:12:16','West Sibyl'),(60,'m','1999-09-14',60,'1981-02-06 04:05:26','Antwantown'),(61,'m','2005-02-09',61,'1972-07-02 08:34:26','New Nonaview'),(62,'f','1993-07-09',62,'1996-12-19 03:17:29','Hilarioland'),(63,'f','2012-04-04',63,'1978-12-23 11:06:08','South Skylarmouth'),(64,'f','2005-10-07',64,'2010-10-31 01:21:49','West Bernadine'),(65,'f','1992-11-02',65,'1971-10-15 06:36:08','New Kacie'),(66,'m','2009-10-12',66,'1993-10-20 16:49:29','New Doylefort'),(67,'f','1982-08-16',67,'1990-01-23 22:14:55','West Kellihaven'),(68,'f','2006-05-13',68,'1997-04-29 02:49:42','East Ottis'),(69,'m','2003-09-20',69,'1987-02-12 08:27:11','Busterfort'),(70,'f','2011-09-09',70,'2017-05-04 11:35:24','Kassandrachester'),(71,'f','1979-10-23',71,'1993-10-23 12:37:59','North Estelle'),(72,'f','1978-07-10',72,'1990-09-16 18:57:43','Sonyachester'),(73,'m','1993-07-13',73,'1992-08-10 05:04:44','West Mozelle'),(74,'m','1977-12-04',74,'2009-09-19 18:30:49','South Kayleeton'),(75,'f','1981-08-27',75,'1974-12-15 01:52:32','Port Abdul'),(76,'f','1998-02-10',76,'2012-05-22 12:05:10','Lake Kellyland'),(77,'m','1973-10-17',77,'1984-06-22 12:10:24','West Alice'),(78,'f','2018-10-25',78,'1994-03-02 05:14:12','New Danykaberg'),(79,'m','1990-06-28',79,'2010-03-06 20:16:13','Port Nickolaschester'),(80,'m','2006-10-08',80,'2007-10-20 17:07:41','South Marleeburgh'),(81,'m','1972-02-09',81,'2012-02-18 04:33:04','South Elizabethside'),(82,'f','1971-09-28',82,'1979-09-10 00:00:36','Volkmanberg'),(83,'m','1987-11-02',83,'1994-02-03 03:15:34','South Bernita'),(84,'f','2019-03-20',84,'1979-09-08 02:29:57','Rennerfort'),(85,'m','2013-06-30',85,'2003-12-31 09:46:13','New Dagmar'),(86,'f','1974-12-29',86,'1978-05-13 16:58:53','West Cade'),(87,'f','2006-04-20',87,'2006-10-20 00:25:45','New Alycia'),(88,'f','1995-12-10',88,'2000-04-28 19:55:37','Hermanmouth'),(89,'f','1972-05-13',89,'2010-09-05 17:54:37','East Aliyah'),(90,'m','2006-08-02',90,'2007-10-11 03:49:30','Majorland'),(91,'f','1988-11-18',91,'2000-05-01 02:03:19','Sydneeport'),(92,'f','1983-07-24',92,'1977-10-20 00:24:36','Trinityland'),(93,'m','2015-04-16',93,'2003-01-06 17:49:50','South Noeliaton'),(94,'f','2016-09-20',94,'1990-07-07 06:28:12','South Kirstin'),(95,'m','1980-10-15',95,'1974-09-15 21:30:36','West Coryville'),(96,'m','1984-10-02',96,'1972-05-04 20:10:50','Hettingerside'),(97,'f','1971-12-10',97,'2005-07-14 15:03:46','Dooleyland'),(98,'f','2005-09-07',98,'1990-04-06 05:48:14','Lockmantown'),(99,'f','1996-10-09',99,'1981-09-24 02:19:44','Lake Lora'),(100,'f','1990-02-11',100,'1974-08-23 15:31:47','Port Mable');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_phone_idx` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Noemie','Auer','noel44@example.net',0),(2,'Jovanny','Barrows','mason.doyle@example.com',1),(3,'Lelah','Kutch','mallory.jenkins@example.org',927),(4,'Jaunita','Pollich','lina.leuschke@example.net',0),(5,'Tre','Rutherford','angie.weber@example.com',345),(6,'Colten','Gaylord','melissa75@example.net',1),(7,'Hilbert','Pagac','fbosco@example.net',0),(8,'Elroy','Lesch','casper.stephanie@example.com',1),(9,'Mabel','Klocko','dconnelly@example.org',603388),(10,'Federico','Murphy','auer.stella@example.com',0),(11,'Nathaniel','Rohan','trace51@example.com',50),(12,'Giles','Schneider','po\'connell@example.org',296794),(13,'D\'angelo','Runte','vgreenfelder@example.org',513554),(14,'Maegan','Douglas','crooks.mark@example.org',80),(15,'Coy','Fritsch','lgulgowski@example.org',0),(16,'Cleta','Keeling','hoppe.dudley@example.net',0),(17,'Annabelle','Parker','quitzon.mabelle@example.com',809655),(18,'Jaylin','Lakin','larry26@example.org',0),(19,'Frederique','Ryan','leopoldo.nolan@example.com',1),(20,'Esteban','Powlowski','hauck.letha@example.org',916206),(21,'Cesar','Auer','marvin.maye@example.net',1),(22,'Everette','Hilpert','kbauch@example.net',0),(23,'Billie','Nitzsche','gutkowski.thea@example.net',558),(24,'Carolyne','Kilback','twill@example.org',787),(25,'Mitchell','Haley','qschuppe@example.net',844),(26,'Alexanne','Herman','bogisich.lauryn@example.org',20),(27,'Zackery','Kassulke','hschowalter@example.org',1),(28,'Monserrate','Heidenreich','maribel.tillman@example.com',0),(29,'Elyse','Kiehn','ifeeney@example.org',1),(30,'Kimberly','O\'Reilly','cleuschke@example.net',46),(31,'Francesco','Hintz','xmetz@example.org',0),(32,'Reyes','Marquardt','bogan.janie@example.net',146921),(33,'Assunta','Hegmann','harber.rosemary@example.net',0),(34,'Catalina','Spencer','aiyana68@example.org',0),(35,'Estella','Rowe','halvorson.donavon@example.org',1),(36,'Abigayle','Toy','pouros.trenton@example.org',852236),(37,'Kianna','Schulist','monahan.joel@example.com',0),(38,'Leslie','Wiza','rmccullough@example.org',1),(39,'Napoleon','Koepp','bartell.hans@example.com',0),(40,'Newell','Medhurst','misty25@example.net',151),(41,'David','Casper','wilderman.missouri@example.net',208299),(42,'Johnny','Champlin','raynor.elisa@example.net',1),(43,'Gia','Homenick','ernser.yoshiko@example.net',150132),(44,'Jazmin','Bosco','smraz@example.org',0),(45,'Allen','Kilback','raoul.medhurst@example.net',0),(46,'Aliyah','Armstrong','xjaskolski@example.net',9228540405),(47,'Maxine','Hintz','tmayert@example.net',3735592027),(48,'Freddie','Swaniawski','strosin.angus@example.com',0),(49,'Lesly','Yost','zieme.julie@example.org',1),(50,'Orion','Mayer','tmcclure@example.com',1431746250),(51,'Sigrid','Prohaska','xbartoletti@example.org',1),(52,'Alize','Goyette','jonas67@example.com',1),(53,'Dorothy','Barrows','gutmann.vincenza@example.com',1),(54,'Cedrick','Nikolaus','chase94@example.net',6729406556),(55,'Cody','McCullough','deshawn39@example.com',2907),(56,'Roscoe','Cassin','alexis89@example.org',1),(57,'Otho','Weissnat','demetris11@example.com',843311),(58,'Roman','Marquardt','ondricka.chaya@example.com',904337),(59,'Daryl','Emmerich','bauch.erik@example.org',0),(60,'Jesus','Gislason','trantow.candice@example.com',1),(61,'Laurine','Fay','oromaguera@example.org',649),(62,'Rosalyn','Crist','douglas.dortha@example.net',719),(63,'Linnea','Zieme','bechtelar.vivian@example.net',1),(64,'Enrique','Kshlerin','clifford.collins@example.com',0),(65,'Millie','Greenfelder','weber.gisselle@example.org',0),(66,'Kaitlyn','Mills','maryse85@example.net',1),(67,'Dorothea','Kessler','khyatt@example.com',448),(68,'Ewell','Ankunding','xpadberg@example.org',0),(69,'Bennett','Huel','strosin.imogene@example.net',747398),(70,'Hortense','Brown','abdullah11@example.net',65),(71,'Emmett','Daugherty','elsa48@example.net',8306504097),(72,'Andreane','Kohler','sconsidine@example.com',1),(73,'Arely','Bednar','christopher44@example.com',1),(74,'Imogene','Jacobson','pdaugherty@example.net',453481),(75,'Florian','Blanda','vernon.kunze@example.org',753),(76,'Abigale','Grimes','johnathon86@example.net',695059),(77,'Gilbert','Quigley','adolf90@example.net',442),(78,'Aiden','Wyman','rahsaan.grimes@example.com',37),(79,'Aubrey','Jenkins','sfarrell@example.org',1),(80,'Cecilia','Quigley','crau@example.net',580),(81,'Dana','Harvey','barrows.nathanael@example.org',84),(82,'Luna','Price','davonte.bradtke@example.com',0),(83,'Eleazar','Crist','rmetz@example.com',488294),(84,'Ally','Olson','fay.veum@example.net',733),(85,'Wilhelmine','Torp','jgrant@example.com',78),(86,'Clair','Gorczany','koch.lexi@example.net',0),(87,'Amari','Glover','lawson.bechtelar@example.org',971),(88,'Odessa','Daniel','kaycee21@example.org',0),(89,'Osvaldo','Kovacek','kenyon90@example.net',5),(90,'Terry','Reilly','lakin.edmund@example.com',0),(91,'Neal','Schamberger','annetta.davis@example.com',2112638552),(92,'Felix','Nienow','block.mayra@example.org',0),(93,'Valentina','Carroll','glover.zelma@example.org',1183872565),(94,'Frankie','Hermiston','ambrose.marvin@example.org',90),(95,'Hiram','Prohaska','schneider.juanita@example.net',37),(96,'Jarrell','Jacobson','hrobel@example.org',116),(97,'Amparo','McKenzie','smitham.salvador@example.com',6547842889),(98,'Duane','Brekke','schimmel.holden@example.org',4737185343),(99,'Clinton','Brakus','cynthia.blick@example.com',140),(100,'Domenic','Schowalter','eloise96@example.org',808421);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(11,1),(21,1),(31,1),(41,1),(51,1),(61,1),(71,1),(81,1),(91,1),(2,2),(12,2),(22,2),(32,2),(42,2),(52,2),(62,2),(72,2),(82,2),(92,2),(3,3),(13,3),(23,3),(33,3),(43,3),(53,3),(63,3),(73,3),(83,3),(93,3),(4,4),(14,4),(24,4),(34,4),(44,4),(54,4),(64,4),(74,4),(84,4),(94,4),(5,5),(15,5),(25,5),(35,5),(45,5),(55,5),(65,5),(75,5),(85,5),(95,5),(6,6),(16,6),(26,6),(36,6),(46,6),(56,6),(66,6),(76,6),(86,6),(96,6),(7,7),(17,7),(27,7),(37,7),(47,7),(57,7),(67,7),(77,7),(87,7),(97,7),(8,8),(18,8),(28,8),(38,8),(48,8),(58,8),(68,8),(78,8),(88,8),(98,8),(9,9),(19,9),(29,9),(39,9),(49,9),(59,9),(69,9),(79,9),(89,9),(99,9),(10,10),(20,10),(30,10),(40,10),(50,10),(60,10),(70,10),(80,10),(90,10),(100,10);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-01 20:18:41
