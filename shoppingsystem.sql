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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carousel`
--

LOCK TABLES `carousel` WRITE;
/*!40000 ALTER TABLE `carousel` DISABLE KEYS */;
INSERT INTO `carousel` VALUES (8,23),(7,37),(6,55);
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
INSERT INTO `cate` VALUES (1,10),(1,30),(2,11),(2,31),(3,5),(3,7),(3,4),(3,6),(4,23),(4,20),(5,33),(5,32),(5,34),(6,49),(6,50),(6,51),(7,46),(7,47),(7,48),(9,36),(9,37),(9,38),(10,40),(10,41),(10,42),(8,44),(8,45);
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
  `IsOnSale` varchar(20) DEFAULT NULL,
  `ProductPicOutline` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `productinfo_ibfk_2` (`ProductTypeId`),
  CONSTRAINT `productinfo_ibfk_1` FOREIGN KEY (`ProductTypeId`) REFERENCES `producttypeinfo` (`ProductTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productinfo`
--

LOCK TABLES `productinfo` WRITE;
/*!40000 ALTER TABLE `productinfo` DISABLE KEYS */;
INSERT INTO `productinfo` VALUES (3,10,'小米6','2499','好用','555',NULL,NULL,NULL),(4,11,'iPad Air 2','3399','9.7英寸','1223',NULL,NULL,NULL),(5,10,'小米5','1399','【课设使用】小米5','321',NULL,NULL,NULL),(11,5,'Hisense高清电视','4399','55寸大电视','232','/static/img/product/86A5HH_POkTyG2XDiVApq_pv.jpg',NULL,NULL),(13,4,'海尔冰箱','4799','Haier/海尔 十字对开变频静音节能干湿分储电冰箱','366','/static/img/product/kziUG53D6IpMO688efzXNEoM.png',NULL,NULL),(14,4,'美的冰箱','749','Midea/美的 单门冷藏电冰箱节能小冰箱小巧节能 ','290','/static/img/product/a66MCX-VO5owmgs52PJUSfhn.png',NULL,NULL),(15,5,'海信电视','3999','Hisense/海信 55吋4K高清智能网络平板液晶电视机50','299','/static/img/product/ir0zMfdci-lTrG_oefGqha_B.png',NULL,NULL),(16,5,'康佳电视','1899','Konka/康佳 43英寸彩电高清蓝光节能液晶平板电视机','562','/static/img/product/hRiuTO4xwE_hKLR5z_4aYgJB.png',NULL,NULL),(17,6,'海尔洗衣机','1599','Haier/海尔 7公斤全自动滚筒家用洗衣机 ','389','/static/img/product/OTrFBz9qEYLakOEeyMUT8plI.png',NULL,NULL),(18,6,'西门子洗衣机','3049','SIEMENS/西门子 全自动洗衣机滚筒8公斤变频超薄家用','499','/static/img/product/SOoFhPDUttlc-R1_dIMUIGfU.png',NULL,NULL),(19,7,'松下空调','2858','Panasonic/松下 大1匹二级能效壁挂式冷暖空调挂机','567','/static/img/product/1yLPm0I1pQJclNau9tB8zW5N.png',NULL,NULL),(20,7,'Tcl空调','3299','TCL 大2匹经典18米送风静音节能客厅立式空调柜机 ','345','/static/img/product/yoloDNYYQoOEoVzzh2EP-n3o.png',NULL,NULL),(21,8,'美的电热水器','1099','Midea/美的 60升电热水器50即热洗澡速热家用储水式','126','/static/img/product/DSBl5nFWHZ8y_qGagO6e02j6.png',NULL,NULL),(22,8,'格力电热水器','5699','Gree/格力 空气能电热水器200升家用 ','1255','/static/img/product/STxRAJlQMVQ2WZ_6fAhN_lMY.png',NULL,NULL),(23,9,'华硕笔记本','5699','Asus/华硕 灵耀笔记本电脑窄框轻薄便携商务办公学生 ','1255','/static/img/product/REqcJfLbcJOq0jhM5SLoMwMt.png',NULL,NULL),(24,9,'Apple笔记本','6488','Apple MacBook Air 13.3英寸笔记本电脑I5 8G','3255','/static/img/product/Shm4keCefrOUF4uWKrn81mKs.png',NULL,NULL),(25,10,'华为手机','3988','Huawei/华为 P10Plus 全网通手机','340','/static/img/product/_MW-4abqNG8eww3cd7Xxgj9g.png',NULL,NULL),(26,10,'小米手机','699','Xiaomi/小米 红米手机4X全网通note4x手机红米4x5','220','/static/img/product/brbDFzOyA5YWCf7-Egc58l7F.png',NULL,NULL),(27,11,'Apple平板','2858','Apple/苹果 iPad mini 4 128G 7.9英寸mini4迷你平板电脑','239','/static/img/product/Gwvm24jss0g_XtZj8aho946l.png',NULL,NULL),(28,12,'佳能相机','2788','Canon/佳能微单单反数码照相机便携复古','239','/static/img/product/yIRslZCxt9lNuI8-x8Y3yEwD.png',NULL,NULL),(29,13,'罗马仕充电器','39','ROMOSS/罗马仕 AC12S充电器 新品2.1A快充 手机平板通用 双USB','2349','/static/img/product/ETPVknwF8d2ogilvwb7sVuO9.png',NULL,NULL),(30,14,'针织长裙','199','条纹针织修身复古木耳边连衣裙子女','349','/static/img/product/4tqgOk3CUBt43xL748isK8EI.png',NULL,NULL),(31,14,'连衣裙','159','宽松收腰撞色抽绳短裙连衣裙子','389','/static/img/product/RP_rJtELvUq4ufi3Mro_pVRI.png',NULL,NULL),(32,15,'鸭舌帽','59','棒球帽男女遮阳帽子夏秋弯檐','3289','/static/img/product/yG-fpqAJm_J3TLWL978qCW3w.png',NULL,NULL),(33,16,'爱华仕旅行箱','499','爱华仕拉杆箱男20寸 旅行箱女行李箱万向轮25寸密码箱包 ','349','/static/img/product/FT3ABuayvSkdlIaSmKBB-abv.png',NULL,NULL),(34,17,'ELLE手提包','799','ELLE女包新款牛皮子母包拉链手提包','39','/static/img/product/2Hj7lV376vPZUV02drmQKeYd.png',NULL,NULL),(35,18,'七匹狼保暖内衣','79','七匹狼保暖内衣秋衣秋裤男套装全棉','539','/static/img/product/15l0WIeIGWlCPgEYVHebyRSg.png',NULL,NULL),(36,19,'腰果','22.9','三只松鼠 炭烧腰果185g坚果零食特产','2539','/static/img/product/LfT6SgIklUsCcTgZYFvOahnx.png',NULL,NULL),(37,19,'牛肉干','25.9','五香牛肉80g手撕黄牛肉片','539','/static/img/product/T65spDISxBst3EW7v1tiXCgB.png',NULL,NULL),(38,20,'牛排','129','绝世澳洲家庭牛排套餐团购10片生鲜新鲜单片牛肉','59','/static/img/product/zl5jJRNeQqGLS3-dB29-Ibks.png',NULL,NULL),(39,21,'盖浇饭','55','盖浇饭冷冻料理包批发10款便当外卖快餐饭速食半成品','539','/static/img/product/v7FqexF6LoXnglj3Fkm2Hblw.png',NULL,NULL),(40,22,'水饺','29','湾仔码头三鲜水饺720g 速冻水饺','119','/static/img/product/o_77J60Bf19hgQvS2BTxIgTO.png',NULL,NULL),(41,23,'巧克力','26','德国进口RitterSport瑞特斯波德 浓醇黑巧克力100g','267','/static/img/product/4-0pSXRJCyPjptLjx5b6JsUE.png',NULL,NULL),(42,23,'饼干','23','比利时进口零食品 LOTUS和情焦糖饼干156g','567','/static/img/product/_vFq5JNPdI_AwoYvtj6KH5n3.png',NULL,NULL),(43,24,'茅台','468','53度茅台迎宾酒（2013款）500ml *6瓶','567','/static/img/product/lQO9HFpLu4A5uJ5LKyYNlfcG.png',NULL,NULL),(44,25,'张裕葡萄酒','248','张裕 红酒优选级赤霞珠 干红葡萄酒750ml*6整箱','56','/static/img/product/Vyx4syH2VJvYI3uiot-2BX3w.png',NULL,NULL),(45,26,'维他柠檬茶','56','维他 柠檬茶250ML*24盒/箱','46','/static/img/product/1FzgTyJwUgY7wZ1d6D5vAjx8.png',NULL,NULL),(46,27,'RIO鸡尾酒','78','RIO伏特加鸡尾酒 锐澳微醺3.8度缤纷6瓶装275ml*6','246','/static/img/product/UUeFBKOlG3rny8ikj8qT_tsO.png',NULL,NULL),(47,28,'威士忌','258','芝华士12年威士忌500ml+百龄坛500ml','246','/static/img/product/UR_yhyDaKZgNvBTHNqcPoENg.png',NULL,NULL),(48,29,'三星电视','3999','Samsung/三星 55吋屏超高清4K智能液晶曲面电视机','246','/static/img/product/ihzV2lufy-0PTdwRlkgcUueh.png',NULL,NULL),(49,31,'文件夹','5','得力板夹A4文件夹垫板写字板夹','24336','/static/img/product/hh0SvwJ7TTOQSwSHrSOW2uh9.png',NULL,NULL),(50,32,'沙发','10600','顾家家居简约合欧式现代皮沙发','4336','/static/img/product/e8UwWJ5oD-LJJDunH6yMPux4.png',NULL,NULL),(51,33,'防水贴纸','37','防水自粘墙纸厨房防油浴室卫生间','14336','/static/img/product/zmRpbTum1yypIiiGF6E5fzp5.png',NULL,NULL),(52,34,'吊灯','399','雷士遥控led吸顶灯','1436','/static/img/product/BBZ_yYiRjk0wXlosFLbBS5cW.png',NULL,NULL),(53,36,'冲锋衣','299','男士防风运动外套男三合一冲锋衣','436','/static/img/product/d0OcOutVjg8g3A_Lgo5CWDmV.png',NULL,NULL),(54,37,'李宁足球','69','李宁足球标准尺寸','3436','/static/img/product/UpOmRNUStL5nb4JaSDHODvI9.png',NULL,NULL),(55,38,'汽车坐垫','149','汽车坐垫冬毛绒单片无靠背三件套','43436','/static/img/product/bmLKHvJb4EJ7y97ve1jEbOOE.png',NULL,NULL),(56,40,'龙应台','69','龙应台人生三书：目送+亲爱的安德烈+孩子你慢慢来','4436','/static/img/product/VTjbZn_D3WxLfUgQNV-sUeCe.png',NULL,NULL),(57,41,'蓝悦音箱','39','LEnRuE/蓝悦 A2无线蓝牙插卡音箱车载','436','/static/img/product/vU1XOiDwGRKneHxlyXXGwOdS.png',NULL,NULL),(58,42,'kindle电子书','948','Kindle Paperwhite亚马逊电子书阅读器电纸书','34436','/static/img/product/vHUVUOPOdfMFJH47tiNjKFzQ.png',NULL,NULL),(59,44,'卡西欧手表','119','卡西欧石英手表','3436','/static/img/product/pXU1Itraj-Na3gkF7aRDi9C6.png',NULL,NULL),(60,45,'周生生珠宝','1311','周生生足金珠宝黄金项链','346','/static/img/product/PRODPzTHcVQ_fpvYXyMn_bcz.png',NULL,NULL),(61,46,'奶瓶','95','贝亲奶瓶 自然实感宽口径玻璃奶瓶160ml','32246',NULL,NULL,NULL),(62,47,'乐高积木','279','乐高经典创意系列10696','326','/static/img/product/h5vtIZek_YUNsY0Wmpjd0hRV.png',NULL,NULL),(63,48,'公主裙','99','童装女宝宝春秋公主裙','8926','/static/img/product/IMYo192sT0M511OhrcIiHR7a.png',NULL,NULL),(64,49,'美宝莲粉底液','139','美宝莲粉底液','926','/static/img/product/9hWr_Ji8sVyyFe8IsMxVfq_E.png',NULL,NULL),(65,50,'舒肤佳沐浴露','49','舒肤佳沐浴露 男女家庭滋润持久留香保湿纯白1.5L ','1926','/static/img/product/xkZkbHKOzjQNJGfDpWLLQYDi.png',NULL,NULL),(66,51,'维达纸巾','49','维达超韧系列软包抽纸3层130抽','19326','/static/img/product/5IB_w5TqdsVBQWUCuq6WPWvK.png',NULL,NULL);
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
  `ReceiveName` varchar(20) DEFAULT NULL,
  `ReceiveAdd` varchar(200) DEFAULT NULL,
  `ReceiveTel` varchar(20) DEFAULT NULL,
  `ReceiveProvince` varchar(20) DEFAULT NULL,
  `ReceiveCite` varchar(20) DEFAULT NULL,
  `ReceivePost` varchar(20) DEFAULT NULL,
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
INSERT INTO `userorder` VALUES ('1514379300316','1514356386529','2017-12-27 20:55:00','3898','已发货',NULL,NULL,'1514182549133',NULL,NULL,NULL,NULL,NULL,NULL),('1514380918190','1514356386529','2017-12-27 21:21:58','7796','已发货',NULL,NULL,'1514182549133',NULL,NULL,NULL,NULL,NULL,NULL),('1514437196478','1514437178483','2017-12-28 12:59:56','4197','已发货','在线支付',NULL,'1514437075075',NULL,NULL,NULL,NULL,NULL,NULL),('1514459783680','1514356386529','2017-12-28 19:16:23','15696','已发货','在线支付',NULL,'1514182549133',NULL,NULL,NULL,NULL,NULL,NULL),('1514466832008','1514466821242','2017-12-28 21:13:52','16594','已发货','在线支付',NULL,'1514182549133',NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2018-01-04 15:08:43
