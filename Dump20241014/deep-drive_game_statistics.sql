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
-- Table structure for table `game_statistics`
--

DROP TABLE IF EXISTS `game_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_statistics` (
  `Date` date NOT NULL,
  `Team1` varchar(45) NOT NULL,
  `Team2` varchar(45) NOT NULL,
  `Team1Pts` int DEFAULT NULL,
  `Team2Pts` int DEFAULT NULL,
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
-- Dumping data for table `game_statistics`
--

LOCK TABLES `game_statistics` WRITE;
/*!40000 ALTER TABLE `game_statistics` DISABLE KEYS */;
INSERT INTO `game_statistics` VALUES ('2023-10-24','Golden State Warriors','Phoenix Suns',104,108,49,60,19,23,6,7,0.786,0.765,0.233,0.333,11,19),('2023-10-24','Los Angeles Lakers','Denver Nuggets',107,119,44,42,23,29,4,6,0.75,0.75,0.345,0.412,12,12),('2023-11-02','San Antonio Spurs','Phoenix Suns',132,121,41,34,37,26,5,4,0.923,0.731,0.486,0.5,21,19),('2023-11-02','Toronto Raptors','Philadelphia 76ers',99,114,41,46,30,21,3,3,0.684,0.84,0.684,0.84,19,14),('2023-12-01','Memphis Grizzlies','Dallas Mavericks',108,94,52,42,27,27,12,5,0.818,0.667,0.324,0.308,15,12),('2023-12-01','Washington Wizards','Orlando Magic',125,130,40,44,25,35,5,8,0.71,0.788,0.464,0.387,14,15),('2024-01-08','Chicago Bulls','Charlotte Hornets',119,112,51,44,27,26,7,7,0.833,0.882,0.346,0.405,14,15),('2024-02-12','San Antonio Spurs','Toronto Raptors',122,99,46,47,37,25,13,4,0.826,0.813,0.367,0.258,19,19),('2024-02-13','Boston Celtics','Brooklyn Nets',118,110,39,37,31,28,1,3,0.739,0.654,0.405,0.455,14,12),('2024-01-02','Brooklyn Nets','New Orleans Pelicans',85,112,43,53,26,23,7,10,0.5,0.778,0.256,0.41,15,17),('2024-01-27','Los Angeles Lakers','Golden State Warriors',145,144,55,50,33,37,5,3,0.88,0.69,0.33,0.4,19,17),('2024-03-17','Denver Nuggets','Dallas Mavericks',105,107,37,60,26,22,6,5,0.86,0.67,0.43,0.26,7,11),('2023-10-31','San Antonio Spurs','Phoenix Suns',115,114,37,43,25,29,9,7,0.75,0.8,0.38,0.46,12,19),('2024-01-14','Sacramento Kings','Milwaukee Bucks',142,143,47,40,34,31,2,3,0.75,0.84,0.42,0.47,9,13),('2023-11-06','Boston Celtics','Minnesota Timberwolves',109,114,45,45,20,26,2,5,0.77,0.52,0.28,0.35,16,23);
/*!40000 ALTER TABLE `game_statistics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15  3:46:47
