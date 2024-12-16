CREATE DATABASE  IF NOT EXISTS `deep-drive` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `deep-drive`;
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
-- Table structure for table `player_game_stats`
--

DROP TABLE IF EXISTS `player_game_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_game_stats` (
  `PlayerName` varchar(45) NOT NULL,
  `GameDate` date NOT NULL,
  `PTS` int DEFAULT NULL,
  `RBS` int DEFAULT NULL,
  `ATS` int DEFAULT NULL,
  `BLKS` int DEFAULT NULL,
  `FT%` double DEFAULT NULL,
  `3PT%` double DEFAULT NULL,
  `TOV` int DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_game_stats`
--

LOCK TABLES `player_game_stats` WRITE;
/*!40000 ALTER TABLE `player_game_stats` DISABLE KEYS */;
INSERT INTO `player_game_stats` VALUES ('DeMar DeRozan','2024-01-08',18,7,7,1,0.75,0.333,3,'Chicago Bulls'),('Jayson Tatum','2024-02-13',41,14,5,1,1,0.538,2,'Boston Celtics'),('Joel Embiid','2023-11-02',28,13,7,1,0.923,0,4,'Philadelphia 76ers'),('Kyle Kuzma','2023-12-01',27,6,1,2,0.833,0.333,6,'Washington Wizards'),('Kyrie Irving','2023-12-01',10,5,5,0,0.8,0,1,'Dallas Mavericks'),('Lebron James','2023-10-24',21,8,5,1,0,0.25,0,'Los Angeles Lakers'),('Mikal Bridges','2024-01-02',13,3,2,0,1,0.4,4,'Brooklyn Nets'),('Stephen Curry','2023-10-24',27,5,1,0,1,0.285,2,'Golden State Warriors'),('Victor Wembanyama','2023-11-02',38,10,2,2,0.833,0.5,2,'San Antonio Spurs'),('Victor Wembanyama','2024-02-12',21,4,3,1,1,0.5,4,'San Antonio Spurs'),('Kevin Durant','2023-10-24',18,11,3,1,0.6,0.5,2,'Phoenix Suns'),('Nikola Jokic','2023-10-24',29,13,11,1,0.5,0.6,2,'Denver Nuggets'),('Kevin Durant','2023-11-02',28,6,1,2,0.55,0.6,3,'Phoenix Suns'),('Scottie Barnes','2023-11-02',24,8,8,0,1,0.285,1,'Toronto Raptors'),('Desmond Bane','2023-12-01',30,4,5,2,0.666,0.666,4,'Memphis Grizzlies'),('Paolo Banchero','2023-12-01',28,13,7,0,1,0.75,2,'Orlando Magic'),('CJ McCollum','2024-01-02',16,6,5,0,0,0.5,2,'New Orleans Pelicans'),('Terry Rozier','2024-01-08',39,3,8,0,1,0.538,0,'Charlotte Hornets'),('RJ Barrett','2024-02-12',13,5,2,0,0,0.5,4,'Toronto Raptors'),('Cam Thomas','2024-02-13',26,2,4,0,1,0.57,3,'Brooklyn Nets');
/*!40000 ALTER TABLE `player_game_stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-16  0:16:55
