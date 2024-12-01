-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: deep-drive
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `tournament_stats`
--

DROP TABLE IF EXISTS `tournament_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament_stats` (
  `TournamentName` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Team1` varchar(45) DEFAULT NULL,
  `Team2` varchar(45) DEFAULT NULL,
  `Team1Pts` varchar(45) DEFAULT NULL,
  `Team2Pts` varchar(45) DEFAULT NULL,
  `Team1Rebounds` int DEFAULT NULL,
  `Team2Rebounds` int DEFAULT NULL,
  `Team1Assists` int DEFAULT NULL,
  `Team2Assists` int DEFAULT NULL,
  `Team1Blocks` int DEFAULT NULL,
  `Team2Blocks` int DEFAULT NULL,
  `Team1FT%` double DEFAULT NULL,
  `Team2FT%` double DEFAULT NULL,
  `Team13PT%` double DEFAULT NULL,
  `Team23PT%` double DEFAULT NULL,
  `Team1TO` int DEFAULT NULL,
  `Team2TO` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_stats`
--

LOCK TABLES `tournament_stats` WRITE;
/*!40000 ALTER TABLE `tournament_stats` DISABLE KEYS */;
INSERT INTO `tournament_stats` VALUES ('Play-In Tournament','2024-04-16',NULL,NULL,'94','118',42,49,19,28,3,5,0.413,0.439,0.313,0.462,16,8);
/*!40000 ALTER TABLE `tournament_stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01  1:55:19
