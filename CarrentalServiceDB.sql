-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: trail2
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_credentials`
--

DROP TABLE IF EXISTS `admin_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_credentials` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_contact_number` varchar(255) DEFAULT NULL,
  `admin_firstname` varchar(255) DEFAULT NULL,
  `admin_lastname` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  `admin_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_credentials`
--

LOCK TABLES `admin_credentials` WRITE;
/*!40000 ALTER TABLE `admin_credentials` DISABLE KEYS */;
INSERT INTO `admin_credentials` VALUES (1,'8552968489','Pranav','Wagh','pranav@123','pranav'),(2,'8552968489','Pranav','Wagh','pranav@123','pranav12');
/*!40000 ALTER TABLE `admin_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `ongoing_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `vehicle_id` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `booking_time` varchar(50) DEFAULT (curtime()),
  `booking_date` varchar(50) DEFAULT (curdate()),
  `journey_time` varchar(50) DEFAULT (curtime()),
  `journey_date` varchar(50) DEFAULT (curdate()),
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `ride_status` int DEFAULT '1',
  PRIMARY KEY (`ongoing_id`),
  KEY `fk_userid` (`customer_id`),
  KEY `fk_carreg` (`vehicle_id`),
  KEY `fk_ond` (`driver_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`),
  CONSTRAINT `fk_carreg` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`),
  CONSTRAINT `fk_ond` FOREIGN KEY (`driver_id`) REFERENCES `driver_details` (`driver_id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`customer_id`) REFERENCES `customer_details` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (5,5,4,2,13,'11:34:06','2022-02-25','11:34:06','2022-02-25','Pune','Mumbai',0),(6,5,3,1,15,'11:34:06','1995','11:34:06','1995','Pune','Mumbai',0),(30,4,6,4,29,NULL,NULL,'05:55','2022-05-08','pune','mumbai',0),(33,4,11,5,32,'02:01:49','2022-04-02','05:04','2022-04-26','pune','mumbai',0),(36,4,5,6,35,'02:04:24','2022-04-02','07:08','2022-04-28','pune','aurangabad',0),(40,4,2,1,39,'03:02:16','2022-04-02','07:05','2022-04-22','pune','mumbai',0),(43,4,12,2,42,'08:43:06','2022-04-02','11:45','2022-04-15','pune','mumbai',0),(45,4,2,1,44,'09:08:51','2022-04-02','11:10','2022-04-23','pune','mumbai',0),(48,4,3,2,47,'19:02:58','2022-04-02','22:06','2022-04-28','pune','mumbai',0),(51,4,12,3,50,'19:03:45','2022-04-02','20:07','2022-04-30','pune','mumbai',0),(54,20,5,4,53,'19:05:00','2022-04-02','22:10','2022-04-21','pune','mumbai',0),(57,20,1,5,56,'19:05:31','2022-04-02','20:07','2022-04-28','pune','aurangabad',0),(60,4,2,1,59,'19:55:48','2022-04-02','20:56','2022-04-20','pune','mumbai',0),(62,20,1,2,61,'19:57:37','2022-04-02','23:59','2022-04-27','pune','mumbai',0),(65,21,5,4,64,'19:58:31','2022-04-02','23:04','2022-04-30','pune','aurangabad',0),(68,4,11,1,67,'21:48:12','2022-04-02','01:51','2022-04-22','Mumbai','Pune',0),(70,21,3,5,69,'21:49:56','2022-04-02','02:54','2022-04-23','Aurangabad','Mumbai',0),(73,23,6,6,72,'21:50:56','2022-04-02','02:51','2022-04-16','Aurangabad','Pune',0),(75,4,1,2,74,'22:48:12','2022-04-02','02:51','2022-04-09','Mumbai','Aurangabad',0),(78,4,1,2,77,'23:21:02','2022-04-02','03:24','2022-04-16','Mumbai','Pune',0),(80,4,1,2,79,'10:12:15','2022-04-03','12:14','2022-04-15','Aurangabad','Mumbai',0),(85,83,5,3,84,'10:15:58','2022-04-03','01:01','2022-05-01','Aurangabad','Pune',0),(88,83,2,1,87,'10:25:51','2022-04-03','14:30','2022-04-30','pune','mumbai',1),(91,83,3,3,90,'10:30:34','2022-04-03','16:36','2022-05-06','Pune','Mumbai',1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_details` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_firstname` varchar(50) DEFAULT NULL,
  `customer_lastname` varchar(50) DEFAULT NULL,
  `customer_contact_number` varchar(12) DEFAULT NULL,
  `customer_username` varchar(50) DEFAULT NULL,
  `customer_password` varchar(50) DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_pincode` int DEFAULT NULL,
  `customer_state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `phone_no` (`customer_contact_number`),
  UNIQUE KEY `phone_no_2` (`customer_contact_number`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (1,'Shriniwas','Sir','987654321','shriniwas','dulhani@123','dulhani@IET.com','Pune',411041,'Maharashtra'),(4,'Pranav','Wagh','8552968489','pranav','pranav@123','waghpranav222@gmail.com','Aurangabad',431109,'MH'),(5,'kalpit','vyas','9552790248','kalpit','kalpit@123','kapit@hotmail.com','Pune',431136,'DL'),(6,'Dhiraj','Chaudhari','7856953856','dhiraj','dhiraj@123','dhiraj@gmail.com','Pune',411041,'Maharashtra'),(7,'Ashwini','Aghav','8566953856','ashwini','ashwini@123','ashwini@gmail.com','Nashik',402341,'Maharashtra'),(20,'virat','kohli','8888888888','virat','virat@123','virat@gmail.com','mumbai',400030,'Maharashtra'),(21,'elon','musk','7896541230','elon','elon@123','elona@123','Aurangabad',431109,'GJ'),(22,'Mark','zukerberge','7859641235','mark','mark@123','mark@1253','Aurangabad',431109,'Maharashtra'),(23,'Jeff','Bezos','7458963210','jeff','jeff@123','jeff@amazon.com','NY',853262,'Maharashtra'),(83,'Pranav','Wagh','9011867415','pranav12','pranav@123','waghpranav222@gmail.com','Aurangabad',431136,'Maharashtra');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_details`
--

DROP TABLE IF EXISTS `driver_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_details` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `driver_firstname` varchar(50) DEFAULT NULL,
  `driver_lastname` varchar(50) DEFAULT NULL,
  `driver_contact_number` varchar(12) DEFAULT NULL,
  `driver_license` varchar(50) DEFAULT NULL,
  `driver_status` tinyint(1) DEFAULT NULL,
  `driver_city` varchar(50) DEFAULT NULL,
  `driver_pincode` int DEFAULT NULL,
  `driver_state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_details`
--

LOCK TABLES `driver_details` WRITE;
/*!40000 ALTER TABLE `driver_details` DISABLE KEYS */;
INSERT INTO `driver_details` VALUES (1,'manoj','dupargude','9876543210','XX1001XXX',0,'Pune',431136,'Maharashtra'),(2,'Ramesh','sonule','9789654123','XX1002XXX',0,'Aurangabad ',431109,'Assam'),(3,'Suresh','Sharma','9658496124','XX11021XX',0,'Nagpur',410215,'Delhi'),(4,'Kishor','Verma','9856986112','XX11021XX',1,'Mumbai',400015,'Goa'),(5,'Sanjiv','Kumar','9856986115','XX11024XX',1,'Bhopal',342023,'Gujarat'),(6,'Ravi','Verma','9856986562','XX11023XX',1,'Mumbai',400015,'Bihar'),(10,'Elon','Musk','894585696','XX1001XXX',1,'Pune',321152,'US');
/*!40000 ALTER TABLE `driver_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `customer_rating` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ongoing_id` int DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `fk_fedcust` (`customer_id`),
  KEY `fk_feedbackongoing` (`ongoing_id`),
  CONSTRAINT `fk_fedcust` FOREIGN KEY (`customer_id`) REFERENCES `customer_details` (`customer_id`),
  CONSTRAINT `fk_feedbackongoing` FOREIGN KEY (`ongoing_id`) REFERENCES `booking` (`ongoing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,5,4,'Very Good Ride!!',6),(27,5,4,'I hope this will save in DB',5),(28,5,5,'This is me!!!',5),(31,4,5,'This is my first bolero ride!!',30),(34,4,4,'This ride was awesome',33),(37,4,5,'This is my type of car ',36),(41,4,5,'This is creta ride',40),(46,4,3,'Thats cool',45),(49,4,4,'Trail Ride',48),(52,4,4,'Thats cool',45),(55,20,4,'Hey..This is Virat!!',54),(58,20,5,'This is verna ride!!!',57),(63,20,5,'This is My verna!!@@',62),(66,21,5,'This is Elon!!',65),(71,21,3,'The Ride was great!!!',70),(72,23,5,'Great!!',73),(73,4,5,'Nice Ride',68),(76,4,5,'Your voice is breaking',75),(86,83,5,'The ride was great\n',85),(89,83,3,'The perfect Ride!!\n\n',85),(92,83,5,'Pune To mumbai.....Luxurious Ride!!\n',91);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (93);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `destination` varchar(255) DEFAULT NULL,
  `distance` int DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'mumbai',200,'pune'),(2,'mumbai',300,'aurangabad'),(3,'pune',250,'aurangabad'),(4,'aurangabad',250,'pune'),(5,'aurangabad',300,'mumbai'),(6,'nagpur',300,'pune'),(7,'nagpur',500,'mumbai'),(8,'pune',200,'mumbai'),(9,'mumbai',600,'nagpur'),(10,'pune',550,'nagpur'),(11,'aurangabad',300,'nagpur'),(12,'nagpur',300,'aurangabad');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `vehicle_id` int DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `payment_date` varchar(20) DEFAULT (curdate()),
  `payment_time` varchar(20) DEFAULT (curtime()),
  PRIMARY KEY (`payment_id`),
  KEY `fk_user_id` (`customer_id`),
  KEY `fk_carid` (`vehicle_id`),
  CONSTRAINT `fk_carid` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_details` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (13,4,1,0,NULL,NULL),(15,1,1,0,NULL,NULL),(29,4,6,4000,'2022-04-02','01:51:27'),(32,4,11,4000,'2022-04-02','02:01:49'),(35,4,5,4500,'2022-04-02','02:04:24'),(39,4,2,4000,'2022-04-02','03:02:16'),(42,4,12,5000,'2022-04-02','08:43:06'),(44,4,2,4000,'2022-04-02','09:08:51'),(47,4,3,4000,'2022-04-02','19:02:58'),(50,4,12,5000,'2022-04-02','19:03:45'),(53,20,5,3600,'2022-04-02','19:05:00'),(56,20,1,25000,'2022-04-02','19:05:31'),(59,4,2,4000,'2022-04-02','19:55:47'),(61,20,1,20000,'2022-04-02','19:57:37'),(64,21,5,4500,'2022-04-02','19:58:31'),(67,4,11,4000,'2022-04-02','21:48:12'),(69,21,3,6000,'2022-04-02','21:49:56'),(72,23,6,5000,'2022-04-02','21:50:56'),(74,4,1,30000,'2022-04-02','22:48:12'),(77,4,1,20000,'2022-04-02','23:21:02'),(79,4,1,30000,'2022-04-03','10:12:15'),(84,83,5,4500,'2022-04-03','10:15:58'),(87,83,2,4000,'2022-04-03','10:25:51'),(90,83,3,4000,'2022-04-03','10:30:34');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicle_id` int NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(50) DEFAULT NULL,
  `vehicle_brand_name` varchar(50) DEFAULT NULL,
  `vehicle_type` varchar(20) DEFAULT NULL,
  `vehicle_seating_capacity` int DEFAULT NULL,
  `vehicle_price_per_km` double DEFAULT NULL,
  `vehicle_fuel_type` varchar(10) DEFAULT NULL,
  `vehicle_status` int DEFAULT '1',
  `vehicle_image` longblob,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'VERNA','HYUNDAI','SEDAN',5,100,'petrol',1,NULL),(2,'CRETA','HYUNDAI','SUV',6,20,'petrol',0,NULL),(3,'S-Presso','Maruti','Crossover',4,20,'Petrol',0,NULL),(4,'Safari','TATA','SUV',7,25,'Diesel',0,NULL),(5,'S-Cross','Maruti','Hatchback',5,18,'Petrol',1,NULL),(6,'Bolero','Mahindra','SUV',6,20,'Diesel',1,NULL),(11,'X3','BMW','SEDAN',4,20,'petrol',1,NULL),(12,'Benz S-Class','Mercedes','SEDAN',4,25,'petrol',1,NULL);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-03 12:16:47
