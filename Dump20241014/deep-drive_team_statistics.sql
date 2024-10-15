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
-- Table structure for table `team_statistics`
--

DROP TABLE IF EXISTS `team_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_statistics` (
  `Team` varchar(45) NOT NULL,
  `PPG` double DEFAULT NULL,
  `APG` double DEFAULT NULL,
  `SPG` double DEFAULT NULL,
  `BPG` double DEFAULT NULL,
  `TOPG` double DEFAULT NULL,
  `FT%` double DEFAULT NULL,
  `3PT%` double DEFAULT NULL,
  `GamesPlayed` double DEFAULT NULL,
  `Wins` double DEFAULT NULL,
  `Losses` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_statistics`
--

LOCK TABLES `team_statistics` WRITE;
/*!40000 ALTER TABLE `team_statistics` DISABLE KEYS */;
INSERT INTO `team_statistics` VALUES ('Boston Celtics',120.6,26.9,6.8,6.6,11.9,80.7,38.8,82,64,18),('Brooklyn Nets',110.4,25.6,6.8,5.2,13.1,75.6,52.2,82,32,50),('Chicago Bulls',112.3,25,7.8,4.8,12.2,79.1,35.8,82,39,43),('Dallas Mavericks',117.9,27.9,6.9,5,12.5,75.8,36.9,82,50,32),('Denver Nuggets',114.9,29.5,7.1,5.6,12.6,76.2,37.4,82,57,25),('Golden State Warriors',117.8,29.3,7,4.6,13.7,78,38,82,46,36),('Los Angeles Lakers',118,28.5,7.4,5.5,14,78.2,18.9,82,47,35),('New Orleans Pelicans',115.1,27,8.3,4.6,13,77.1,38.3,82,49,33),('San Antonio Spurs',112.1,29.9,7.1,6.3,15.1,78.2,34.7,82,22,60),('Washington Wizards',113.7,27.9,7.6,5.1,14,76.4,34.8,82,15,67);
/*!40000 ALTER TABLE `team_statistics` ENABLE KEYS */;
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
