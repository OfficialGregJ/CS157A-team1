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
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `User` varchar(45) NOT NULL,
  `Teams` varchar(45) DEFAULT NULL,
  `Players` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('A','Golden State Warriors','Stephen Curry, Draymond Green'),('B','Los Angeles Lakers','Lebron James'),('C','San Antonio Spurs','Victor Wembanyama'),('D','Boston Celtics, Dallas Mavericks','Jayson Tatum, Kyrie Irving'),('E','Denver Nuggets','Nikola Jokic, Jamal Murray'),('F','Dallas Mavericks, Sacramento Kings','Luka Doncic, Domantas Sabonis'),('G','Brooklyn Nets','Ben Simmons'),('H','New York Knicks, Philadelphia 76ers','Jalen Brunson, Joel Embiid'),('I','Minnesota Timberwolves','Anthony Edwards, Rudy Gobert'),('J','Los Angeles Clippers, Toronto Raptors','Paul George, Scottie Barnes, James Harden');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `game_statistics` VALUES ('2023-10-24','Golden State Warriors','Phoenix Suns',104,108,49,60,19,23,6,7,0.786,0.765,0.233,0.333,11,19),('2023-10-24','Los Angeles Lakers','Denver Nuggets',107,119,44,42,23,29,4,6,0.75,0.75,0.345,0.412,12,12),('2023-11-02','San Antonio Spurs','Phoenix Suns',132,121,41,34,37,26,5,4,0.923,0.731,0.486,0.5,21,19),('2023-11-02','Toronto Raptors','Philadelphia 76ers',99,114,41,46,30,21,3,3,0.684,0.84,0.684,0.84,19,14),('2023-12-01','Memphis Grizzlies','Dallas Mavericks',108,94,52,42,27,27,12,5,0.818,0.667,0.324,0.308,15,12),('2023-12-01','Washington Wizards','Orlando Magic',125,130,40,44,25,35,5,8,0.71,0.788,0.464,0.387,14,15),('2024-01-08','Chicago Bulls','Charlotte Hornets',119,112,51,44,27,26,7,7,0.833,0.882,0.346,0.405,14,15),('2024-02-12','San Antonio Spurs','Toronto Raptors',122,99,46,47,37,25,13,4,0.826,0.813,0.367,0.258,19,19),('2024-02-13','Boston Celtics','Brooklyn Nets',118,110,39,37,31,28,1,3,0.739,0.654,0.405,0.455,14,12),('2024-10-02','Brooklyn Nets','New Orleans Pelicans',85,112,43,53,26,23,7,10,0.5,0.778,0.256,0.41,15,17);
/*!40000 ALTER TABLE `game_statistics` ENABLE KEYS */;
UNLOCK TABLES;

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
  `YearInNBA` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('Anthony Davis','Los Angeles Lakers','Power Forward, Center',31,'6\'10',253,'University of Kentucky',12),('Joel Embiid','Philadelphia 76ers','Center',30,'7\'0',280,'University of Kansas',8),('Kevin Durant','Phoenix Suns','Small Forward, Power Forward',36,'6\'11',240,'University of Texas, Austin',16),('Kyrie Irving','Dallas Mavericks','Point Guard, Shooting Guard',32,'6\'02',195,'Duke University',13),('Lebron James','Los Angeles Lakers','Small Forward, Power Forward',39,'6\'09',250,'N/A',21),('Luka Doncic','Dallas Mavericks','Point Guard, Shooting Guard',25,'6\'07',230,'N/A',6),('Nikola Jokic','Denver Nuggets','Center',29,'6\'11',284,'N/A',9),('Stephen Curry','Golden State Warriors','Point Guard',36,'6\'02',185,'Davidson College',15),('Tyrese Haliburton','Indiana Pacers','Point Guard, Shooting Guard',24,'6\'05',185,'Iowa State',4),('Victor Wembanyama','San Antonio Spurs','Power Forward, Center',20,'7\'04',209,'N/A',1);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `Name` varchar(45) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Stadium` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('Boston Celtics','Boston','TD Garden'),('Brooklyn Nets','New York City','Barclays Center'),('Dallas Mavericks','Dallas','American Airlines Center'),('Denver Nuggets','Denver','Ball Arena'),('Golden State Warriors','San Francisco','Chase Center'),('Los Angeles Clippers','Los Angeles','Intuit Dome'),('Los Angeles Lakers','Los Angeles','SoFi Center'),('Minnesota Timberwolves','Minneapolis','Target Center'),('New York Knicks','New York City','Madison Square Garden'),('San Antonio Spurs','San Antonio','Frost Bank Center');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tournamenet_stats`
--

DROP TABLE IF EXISTS `tournamenet_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournamenet_stats` (
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
-- Dumping data for table `tournamenet_stats`
--

LOCK TABLES `tournamenet_stats` WRITE;
/*!40000 ALTER TABLE `tournamenet_stats` DISABLE KEYS */;
INSERT INTO `tournamenet_stats` VALUES ('Play-In Tournament','2024-04-16',NULL,NULL,'94','118',42,49,19,28,3,5,0.413,0.439,0.313,0.462,16,8);
/*!40000 ALTER TABLE `tournamenet_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournamenets`
--

DROP TABLE IF EXISTS `tournamenets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournamenets` (
  `TournamentName` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Team1` varchar(45) NOT NULL,
  `Team2` varchar(45) NOT NULL,
  `Winner` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournamenets`
--

LOCK TABLES `tournamenets` WRITE;
/*!40000 ALTER TABLE `tournamenets` DISABLE KEYS */;
INSERT INTO `tournamenets` VALUES ('Eastern Conference Finals','2024-05-27','Boston Celtics','Indiana Pacers','Boston Celtics','Gainbridge Fieldhouse'),('Finals','2024-06-17','Dallas Mavericks','Boston Celtics','Boston Celtics','TD Garden'),('In-Season Tournament','2023-11-03','Cleveland Cavaliers','Indiana Pacers','Indiana Pacers','Gainbridge Fieldhouse'),('In-Season Tournament','2023-11-03','New York Knicks','Milwaukee Bucks','Milwaukee Bucks','Fiserv Forum'),('In-Season Tournament','2023-12-04','New Orleans Pelicans','Sacramento Kings','New Orleans Pelicans','Golden 1 Center'),('In-Season Tournament','2023-12-05','Phoenix Suns','Los Angeles Lakers','Los Angeles Lakers','Crypto.com Arena'),('In-Season Tournament ','2023-12-09','Los Angeles Lakers','Indiana Pacers','Los Angeles Lakers','T-Mobile Arena'),('Play-In Game','2024-04-16','Golden State Warriors','Sacramento Kings','Sacramento Kings','Golden 1 Center'),('Play-In Game','2024-04-19','Sacamento Kings','New Orleans Pelicans','New Orleans Pelicans','Smoothie King Center'),('Western Conference Finals','2024-05-30','Dallas Mavericks','Minnesota Timberwolves','Dallas Mavericks','Target Center');
/*!40000 ALTER TABLE `tournamenets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('A','Test1'),('B','Test2'),('C','Test3'),('D','Test4'),('E','Test5'),('F','Test6'),('G','Test7'),('H','Test8'),('I','Test9'),('J','Test10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14 11:03:36
