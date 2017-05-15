-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: news
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Table structure for table `check_readed`
--

DROP TABLE IF EXISTS `check_readed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_readed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_readed` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_readed`
--

LOCK TABLES `check_readed` WRITE;
/*!40000 ALTER TABLE `check_readed` DISABLE KEYS */;
INSERT INTO `check_readed` VALUES (1,'3','7','1','2017-05-09 09:35:58','2017-05-09 09:40:05'),(2,'4','7','1','2017-05-09 09:36:00','2017-05-09 09:40:06'),(3,'6','10','1','2017-05-09 09:42:30','2017-05-09 10:59:56'),(4,'7','10','1','2017-05-09 09:42:34','2017-05-09 10:49:01'),(5,'3','10','1','2017-05-09 09:42:43','2017-05-09 10:49:13'),(6,'4','10','1','2017-05-09 09:42:45','2017-05-09 09:42:45'),(7,'5','10','1','2017-05-09 10:02:37','2017-05-09 10:43:48'),(8,'12','10','1','2017-05-09 10:14:53','2017-05-09 10:32:19'),(9,'11','10','1','2017-05-09 10:14:56','2017-05-15 15:25:29'),(10,'14','10','1','2017-05-09 10:48:17','2017-05-15 15:25:22'),(11,'15','10','1','2017-05-09 10:48:31','2017-05-15 11:50:21'),(12,'16','10','1','2017-05-09 10:56:13','2017-05-09 15:50:21'),(13,'11','15','1','2017-05-09 11:49:11','2017-05-11 11:04:00'),(14,'11','7','1','2017-05-10 09:54:49','2017-05-11 09:31:28');
/*!40000 ALTER TABLE `check_readed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supervisor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Thành phố Hà Nội','1',NULL,NULL);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `county` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supervisor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `county`
--

LOCK TABLES `county` WRITE;
/*!40000 ALTER TABLE `county` DISABLE KEYS */;
INSERT INTO `county` VALUES (1,'Quận Đống Đa','1',NULL,NULL,NULL),(2,'Quận Hai Bà Trưng','1',NULL,NULL,NULL),(3,'Quận Hoàng Mai','1',NULL,NULL,NULL),(4,'Quận Thanh Xuân','1',NULL,NULL,NULL),(5,'Huyện Sóc Sơn','1',NULL,NULL,NULL),(6,'Huyện Đông Anh','1',NULL,NULL,NULL),(7,'Huyện Gia Lâm','1',NULL,NULL,NULL),(8,'Quận Nam Từ Liêm','1',NULL,NULL,NULL),(9,'Huyện Thanh trì','1',NULL,NULL,NULL),(10,'Quận Bắc Từ Liêm','1',NULL,NULL,NULL),(11,'Huyện Mê Linh','1',NULL,NULL,NULL),(12,'Quận Hà Đông','1',NULL,NULL,NULL),(13,'Thị xã Sơn Tây','1',NULL,NULL,NULL),(14,'Huyện Ba Vì','1',NULL,NULL,NULL),(15,'Huyện Phúc Thọ','1',NULL,NULL,NULL),(16,'Huyện Đan Phượng','1',NULL,NULL,NULL),(17,'Huyện Hoaì Đức','1',NULL,NULL,NULL),(18,'Huyện Quốc Oai','1',NULL,NULL,NULL),(19,'Huyện Thạch Thất','1',NULL,NULL,NULL),(20,'Huyện Chương Mỹ','1',NULL,NULL,NULL),(21,'Huyện Thanh Oai','1',NULL,NULL,NULL),(22,'Huyện Thường tín','1',NULL,NULL,NULL),(23,'Huyện Phú Xuyên','1',NULL,NULL,NULL),(24,'Huyện Ứng Hòa','1',NULL,NULL,NULL),(25,'Huyện Mỹ Đức','1',NULL,NULL,NULL),(26,'Quận Ba Đình','1',NULL,NULL,NULL),(27,'Quận Hoàn Kiếm','1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `county` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `county_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supervisor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild`
--

LOCK TABLES `guild` WRITE;
/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
INSERT INTO `guild` VALUES (1,'Phường Cầu Diễn','8',NULL,NULL,NULL),(2,'Phường Xuân Phương','8',NULL,NULL,NULL),(3,'Phường Phương Canh','8',NULL,NULL,NULL),(4,'Phường Mỹ Đình 1','8',NULL,NULL,NULL),(5,'Phường Mỹ Đình 2','8',NULL,NULL,NULL),(6,'Phường Tây Mỗ','8',NULL,NULL,NULL),(7,'Phường Mễ Trì','8',NULL,NULL,NULL),(8,'Phường Phú Đô','8',NULL,NULL,NULL),(9,'Phường Đại Mỗ','8',NULL,NULL,NULL),(10,'Phường Trung Văn','8',NULL,NULL,NULL),(11,'Phường Phúc Xá','26',NULL,NULL,NULL),(12,'Phường Trúc Bạch','26',NULL,NULL,NULL),(13,'Phường Vĩnh Phúc','26',NULL,NULL,NULL),(14,'Phường Cống Vị','26',NULL,NULL,NULL),(15,'Phường Liễu Giai','26',NULL,NULL,NULL),(16,'Phường Nguyễn Trung Trực','26',NULL,NULL,NULL),(17,'Phường Quán Thánh','26',NULL,NULL,NULL),(18,'Phường Ngọc Hà','26',NULL,NULL,NULL),(19,'Phường Điện Biên','26',NULL,NULL,NULL),(20,'Phường Đội Cấn','26',NULL,NULL,NULL),(21,'Phường Ngọc Khánh','26',NULL,NULL,NULL),(22,'Phường Kim Mã','26',NULL,NULL,NULL),(23,'Phường Giảng Võ','26',NULL,NULL,NULL),(24,'Phường Phúc Tân','27',NULL,NULL,NULL),(25,'Phường Đồng Xuân','27',NULL,NULL,NULL),(26,'Phường Hàng Mã','27',NULL,NULL,NULL),(27,'Phường Hàng Buồm','27',NULL,NULL,NULL),(28,'Phường Hàng Đào','27',NULL,NULL,NULL),(29,'Phường Hàng Bồ','27',NULL,NULL,NULL),(30,'Phường Cửa Đông','27',NULL,NULL,NULL),(31,'Phường Lý Thái Tổ','27',NULL,NULL,NULL),(32,'Phường Hàng Bạc','27',NULL,NULL,NULL),(33,'Phường Hàng Gai','27',NULL,NULL,NULL),(34,'Phường Chương Dương Độ','27',NULL,NULL,NULL),(35,'Phường Hàng Trống','27',NULL,NULL,NULL),(36,'Phường Cửa Nam','27',NULL,NULL,NULL),(37,'Phường Hàng Bông','27',NULL,NULL,NULL),(38,'Phường Tràng Tiền','27',NULL,NULL,NULL),(39,'Phường Trần Hưng Đạo','27',NULL,NULL,NULL),(40,'Phường Phan Chu Trinh','27',NULL,NULL,NULL),(41,'Phường Hàng Bài','27',NULL,NULL,NULL);
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_04_05_093524_create_news_table',1),(4,'2017_04_05_093713_create_places_table',1),(5,'2017_04_05_093724_create_role_table',1),(6,'2017_04_05_093733_create_status_table',1),(7,'2017_04_10_032918_create_city_table',1),(8,'2017_04_10_033022_create_county_table',1),(9,'2017_04_10_033034_create_guild_table',1),(10,'2017_04_16_173421_create_check_readed_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audio_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audio_text` text COLLATE utf8_unicode_ci,
  `attach_path_file` text COLLATE utf8_unicode_ci,
  `file_type` text COLLATE utf8_unicode_ci,
  `place_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (13,'Hai test tin khẩn','','3',NULL,'Hai test tin khẩn\r\nHai test tin khẩn\r\nHai test tin khẩn','','text','13','22','22',NULL,'2017-05-09 12:00:40','2017-05-09 10:00:40','2017-05-09 10:01:36'),(16,'Đồng chí Hoàng Trung Hải dự lễ giao quân và nhận quân tại quận Ba Đình, TP Hà Nội','Lễ ra quân','2','http://res.cloudinary.com/iist/video/upload/v1494302044/tcfrybyopmyg5s9brvxj.mp4','','','video','16','6','6',NULL,'2017-05-09 10:53:12','2017-05-09 10:52:41','2017-05-09 10:54:22'),(17,'Khẩn cấp','khẩn','2','','Khẩn','','text','17','13','13',NULL,'2017-05-10 14:24:31','2017-05-10 14:24:03','2017-05-10 14:24:14'),(19,'Test 123','Test Hai11','2','','text','','text','19','13','13',NULL,'2017-05-13 13:32:22','2017-05-13 16:31:32','2017-05-13 16:32:58'),(41,'Thông báo tiếp xúc cử tri','Ủy ban nhân dân phường Đội cấn xin thông báo, đúng 8h sáng ngày 19 tháng 4 đề nghị bà con có mặt tại nhà văn hóa số 6 để tiếp xúc cử tri','3','http://res.cloudinary.com/loaphuongiist/video/upload/v1494837662/oozjhd8ehbcuv3nhs6qi.wav','','','audio','41','9','9',NULL,'2017-05-15 15:40:15','2017-05-15 15:39:08','2017-05-15 15:39:34'),(42,'Thông báo tổng vệ sinh đường phố','Ủy ban nhân dân phường Đội cấn xin thông báo, đúng 8h sáng ngày 20 tháng 4 đề nghị bà con tổng vệ sinh đường phố tại khu phố mình đang ở','3','http://res.cloudinary.com/loaphuongiist/video/upload/v1494837738/zelsyx1uddwfyzloqwrn.wav','','','audio','42','9','9',NULL,'2017-05-15 15:41:58','2017-05-15 15:40:24','2017-05-15 15:40:42'),(43,'Lễ giao quân và nhận quân tại quận Ba Đình','Đồng chí Hoàng Trung Hải dự lễ giao quân và nhận quân tại quận Ba Đình, TP Hà Nội','3','http://res.cloudinary.com/loaphuongiist/video/upload/v1494837838/vqhynbnau3u9stru2ttf.mp4','','','video','43','6','6',NULL,'2017-05-15 15:42:53','2017-05-15 15:42:06','2017-05-15 15:42:31'),(48,'Hà Nội mở rộng lắp đặt loa tuyên truyền giao thông trên tuyến buýt nhanh BRT','Buýt nhanh BRT','3','http://res.cloudinary.com/loaphuongiist/video/upload/v1494838546/ketpj6cwgihmhr0wfvzp.mp4','','','video','48','13','13',NULL,'2017-05-15 15:55:02','2017-05-15 15:53:55','2017-05-15 15:54:21'),(53,'Thông báo nộp tiền điện tháng 2_2017','Thông báo nộp tiền điện tháng 2_2017','4','http://res.cloudinary.com/loaphuongiist/video/upload/v1494840144/pelygx8vwxulq4uzlqv0.mp4','Thông báo đến các hộ dân tiền điện tháng 2_2017',NULL,'video','53','9',NULL,'a','2017-05-15 16:17:23','2017-05-15 16:20:33','2017-05-15 16:39:06'),(56,'Thông báo nộp tiền điện tháng 5_2017','Thông báo nộp tiền điện tháng 6_2017','4','http://res.cloudinary.com/loaphuongiist/video/upload/v1494840144/pelygx8vwxulq4uzlqv0.mp4','Thông báo đến các hộ dân tiền điện tháng 6_2017','','text','56','9',NULL,'a','2017-05-20 16:17:23','2017-05-15 16:21:50','2017-05-15 16:39:10'),(59,'Thông báo nộp tiền điện tháng 9_2017','Thông báo nộp tiền điện tháng 9_2017','4','','Thông báo nộp tiền điện tháng 9_2017','','text','59','9',NULL,'a','2017-05-19 16:24:10','2017-05-15 16:23:07','2017-05-15 16:39:13'),(60,'Thông báo tiền điện tháng 1_2017','Thông báo tiền điện tháng 1_2017','3','','Thông báo tiền điện tháng 1_2017','http://res.cloudinary.com/loaphuongiist/image/upload/v1494841318/unaibwbb18guiwjz2kyk.pdf','text','60','6','6',NULL,'2017-05-15 16:42:06','2017-05-15 16:40:04','2017-05-15 16:52:07'),(61,'Thông báo tiền điện tháng 2_2017','Thông báo tiền điện tháng 2_2017','3','','Thông báo tiền điện tháng 2_2017','http://res.cloudinary.com/loaphuongiist/image/upload/v1494841339/pakrswszprqocfcdfgqc.pdf','text','61','6','6',NULL,'2017-05-15 16:42:06','2017-05-15 16:40:26','2017-05-15 16:52:13'),(62,'Thông báo tiền điện tháng 3_2017','Thông báo tiền điện tháng 3_2017','3','http://res.cloudinary.com/loaphuongiist/video/upload/v1494841390/vwrxkhu3d1oqceitj1od.mp4','','','audio','62','6','6',NULL,'2017-05-15 16:43:06','2017-05-15 16:41:22','2017-05-15 16:52:25'),(63,'Thông báo tiền điện tháng 4_2017','Thông báo tiền điện tháng 4_2017','2','http://res.cloudinary.com/loaphuongiist/video/upload/v1494841498/gqcw6hqzctwvlgshejcr.mp4','',NULL,'video','63','6','6',NULL,'2017-05-16 16:43:06','2017-05-15 16:43:08','2017-05-15 16:43:13'),(64,'Thông báo tiền điện tháng 5_2017','Thông báo tiền điện tháng 5_2017','1','http://res.cloudinary.com/loaphuongiist/video/upload/v1494841551/bkntgjnnm22tvvwbjev5.mp4','Thông báo tiền điện tháng 5_2017','http://res.cloudinary.com/loaphuongiist/image/upload/v1494841558/izc14yz8boujfbe91sqi.pdf','text','64','6',NULL,NULL,'2017-05-15 16:43:00','2017-05-15 16:44:04','2017-05-15 16:44:04'),(65,'Thông báo tiền điện tháng 6_2017','Thông báo tiền điện tháng 6_2017','3','http://res.cloudinary.com/loaphuongiist/video/upload/v1494841578/rcxdwqrh4puwlcs55qqq.mp4','','http://res.cloudinary.com/loaphuongiist/image/upload/v1494841584/ngabmoue88qy2isuydfc.pdf','audio','65','6','6',NULL,'2017-05-15 16:45:48','2017-05-15 16:44:31','2017-05-15 16:52:19'),(66,'Thông báo tiền điện tháng 7_2017','Thông báo tiền điện tháng 7_2017','1','http://res.cloudinary.com/loaphuongiist/video/upload/v1494841578/rcxdwqrh4puwlcs55qqq.mp4','Thông báo tiền điện tháng 7_2017','http://res.cloudinary.com/loaphuongiist/image/upload/v1494841718/esbxoiiisfrdv31nokpz.pdf','text','66','6',NULL,NULL,'2017-05-15 16:45:48','2017-05-15 16:46:44','2017-05-15 16:46:44');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `place_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lat` double(8,2) DEFAULT NULL,
  `lng` double(8,2) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('city','county','guild') COLLATE utf8_unicode_ci NOT NULL,
  `original_place_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (13,NULL,NULL,NULL,NULL,'guild','11','2017-05-09 10:00:40','2017-05-09 10:00:40'),(16,NULL,NULL,NULL,NULL,'county','26','2017-05-09 10:52:41','2017-05-09 10:52:41'),(17,NULL,NULL,NULL,NULL,'city','1','2017-05-10 14:24:03','2017-05-10 14:24:03'),(19,NULL,NULL,NULL,NULL,'city','1','2017-05-13 16:31:32','2017-05-13 16:31:32'),(41,NULL,NULL,NULL,NULL,'guild','20','2017-05-15 15:39:08','2017-05-15 15:39:08'),(42,NULL,NULL,NULL,NULL,'guild','20','2017-05-15 15:40:24','2017-05-15 15:40:24'),(43,NULL,NULL,NULL,NULL,'county','26','2017-05-15 15:42:06','2017-05-15 15:42:06'),(48,NULL,NULL,NULL,NULL,'city','1','2017-05-15 15:53:55','2017-05-15 15:53:55'),(53,NULL,NULL,NULL,NULL,'guild','20','2017-05-15 16:20:33','2017-05-15 16:20:33'),(56,NULL,NULL,NULL,NULL,'guild','20','2017-05-15 16:21:50','2017-05-15 16:21:50'),(59,NULL,NULL,NULL,NULL,'guild','20','2017-05-15 16:23:07','2017-05-15 16:23:07'),(60,NULL,NULL,NULL,NULL,'county','26','2017-05-15 16:40:04','2017-05-15 16:40:04'),(61,NULL,NULL,NULL,NULL,'county','26','2017-05-15 16:40:26','2017-05-15 16:40:26'),(62,NULL,NULL,NULL,NULL,'county','26','2017-05-15 16:41:22','2017-05-15 16:41:22'),(63,NULL,NULL,NULL,NULL,'county','26','2017-05-15 16:43:08','2017-05-15 16:43:08'),(64,NULL,NULL,NULL,NULL,'county','26','2017-05-15 16:44:04','2017-05-15 16:44:04'),(65,NULL,NULL,NULL,NULL,'county','26','2017-05-15 16:44:31','2017-05-15 16:44:31'),(66,NULL,NULL,NULL,NULL,'county','26','2017-05-15 16:46:44','2017-05-15 16:46:44');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `role_role_id_unique` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('1','Người dân',NULL,NULL),('2','Người quản lý nội dung',NULL,NULL),('3','Người quản lý phê duyệt',NULL,NULL),('4','Quản lý người dùng',NULL,NULL),('5','Quản lý phản ánh',NULL,NULL),('6','Admin',NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status_id` enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `status_status_id_unique` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES ('1','Mới tạo',NULL,NULL),('2','Đang đợi duyệt',NULL,NULL),('3','Đã phê duyệt',NULL,NULL),('4','Đã hủy ',NULL,NULL);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `belong_to_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_place_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,'suSZfoyBWVnupETmkm6CaNxAYKI5Cd3RZVJmmvAsW02qBY2jHzBVpKmmnDOF','admin@test.com','6','city','1','$2y$10$vfvvo14FeHws878mh4fbjux4a817rC9gsREuIt8QLfRWPVhR6rJWu','rezt8FftnNSQKzlY3RXb4Oo7nsKx4DEiqQpUsEnP04Wl48rCpwzfM2IbsnfH',NULL,'2017-05-15 16:53:43'),(2,'test',NULL,'wpZ93KAhUyjy9BekXAEoV3ybKzRV5EpDqrzE2kWvlaXy0O0CdvvIpj9OlQSr','test@test.com','1','guild','1','$2y$10$engk07annVuDKUim/tIQN.fJYu4AaH5SBcF6lnb7Cy4ew/0GqrGG2',NULL,NULL,NULL),(3,'QLND_HN','Thành phố Hà Nội','ZBJP1To0Z06w2erygFDWe5NDuzoeEwdJoExuxdPa2lNhvLjMgxA2FcP29vjy','qlnd_hn@gov.vn','2','city','26','$2y$10$J7Goa31KyM8tGdL5L9xn2.9zrSqYgM2EekOVyS/bfLI2gkMY.e45q',NULL,'2017-05-09 09:02:08','2017-05-09 09:02:08'),(5,'Admin phường Đội Cấn','Admin phường Đội Cấn','vmDiQod2qrqpEfUOWc0tVjfTIxaTBcCmbJLjEDxockcNDWHuybhwdfx4EA2J','doican@gov.vn','6','guild','20','$2y$10$DhjKoOZWSsNIOtRsH9EcAeBq0aGyv6zFaq1SW3UnrdqGHKl1DeGS2','kqi9js7GJ3ZBNJYo5aVySV1y5HT6ttZvDpSsnytQmItVJhDGE7YmAqTzdc1j','2017-05-09 09:07:03','2017-05-15 16:38:53'),(6,'badinh_cm','Quản lý nội dung quận Ba ĐÌnh','QYoT4xP3gjEPqXdTXsIaIeOuhGNoanRxQ6hXahh2X1XlAtyBNbfqvCr1y2CG','badinh_cm@gov.vn','2','county','26','$2y$10$cgpBKl3pFu2C48RPrhhpyu9QcOhMY7uaM/eOPbbtjs.RUDvD1M8Zi','Ye1CssJpEoh8C9pIwA7ebtH3SifMMJHBQHHERzR6r0aYbtNg8HicQofrn2CB','2017-05-09 09:07:48','2017-05-15 16:51:42'),(8,'doican_am','Phê duyệt phường','itt72gvW3o5GrQAuJSjAk6iOmuIF8jGZQM5BnDGmZV87Tj5nXl85AiDiVLKq','doican_am@gov.vn','3','guild','20','$2y$10$QTM/yOOiDJMp8UYhj.5A0OVetdRQSLi6kKtky2jbD7hMvh6TIEyfS','aCXUMv1C8e4caavkyQerT4ALguSJ9YYlz91sY3JgGXVZlpn87wUQH4s5v4KA','2017-05-09 09:17:25','2017-05-15 16:51:54'),(9,'doican_cm','QL Nội dung','DrXNJUh2WrAs9DcHdaIAp4BZsghtFFrfBo781gqG7RRjxRGjP3P8hfFetRaP','doican_cm@gov.vn','2','guild','20','$2y$10$67L6qQjHmFzTq2fRrM/zYujSIQ/hr.NF7vMIADyPr6y5L7QBgWSiq','jQezkVQF6iEFT0gT85hGsY2DAsa0eMmvOfXohX8vlg3eQffKCdsL9icI3lmp','2017-05-09 09:18:27','2017-05-15 16:39:13'),(10,'doican_nguoi dung','Người dùng phường','fdwUI1xYLSkcdIACt49B4EVK1dCnOfDUMYBOOQqPUnCS6SConBfGZ2shM5iQ','doican_us@gov.vn','1','guild','20','$2y$10$0P8AXwtifgMhsVrk5ThgQOyGw.hYA2TcOluw4i3Hzn6ZpPUXzRLFu',NULL,'2017-05-09 09:19:34','2017-05-09 15:30:20'),(11,'badinh_am','Phê duyệt quận','82IPGPuXO41e9FSfdBvjs2ODdNer2vXd3gLQjXe1IbQbZfA1l2qgPJPDsTiZ','badinh_am@gov.vn','3','county','26','$2y$10$9Lrqy4D9ETqiPsjm6fD5XuaUzRCv.OjA96AKHLBryXkk1eIqzfHma','0aYcNuGwwSbbkGFsF3N4Wa8nXWf8brUbGEeAeOADTlpnmsLj4PRVGQWmXcCE','2017-05-09 09:31:59','2017-05-15 16:52:33'),(13,'hanoi_cm','QL Nội Dung','c8QNl1AYufvr5yYA15viaMPZt5MLRez7nTxQM4T5Kaxzc4eQB01kCXDjrFWt','hanoi_cm@gov.vn','2','city','1','$2y$10$aa/uPKRxmk2tLE8Wo2wBf.CVFcA1IJM6zHQ.ykkuWrvImBpJNReH2','pgDUWfU4Z5mBqeZPLI6EynBzUh4Dkv1RWIi8RWyuiZSefyui3IwXrsbCTvLD','2017-05-09 09:37:03','2017-05-15 16:37:41'),(19,'phucxa@gov.vn','Admin','ScLQeXoZeoRQWqLUW6sKqBDMNJc1Clrzc4K9yRD2W1ZOuzszjHvR2mwJwiVd','phucxa@gov.vn','6','guild','11','$2y$10$7yqSVTRJQHl0mgznjYjgM.h6hYSopq9CTaMTJrJqtefKeE1IhHyqW','Uy8qi0W5UaxsgwBQz1ckhl69kHrjr1ldvtX350S4ta0XlKsosMgjYtJuKtSh','2017-05-09 09:57:04','2017-05-14 07:22:50'),(21,'phucxa_am','Phê duyệt phường','eaIB1jue8zT0ApHzwPzLWKKxOdCyeIu1xgWjZzZZXkU5ld1k252nQltOhtqW','phucxa_am@gov.vn','3','guild','11','$2y$10$Ybx9bdLjX9QCumdfv07Eq.HLnQ4QuqHGAgUN5IixK75a3jGLVBXjq','9EKP1XEQ9QkhZznH0Y8Pb5SqSZ4gV7g7gfnA0lVhGIsVuxfKiCb84JpDrK7X','2017-05-09 09:57:53','2017-05-09 10:04:52'),(22,'phucxa_cm','QL Nội dung','ZVWPbVJEHIMmlxqNil4c14MIng3o6N0avrvPdaVdbEueEPN71hiPB471q33i','phucxa_cm@gov.vn','2','guild','11','$2y$10$JbxSgXJfVx0Dv8S4sjzlvesils6Wl.lzgDlz1BoY9ESJf0S77ktX2','jhAbQo8ZNzmMP2j7PW4kDsnTBs11bwCcWYNsK8Bt7fzXwHQKjc8vk4VX21N2','2017-05-09 09:58:29','2017-05-14 07:23:15'),(23,'badinh@gov.vn','badinh@gov.vn','qsRLEhno6RfeRbYuHy8PIQhSJCdAk0FmagTme62szGJTaPTEgvIfKO2fl912','badinh@gov.vn','6','county','26','$2y$10$se6ggFI0yqj5cuxTCLHvGu5o3E3hAitEhRxIffRMujH1KBXoanCVO','9tUQLdFyffJagdOfQiGybX4yqYZ7M1HYVhQwdeTS58JDhZ3BCm19IpVafEtN','2017-05-09 10:00:06','2017-05-15 16:28:38'),(27,'admin quận','Quận Đống Đa','v4yXHF8niLNNXUbw4FcOHChKe0O8khfqNoIs91p36OqbWnC6brF7NUL5MxE1','dongda_admin@gov.vn','6','county','1','$2y$10$Sf45DUTmK8ToXAaBoLrVX.UL1xykYDR4hUTDJZLq8ahrMMuZp3jKO','Fma74OzU0lHZl85gpeq8aumUNNhSRlr4htTTcvk5eZJB6H1CA2EQfdO2Q6J6','2017-05-14 11:39:47','2017-05-15 07:14:04'),(31,'tuliem','tuliem','ECZnGs7jguXlYdjK2YcGMkwqJMYAVw0DdWKOSBB3fsrX1Hd2S5Z6ejPVSK1j','tuliem@gov.vn','6','county','8','$2y$10$lpBjacYO7wiFMvFv6U/sweFMGxnPNStXScmaFumuaNZS0J2/iokQ2','jps0PcxUiiLKIeahTctrxXwORfJD4ZjGheEmHvAOntF5bAbzSnbA54tEsKDM','2017-05-15 13:02:51','2017-05-15 13:04:02'),(32,'metri','metri','RTNosn0U6EgJd1TpB2f4KIwAy1LXCmjf6NExb4lfhQL1qUJBDRKRTjJv7GYX','metri@gov.vn','6','guild','7','$2y$10$o/eYzMHdq56PPxx3jkPDMOPfuIep6r6GZrWkopIYUS6dXFWRHHAp2','t0aMCPQJ341Gut58MOB56yksztFaAqkQYVDNEGiuMgQyeHakqOPJJVAXs3by','2017-05-15 13:03:57','2017-05-15 13:06:03'),(33,'metri_cm@gov.vn','metri noi dung','Xgx8jQKzhBUfABcNjkkKymAO3h74qsa4EyAl64vvc4Jv8Wb2pdhsIXXq77rO','metri_cm@gov.vn','2','guild','7','$2y$10$fw2mUcB3rw/kv23668661ega8x68Cl2MxYrWX.tp2Gzgr/rqXGKIK','0eVJneCc06fkcNs2TAfNp3BG5POWfzw1HN3W1luu3BTxvleRbQTVb1TjG1xp','2017-05-15 13:04:55','2017-05-15 15:24:14'),(34,'metri_am@gov.vn','metri phe duyet','m9B0Alx6C5y0t13xuafqVyq2HKsVCY52cWHSXJvRmgsDrDmaXvn5tY3lgCDQ','metri_am@gov.vn','3','guild','7','$2y$10$7xb46euv7wZsIwxj8hk.YuHh3I5GLyZ0KNu5YcpTeXu6W8xLZirBq','AM3lJkFLG1UbkROkVbjFE2iZeBCayslTYSalH7ACkNPW3soA6TTkM0SQlerk','2017-05-15 13:05:31','2017-05-15 14:18:03'),(36,'hanoi_am@gov.vn','hanoi_am@gov.vn','HMymcMdEGPr2dYqqjY5o7PcHuY90jHtWRfc4h3LoYAlwrxwGuV9evnPHJDsu','hanoi_am@gov.vn','3','city','1','$2y$10$zhAYc7EDRVyJJ3ai//hM4usd3Z7pxc20Eb75dd4XfRli3CkyVonoi','P1IuFCVYgT5SQr8vxGfFxPROLlXx2yWpLCZ7LKpeWTqU117HvihR2r7KqQ1u','2017-05-15 15:52:31','2017-05-15 16:24:51'),(37,'ngoc1','1','EmGvur5hyK3bljXnNkFLdstNokydxh6KEKHtexRWOklpMRwTIc8HbBaTRVGu','noidungquan1@gmail.com','6','county','5','$2y$10$RbHzhZkbHWFSi/IDgwfHNub3n9guaW0fOd7JbX5ekKeA2g0nqMTVe','8n1fRRxEXAC4UVHj6ei1nw79SR0oTYZcTvClG6tCjnyjrV72mkHY9qtFQUNu','2017-05-15 16:07:31','2017-05-15 16:10:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-15  2:56:13
