-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: malldemo
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `carousel`
--

DROP TABLE IF EXISTS `carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ProductId` (`ProductId`),
  CONSTRAINT `carousel_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `productinfo` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carousel`
--

LOCK TABLES `carousel` WRITE;
/*!40000 ALTER TABLE `carousel` DISABLE KEYS */;
INSERT INTO `carousel` VALUES (2,3);
/*!40000 ALTER TABLE `carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cate`
--

DROP TABLE IF EXISTS `cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cate` (
  `row` int(10) unsigned NOT NULL,
  `ProductTypeId` int(20) unsigned NOT NULL,
  KEY `ProductTypeId` (`ProductTypeId`),
  CONSTRAINT `cate_ibfk_1` FOREIGN KEY (`ProductTypeId`) REFERENCES `producttypeinfo` (`ProductTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cate`
--

LOCK TABLES `cate` WRITE;
/*!40000 ALTER TABLE `cate` DISABLE KEYS */;
INSERT INTO `cate` VALUES (1,10),(1,30);
/*!40000 ALTER TABLE `cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FloorId` int(10) unsigned NOT NULL,
  `ClassId` int(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ClassId` (`ClassId`),
  CONSTRAINT `floor_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `productclass` (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productclass`
--

DROP TABLE IF EXISTS `productclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productclass` (
  `ClassId` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(50) NOT NULL,
  PRIMARY KEY (`ClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productclass`
--

LOCK TABLES `productclass` WRITE;
/*!40000 ALTER TABLE `productclass` DISABLE KEYS */;
INSERT INTO `productclass` VALUES (2,'家用电器'),(3,'数码3C'),(4,'服装箱包'),(5,'食品生鲜'),(6,'酒水饮料'),(7,'生活家居'),(8,'体育运动'),(9,'汽车'),(10,'图书音像'),(11,'钟表珠宝'),(12,'母婴儿童'),(13,'卫生健康');
/*!40000 ALTER TABLE `productclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productinfo`
--

DROP TABLE IF EXISTS `productinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productinfo` (
  `ProductId` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `ProductTypeId` int(20) unsigned DEFAULT NULL,
  `ProductName` varchar(200) DEFAULT NULL,
  `ProductPrice` varchar(20) DEFAULT NULL,
  `ProductOutline` varchar(200) DEFAULT NULL,
  `ProductStorage` varchar(20) DEFAULT NULL,
  `ProductPic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `productinfo_ibfk_2` (`ProductTypeId`),
  CONSTRAINT `productinfo_ibfk_1` FOREIGN KEY (`ProductTypeId`) REFERENCES `producttypeinfo` (`ProductTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productinfo`
--

LOCK TABLES `productinfo` WRITE;
/*!40000 ALTER TABLE `productinfo` DISABLE KEYS */;
INSERT INTO `productinfo` VALUES (3,10,'小米6','2499','好用','555',NULL),(4,11,'iPad Air 2','3399','9.7英寸','1223',NULL),(5,10,'小米5','1399','【课设使用】小米5','321',NULL),(6,37,'测试商品风景','10','山','10',NULL),(7,40,'测试商品','20','桥','10',NULL),(9,32,'2','2','2','22',NULL),(11,5,'Hisense高清电视','4399','55寸大电视','232','/static/img/product/86A5HH_POkTyG2XDiVApq_pv.jpg'),(12,29,'test','1444','修改','3333','/static/img/product/5zgN14ZcxFZAsJv3isq7d9J8.jpg');
/*!40000 ALTER TABLE `productinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttypeinfo`
--

DROP TABLE IF EXISTS `producttypeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producttypeinfo` (
  `ProductTypeId` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `ProductTypeName` varchar(20) DEFAULT NULL,
  `ClassId` int(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ProductTypeId`),
  KEY `FK_ID` (`ClassId`),
  CONSTRAINT `FK_ID` FOREIGN KEY (`ClassId`) REFERENCES `productclass` (`ClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttypeinfo`
--

LOCK TABLES `producttypeinfo` WRITE;
/*!40000 ALTER TABLE `producttypeinfo` DISABLE KEYS */;
INSERT INTO `producttypeinfo` VALUES (4,'冰箱',2),(5,'高清电视',2),(6,'洗衣机',2),(7,'空调',2),(8,'电热水器',2),(9,'笔记本',3),(10,'手机',3),(11,'平板电脑',3),(12,'数码相机',3),(13,'相关配件',3),(14,'女装',4),(15,'帽子专区',4),(16,'旅行箱',4),(17,'手提包',4),(18,'保暖内衣',4),(19,'最爱零食',5),(20,'生鲜',5),(21,'半成品菜',5),(22,'速冻专区',5),(23,'进口食品',5),(24,'白酒',6),(25,'红酒',6),(26,'饮料',6),(27,'调制鸡尾酒',6),(28,'进口洋酒',6),(29,'电视',2),(30,'数码',3),(31,'办公配件',3),(32,'家具',7),(33,'家居',7),(34,'家装',7),(35,NULL,2),(36,'运动户外',8),(37,'足球',8),(38,'汽车生活',9),(39,'二手车',9),(40,'图书',10),(41,'音像',10),(42,'电子书',10),(43,NULL,4),(44,'钟表',11),(45,'珠宝',11),(46,'母婴',12),(47,'玩具',12),(48,'童装童鞋',12),(49,'个护化妆',13),(50,'清洁',13),(51,'纸品',13);
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
INSERT INTO `receiveadd` VALUES ('1514356386529','1514182549133','小头爸爸','华中科技大学','12345678910','湖北','武汉','100000'),('1514437178483','1514437075075','电信1502','华中科技大学韵苑学生公寓23栋','15927501234','湖北','武汉','430074'),('1514466821242','1514182549133','电信1502','华中科技大学','1599999999','湖北','武汉','100000');
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
INSERT INTO `shopcart` VALUES ('1514180894204','1514180894204',NULL),('1514182549133','1514182549133',NULL),('1514437075075','1514437075075',NULL);
/*!40000 ALTER TABLE `shopcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart_productinfo`
--

DROP TABLE IF EXISTS `shopcart_productinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopcart_productinfo` (
  `shopcartid` varchar(20) NOT NULL,
  `productid` int(20) unsigned NOT NULL,
  `count` int(20) unsigned NOT NULL,
  PRIMARY KEY (`shopcartid`,`productid`),
  KEY `shopcart_productinfo1` (`productid`),
  CONSTRAINT `shopcart_productinfo1` FOREIGN KEY (`productid`) REFERENCES `productinfo` (`ProductId`),
  CONSTRAINT `shopcart_productinfo2` FOREIGN KEY (`shopcartid`) REFERENCES `shopcart` (`ShopCartId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart_productinfo`
--

LOCK TABLES `shopcart_productinfo` WRITE;
/*!40000 ALTER TABLE `shopcart_productinfo` DISABLE KEYS */;
INSERT INTO `shopcart_productinfo` VALUES ('1514180894204',3,1);
/*!40000 ALTER TABLE `shopcart_productinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` varchar(20) NOT NULL,
  `shopcartid` varchar(20) DEFAULT NULL,
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
INSERT INTO `user` VALUES ('1513774051868',NULL,'123','12','12','12',NULL,NULL,NULL),('1514098900188',NULL,'hust','hust','123','123',NULL,NULL,NULL),('1514180894204',NULL,'test','test','111','111',NULL,NULL,NULL),('1514182549133','1514182549133','ttt','ttt','111','111',NULL,NULL,NULL),('1514437075075','1514437075075','huster','huster','15927506875','564144319@qq.com',NULL,NULL,NULL);
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
  `OrderTime` datetime DEFAULT NULL,
  `OrderTotalPrice` varchar(20) DEFAULT NULL,
  `Ispay` varchar(20) DEFAULT NULL,
  `PayMethod` varchar(20) DEFAULT NULL,
  `OrderData` varchar(200) DEFAULT NULL,
  `UserId` varchar(20) NOT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `ReceiveAddId` (`ReceiveAddId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `userorder_ibfk_1` FOREIGN KEY (`ReceiveAddId`) REFERENCES `receiveadd` (`ReceiveAddId`),
  CONSTRAINT `userorder_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userorder`
--

LOCK TABLES `userorder` WRITE;
/*!40000 ALTER TABLE `userorder` DISABLE KEYS */;
INSERT INTO `userorder` VALUES ('1514379300316','1514356386529','2017-12-27 20:55:00','3898','已发货',NULL,NULL,'1514182549133'),('1514380918190','1514356386529','2017-12-27 21:21:58','7796','已发货',NULL,NULL,'1514182549133'),('1514437196478','1514437178483','2017-12-28 12:59:56','4197','已发货','在线支付',NULL,'1514437075075'),('1514459783680','1514356386529','2017-12-28 19:16:23','15696','已发货','在线支付',NULL,'1514182549133'),('1514466832008','1514466821242','2017-12-28 21:13:52','16594','已发货','在线支付',NULL,'1514182549133');
/*!40000 ALTER TABLE `userorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userorder_productinfo`
--

DROP TABLE IF EXISTS `userorder_productinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userorder_productinfo` (
  `orderid` varchar(20) NOT NULL,
  `productid` int(20) unsigned NOT NULL,
  `count` int(20) unsigned NOT NULL,
  PRIMARY KEY (`orderid`,`productid`),
  KEY `userorder_productinfo2` (`productid`),
  CONSTRAINT `userorder_productinfo1` FOREIGN KEY (`orderid`) REFERENCES `userorder` (`OrderId`),
  CONSTRAINT `userorder_productinfo2` FOREIGN KEY (`productid`) REFERENCES `productinfo` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userorder_productinfo`
--

LOCK TABLES `userorder_productinfo` WRITE;
/*!40000 ALTER TABLE `userorder_productinfo` DISABLE KEYS */;
INSERT INTO `userorder_productinfo` VALUES ('1514379300316',3,1),('1514379300316',5,1),('1514380918190',3,2),('1514380918190',5,2),('1514437196478',5,3),('1514459783680',3,1),('1514459783680',11,3),('1514466832008',3,2),('1514466832008',5,2),('1514466832008',11,2);
/*!40000 ALTER TABLE `userorder_productinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-29  8:16:41
