-- MySQL dump 10.13  Distrib 5.5.58, for Win64 (AMD64)
--
-- Host: localhost    Database: shoppingsystem
-- ------------------------------------------------------
-- Server version	5.5.58

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

CREATE DATABASE IF NOT EXISTS `malldemo`;

USE `malldemo`; 
--
-- Table structure for table `productinfo`
--

DROP TABLE IF EXISTS `productinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productinfo` (
  `ProductId` varchar(20) NOT NULL,
  `ShopCartId` varchar(20) DEFAULT NULL,
  `ProductTypeId` varchar(20) DEFAULT NULL,
  `OrderId` varchar(20) DEFAULT NULL,
  `ProductName` varchar(200) DEFAULT NULL,
  `ProductPrice` varchar(20) DEFAULT NULL,
  `ProductOutline` varchar(200) DEFAULT NULL,
  `ProductStorage` varchar(20) DEFAULT NULL,
  `ProductPic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `ShopCartId` (`ShopCartId`),
  KEY `ProductTypeId` (`ProductTypeId`),
  KEY `OrderId` (`OrderId`),
  CONSTRAINT `productinfo_ibfk_1` FOREIGN KEY (`ShopCartId`) REFERENCES `shopcart` (`ShopCartId`),
  CONSTRAINT `productinfo_ibfk_2` FOREIGN KEY (`ProductTypeId`) REFERENCES `producttypeinfo` (`ProductTypeId`),
  CONSTRAINT `productinfo_ibfk_3` FOREIGN KEY (`OrderId`) REFERENCES `userorder` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productinfo`
--

LOCK TABLES `productinfo` WRITE;
/*!40000 ALTER TABLE `productinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `productinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttypeinfo`
--

DROP TABLE IF EXISTS `producttypeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producttypeinfo` (
  `ProductTypeId` varchar(20) NOT NULL,
  `ProductTypeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ProductTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttypeinfo`
--

LOCK TABLES `producttypeinfo` WRITE;
/*!40000 ALTER TABLE `producttypeinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `producttypeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiveadd`
--

DROP TABLE IF EXISTS `receiveadd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiveadd` (
  `ReceiveAddId` varchar(20) NOT NULL,
  `UserId` varchar(20) DEFAULT NULL,
  `ReceiveName` varchar(20) DEFAULT NULL,
  `ReceiveAdd` varchar(200) DEFAULT NULL,
  `ReceiveTel` varchar(20) DEFAULT NULL,
  `ReceiveProvince` varchar(20) DEFAULT NULL,
  `ReceiveCity` varchar(20) DEFAULT NULL,
  `ReceivePost` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ReceiveAddId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `receiveadd_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiveadd`
--

LOCK TABLES `receiveadd` WRITE;
/*!40000 ALTER TABLE `receiveadd` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiveadd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart`
--

DROP TABLE IF EXISTS `shopcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopcart` (
  `ShopCartId` varchar(20) NOT NULL,
  `UserId` varchar(20) DEFAULT NULL,
  `ProductTotalPrice` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ShopCartId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart`
--

LOCK TABLES `shopcart` WRITE;
/*!40000 ALTER TABLE `shopcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` varchar(20) NOT NULL,
  `ShopCartId` varchar(20) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `UserPwd` varchar(20) DEFAULT NULL,
  `UserTel` varchar(20) DEFAULT NULL,
  `UserEmail` varchar(20) DEFAULT NULL,
  `UserAddNum` varchar(20) DEFAULT NULL,
  `UserQuestion` varchar(200) DEFAULT NULL,
  `UserAnswer` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userorder`
--

DROP TABLE IF EXISTS `userorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userorder` (
  `OrderId` varchar(20) NOT NULL,
  `ReceiveAddId` varchar(20) DEFAULT NULL,
  `OrderData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OrderTotalPrice` varchar(20) DEFAULT NULL,
  `Ispay` varchar(20) DEFAULT NULL,
  `PayMethod` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `ReceiveAddId` (`ReceiveAddId`),
  CONSTRAINT `userorder_ibfk_1` FOREIGN KEY (`ReceiveAddId`) REFERENCES `receiveadd` (`ReceiveAddId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userorder`
--

LOCK TABLES `userorder` WRITE;
/*!40000 ALTER TABLE `userorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `userorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-15 21:32:35
