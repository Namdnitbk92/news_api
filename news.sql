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
INSERT INTO `check_readed` VALUES (1,'3','7','1','2017-05-09 09:35:58','2017-05-09 09:40:05'),(2,'4','7','1','2017-05-09 09:36:00','2017-05-09 09:40:06'),(3,'6','10','1','2017-05-09 09:42:30','2017-05-09 10:59:56'),(4,'7','10','1','2017-05-09 09:42:34','2017-05-09 10:49:01'),(5,'3','10','1','2017-05-09 09:42:43','2017-05-09 10:49:13'),(6,'4','10','1','2017-05-09 09:42:45','2017-05-09 09:42:45'),(7,'5','10','1','2017-05-09 10:02:37','2017-05-09 10:43:48'),(8,'12','10','1','2017-05-09 10:14:53','2017-05-09 10:32:19'),(9,'11','10','1','2017-05-09 10:14:56','2017-05-13 16:43:32'),(10,'14','10','1','2017-05-09 10:48:17','2017-05-13 16:53:26'),(11,'15','10','1','2017-05-09 10:48:31','2017-05-13 16:43:29'),(12,'16','10','1','2017-05-09 10:56:13','2017-05-09 15:50:21'),(13,'11','15','1','2017-05-09 11:49:11','2017-05-11 11:04:00'),(14,'11','7','1','2017-05-10 09:54:49','2017-05-11 09:31:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (11,'Hà Nội mở rộng lắp đặt loa tuyên truyền giao thông trên tuyến buýt nhanh BRT','Hà Nội mở rộng lắp đặt loa tuyên truyền giao thông trên tuyến buýt nhanh BRT','3','http://res.cloudinary.com/iist/video/upload/v1494298500/iywyzpnyimgg7pm7lezo.mp4','','','video','11','13','13',NULL,'2017-05-09 09:53:29','2017-05-09 09:53:36','2017-05-09 10:07:32'),(13,'Hai test tin khẩn','','3',NULL,'Hai test tin khẩn\r\nHai test tin khẩn\r\nHai test tin khẩn','','text','13','22','22',NULL,'2017-05-09 12:00:40','2017-05-09 10:00:40','2017-05-09 10:01:36'),(14,'Thông báo tiếp xúc cử tri','Ủy ban nhân dân phường Đội cấn xin thông báo, đúng 8h sáng ngày 19 tháng 4 đề nghị bà con có mặt tại nhà văn hóa số 6 để tiếp xúc cử tri','3','http://res.cloudinary.com/iist/video/upload/v1494301640/fohxyctn7w67hrrxuk2q.wav','','','audio','14','9','9',NULL,'2017-05-09 10:46:27','2017-05-09 10:45:55','2017-05-09 10:50:51'),(15,'Thông báo tổng vệ sinh đường phố','Ủy ban nhân dân phường Đội cấn xin thông báo, đúng 8h sáng ngày 20 tháng 4 đề nghị bà con tổng vệ sinh đường phố tại khu phố mình đang ở','3','http://res.cloudinary.com/iist/video/upload/v1494301675/hzinwifqlxvxylrfm0ep.wav','','','audio','15','9','9',NULL,'2017-05-09 10:47:25','2017-05-09 10:46:30','2017-05-09 10:51:11'),(16,'Đồng chí Hoàng Trung Hải dự lễ giao quân và nhận quân tại quận Ba Đình, TP Hà Nội','Lễ ra quân','2','http://res.cloudinary.com/iist/video/upload/v1494302044/tcfrybyopmyg5s9brvxj.mp4','','','video','16','6','6',NULL,'2017-05-09 10:53:12','2017-05-09 10:52:41','2017-05-09 10:54:22'),(17,'Khẩn cấp','khẩn','2','','Khẩn','','text','17','13','13',NULL,'2017-05-10 14:24:31','2017-05-10 14:24:03','2017-05-10 14:24:14'),(18,'Đồng chí Hoàng Trung Hải dự lễ giao quân và nhận quân tại quận Ba Đình, TP Hà Nội','Lễ ra quân test','3','http://res.cloudinary.com/iist/video/upload/v1494302044/tcfrybyopmyg5s9brvxj.mp4','','','video','18','6','6',NULL,'2017-06-10 10:53:12','2017-05-12 21:44:52','2017-05-12 21:46:32'),(19,'Test 123','Test Hai11','2','','text','','text','19','13','13',NULL,'2017-05-13 13:32:22','2017-05-13 16:31:32','2017-05-13 16:32:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (11,NULL,NULL,NULL,NULL,'city','1','2017-05-09 09:53:36','2017-05-09 09:53:36'),(13,NULL,NULL,NULL,NULL,'guild','11','2017-05-09 10:00:40','2017-05-09 10:00:40'),(14,NULL,NULL,NULL,NULL,'guild','20','2017-05-09 10:45:55','2017-05-09 10:45:55'),(15,NULL,NULL,NULL,NULL,'guild','20','2017-05-09 10:46:30','2017-05-09 10:46:30'),(16,NULL,NULL,NULL,NULL,'county','26','2017-05-09 10:52:41','2017-05-09 10:52:41'),(17,NULL,NULL,NULL,NULL,'city','1','2017-05-10 14:24:03','2017-05-10 14:24:03'),(18,NULL,NULL,NULL,NULL,'county','26','2017-05-12 21:44:52','2017-05-12 21:44:52'),(19,NULL,NULL,NULL,NULL,'city','1','2017-05-13 16:31:32','2017-05-13 16:31:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,'suSZfoyBWVnupETmkm6CaNxAYKI5Cd3RZVJmmvAsW02qBY2jHzBVpKmmnDOF','admin@test.com','6','city','1','$2y$10$vfvvo14FeHws878mh4fbjux4a817rC9gsREuIt8QLfRWPVhR6rJWu','d1dZMWYmKtkNhkeoKbCtQsqheSPCpEbe43L8Tp2DqBEhXYeGYHR5HDfWyBz3',NULL,'2017-05-14 11:39:59'),(2,'test',NULL,'wpZ93KAhUyjy9BekXAEoV3ybKzRV5EpDqrzE2kWvlaXy0O0CdvvIpj9OlQSr','test@test.com','1','guild','1','$2y$10$engk07annVuDKUim/tIQN.fJYu4AaH5SBcF6lnb7Cy4ew/0GqrGG2',NULL,NULL,NULL),(3,'QLND_HN','Thành phố Hà Nội','ZBJP1To0Z06w2erygFDWe5NDuzoeEwdJoExuxdPa2lNhvLjMgxA2FcP29vjy','qlnd_hn@gov.vn','2','city','26','$2y$10$J7Goa31KyM8tGdL5L9xn2.9zrSqYgM2EekOVyS/bfLI2gkMY.e45q',NULL,'2017-05-09 09:02:08','2017-05-09 09:02:08'),(5,'Admin phường Đội Cấn','Admin phường Đội Cấn','vmDiQod2qrqpEfUOWc0tVjfTIxaTBcCmbJLjEDxockcNDWHuybhwdfx4EA2J','doican@gov.vn','6','guild','20','$2y$10$DhjKoOZWSsNIOtRsH9EcAeBq0aGyv6zFaq1SW3UnrdqGHKl1DeGS2','Wt4uyNvBG4VLk3YQUuTdJR6DveHnH6olKvcaNwq19t722VcjOX7lWefp2hFO','2017-05-09 09:07:03','2017-05-09 11:53:53'),(6,'badinh_cm','Quản lý nội dung quận Ba ĐÌnh','QYoT4xP3gjEPqXdTXsIaIeOuhGNoanRxQ6hXahh2X1XlAtyBNbfqvCr1y2CG','badinh_cm@gov.vn','2','county','26','$2y$10$cgpBKl3pFu2C48RPrhhpyu9QcOhMY7uaM/eOPbbtjs.RUDvD1M8Zi','vEQjOGf0OJcrXqVwJM9Lr0m1mrz78yfsjN48zIL1k3JH1hvcdG80xFY91jNk','2017-05-09 09:07:48','2017-05-12 21:47:09'),(8,'doican_am','Phê duyệt phường','itt72gvW3o5GrQAuJSjAk6iOmuIF8jGZQM5BnDGmZV87Tj5nXl85AiDiVLKq','doican_am@gov.vn','3','guild','20','$2y$10$QTM/yOOiDJMp8UYhj.5A0OVetdRQSLi6kKtky2jbD7hMvh6TIEyfS','pqH3RIjIeesL0daZ7SVECCHsJcA5BjE0DorzxdlMaLSTFND3vLtjOTYDmehi','2017-05-09 09:17:25','2017-05-09 11:30:30'),(9,'doican_cm','QL Nội dung','DrXNJUh2WrAs9DcHdaIAp4BZsghtFFrfBo781gqG7RRjxRGjP3P8hfFetRaP','doican_cm@gov.vn','2','guild','20','$2y$10$67L6qQjHmFzTq2fRrM/zYujSIQ/hr.NF7vMIADyPr6y5L7QBgWSiq','UKH5Ug9TvdfgNq8WndGgthg8IPWJ2PJEPvPKPHAynYKHPhrtp7wtUUbQfkpV','2017-05-09 09:18:27','2017-05-09 11:54:49'),(10,'doican_nguoi dung','Người dùng phường','fdwUI1xYLSkcdIACt49B4EVK1dCnOfDUMYBOOQqPUnCS6SConBfGZ2shM5iQ','doican_us@gov.vn','1','guild','20','$2y$10$0P8AXwtifgMhsVrk5ThgQOyGw.hYA2TcOluw4i3Hzn6ZpPUXzRLFu',NULL,'2017-05-09 09:19:34','2017-05-09 15:30:20'),(11,'badinh_am','Phê duyệt quận','82IPGPuXO41e9FSfdBvjs2ODdNer2vXd3gLQjXe1IbQbZfA1l2qgPJPDsTiZ','badinh_am@gov.vn','3','county','26','$2y$10$9Lrqy4D9ETqiPsjm6fD5XuaUzRCv.OjA96AKHLBryXkk1eIqzfHma','BzVEp8sOJ8QjQfYwgDVqwf0wcD0IUuFrUpnMpDgBhLgnlVgzwpLzYGkqxQlB','2017-05-09 09:31:59','2017-05-12 21:46:41'),(13,'hanoi_cm','QL Nội Dung','c8QNl1AYufvr5yYA15viaMPZt5MLRez7nTxQM4T5Kaxzc4eQB01kCXDjrFWt','hanoi_cm@gov.vn','2','city','1','$2y$10$Xd8JZVMYFFtDTnGHkqYYLOjxfr8EDO2tHlzsioomXjO8uCahhM7Aq','pjGpPBv5Vv4IqFBh5WO7P33sLgOH0qkiPo1xiMgPMtDJHIW8eDBswLXodiXC','2017-05-09 09:37:03','2017-05-13 16:33:22'),(19,'phucxa@gov.vn','Admin','ScLQeXoZeoRQWqLUW6sKqBDMNJc1Clrzc4K9yRD2W1ZOuzszjHvR2mwJwiVd','phucxa@gov.vn','6','guild','11','$2y$10$7yqSVTRJQHl0mgznjYjgM.h6hYSopq9CTaMTJrJqtefKeE1IhHyqW','Uy8qi0W5UaxsgwBQz1ckhl69kHrjr1ldvtX350S4ta0XlKsosMgjYtJuKtSh','2017-05-09 09:57:04','2017-05-14 07:22:50'),(20,'hn_am@gov.vn','hn_am@gov.vn','YWbBlwyjyAeNkOfvlnCCBiswkVgTFOB0rkwKoTEJMFPLVzAbE6ztnNM53c5l','hn_am@gov.vn','3','city','1','$2y$10$eDS3.g3FPRMgK46IH7uD7.jNS4SzV0miH/3C17n4EebOisShXlBaS','c58S68xwfHvrKOxh22ZXWbimRX6ze3W0HAXsFJ9RI2vPd3vWiG0vwXgt8UJd','2017-05-09 09:57:30','2017-05-09 10:08:20'),(21,'phucxa_am','Phê duyệt phường','eaIB1jue8zT0ApHzwPzLWKKxOdCyeIu1xgWjZzZZXkU5ld1k252nQltOhtqW','phucxa_am@gov.vn','3','guild','11','$2y$10$Ybx9bdLjX9QCumdfv07Eq.HLnQ4QuqHGAgUN5IixK75a3jGLVBXjq','9EKP1XEQ9QkhZznH0Y8Pb5SqSZ4gV7g7gfnA0lVhGIsVuxfKiCb84JpDrK7X','2017-05-09 09:57:53','2017-05-09 10:04:52'),(22,'phucxa_cm','QL Nội dung','ZVWPbVJEHIMmlxqNil4c14MIng3o6N0avrvPdaVdbEueEPN71hiPB471q33i','phucxa_cm@gov.vn','2','guild','11','$2y$10$JbxSgXJfVx0Dv8S4sjzlvesils6Wl.lzgDlz1BoY9ESJf0S77ktX2','jhAbQo8ZNzmMP2j7PW4kDsnTBs11bwCcWYNsK8Bt7fzXwHQKjc8vk4VX21N2','2017-05-09 09:58:29','2017-05-14 07:23:15'),(23,'badinh@gov.vn','badinh@gov.vn','qsRLEhno6RfeRbYuHy8PIQhSJCdAk0FmagTme62szGJTaPTEgvIfKO2fl912','badinh@gov.vn','6','county','26','$2y$10$se6ggFI0yqj5cuxTCLHvGu5o3E3hAitEhRxIffRMujH1KBXoanCVO','JqZFuNsUglIwsZKEzSuLPo9NhJWbKI8c7dhpOErm7sa1JyxWRT92T9xPFyoM','2017-05-09 10:00:06','2017-05-14 11:38:18'),(25,'phucxa_nd','phucxa_nd','6wYjuoWZCrGqnpUEVJyFNssXgP4kzIoLOiKJ5aPYJzhiZmb8Bfjk7bOEv8cW','phucxa_nd@gov.vn','6','guild','11','$2y$10$Ff9IT9kaqSRy/BUtaikyR.J8oMoalU5qk238S7qrYHSuwckmekyda','k0N7oCvXkZ4xgfcz3lfJ1QZtqRSwOeLENPRAvPK9vQXfswXcan8I2REpXdlH','2017-05-13 13:45:35','2017-05-13 13:48:21'),(26,'sâs','sâsa','yNV1ENeJQSdqTJGiNyB6FFaKABZTds8YqB3VczvZhTzDStLhmvidnOcHeR4E','admin_test@test.com','6','guild','11','$2y$10$E0eceg6tC6Gg6vEr8YFjq.G4UrvYO1OctUsV4LkJcgvZ3dOBsyRTm',NULL,'2017-05-13 13:46:45','2017-05-13 13:46:45'),(27,'admin quận','Quận Đống Đa','v4yXHF8niLNNXUbw4FcOHChKe0O8khfqNoIs91p36OqbWnC6brF7NUL5MxE1','dongda_admin@gov.vn','6','county','1','$2y$10$Sf45DUTmK8ToXAaBoLrVX.UL1xykYDR4hUTDJZLq8ahrMMuZp3jKO',NULL,'2017-05-14 11:39:47','2017-05-14 11:39:47');
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

-- Dump completed on 2017-05-14  3:48:23
