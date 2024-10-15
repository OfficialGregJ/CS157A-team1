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
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `Date` date NOT NULL,
  `Team1` varchar(45) NOT NULL,
  `Team2` varchar(45) NOT NULL,
  `Winner` varchar(45) DEFAULT NULL,
  `Loser` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES ('2023-10-24','Golden State Warriors','Phoenix Suns','Phoenix Suns','Golden State Warriors','Chase Center'),('2023-10-24','Los Angeles Lakers','Denver Nuggets','Denver Nuggets','Los Angeles Lakers','Ball Arena'),('2023-11-02','San Antonio Spurs','Phoenix Suns','San Antonio Spurs','Phoenix Suns','Footprint Center'),('2023-11-02','Toronto Raptors','Philadelphia 76ers','Philadelphia 76ers','Toronto Raptors','Wells Fargo Center'),('2023-12-01','Memphis Grizzlies','Dallas Mavericks','Memphis Grizzlies','Dallas Mavericks','American Airlines Center'),('2023-12-01','Washington Wizards','Orlando Magic','Orlando Magic','Washington Wizards','Kia Center'),('2024-01-02','Brooklyn Nets','New Orleans Pelicans','New Orleans Pelicans','Brooklyn Nets','Smoothie King Center'),('2024-01-08','Chicago Bulls','Charlotte Hornets','Chicago Bulls','Charlotte Hornets','Spectrum Center'),('2024-02-12','San Antonio Spurs','Toronto Raptors','San Antonio Spurs','Toronto Raptors','Scotiabank Arena'),('2024-02-13','Boston Celtics','Brooklyn Nets','Boston Celtics','Brooklyn Nets','Barclays Center');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14 11:02:53
