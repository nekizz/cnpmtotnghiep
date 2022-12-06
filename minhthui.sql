-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cnpm
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `tblbookedtable`
--

DROP TABLE IF EXISTS `tblbookedtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbookedtable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IsCheckin` varchar(255) NOT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `TableIDTable` varchar(255) NOT NULL,
  `BookingID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKtblBookedT650497` (`TableIDTable`),
  KEY `FKtblBookedT971869` (`BookingID`),
  CONSTRAINT `FKtblBookedT650497` FOREIGN KEY (`TableIDTable`) REFERENCES `tbltable` (`IDTable`),
  CONSTRAINT `FKtblBookedT971869` FOREIGN KEY (`BookingID`) REFERENCES `tblbooking` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbookedtable`
--

LOCK TABLES `tblbookedtable` WRITE;
/*!40000 ALTER TABLE `tblbookedtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbookedtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbooking`
--

DROP TABLE IF EXISTS `tblbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbooking` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BookDay` date NOT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `ClientIDCard` varchar(255) NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKtblBooking148863` (`ClientIDCard`),
  KEY `FKtblBooking220575` (`UserID`),
  CONSTRAINT `FKtblBooking148863` FOREIGN KEY (`ClientIDCard`) REFERENCES `tblclient` (`IDCard`),
  CONSTRAINT `FKtblBooking220575` FOREIGN KEY (`UserID`) REFERENCES `tbluser` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbooking`
--

LOCK TABLES `tblbooking` WRITE;
/*!40000 ALTER TABLE `tblbooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclient`
--

DROP TABLE IF EXISTS `tblclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblclient` (
  `IDCard` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDCard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclient`
--

LOCK TABLES `tblclient` WRITE;
/*!40000 ALTER TABLE `tblclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcombodishes`
--

DROP TABLE IF EXISTS `tblcombodishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcombodishes` (
  `IDComboDishes` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` float NOT NULL,
  `Discount` float NOT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDComboDishes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcombodishes`
--

LOCK TABLES `tblcombodishes` WRITE;
/*!40000 ALTER TABLE `tblcombodishes` DISABLE KEYS */;
INSERT INTO `tblcombodishes` VALUES ('COMBO1','Combo tình yêu',100000,0,'Còn hàng',NULL),('COMBO2','Combo thất tình',20000,0,'Còn hàng',NULL);
/*!40000 ALTER TABLE `tblcombodishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcomboordered`
--

DROP TABLE IF EXISTS `tblcomboordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcomboordered` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Price` float NOT NULL,
  `Discount` float NOT NULL,
  `Quantity` int NOT NULL,
  `TotalAmount` float NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `BookedTableID` int NOT NULL,
  `ComboDishesID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKtblComboOr446861` (`BookedTableID`),
  KEY `FKtblComboOr642566` (`ComboDishesID`),
  CONSTRAINT `FKtblComboOr446861` FOREIGN KEY (`BookedTableID`) REFERENCES `tblbookedtable` (`ID`),
  CONSTRAINT `FKtblComboOr642566` FOREIGN KEY (`ComboDishesID`) REFERENCES `tblcombodishes` (`IDComboDishes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcomboordered`
--

LOCK TABLES `tblcomboordered` WRITE;
/*!40000 ALTER TABLE `tblcomboordered` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcomboordered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldishes`
--

DROP TABLE IF EXISTS `tbldishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldishes` (
  `IDDishes` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Price` float NOT NULL,
  `Discount` float NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDDishes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldishes`
--

LOCK TABLES `tbldishes` WRITE;
/*!40000 ALTER TABLE `tbldishes` DISABLE KEYS */;
INSERT INTO `tbldishes` VALUES ('COCA1','Nước uống coca','Đồ uống','Còn hàng',10000,0,NULL),('KHOAILC','Khoai lang chiên','Ăn nhẹ','Còn hàng',80000,0,NULL),('KHOAITC','Khoai tây chiên','Ăn nhẹ','Còn hàng',70000,0,NULL),('LAUTHAI','Lẩu thái','Ăn chính','Còn hàng',300000,0,NULL);
/*!40000 ALTER TABLE `tbldishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldishescombo`
--

DROP TABLE IF EXISTS `tbldishescombo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldishescombo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDComboDishes` varchar(255) NOT NULL,
  `IDDishes` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKtblDishesC853651` (`IDComboDishes`),
  KEY `FKtblDishesC491741` (`IDDishes`),
  CONSTRAINT `FKtblDishesC491741` FOREIGN KEY (`IDDishes`) REFERENCES `tbldishes` (`IDDishes`),
  CONSTRAINT `FKtblDishesC853651` FOREIGN KEY (`IDComboDishes`) REFERENCES `tblcombodishes` (`IDComboDishes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldishescombo`
--

LOCK TABLES `tbldishescombo` WRITE;
/*!40000 ALTER TABLE `tbldishescombo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldishescombo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldishesordered`
--

DROP TABLE IF EXISTS `tbldishesordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldishesordered` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Price` float NOT NULL,
  `Discount` float NOT NULL,
  `Quantity` int NOT NULL,
  `TotalAmount` float NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `BookedTableID` int NOT NULL,
  `DishesID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKtblDishesO723631` (`BookedTableID`),
  KEY `FKtblDishesO190258` (`DishesID`),
  CONSTRAINT `FKtblDishesO190258` FOREIGN KEY (`DishesID`) REFERENCES `tbldishes` (`IDDishes`),
  CONSTRAINT `FKtblDishesO723631` FOREIGN KEY (`BookedTableID`) REFERENCES `tblbookedtable` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldishesordered`
--

LOCK TABLES `tbldishesordered` WRITE;
/*!40000 ALTER TABLE `tbldishesordered` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldishesordered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrestaurant`
--

DROP TABLE IF EXISTS `tblrestaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblrestaurant` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `StarLevel` int NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrestaurant`
--

LOCK TABLES `tblrestaurant` WRITE;
/*!40000 ALTER TABLE `tblrestaurant` DISABLE KEYS */;
INSERT INTO `tblrestaurant` VALUES (1,'Malina',3,'Hà Nội',NULL);
/*!40000 ALTER TABLE `tblrestaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltable`
--

DROP TABLE IF EXISTS `tbltable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbltable` (
  `IDTable` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `RestaurantID` int NOT NULL,
  PRIMARY KEY (`IDTable`),
  KEY `FKtblTable244605` (`RestaurantID`),
  CONSTRAINT `FKtblTable244605` FOREIGN KEY (`RestaurantID`) REFERENCES `tblrestaurant` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltable`
--

LOCK TABLES `tbltable` WRITE;
/*!40000 ALTER TABLE `tbltable` DISABLE KEYS */;
INSERT INTO `tbltable` VALUES ('BC1','Thường','Còn bàn',NULL,1),('BC2','Thường ','Còn bàn',NULL,1),('BC3','VIP','Còn bàn','',1),('TN1','VIP','Còn bàn',NULL,1),('TN2','VIP','Còn bàn','',1);
/*!40000 ALTER TABLE `tbltable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbluser` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-06 17:41:57
