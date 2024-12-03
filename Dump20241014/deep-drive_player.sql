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
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `Name` varchar(45) NOT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Position` varchar(45) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Height` varchar(45) DEFAULT NULL,
  `Weight` double DEFAULT NULL,
  `College` varchar(45) DEFAULT NULL,
  `YearInNBA` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('Anthony Davis','Los Angeles Lakers','Power Forward, Center',31,'6\'10',253,'University of Kentucky',12,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/6583.png&w=350&h=254'),('Joel Embiid','Philadelphia 76ers','Center',30,'7\'0',280,'University of Kansas',8,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3059318.png&w=350&h=254'),('Kevin Durant','Phoenix Suns','Small Forward, Power Forward',36,'6\'11',240,'University of Texas, Austin',16,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3202.png&w=350&h=254'),('Kyrie Irving','Dallas Mavericks','Point Guard, Shooting Guard',32,'6\'02',195,'Duke University',13,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/6442.png&w=350&h=254'),('Lebron James','Los Angeles Lakers','Small Forward, Power Forward',39,'6\'09',250,'N/A',21,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/1966.png&w=350&h=254'),('Luka Doncic','Dallas Mavericks','Point Guard, Shooting Guard',25,'6\'07',230,'N/A',6,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3945274.png&w=350&h=254'),('Nikola Jokic','Denver Nuggets','Center',29,'6\'11',284,'N/A',9,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3112335.png&w=350&h=254'),('Stephen Curry','Golden State Warriors','Point Guard',36,'6\'02',185,'Davidson College',15,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3975.png&w=350&h=254'),('Tyrese Haliburton','Indiana Pacers','Point Guard, Shooting Guard',24,'6\'05',185,'Iowa State',4,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4396993.png&w=350&h=254'),('Victor Wembanyama','San Antonio Spurs','Power Forward, Center',20,'7\'04',209,'N/A',1,'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/5104157.png&w=350&h=254');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03  1:25:22
