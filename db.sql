-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: cnpm
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
  `IsCheckin` tinyint NOT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `TableIDTable` varchar(255) NOT NULL,
  `BookingID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKBookedTabl264506` (`TableIDTable`),
  KEY `FKBookedTabl425481` (`BookingID`),
  CONSTRAINT `FKBookedTabl264506` FOREIGN KEY (`TableIDTable`) REFERENCES `tbltable` (`IDTable`),
  CONSTRAINT `FKBookedTabl425481` FOREIGN KEY (`BookingID`) REFERENCES `tblbooking` (`ID`)
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
  KEY `FKBooking988462` (`ClientIDCard`),
  KEY `FKBooking176015` (`UserID`),
  CONSTRAINT `FKBooking176015` FOREIGN KEY (`UserID`) REFERENCES `tbluser` (`ID`),
  CONSTRAINT `FKBooking988462` FOREIGN KEY (`ClientIDCard`) REFERENCES `tblclient` (`IDCard`)
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
  `Status` varchar(45) NOT NULL,
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDComboDishes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcombodishes`
--

LOCK TABLES `tblcombodishes` WRITE;
/*!40000 ALTER TABLE `tblcombodishes` DISABLE KEYS */;
INSERT INTO `tblcombodishes` VALUES ('COMBO1','Combo tình yêu',550000,0,'Còn hàng',NULL),('COMBO2','Combo mê quá',400000,0,'Còn hàng',NULL);
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
  KEY `FKComboOrder65265` (`BookedTableID`),
  KEY `FKComboOrder183102` (`ComboDishesID`),
  CONSTRAINT `FKComboOrder183102` FOREIGN KEY (`ComboDishesID`) REFERENCES `tblcombodishes` (`IDComboDishes`),
  CONSTRAINT `FKComboOrder65265` FOREIGN KEY (`BookedTableID`) REFERENCES `tblbookedtable` (`ID`)
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
  `ComboDishesID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDDishes`),
  KEY `FKDishes320504` (`ComboDishesID`),
  CONSTRAINT `FKDishes320504` FOREIGN KEY (`ComboDishesID`) REFERENCES `tblcombodishes` (`IDComboDishes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldishes`
--

LOCK TABLES `tbldishes` WRITE;
/*!40000 ALTER TABLE `tbldishes` DISABLE KEYS */;
INSERT INTO `tbldishes` VALUES ('KHOAILC','Khoai lang chiên','Ăn nhẹ','Còn hàng',70000,0,NULL,'COMBO1'),('KHOAITC','Khoai tây chiên','Ăn nhẹ','Còn hàng',70000,0,NULL,NULL),('LAU1','Lẩu thái','Ăn chính','Còn hàng',250000,0,NULL,'COMBO1'),('LAU2','Lẩu chua cay','Ăn chính','Còn hàng',300000,0,NULL,NULL),('MYGATAN1','Mỳ gà tần','Ăn nhẹ','Còn hàng',85000,0,NULL,NULL),('MYTOM1','Mỳ tim cật','Ăn nhẹ','Còn hàng',50000,0,NULL,NULL),('NUOC1','Coca','Đồ uống','Còn hàng',10000,0,NULL,'COMBO1');
/*!40000 ALTER TABLE `tbldishes` ENABLE KEYS */;
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
  KEY `FKDishesOrde151873` (`BookedTableID`),
  KEY `FKDishesOrde751666` (`DishesID`),
  CONSTRAINT `FKDishesOrde151873` FOREIGN KEY (`BookedTableID`) REFERENCES `tblbookedtable` (`ID`),
  CONSTRAINT `FKDishesOrde751666` FOREIGN KEY (`DishesID`) REFERENCES `tbldishes` (`IDDishes`)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrestaurant`
--

LOCK TABLES `tblrestaurant` WRITE;
/*!40000 ALTER TABLE `tblrestaurant` DISABLE KEYS */;
INSERT INTO `tblrestaurant` VALUES (1,'Mai An',3,'Hà Nội',NULL),(2,'Hòa Lạc',4,'Hồ Chí Minh',NULL);
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
  KEY `FKTable233910` (`RestaurantID`),
  CONSTRAINT `FKTable233910` FOREIGN KEY (`RestaurantID`) REFERENCES `tblrestaurant` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltable`
--

LOCK TABLES `tbltable` WRITE;
/*!40000 ALTER TABLE `tbltable` DISABLE KEYS */;
INSERT INTO `tbltable` VALUES ('BC1','VIP','Còn bàn',NULL,1),('TN1','Thường','Còn bàn',NULL,1),('TN2','VIP','Hết bàn',NULL,1),('TN3','VIP','Còn bàn',NULL,1),('TN4','Thường','Hết bàn',NULL,1),('TN5','VIP','Còn bàn',NULL,1);
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

-- Dump completed on 2022-11-29 22:42:21
