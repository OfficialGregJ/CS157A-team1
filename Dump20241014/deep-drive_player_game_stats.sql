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
  `TOV` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_game_stats`
--

LOCK TABLES `player_game_stats` WRITE;
/*!40000 ALTER TABLE `player_game_stats` DISABLE KEYS */;
INSERT INTO `player_game_stats` VALUES ('DeMar DeRozan','2024-01-08',18,7,7,1,0.75,0.333,3),('Jayson Tatum','2024-02-13',41,14,5,1,1,0.538,2),('Joel Embiid','2023-11-02',28,13,7,1,0.923,0,4),('Kyle Kuzma','2023-12-01',27,6,1,2,0.833,0.333,6),('Kyrie Irving','2023-12-01',10,5,5,0,0.8,0,1),('Lebron James','2023-10-24',21,8,5,1,0,0.25,0),('Mikal Bridges','2024-01-02',13,3,2,0,1,0.4,4),('Stephen Curry','2023-10-24',27,5,1,0,0.857,0.4,2),('Victor Wembanyama','2023-11-02',38,10,2,2,0.833,0.5,2),('Victor Wembanyama','2024-02-10',21,4,3,1,1,0.5,4);
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

-- Dump completed on 2024-10-14 11:02:52
