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
-- Table structure for table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournaments` (
  `TournamentName` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Team1` varchar(45) NOT NULL,
  `Team2` varchar(45) NOT NULL,
  `Winner` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournaments`
--

LOCK TABLES `tournaments` WRITE;
/*!40000 ALTER TABLE `tournaments` DISABLE KEYS */;
INSERT INTO `tournaments` VALUES ('Eastern Conference Finals Game 4','2024-05-27','Boston Celtics','Indiana Pacers','Boston Celtics','Gainbridge Fieldhouse','https://www.youtube.com/watch?v=YlrNKOnByTU'),('NBA Finals Game 5','2024-06-17','Dallas Mavericks','Boston Celtics','Boston Celtics','TD Garden','https://www.youtube.com/watch?v=6kW6N2Ax9XA'),('In-Season Tournament Group A Stage','2023-11-03','Cleveland Cavaliers','Indiana Pacers','Indiana Pacers','Gainbridge Fieldhouse','https://www.youtube.com/watch?v=k4xwzhi1RSs'),('In-Season Tournament Group B Stage','2023-11-03','New York Knicks','Milwaukee Bucks','Milwaukee Bucks','Fiserv Forum','https://www.youtube.com/watch?v=SQm91d9mGQs'),('In-Season Tournament West Quarterfinal 1','2023-12-04','New Orleans Pelicans','Sacramento Kings','New Orleans Pelicans','Golden 1 Center','https://www.youtube.com/watch?v=tR7q722cXJU'),('In-Season Tournament West Quarterfinal 2','2023-12-05','Phoenix Suns','Los Angeles Lakers','Los Angeles Lakers','Crypto.com Arena','https://www.youtube.com/watch?v=DM31F9qQGWw'),('In-Season Tournament Finals','2023-12-09','Indiana Pacers','Los Angeles Lakers','Los Angeles Lakers','T-Mobile Arena','https://www.youtube.com/watch?v=NJNSgOE0AvE'),('Play-In Game 1','2024-04-16','Golden State Warriors','Sacramento Kings','Sacramento Kings','Golden 1 Center','https://www.youtube.com/watch?v=1MIVbc5lfFA'),('Play-In Game 2','2024-04-19','Sacamento Kings','New Orleans Pelicans','New Orleans Pelicans','Smoothie King Center','https://www.youtube.com/watch?v=OOD-X88f27Q'),('Western Conference Finals Game 5','2024-05-30','Dallas Mavericks','Minnesota Timberwolves','Dallas Mavericks','Target Center','https://www.youtube.com/watch?v=VUu2xSxGPfk'),('Play-In Game 3','2024-04-19','Chicago Bulls','Miami Heat','Miami Heat','Kaseya Center','https://www.youtube.com/watch?v=czEjG_TI0U8'),('Play-In Game 4','2024-04-16','Los Angeles Lakers','New Orleans Pelicans','Los Angeles Lakers','Smoothie King Center','https://www.youtube.com/watch?v=H79JI1zq-R8'),('Play-In Game 5','2024-04-17','Miami Heat','Philadelphia 76ers','Philadelphia 76ers','Wells Fargo Center','https://www.youtube.com/watch?v=llrWfHAAK6U'),('Play-In Game 6','2024-04-17','Atlanta Hawks','Chicago Bulls','Chicago Bulls','United Center','https://www.youtube.com/watch?v=x1yVVeoUkXI'),('In-Season Tournament East Quarterfinal 1','2023-12-05','New York Knicks','Milwaukee Bucks','Milwaukee Bucks','Fiserv Forum','https://www.youtube.com/watch?v=kPtMELZ9-fA');
/*!40000 ALTER TABLE `tournaments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15  3:46:48
