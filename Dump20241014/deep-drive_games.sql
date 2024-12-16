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
  `Location` varchar(45) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES ('2023-10-24','Golden State Warriors','Phoenix Suns','Phoenix Suns','Golden State Warriors','Chase Center','https://www.youtube.com/watch?v=0-xnCzuzRXk'),('2023-10-24','Los Angeles Lakers','Denver Nuggets','Denver Nuggets','Los Angeles Lakers','Ball Arena','https://www.youtube.com/watch?v=B0QZOj_k984'),('2023-11-02','San Antonio Spurs','Phoenix Suns','San Antonio Spurs','Phoenix Suns','Footprint Center','https://www.youtube.com/watch?v=SrVrF8zh-zY'),('2023-11-02','Toronto Raptors','Philadelphia 76ers','Philadelphia 76ers','Toronto Raptors','Wells Fargo Center','https://www.youtube.com/watch?v=BcfxDRpaweg'),('2023-12-01','Memphis Grizzlies','Dallas Mavericks','Memphis Grizzlies','Dallas Mavericks','American Airlines Center','https://www.youtube.com/watch?v=7k109F-4Hbo'),('2023-12-01','Washington Wizards','Orlando Magic','Orlando Magic','Washington Wizards','Kia Center','https://www.youtube.com/watch?v=7FBLv_zeFJQ'),('2024-01-02','Brooklyn Nets','New Orleans Pelicans','New Orleans Pelicans','Brooklyn Nets','Smoothie King Center','https://www.youtube.com/watch?v=S0qgWGUmRy8'),('2024-01-08','Chicago Bulls','Charlotte Hornets','Chicago Bulls','Charlotte Hornets','Spectrum Center','https://www.youtube.com/watch?v=UfD8d0WtBUo'),('2024-02-12','San Antonio Spurs','Toronto Raptors','San Antonio Spurs','Toronto Raptors','Scotiabank Arena','https://www.youtube.com/watch?v=Oei6RraZono'),('2024-02-13','Boston Celtics','Brooklyn Nets','Boston Celtics','Brooklyn Nets','Barclays Center','https://www.youtube.com/watch?v=guEL4hh1VTI'),('2024-01-27','Los Angeles Lakers','Golden State Warriors','Los Angeles Lakers','Golden State Warriors','Chase Center','https://www.youtube.com/watch?v=CykicwiC_Mk'),('2024-03-17','Denver Nuggets','Dallas Mavericks','Dallas Mavericks','Denver Nuggets','American Airlines Center','https://www.youtube.com/watch?v=FhN1mq_0Ibk'),('2023-10-31','San Antonio Spurs','Phoenix Suns','San Antonio Spurs','Phoenix Suns','Footprint Center','https://www.youtube.com/watch?v=N11F5PeeJpI'),('2024-01-14','Sacramento Kings','Milwaukee Bucks','Milwaukee Bucks','Sacramento Kings','Fiserv Forum','https://www.youtube.com/watch?v=EMEywnJZwOM'),('2023-11-06','Boston Celtics','Minnesota Timberwolves','Minnesota Timberwolves','Boston Celtics','Target Center','https://www.youtube.com/watch?v=9ILpfYHMP0U');
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

-- Dump completed on 2024-12-16  0:16:52
