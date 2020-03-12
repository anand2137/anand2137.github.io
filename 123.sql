-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: anand
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `conducted_by`
--

DROP TABLE IF EXISTS `conducted_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conducted_by` (
  `Event_Id` int(11) NOT NULL,
  `Org_Id` int(11) NOT NULL,
  PRIMARY KEY (`Event_Id`,`Org_Id`),
  KEY `Org_Id` (`Org_Id`),
  CONSTRAINT `conducted_by_ibfk_1` FOREIGN KEY (`Event_Id`) REFERENCES `event` (`Event_Id`),
  CONSTRAINT `conducted_by_ibfk_2` FOREIGN KEY (`Org_Id`) REFERENCES `organizer` (`Org_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conducted_by`
--

LOCK TABLES `conducted_by` WRITE;
/*!40000 ALTER TABLE `conducted_by` DISABLE KEYS */;
INSERT INTO `conducted_by` VALUES (5001,1001),(5004,1001),(5005,1001),(5003,1002),(5006,1002),(5002,1004),(5007,1005),(5003,1006);
/*!40000 ALTER TABLE `conducted_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consist_of`
--

DROP TABLE IF EXISTS `consist_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consist_of` (
  `Team_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Team_Id`,`User_Id`),
  KEY `consist_of_ibfk_1` (`User_Id`),
  CONSTRAINT `consist_of_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`),
  CONSTRAINT `consist_of_ibfk_2` FOREIGN KEY (`Team_Id`) REFERENCES `team` (`Team_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consist_of`
--

LOCK TABLES `consist_of` WRITE;
/*!40000 ALTER TABLE `consist_of` DISABLE KEYS */;
INSERT INTO `consist_of` VALUES (2001,182160),(2002,182160),(2006,182258),(2002,183162),(2008,183162),(2002,184158),(2008,184158),(2004,184251),(2004,184257),(2003,186138),(2001,187205),(2001,187206),(2004,187206),(2003,187246),(2007,187249),(2006,187268),(2007,187268);
/*!40000 ALTER TABLE `consist_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `Event_Id` int(11) NOT NULL,
  `Event_Name` varchar(50) NOT NULL,
  `Discription` varchar(100) DEFAULT NULL,
  `EDate` date DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`Event_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (5001,'Bot Workshop','Line Follower Robot Making Workshop','2020-03-01',5),(5002,'India Quiz','India Quiz on republic day','2020-01-26',3),(5003,'Game Automation','Game Automation Workshop','2020-02-23',5),(5004,'Webinar','Web Development Workshop by Progate','2020-02-27',2),(5005,'Tshirt Designing','Tshirt Designing for new Academic Year of CSEA','2019-10-18',1),(5006,'Rangoli Making','Rangoli Making Competition in YouthFest','2020-01-09',2),(5007,'Car Quiz','','2020-02-29',3);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_summary`
--

DROP TABLE IF EXISTS `event_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_summary` (
  `Event_Id` int(11) NOT NULL,
  `Org_Id` int(11) NOT NULL,
  `Summary` varchar(100) DEFAULT NULL,
  `Expenses` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`Event_Id`,`Org_Id`),
  KEY `event_summary_ibfk_1` (`Org_Id`),
  CONSTRAINT `event_summary_ibfk_1` FOREIGN KEY (`Org_Id`) REFERENCES `organizer` (`Org_Id`),
  CONSTRAINT `event_summary_ibfk_2` FOREIGN KEY (`Event_Id`) REFERENCES `event` (`Event_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_summary`
--

LOCK TABLES `event_summary` WRITE;
/*!40000 ALTER TABLE `event_summary` DISABLE KEYS */;
INSERT INTO `event_summary` VALUES (5001,1001,'event was successfully conducted',2000,8),(5002,1004,'event was successfully conducted',2500,8),(5003,1002,'event was inturupted by rain',2010,5),(5003,1006,'event was successfully conducted',1000,7),(5004,1001,'event was successfully conducted',3000,9),(5005,1001,'event was postponed due to power cut',2500,5),(5006,1002,'event was successfully conducted',2800,6),(5007,1005,'event was successfully conducted',2600,10);
/*!40000 ALTER TABLE `event_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_survey`
--

DROP TABLE IF EXISTS `event_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_survey` (
  `Event_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Intrested` varchar(5) DEFAULT NULL,
  `Feedback` varchar(50) DEFAULT NULL,
  KEY `User_Id` (`User_Id`),
  KEY `Event_Id` (`Event_Id`),
  CONSTRAINT `event_survey_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`),
  CONSTRAINT `event_survey_ibfk_2` FOREIGN KEY (`Event_Id`) REFERENCES `event` (`Event_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_survey`
--

LOCK TABLES `event_survey` WRITE;
/*!40000 ALTER TABLE `event_survey` DISABLE KEYS */;
INSERT INTO `event_survey` VALUES (5002,182160,'yes','looking forward'),(5002,182258,'no','no use'),(5002,183162,'yes','strength boaster'),(5004,184158,'no','not related'),(5004,184251,'no','not relevent'),(5004,184257,'yes','great event'),(5004,186138,'yes','useful for all'),(5007,187205,'yes','related to studies'),(5007,187206,'yes','relevent to current course');
/*!40000 ALTER TABLE `event_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_contact`
--

DROP TABLE IF EXISTS `org_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_contact` (
  `Contact_No` int(11) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Org_Id` int(11) DEFAULT NULL,
  KEY `Org_Id` (`Org_Id`),
  CONSTRAINT `org_contact_ibfk_1` FOREIGN KEY (`Org_Id`) REFERENCES `organizer` (`Org_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_contact`
--

LOCK TABLES `org_contact` WRITE;
/*!40000 ALTER TABLE `org_contact` DISABLE KEYS */;
INSERT INTO `org_contact` VALUES (741815,'b1@gmail.com',1001),(852363,'b2@gmail.com',1002),(369845,'b3@gmail.com',1003),(159455,'b4@gmail.com',1004),(153815,'b5@gmail.com',1005),(858157,'b6@gmail.com',1006);
/*!40000 ALTER TABLE `org_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizer`
--

DROP TABLE IF EXISTS `organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizer` (
  `Org_Id` int(11) NOT NULL,
  `Head_UId` int(11) DEFAULT NULL,
  `Org_Name` varchar(50) DEFAULT NULL,
  `Org_Type` varchar(50) DEFAULT NULL,
  `Faculty_Advisor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Org_Id`),
  KEY `Head_UId` (`Head_UId`),
  CONSTRAINT `organizer_ibfk_1` FOREIGN KEY (`Head_UId`) REFERENCES `users` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizer`
--

LOCK TABLES `organizer` WRITE;
/*!40000 ALTER TABLE `organizer` DISABLE KEYS */;
INSERT INTO `organizer` VALUES (1001,187246,'CSEA','Branch Association','K.Ramesh Sir'),(1002,184251,'ECEA','Branch Association','RamaRao Sir'),(1003,182160,'EEEA','Branch Association','Ramalu Sir'),(1004,184158,'Quiz Club','Club Association','Venkat Ramna Sir'),(1005,183162,'MEA','Branch Association','Kavitha Madam'),(1006,184257,'EA and HAM Club','Club Association',NULL);
/*!40000 ALTER TABLE `organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participated_teams`
--

DROP TABLE IF EXISTS `participated_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participated_teams` (
  `Event_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`Event_id`,`team_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `participated_teams_ibfk_1` FOREIGN KEY (`Event_id`) REFERENCES `event` (`Event_Id`),
  CONSTRAINT `participated_teams_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`Team_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participated_teams`
--

LOCK TABLES `participated_teams` WRITE;
/*!40000 ALTER TABLE `participated_teams` DISABLE KEYS */;
INSERT INTO `participated_teams` VALUES (5001,2002),(5002,2002),(5001,2003),(5002,2003),(5003,2003),(5002,2004),(5003,2004),(5004,2004),(5003,2005),(5004,2005),(5005,2005),(5004,2006),(5005,2006),(5006,2006),(5005,2007),(5006,2007),(5007,2007),(5006,2008),(5007,2008),(5007,2009);
/*!40000 ALTER TABLE `participated_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `Team_Id` int(11) NOT NULL,
  `Team_Name` varchar(20) DEFAULT NULL,
  `Leader_UId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Team_Id`),
  KEY `Leader_UId` (`Leader_UId`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`Leader_UId`) REFERENCES `users` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (2001,'Anubhav',187206),(2002,'Desi Katta',184251),(2003,'Alpha',187246),(2004,'Hindi Madhyam',187249),(2005,'Ronin',182258),(2006,'Uniq',187268),(2007,'DeathNote',184257),(2008,'MechBlasters',183162),(2009,'Best Team',187249);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contact`
--

DROP TABLE IF EXISTS `user_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_contact` (
  `Contact_No` int(11) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `user_contact_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contact`
--

LOCK TABLES `user_contact` WRITE;
/*!40000 ALTER TABLE `user_contact` DISABLE KEYS */;
INSERT INTO `user_contact` VALUES (895815,'a1@gmail.com',182160),(895815,'a1@gmail.com',182160),(895363,'a2@gmail.com',182258),(895845,'a3@gmail.com',183162),(895455,'a4@gmail.com',184158),(257815,'a5@gmail.com',184251),(635815,'a6@gmail.com',184257),(958815,'a7@gmail.com',186138),(892585,'a8@gmail.com',187205),(891255,'a9@gmail.com',187206),(102815,'a11@gmail.com',187246),(365715,'a23@gmail.com',187268);
/*!40000 ALTER TABLE `user_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_Id` int(11) NOT NULL,
  `First_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `UGorPG` varchar(5) DEFAULT NULL,
  `Branch` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Hostel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (182160,'Shyam','Singh','UG','EEE','2000-10-06','6thBlock'),(182258,'Shashwat','Mahale','UG','EEE','2000-09-21','6thBlock'),(183162,'Ritesh','Mugdiya','UG','ME','2000-04-18','6thBlock'),(184158,'Snehil','Khajuria','UG','ECE','2001-07-02','3rdBlock'),(184251,'Rushikesh','Shendre','UG','ECE','2000-08-10','6thBlock'),(184257,'Sitanshu','Shukla','UG','ECE','2000-04-29','6thBlock'),(186138,'Piyush','Ambulgekar','UG','ChE','2001-02-28','6thBlock'),(187205,'Akhilesh','Yadav','UG','CSE','2000-09-15','7thBlock'),(187206,'Ankush','Verma','UG','CSE','2001-09-14','6thBlock'),(187246,'Priyansh','Maheshwari','UG','CSE','2000-06-09','6thBlock'),(187249,'Anand','Raut','UG','CSE','2000-08-06','6thBlock'),(187268,'Tushar','Sain','UG','CSE','2001-01-28','3thBlock');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `Event_Id` int(11) NOT NULL,
  `Building` varchar(20) NOT NULL,
  `Room_No` varchar(5) NOT NULL,
  PRIMARY KEY (`Event_Id`,`Building`,`Room_No`),
  CONSTRAINT `venue_ibfk_1` FOREIGN KEY (`Event_Id`) REFERENCES `event` (`Event_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (5001,'ECE Dept','303'),(5002,'NAB','104'),(5003,'ECE Dept','302'),(5004,'CSE Dept','101'),(5005,'NAB','102'),(5006,'Audi Foyer','000'),(5007,'ME Dept','203');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `winner_teams`
--

DROP TABLE IF EXISTS `winner_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `winner_teams` (
  `Position_Held` int(11) DEFAULT NULL,
  `Prize` varchar(50) DEFAULT NULL,
  `Team_Id` int(11) DEFAULT NULL,
  `Event_Id` int(11) DEFAULT NULL,
  KEY `Event_Id` (`Event_Id`),
  KEY `Team_Id` (`Team_Id`),
  CONSTRAINT `winner_teams_ibfk_1` FOREIGN KEY (`Event_Id`) REFERENCES `event` (`Event_Id`),
  CONSTRAINT `winner_teams_ibfk_2` FOREIGN KEY (`Team_Id`) REFERENCES `team` (`Team_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `winner_teams`
--

LOCK TABLES `winner_teams` WRITE;
/*!40000 ALTER TABLE `winner_teams` DISABLE KEYS */;
INSERT INTO `winner_teams` VALUES (1,'2500',2002,5001),(1,'2500',2003,5002),(1,'2500',2004,5003),(1,'2500',2005,5004),(1,'2500',2006,5005),(1,'2500',2007,5006),(1,'2500',2008,5007),(2,'1500',2009,5007);
/*!40000 ALTER TABLE `winner_teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-28  3:05:17
