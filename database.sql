-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: MyDb
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `BookId` int(11) NOT NULL AUTO_INCREMENT,
  `BookName` varchar(45) DEFAULT NULL,
  `Author` varchar(45) DEFAULT NULL,
  `Summary` varchar(45) DEFAULT NULL,
  `UpLoadAdminId` int(11) DEFAULT NULL,
  `UpLoadDate` datetime DEFAULT NULL,
  `IsBorrow` int(11) DEFAULT '0',
  `Cover` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BookId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (1,'书籍1','作者1','书籍1的简介',4,'2017-04-27 14:37:57',0,'55222335.png'),(2,'书籍2','作者2','书籍2的简介',4,'2017-04-27 14:38:14',0,'77788225.jpg'),(3,'书籍3','作者3','书籍3的简介',4,'2017-04-27 14:38:21',0,'666888755.png'),(4,'书籍4','作者4','书籍4的简介',4,'2017-04-27 14:38:28',0,'1111444555.jpg'),(5,'书籍5','作者5','书籍5的简介',7,'2017-04-27 14:38:44',0,'2333669877.png'),(6,'书籍6','作者6','书籍6的简介',7,'2017-04-27 14:39:03',0,'2555222222.jpg'),(7,'书籍7','作者7','书籍7的简介',7,'2017-04-27 14:39:10',0,'55222335.png');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BorrowInfo`
--

DROP TABLE IF EXISTS `BorrowInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BorrowInfo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BookId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `BorrowDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BorrowInfo`
--

LOCK TABLES `BorrowInfo` WRITE;
/*!40000 ALTER TABLE `BorrowInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `BorrowInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `New`
--

DROP TABLE IF EXISTS `New`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `New` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `New`
--

LOCK TABLES `New` WRITE;
/*!40000 ALTER TABLE `New` DISABLE KEYS */;
INSERT INTO `New` VALUES (1,'哈哈'),(2,'哈哈');
/*!40000 ALTER TABLE `New` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Sal` int(11) DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  `Age` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher`
--

LOCK TABLES `Teacher` WRITE;
/*!40000 ALTER TABLE `Teacher` DISABLE KEYS */;
INSERT INTO `Teacher` VALUES (2,'老老王',4200,'男','44'),(3,'小赵',3500,'女','30'),(4,'小李',3700,'女','25'),(5,'老黄',4500,'男','39'),(7,'老马',4200,'男','33');
/*!40000 ALTER TABLE `Teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) DEFAULT NULL,
  `Account` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `IsAdmin` int(11) DEFAULT '0',
  `IsLogin` int(11) DEFAULT '0',
  `Icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (2,'李四','123','123','2017-04-21 10:46:07',0,1,'20170502045733901418.jpg'),(3,'张三','321','321','2017-04-21 11:21:56',0,0,NULL),(4,'管理员','110','110','2017-04-21 13:43:01',1,1,NULL),(5,'haha','111','111','2017-04-24 16:26:24',0,0,NULL),(6,NULL,'1111','1111','2017-04-24 16:27:27',0,0,NULL),(7,'哈哈','11111','11111','2017-04-24 16:30:12',1,0,NULL),(8,'我','asd','asd','2017-04-28 15:52:35',0,1,NULL),(9,'哈哈hhh','111111','11111','2017-05-10 09:20:46',0,0,NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'MyDb'
--

--
-- Dumping routines for database 'MyDb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-27 15:49:20
