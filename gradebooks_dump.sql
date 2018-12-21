-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: gradebooks
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chairs`
--

DROP TABLE IF EXISTS `chairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chairs` (
  `chair_id` int(11) NOT NULL AUTO_INCREMENT,
  `chair_name` varchar(50) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`chair_id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `chairs_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chairs`
--

LOCK TABLES `chairs` WRITE;
/*!40000 ALTER TABLE `chairs` DISABLE KEYS */;
INSERT INTO `chairs` VALUES (1,'Computer Science and Information Systems',1),(2,'finance',2);
/*!40000 ALTER TABLE `chairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faculties` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(50) NOT NULL,
  `faculty_short_name` varchar(10) NOT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
INSERT INTO `faculties` VALUES (1,'Mathematics and Informatics','MaI'),(2,'Economic','E');
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_types`
--

DROP TABLE IF EXISTS `grade_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `grade_types` (
  `grade_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`grade_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_types`
--

LOCK TABLES `grade_types` WRITE;
/*!40000 ALTER TABLE `grade_types` DISABLE KEYS */;
INSERT INTO `grade_types` VALUES (1,'exam'),(2,'credit'),(3,'Coursework');
/*!40000 ALTER TABLE `grade_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebooks`
--

DROP TABLE IF EXISTS `gradebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gradebooks` (
  `gradebook_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`gradebook_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `gradebooks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebooks`
--

LOCK TABLES `gradebooks` WRITE;
/*!40000 ALTER TABLE `gradebooks` DISABLE KEYS */;
INSERT INTO `gradebooks` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8);
/*!40000 ALTER TABLE `gradebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `grades` (
  `gradebook_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `grade_type_id` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  KEY `gradebook_id` (`gradebook_id`),
  KEY `subject_id` (`subject_id`),
  KEY `lecturer_id` (`lecturer_id`),
  KEY `grade_type_id` (`grade_type_id`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`gradebook_id`) REFERENCES `gradebooks` (`gradebook_id`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`lecturer_id`),
  CONSTRAINT `grades_ibfk_4` FOREIGN KEY (`grade_type_id`) REFERENCES `grade_types` (`grade_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,1,1,1,70),(1,2,1,2,75),(1,4,2,3,80),(2,1,1,1,50),(2,2,1,2,80),(2,4,2,3,50),(3,1,1,1,50),(3,2,1,1,80),(3,4,3,3,90),(4,1,1,1,65),(4,2,1,1,66),(4,4,3,3,68),(7,1,1,1,92),(7,2,1,2,93),(7,4,3,3,95),(8,1,1,1,99),(8,2,1,2,98),(8,4,3,3,95);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lecturers` (
  `lecturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecturer_name` varchar(15) NOT NULL,
  `lecturer_surname` varchar(15) NOT NULL,
  `chair_id` int(11) NOT NULL,
  PRIMARY KEY (`lecturer_id`),
  KEY `chair_id` (`chair_id`),
  CONSTRAINT `lecturers_ibfk_1` FOREIGN KEY (`chair_id`) REFERENCES `chairs` (`chair_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (1,'Roman','Zatorsky',1),(2,'Anatoly','Kazmerchuk',2),(3,'Pavel','Vasilishin',1);
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialities`
--

DROP TABLE IF EXISTS `specialities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `specialities` (
  `speciality_id` int(11) NOT NULL AUTO_INCREMENT,
  `speciality_name` varchar(30) NOT NULL,
  `speciality_short_name` varchar(10) NOT NULL,
  `chair_id` int(11) NOT NULL,
  PRIMARY KEY (`speciality_id`),
  KEY `chair_id` (`chair_id`),
  CONSTRAINT `specialities_ibfk_1` FOREIGN KEY (`chair_id`) REFERENCES `chairs` (`chair_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialities`
--

LOCK TABLES `specialities` WRITE;
/*!40000 ALTER TABLE `specialities` DISABLE KEYS */;
INSERT INTO `specialities` VALUES (1,'software engineering','SE',1),(2,'Computer Science','CS',1),(3,'Management','M',2);
/*!40000 ALTER TABLE `specialities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(15) NOT NULL,
  `student_surname` varchar(15) NOT NULL,
  `student_course` int(11) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Taras','Seniv',3),(2,'Rostislav','Masniuk',3),(3,'Vasyl','Polich',3),(4,'Liudmyla','Shevliuk',3),(5,'Rostislav','Ivankiv',2),(6,'Serhii','Hortyuk',2),(7,'Beley','Maria',3),(8,'Grytskiv','Bohdan',3);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentsandspecialities`
--

DROP TABLE IF EXISTS `studentsandspecialities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentsandspecialities` (
  `student_id` int(11) NOT NULL,
  `speciality_id` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `speciality_id` (`speciality_id`),
  CONSTRAINT `studentsandspecialities_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `studentsandspecialities_ibfk_2` FOREIGN KEY (`speciality_id`) REFERENCES `specialities` (`speciality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentsandspecialities`
--

LOCK TABLES `studentsandspecialities` WRITE;
/*!40000 ALTER TABLE `studentsandspecialities` DISABLE KEYS */;
INSERT INTO `studentsandspecialities` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,1),(8,1);
/*!40000 ALTER TABLE `studentsandspecialities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'mathematical analysis'),(2,'laws'),(3,'computer design'),(4,'probability theory');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-21  3:55:42
