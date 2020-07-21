CREATE DATABASE  IF NOT EXISTS `lesson01_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lesson01_db`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 192.168.1.124    Database: lesson01_db
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `city_table`
--

DROP TABLE IF EXISTS `city_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_table` (
  `city_id` int unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `district_id` int unsigned DEFAULT NULL,
  `oblast_id` int unsigned NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_name_UNIQUE` (`city_name`),
  KEY `fk_district_id_idx` (`district_id`),
  KEY `fk_oblast_id_in_city_idx` (`oblast_id`),
  CONSTRAINT `fk_district_id` FOREIGN KEY (`district_id`) REFERENCES `district_table` (`district_id`),
  CONSTRAINT `fk_oblast_id_in_city` FOREIGN KEY (`oblast_id`) REFERENCES `oblast_table` (`oblast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_table`
--

LOCK TABLES `city_table` WRITE;
/*!40000 ALTER TABLE `city_table` DISABLE KEYS */;
INSERT INTO `city_table` VALUES (1,'Октябрьское',NULL,0),(2,'Аша',NULL,0),(3,'Абай',NULL,0),(4,'Успенка',NULL,0),(5,'Логойск',NULL,0),(6,'Столин',NULL,0);
/*!40000 ALTER TABLE `city_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_table`
--

DROP TABLE IF EXISTS `country_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_table` (
  `country_id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name_UNIQUE` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_table`
--

LOCK TABLES `country_table` WRITE;
/*!40000 ALTER TABLE `country_table` DISABLE KEYS */;
INSERT INTO `country_table` VALUES (3,'Беларусь'),(2,'Казахстан'),(1,'Россия');
/*!40000 ALTER TABLE `country_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district_table`
--

DROP TABLE IF EXISTS `district_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district_table` (
  `district_id` int unsigned NOT NULL AUTO_INCREMENT,
  `district_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `oblast_id` int unsigned NOT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `region_name_UNIQUE` (`district_name`),
  KEY `fk_oblast_id_idx` (`oblast_id`),
  CONSTRAINT `fk_oblast_id` FOREIGN KEY (`oblast_id`) REFERENCES `oblast_table` (`oblast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_table`
--

LOCK TABLES `district_table` WRITE;
/*!40000 ALTER TABLE `district_table` DISABLE KEYS */;
INSERT INTO `district_table` VALUES (1,'Оренбургская',0),(2,'Челябинская',0),(3,'Карагандинская',0),(4,'Павлодарская',0),(5,'Минская',0),(6,'Брестская',0);
/*!40000 ALTER TABLE `district_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oblast_table`
--

DROP TABLE IF EXISTS `oblast_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oblast_table` (
  `oblast_id` int unsigned NOT NULL AUTO_INCREMENT,
  `oblast_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`oblast_id`),
  UNIQUE KEY `area_name_UNIQUE` (`oblast_name`),
  KEY `fk_country_id_idx` (`country_id`),
  CONSTRAINT `fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `country_table` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oblast_table`
--

LOCK TABLES `oblast_table` WRITE;
/*!40000 ALTER TABLE `oblast_table` DISABLE KEYS */;
INSERT INTO `oblast_table` VALUES (1,'Октябрьский',0),(2,'Ашинский',0),(3,'Абайский',0),(4,'Успенский',0),(5,'Логойский',0),(6,'Столинский',0);
/*!40000 ALTER TABLE `oblast_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-21  5:03:12
