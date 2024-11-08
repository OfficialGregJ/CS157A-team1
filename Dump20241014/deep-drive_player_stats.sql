-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
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
-- Table structure for table `player_stats`
--

DROP TABLE IF EXISTS `player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_stats` (
  `Name` varchar(45) NOT NULL,
  `PPG` double DEFAULT NULL,
  `APG` double DEFAULT NULL,
  `BPG` double DEFAULT NULL,
  `SPG` double DEFAULT NULL,
  `RPG` double DEFAULT NULL,
  `FT%` double DEFAULT NULL,
  `3PT%` double DEFAULT NULL,
  `TOPG` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_stats`
--

LOCK TABLES `player_stats` WRITE;
/*!40000 ALTER TABLE `player_stats` DISABLE KEYS */;
INSERT INTO `player_stats` VALUES ('Anthony Davis',24.1,3.5,2.3,1.2,12.6,81.6,27.1,2.1),('Joel Embiid',34.7,5.6,1.7,1.2,11,88.3,38.8,3.8),('Kevin Durant',27.1,5,1.2,0.9,6.6,85.6,41.3,3.3),('Kyrie Irving',25.6,5.2,0.5,1.3,5,90.5,49.7,1.8),('Lebron James',27.1,7.4,0.7,1.3,7.3,75,41,3.5),('Luka Doncic',33.9,9.8,0.5,1.4,9.2,78.6,38.2,4),('Nikola Jokic',26.4,9,0.9,1.4,12.4,81.7,35.9,3),('Stephen Curry',24.8,5.1,0.4,0.7,4.5,47.2,40.8,2.8),('Tyrese Haliburton',20.1,10.9,0.6,1.5,3.9,85.5,36.4,2.3),('Victor Wembanyama',21.4,3.9,3.6,1.2,10.6,79.6,32.5,3.7);
/*!40000 ALTER TABLE `player_stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14 11:02:52
