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
INSERT INTO `tournament_stats` VALUES ('Eastern Conference Finals Game 4','2024-05-27','Boston Celtics','Indiana Pacers','105','102',44,47,22,24,6,4,0.79,0.75,0.32,0.35,11,14),('NBA Finals Game 5','2024-06-17','Dallas Mavericks','Boston Celtics','88','106',35,51,18,25,4,2,0.54,0.85,0.3,0.33,13,7),('In-Season Tournament Group A Stage','2023-11-03','Cleveland Cavaliers','Indiana Pacers','116','121',35,40,27,28,9,5,0.8,0.67,0.29,0.48,13,18),('In-Season Tournament Group B Stage','2023-11-03','New York Knicks','Milwaukee Bucks','105','110',56,41,18,24,1,11,0.76,0.71,0.26,0.51,10,14),('In-Season Tournament West Quarterfinal 1','2023-12-04','New Orleans Pelicans','Sacramento Kings','127','117',42,38,29,29,7,2,0.83,0.82,0.45,0.34,12,8),('In-Season Tournament West Quarterfinal 2','2023-12-05','Phoenix Suns','Los Angeles Lakers','103','106',44,45,25,24,5,2,0.81,0.84,0.48,0.3,20,9),('In-Season Tournament Finals','2023-12-09','Indiana Pacers','Los Angeles Lakers','109','123',32,55,27,25,7,10,0.88,0.77,0.24,0.15,9,18),('Play-In Game 1','2024-04-16','Golden State Warriors','Sacramento Kings','94','118',42,49,19,28,3,5,0.78,0.93,0.31,0.46,16,8),('Play-In Game 2','2024-04-19','Sacramento Kings','New Orleans Pelicans','98','105',40,45,21,29,4,8,0.68,0.77,0.27,0.37,15,15),('Western Conference Finals Game 5','2024-05-30','Dallas Mavericks','Minnesota Timberwolves','124','103',45,41,19,17,5,5,0.74,0.81,0.44,0.31,12,11);
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

-- Dump completed on 2024-12-01  5:24:03
