-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: dsc_db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `member_details`
--

DROP TABLE IF EXISTS `member_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_details` (
  `Memberid` varchar(45) NOT NULL,
  `Membername` varchar(50) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Dob` date NOT NULL,
  `Occupation` varchar(50) NOT NULL,
  `Plan_name` varchar(20) NOT NULL,
  `dateofMembership` date NOT NULL,
  `dateofExpiry` date NOT NULL,
  `Sportsname` varchar(45) NOT NULL,
  PRIMARY KEY (`Memberid`),
  KEY `Plan_name_idx` (`Plan_name`),
  CONSTRAINT `Plan_name` FOREIGN KEY (`Plan_name`) REFERENCES `plan_details` (`Plan_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_details`
--

LOCK TABLES `member_details` WRITE;
/*!40000 ALTER TABLE `member_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_details`
--

DROP TABLE IF EXISTS `plan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_details` (
  `Plan_name` varchar(50) NOT NULL,
  `Facilities` varchar(100) DEFAULT NULL,
  `Charges` int NOT NULL,
  `Duration` int NOT NULL,
  PRIMARY KEY (`Plan_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_details`
--

LOCK TABLES `plan_details` WRITE;
/*!40000 ALTER TABLE `plan_details` DISABLE KEYS */;
INSERT INTO `plan_details` VALUES ('Bronze',NULL,500,1),('Gold','Free lounge access',950,5),('Luxury','Access to all things',9001,2),('Platinum','',700,3),('Silver','',600,2);
/*!40000 ALTER TABLE `plan_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_payment_details`
--

DROP TABLE IF EXISTS `plan_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_payment_details` (
  `Serial_number` int NOT NULL AUTO_INCREMENT,
  `Plan_name` varchar(50) NOT NULL,
  `Memberid` varchar(45) NOT NULL,
  `Date_of_Payment` date NOT NULL,
  PRIMARY KEY (`Serial_number`),
  KEY `plan_names_idx` (`Plan_name`),
  CONSTRAINT `plan_names` FOREIGN KEY (`Plan_name`) REFERENCES `plan_details` (`Plan_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_payment_details`
--

LOCK TABLES `plan_payment_details` WRITE;
/*!40000 ALTER TABLE `plan_payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_details`
--

DROP TABLE IF EXISTS `sports_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_details` (
  `Sportsname` varchar(50) NOT NULL,
  `SportsType` varchar(20) NOT NULL,
  `ChargesPerMonth` int NOT NULL,
  PRIMARY KEY (`Sportsname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_details`
--

LOCK TABLES `sports_details` WRITE;
/*!40000 ALTER TABLE `sports_details` DISABLE KEYS */;
INSERT INTO `sports_details` VALUES ('FootBall','Field Game',800),('Swimming','Team Racing Sport',400),('Volley Ball','2-2 Field Sport  ',250);
/*!40000 ALTER TABLE `sports_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_payment_details`
--

DROP TABLE IF EXISTS `sports_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_payment_details` (
  `Serial_number` int NOT NULL AUTO_INCREMENT,
  `Sports_name` varchar(50) NOT NULL,
  `Memberid` varchar(45) NOT NULL,
  `Date_of_Payment` date NOT NULL,
  PRIMARY KEY (`Serial_number`),
  KEY `Sports_name_idx` (`Sports_name`),
  CONSTRAINT `Sports_name` FOREIGN KEY (`Sports_name`) REFERENCES `sports_details` (`Sportsname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_payment_details`
--

LOCK TABLES `sports_payment_details` WRITE;
/*!40000 ALTER TABLE `sports_payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sports_payment_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-22 21:06:10
