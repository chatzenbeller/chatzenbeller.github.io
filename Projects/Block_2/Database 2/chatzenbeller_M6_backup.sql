-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: linkedin
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyID` int unsigned NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) DEFAULT NULL,
  `industry` varchar(60) DEFAULT NULL,
  `companySize` int unsigned DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'RiverTech Solutions','Information Technology',100,'Eau Claire, WI',NULL),(2,'ClearWater Brewery Co.','Beverage Manufacturing',50,'Eau Claire, WI','www.clearwaterbrewery.com'),(3,'Chippewa Valley Logistics','Transportation and Logistics',250,'Eau Claire, WI; Minneapolis, MN','www.chippewavalleylogistics.com'),(4,'BrightMind Media','Digital Marketing',25,'Eau Claire, WI',NULL),(5,'Pine Grove Pharmaceuticals','Pharaceuticals',500,'Madison, WI; Milwaukee, WI','www.pinegrovepharma.com'),(6,'Northern Green Energy','Renewable Energy',250,'Chicago, IL; Des Moines, IA','www.northerngreenenergy.com'),(7,'Metro Solutions Group','Business Consulting',100,'Minneapolis, MN; St Paul, MN',NULL),(8,'EverBright Interiors','Interior Design',25,'Denver, CO; Boulder, CO','www.everbrightinteriors.com');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobposting`
--

DROP TABLE IF EXISTS `jobposting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobposting` (
  `postID` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `postDescription` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `locationType` varchar(30) DEFAULT NULL,
  `employmentType` varchar(30) DEFAULT NULL,
  `requirements` varchar(255) DEFAULT NULL,
  `companyID` int unsigned NOT NULL,
  PRIMARY KEY (`postID`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `jobposting_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobposting`
--

LOCK TABLES `jobposting` WRITE;
/*!40000 ALTER TABLE `jobposting` DISABLE KEYS */;
INSERT INTO `jobposting` VALUES (1,'Junior IT Support Specialist','RiverTech Solutions is seeking a Junior IT Support Specialist to assist with troubleshooting, hardware and software support, and maintaining internal IT systems.','Eau Claire, WI','On-Site','Full-Time','Associate\'s degree in Information Technology or related field',1),(2,'Marketing Internship','BrightMind Media is offering a Marketing Internship for students or recent graduates looking to gain hands-on experience in digital marketing.','Eau Claire, WI','Remote','Internship','Enrolled or recently graduated in a Marketing or related degree program.',4);
/*!40000 ALTER TABLE `jobposting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobskills`
--

DROP TABLE IF EXISTS `jobskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobskills` (
  `jobSkillID` int unsigned NOT NULL AUTO_INCREMENT,
  `skillID` int unsigned NOT NULL,
  `postID` int unsigned NOT NULL,
  PRIMARY KEY (`jobSkillID`),
  KEY `skillID` (`skillID`),
  KEY `postID` (`postID`),
  CONSTRAINT `jobskills_ibfk_1` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`),
  CONSTRAINT `jobskills_ibfk_2` FOREIGN KEY (`postID`) REFERENCES `jobposting` (`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobskills`
--

LOCK TABLES `jobskills` WRITE;
/*!40000 ALTER TABLE `jobskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `schoolID` int unsigned NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`schoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skillID` int unsigned NOT NULL AUTO_INCREMENT,
  `skillName` varchar(60) DEFAULT NULL,
  `skillDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`skillID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Python Programming','Ability to write scripts and applications using Python.'),(2,'Data Analysis','Skilled in interpreting and analyzing complex datasets.'),(3,'Project Management','Proficient in managing and delivering projects on time.'),(4,'Cloud Computing','Experience with cloud platforms such as AWS, Azure, or GCP.'),(5,'Digital Marketing','Knowledgeable in SEO, social media marketing, and content creation.'),(6,'Graphic Design','Skilled in designing graphics using tools like Adobe Illustrator and Photoshop.'),(7,'Web Development','Ability to build and maintain websites using HTML, CSS, JavaScript, and frameworks.'),(8,'Public Speaking','Strong communication and presentation skills in front of large audiences.'),(9,'Network Security','Expert in protecting networks from unauthorized access and threats.'),(10,'SQL Database Management','Experience with database management and query optimization using SQL.'),(11,'Video Editing','Skilled in video editing software such as Adobe Premiere and Final Cut Pro.'),(12,'Customer Service','Proficient in handling customer inquiries and providing solutions.'),(13,'Leadership','Ability to lead teams and motivate members towards achieving goals.'),(14,'Machine Learning','Experience in developing and deploying machine learning models.'),(15,'Content Writing','Skilled in writing clear, concise, and engaging content for blogs, websites, and more.');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usereducation`
--

DROP TABLE IF EXISTS `usereducation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usereducation` (
  `educationID` int unsigned NOT NULL AUTO_INCREMENT,
  `degree` varchar(60) DEFAULT NULL,
  `fieldOfStudy` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `userID` int unsigned NOT NULL,
  `schoolID` int unsigned NOT NULL,
  PRIMARY KEY (`educationID`),
  KEY `userID` (`userID`),
  KEY `schoolID` (`schoolID`),
  CONSTRAINT `usereducation_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `usereducation_ibfk_2` FOREIGN KEY (`schoolID`) REFERENCES `school` (`schoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usereducation`
--

LOCK TABLES `usereducation` WRITE;
/*!40000 ALTER TABLE `usereducation` DISABLE KEYS */;
/*!40000 ALTER TABLE `usereducation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userjobexperience`
--

DROP TABLE IF EXISTS `userjobexperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userjobexperience` (
  `experienceID` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `expDescription` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `locationType` varchar(30) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `employmentStatus` varchar(30) DEFAULT NULL,
  `userID` int unsigned NOT NULL,
  `companyID` int unsigned NOT NULL,
  PRIMARY KEY (`experienceID`),
  KEY `userID` (`userID`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `userjobexperience_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `userjobexperience_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userjobexperience`
--

LOCK TABLES `userjobexperience` WRITE;
/*!40000 ALTER TABLE `userjobexperience` DISABLE KEYS */;
/*!40000 ALTER TABLE `userjobexperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `pronouns` varchar(30) DEFAULT 'Prefer not to say',
  `email` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ashley','Thompson','She/Her','ashthompson@example.com','1240 Elmwood, Rochester, NY 14620','Registered Nurse',NULL),(2,'Jordan','Ramirez',NULL,'jordan.rem@example.com','56 Westwood Drive, Austin, TX 78745','Software Developer','www.jordanrem.dev'),(3,'Christopher','Nguyen','He/Him','nguyenchris@example.com','985 Maple Street, San Fransisco, CA 94107','Data Analyst',NULL),(4,'Sarah','Patel','She/They','sarah.patel@example.com','2339 Cresent Lane, Orlando, FL 32801','Medical Student','www.linkedin.com/in/sarah-patel-880008c152'),(5,'Alex','Johnson',NULL,'alex.john.des@example.com','417 Oakridge Boulevard, Denver, CO 80203','Graphic Designer','www.alexj-graphicdesigns.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userskills`
--

DROP TABLE IF EXISTS `userskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userskills` (
  `userSkillID` int unsigned NOT NULL AUTO_INCREMENT,
  `skillID` int unsigned NOT NULL,
  `userID` int unsigned NOT NULL,
  PRIMARY KEY (`userSkillID`),
  KEY `userID` (`userID`),
  KEY `userskills_ibfk_1` (`skillID`),
  CONSTRAINT `userskills_ibfk_1` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userskills_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userskills`
--

LOCK TABLES `userskills` WRITE;
/*!40000 ALTER TABLE `userskills` DISABLE KEYS */;
INSERT INTO `userskills` VALUES (1,1,1),(2,10,2),(3,15,3),(4,13,4),(5,4,5);
/*!40000 ALTER TABLE `userskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'linkedin'
--
/*!50003 DROP PROCEDURE IF EXISTS `GenData_Skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenData_Skills`()
BEGIN

DELETE FROM skills;

ALTER TABLE skills AUTO_INCREMENT = 1;

INSERT INTO `skills` (skillName, SkillDescription) 
VALUES ('Python Programming', 'Ability to write scripts and applications using Python.'),
('Data Analysis', 'Skilled in interpreting and analyzing complex datasets.'),
('Project Management', 'Proficient in managing and delivering projects on time.'),
('Cloud Computing', 'Experience with cloud platforms such as AWS, Azure, or GCP.'),
('Digital Marketing', 'Knowledgeable in SEO, social media marketing, and content creation.'),
('Graphic Design', 'Skilled in designing graphics using tools like Adobe Illustrator and Photoshop.'),
('Web Development', 'Ability to build and maintain websites using HTML, CSS, JavaScript, and frameworks.'),
('Public Speaking', 'Strong communication and presentation skills in front of large audiences.'),
('Network Security', 'Expert in protecting networks from unauthorized access and threats.'),
('SQL Database Management', 'Experience with database management and query optimization using SQL.'),
('Video Editing', 'Skilled in video editing software such as Adobe Premiere and Final Cut Pro.'),
('Customer Service', 'Proficient in handling customer inquiries and providing solutions.'),
('Leadership', 'Ability to lead teams and motivate members towards achieving goals.'),
('Machine Learning', 'Experience in developing and deploying machine learning models.'),
('Content Writing', 'Skilled in writing clear, concise, and engaging content for blogs, websites, and more.');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenData_UserSkills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenData_UserSkills`()
BEGIN

DECLARE vUserID INTEGER;
DECLARE vSkillID INTEGER;
DECLARE endOfList BOOLEAN DEFAULT FALSE;

DECLARE UserCursor CURSOR FOR
SELECT UserID FROM `users`;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET endOfList = TRUE;

TRUNCATE `userskills`;

OPEN UserCursor;

userRead: LOOP
	FETCH UserCursor INTO vUserID;
		IF endOfList = TRUE THEN
			LEAVE userRead;
		END IF;
        
	SET vSkillID = 1 + Floor(Rand() * 15); 
    
    INSERT INTO `userskills` (userID, skillID) VALUES (vUserID, vSkillID); 
END LOOP userRead;

CLOSE UserCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-06 19:47:11
