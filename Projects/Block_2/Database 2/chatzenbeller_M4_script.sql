-- LinkedIn Database Create Script
-- Developed by Courtland Hatzenbeller
-- Version 1.0
-- Modified Date: 09/22/2024
DROP DATABASE IF EXISTS `LinkedIn`;
CREATE DATABASE IF NOT EXISTS `LinkedIn`;
USE `LinkedIn`;

CREATE TABLE `Users` (
	`userID` int unsigned NOT NULL AUTO_INCREMENT,
	`firstName` varchar(30) DEFAULT NULL,
	`lastName` varchar(30) DEFAULT NULL,
	`pronouns` varchar(30) DEFAULT 'Prefer not to say', 
	`email` varchar(255) DEFAULT NULL,
	`location` varchar(255) DEFAULT NULL,
	`headline` varchar(255) DEFAULT NULL,
	`website` varchar(255) DEFAULT NULL,
	PRIMARY KEY(`userID`)
);

CREATE TABLE `School` (
	`schoolID` int unsigned NOT NULL AUTO_INCREMENT,
	`schoolName` varchar(255) DEFAULT NULL,
	`location` varchar(255) DEFAULT NULL,
	`website` varchar(255) DEFAULT NULL,
	PRIMARY KEY(`schoolID`)
);

CREATE TABLE `UserEducation` (
	`educationID` int unsigned NOT NULL AUTO_INCREMENT,
	`degree` varchar(60) DEFAULT NULL,
	`fieldOfStudy` varchar(255) DEFAULT NULL,
	`startDate` date DEFAULT NULL,
	`endDate` date DEFAULT NULL,
	`userID` int unsigned NOT NULL,
	`schoolID` int unsigned NOT NULL,
	PRIMARY KEY(educationID),
	FOREIGN KEY(userID) REFERENCES Users(userID),
	FOREIGN KEY(schoolID) REFERENCES School(schoolID)
);

CREATE TABLE `Company` (
	`companyID` int unsigned NOT NULL AUTO_INCREMENT,
	`companyName` varchar(255) DEFAULT NULL,
	`industry` varchar(60) DEFAULT NULL,
	`companySize` int unsigned DEFAULT NULL,
	`location` varchar(255) DEFAULT NULL,
	`website` varchar(255) DEFAULT NULL,
	PRIMARY KEY(`companyID`)
);

CREATE TABLE `UserJobExperience` (
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
	PRIMARY KEY(`experienceID`),
	FOREIGN KEY(`userID`) REFERENCES Users(userID),
	FOREIGN KEY(`companyID`) REFERENCES Company(companyID)
);

CREATE TABLE `JobPosting` (
	`postID` int unsigned NOT NULL AUTO_INCREMENT,
	`title` varchar(60) DEFAULT NULL,
	`postDescription` varchar(255) DEFAULT NULL,
	`location` varchar(255) DEFAULT NULL,
	`locationType` varchar(30) DEFAULT NULL,
	`employmentType` varchar(30) DEFAULT NULL,
	`requirements` varchar(255) DEFAULT NULL,
	`companyID` int unsigned NOT NULL,
	PRIMARY KEY(`postID`),
	FOREIGN KEY(`companyID`) REFERENCES Company(companyID)
);

CREATE TABLE `Skills` (
	`skillID` int unsigned NOT NULL AUTO_INCREMENT,
	`skillName` varchar(60) DEFAULT NULL,
	`skillDescription` varchar(255) DEFAULT NULL,
	PRIMARY KEY(`skillID`)
);

CREATE TABLE `JobSkills` (
	`jobSkillID` int unsigned NOT NULL AUTO_INCREMENT,
	`skillID` int unsigned NOT NULL,
	`postID` int unsigned NOT NULL,
	PRIMARY KEY(`jobSkillID`),
	FOREIGN KEY(`skillID`) REFERENCES Skills(skillID),
	FOREIGN KEY(`postID`) REFERENCES JobPosting(postID)
);

CREATE TABLE `UserSkills` (
	`userSkillID` int unsigned NOT NULL AUTO_INCREMENT,
	`skillID` int unsigned NOT NULL,
	`userID` int unsigned NOT NULL,
	PRIMARY KEY(`userSkillID`),
	FOREIGN KEY(`skillID`) REFERENCES Skills(skillID),
	FOREIGN KEY(`userID`) REFERENCES Users(userID)
);