-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: eHOTELS
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `Amenities`
--

DROP TABLE IF EXISTS `Amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Amenities` (
  `HotelRoomID` int(11) NOT NULL,
  `Amenity` varchar(50) DEFAULT NULL,
  KEY `HotelRoomID` (`HotelRoomID`),
  CONSTRAINT `Amenities_ibfk_1` FOREIGN KEY (`HotelRoomID`) REFERENCES `HotelRoom` (`HotelRoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amenities`
--

LOCK TABLES `Amenities` WRITE;
/*!40000 ALTER TABLE `Amenities` DISABLE KEYS */;
INSERT INTO `Amenities` VALUES (1,'AC'),(1,'2WC'),(1,'Massage'),(1,'Sauna'),(2,'AC'),(2,'2WC'),(3,'2WC'),(3,'Sauna'),(4,'AC'),(4,'2WC'),(4,'Massage'),(5,'AC'),(5,'Massage'),(6,'AC'),(6,'Massage'),(7,'AC'),(7,'Massage'),(7,'Sauna'),(8,'AC'),(8,'2WC'),(9,'AC'),(10,'AC'),(10,'Massage'),(10,'Sauna'),(11,'AC'),(11,'2WC'),(11,'Sauna'),(12,'AC'),(12,'2WC'),(12,'Sauna'),(13,'AC'),(13,'Massage'),(14,'2WC'),(14,'Massage'),(15,'AC'),(15,'2WC'),(15,'Massage'),(16,'Sauna'),(17,'Sauna'),(18,'2WC'),(18,'Massage'),(18,'Sauna'),(19,'2WC'),(19,'Massage'),(20,'Massage'),(21,'Sauna'),(22,'Massage'),(22,'Sauna'),(23,'2WC'),(23,'Sauna'),(24,'2WC'),(25,'AC'),(25,'Massage'),(25,'Sauna'),(26,'AC'),(26,'2WC'),(26,'Massage'),(27,'2WC'),(27,'Sauna'),(28,'2WC'),(28,'Massage'),(28,'Sauna'),(29,'AC'),(30,'AC'),(30,'2WC'),(31,'AC'),(31,'Sauna'),(32,'AC'),(33,'2WC'),(34,'2WC'),(34,'Massage'),(34,'Sauna'),(35,'AC'),(35,'2WC'),(36,'AC'),(36,'2WC'),(37,'Massage'),(37,'Sauna'),(38,'Massage'),(38,'Sauna'),(39,'AC'),(39,'Sauna'),(40,'2WC'),(40,'Sauna'),(41,'2WC'),(41,'Massage'),(42,'AC'),(42,'Sauna'),(43,'AC'),(43,'2WC'),(43,'Massage'),(44,'Massage'),(45,'AC'),(45,'Sauna'),(46,'2WC'),(46,'Massage'),(47,'AC'),(47,'2WC'),(47,'Massage'),(47,'Sauna'),(48,'AC'),(49,'AC'),(50,'AC'),(51,'2WC'),(51,'Massage'),(51,'Sauna'),(52,'AC'),(52,'Sauna'),(53,'AC'),(53,'2WC'),(53,'Massage'),(54,'Massage'),(54,'Sauna'),(55,'2WC'),(56,'Massage'),(57,'AC'),(57,'Massage'),(58,'Sauna'),(59,'2WC'),(60,'AC'),(60,'2WC'),(60,'Sauna'),(61,'2WC'),(61,'Massage'),(61,'Sauna'),(62,'2WC'),(62,'Massage'),(62,'Sauna'),(63,'AC'),(63,'Massage'),(64,'2WC'),(65,'Sauna'),(66,'2WC'),(67,'AC'),(67,'2WC'),(67,'Massage'),(68,'Massage'),(68,'Sauna'),(69,'Sauna'),(70,'Sauna'),(71,'Massage'),(71,'Sauna'),(72,'2WC'),(72,'Massage'),(73,'AC'),(74,'2WC'),(74,'Massage'),(74,'Sauna'),(75,'AC'),(76,'AC'),(77,'AC'),(77,'2WC'),(78,'2WC'),(79,'AC'),(79,'2WC'),(80,'AC'),(81,'Sauna'),(82,'AC'),(82,'Sauna'),(83,'Massage'),(83,'Sauna'),(84,'AC'),(84,'Massage'),(85,'Massage'),(85,'Sauna'),(86,'2WC'),(87,'2WC'),(87,'Massage'),(88,'2WC'),(88,'Massage'),(89,'AC'),(90,'Sauna'),(91,'AC'),(92,'2WC'),(92,'Massage'),(93,'AC'),(93,'Sauna'),(94,'Massage'),(94,'Sauna'),(95,'Massage'),(96,'AC'),(96,'Sauna'),(97,'AC'),(97,'Massage'),(98,'AC'),(98,'2WC'),(99,'Sauna'),(100,'AC'),(101,'2WC'),(102,'Sauna'),(103,'AC'),(103,'2WC'),(104,'AC'),(104,'2WC'),(105,'2WC'),(106,'AC'),(106,'Massage'),(107,'2WC'),(107,'Sauna'),(108,'AC'),(108,'Sauna'),(109,'AC'),(109,'2WC'),(110,'Massage'),(110,'Sauna'),(111,'2WC'),(111,'Massage'),(111,'Sauna'),(112,'AC'),(112,'Massage'),(112,'Sauna'),(113,'Massage'),(114,'AC'),(114,'2WC'),(114,'Massage'),(114,'Sauna'),(115,'AC'),(115,'Massage'),(116,'2WC'),(116,'Sauna'),(117,'2WC'),(118,'AC'),(118,'2WC'),(118,'Massage'),(119,'2WC'),(119,'Sauna'),(120,'2WC'),(120,'Massage'),(121,'2WC'),(121,'Sauna'),(122,'2WC'),(123,'2WC'),(123,'Massage'),(123,'Sauna'),(124,'Sauna'),(125,'Massage');
/*!40000 ALTER TABLE `Amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `IRSNumber` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL DEFAULT '',
  `FirstRegistration` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SocialSecurityNumber` int(11) NOT NULL DEFAULT '0',
  `Street` varchar(255) DEFAULT NULL,
  `StreetNumber` varchar(4) DEFAULT NULL,
  `PostalCode` varchar(5) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IRSNumber`),
  KEY `IRSNumber` (`IRSNumber`,`LastName`,`FirstName`),
  KEY `customerindex` (`FirstName`,`LastName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (3,'jimko','kal','2018-04-20 01:19:16',0,'vbm','32','5543','athens'),(54,'vagel','vim','2018-04-20 01:21:07',0,'ces','23','111','athens'),(345,'gdf','gfd','2018-04-19 10:35:44',0,'ASDsadsa','35','12345','athens'),(543,'gdf','teleios','2018-04-19 10:32:36',0,'adsdsad','543','12345','athens'),(12345,'dsapok','fsdpok','2018-04-22 11:41:02',123342,'Archeafksda','5','17237','Athens'),(13213,'Panagiotis','Tsapatsaris','2018-04-27 20:05:03',321321,'Lelas Karagianni','3','23112','Ilioupoli'),(123213,'Marios','Papachristou','2018-04-27 20:05:03',123123,'Archimandriti Archadjikaki ','5','17237','Hymmetus'),(123214,'Dimitris','Kelesis','2018-04-27 20:05:03',321445,'Teo','3','23133','Zografou'),(5566447,'Dimitris','kle','2018-04-19 09:04:19',0,'tre','42','6789','Kalamata');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `IRSNumber` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL DEFAULT '',
  `SocialSecurityNumber` int(11) NOT NULL DEFAULT '0',
  `Street` varchar(255) DEFAULT NULL,
  `StreetNumber` varchar(4) DEFAULT NULL,
  `PostalCode` varchar(5) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IRSNumber`),
  KEY `IRSNumber` (`IRSNumber`,`LastName`,`FirstName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1155,'Kostas','bnvc',76532,'jgr','66','5346','reaf'),(1233,'Victor','ertgv',654,'fg','4','5436','gfds'),(1237,'bwsg','rewd',5432,'jgda','643','6346','dfse'),(3333,'rty','rewc',7542,'gdj','456','63434','gfsd'),(3678,'tyue','tqwv',45356,'jye','76','643','dfsh'),(5234,'Thanasis','Fgfd',6433,'dfgdf','6','8888','Athens'),(6532,'Maria','Vit',1234,'gdfs','4','7777','Sparti'),(6541,'ytgn','javwe',8563,'yme','125','6345','reae'),(6789,'hqbs','fdsas',2546,'jhg','34','6433','hera'),(7562,'wetas','tyrw',8276,'jyew','56','6435','ryea'),(9076,'krmwe','fdtby',6547,'jky','34','6436','hreer'),(10123,'gfdsg','asdfv',4537,'jtye','23','6432','hfsb'),(23453,'nhg','gfdwk',45362,'jyr','45','6245','reah'),(42365,'btrs','cvba',7562,'gerw','25','6346','hyre'),(53412,'ghrg','iopyh',845,'wef','65','6542','hrae'),(53418,'htrb','ertgh',838,'myt','12','6345','yrea'),(54452,'gerb','hsfnb',758,'trnw','123','6432','tera'),(55431,'gerbr','ywbs',7651,'hw','54','63465','yre'),(56745,'fgdrb','ffer',76530,'jety','24','64323','tegv'),(56780,'resfgsd','rfik',65463,'mkuy','235','6433','rew'),(87546,'jytsb','xwef',37,'htr','34','6243','yhrea'),(87654,'kuytyh','qwexj',765,'hwte','54','6345','ret'),(124670,'hrtb','gebe',6731,'we','34','6423','aer'),(564398,'gfdwe','qsc',75632,'ger','77','3646','hrea'),(6772345,'tsfvbr','tywe',8710,'jtwner','76','6435','eryar');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `History` (
  `CustomerIRSNumber` int(11) DEFAULT NULL,
  `HotelRoomID` int(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `Paid` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `CustomerIRSNumber` (`CustomerIRSNumber`,`HotelRoomID`,`StartDate`,`FinishDate`),
  KEY `HotelRoomID` (`HotelRoomID`),
  KEY `historyindex` (`StartDate`,`FinishDate`),
  CONSTRAINT `History_ibfk_1` FOREIGN KEY (`CustomerIRSNumber`) REFERENCES `Customer` (`IRSNumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `History_ibfk_2` FOREIGN KEY (`HotelRoomID`) REFERENCES `HotelRoom` (`HotelRoomID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
INSERT INTO `History` VALUES (3,1,'1973-01-01 00:00:01','1974-01-01 00:00:01',0),(123214,12,'2018-05-22 19:44:48','2018-05-22 19:44:48',0),(123214,12,'2018-05-22 19:44:54','2018-05-22 19:44:54',0),(123214,12,'2018-05-22 19:45:15','2018-05-22 19:45:15',0),(123214,12,'2018-05-22 19:55:20','2018-05-22 19:55:20',0),(123214,12,'1997-02-10 12:01:00','1997-03-11 11:59:00',0),(5566447,12,'2020-02-02 12:01:00','2040-02-02 11:59:00',0),(3,1,'1970-01-01 00:00:01','1971-01-01 00:00:01',1),(123214,12,'2020-10-02 12:01:00','2021-10-02 11:59:00',0),(123214,12,'2100-02-01 12:01:00','2101-02-01 11:59:00',0);
/*!40000 ALTER TABLE `History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotel` (
  `HotelID` int(11) NOT NULL AUTO_INCREMENT,
  `Stars` int(1) NOT NULL DEFAULT '0',
  `NumberOfRooms` int(11) NOT NULL DEFAULT '0',
  `HotelGroupID` int(11) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `StreetNumber` varchar(4) DEFAULT NULL,
  `PostalCode` varchar(5) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HotelID`),
  KEY `HotelGroupID` (`HotelGroupID`),
  CONSTRAINT `Hotel_ibfk_1` FOREIGN KEY (`HotelGroupID`) REFERENCES `HotelGroup` (`HotelGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO `Hotel` VALUES (1,2,5,1,'Papastratou','10','17237','Athens'),(2,3,5,1,'Imittou','3','41231','Athens'),(3,4,5,1,'Kanari','100','31298','Kolokotronitsi'),(4,5,5,1,'Adsad','213','32133','Thesalloniki'),(5,1,5,1,'Adsaokdp','312','39081','Patras'),(6,1,5,2,'Adasdsa','321','32132','RickAndMorty'),(7,3,5,2,'Mpotsari','21','31212','Bolzano'),(8,3,5,2,'Adsadasd','23','33213','Weierstrass'),(9,4,5,2,'ASdsadsa','234','32121','Bolzano'),(10,5,5,2,'Adsadsad','342','43242','Einstein'),(11,1,5,3,'Ilioupolis','12','16263','Athens'),(12,2,5,3,'Argiroupolis','44','13515','Volos'),(13,3,5,3,'Iliou','123','41244','Volos'),(14,4,5,3,'Os','125','12421','Bolzano'),(15,5,5,3,'Damni','31','51255','Einstein'),(16,1,5,4,'Traino','124','21412','Rassias'),(17,2,5,4,'Tikano','51','31233','Cuppertino'),(18,3,5,4,'Popis','241','12412','Rassias'),(19,4,5,4,'Fuuuu','25','12415','RickAndMorty'),(20,5,5,4,'Toutou','124','12424','Popos'),(21,1,1,5,'ASdsadas','345','32423','Weierstrass'),(22,2,2,5,'Adasdsadas','432','32131','California'),(23,3,3,5,'Adasidla','423','87989','Palo Alto Arkadias'),(24,4,5,5,'Adsadasa','321','23123','Cuppertino'),(25,5,4,5,'Elm Street','321','32312','California'),(36,5,5,1,'Test Street','34','43234','California');
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger update_nr_hotels
before insert on Hotel
for each row
begin
	update HotelGroup set NumberOfHotels = NumberOfHotels + 1 
    where HotelGroupID = new.HotelGroupID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger delroomgr
before delete on Hotel
for each row
begin
delete from Works where HotelID=old.HotelID;
delete from HotelEmailAddress where HotelID=old.HotelID;
delete from HotelPhoneNumbers where HotelID=old.HotelID;
delete from Rents where HotelRoomID in (select HotelRoomID FROM HotelRoom where HotelID=old.HotelID);
delete from Amenities where HotelRoomID in (select HotelRoomID FROM HotelRoom where HotelID=old.HotelID);
delete from HotelRoom where HotelID=old.HotelID;
update HotelGroup set NumberOfHotels = NumberOfHotels - 1 where HotelGroupID = old.HotelGroupID;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `HotelEmailAddress`
--

DROP TABLE IF EXISTS `HotelEmailAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelEmailAddress` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `HotelID` int(11) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AddressID`),
  KEY `HotelID` (`HotelID`),
  CONSTRAINT `HotelEmailAddress_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `Hotel` (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelEmailAddress`
--

LOCK TABLES `HotelEmailAddress` WRITE;
/*!40000 ALTER TABLE `HotelEmailAddress` DISABLE KEYS */;
INSERT INTO `HotelEmailAddress` VALUES (1,1,'dpofka1@mail.ntua.gr'),(2,2,'dpofka2@mail.ntua.gr'),(3,3,'dpofka3@mail.ntua.gr'),(4,4,'dpofka4@mail.ntua.gr'),(5,5,'dpofka5@mail.ntua.gr'),(6,6,'dpofka6@mail.ntua.gr'),(7,7,'dpofka7@mail.ntua.gr'),(8,8,'dpofka8@mail.ntua.gr'),(9,9,'dpofka9@mail.ntua.gr'),(10,10,'dpofka10@mail.ntua.gr'),(11,11,'dpofka11@mail.ntua.gr'),(12,12,'dpofka12@mail.ntua.gr'),(13,13,'dpofka13@mail.ntua.gr'),(14,14,'dpofka14@mail.ntua.gr'),(15,15,'dpofka15@mail.ntua.gr'),(16,16,'dpofka16@mail.ntua.gr'),(17,17,'dpofka17@mail.ntua.gr'),(18,18,'dpofka18@mail.ntua.gr'),(19,19,'dpofka19@mail.ntua.gr'),(20,20,'dpofka20@mail.ntua.gr'),(21,21,'dpofka21@mail.ntua.gr'),(22,22,'dpofka22@mail.ntua.gr'),(23,23,'dpofka23@mail.ntua.gr'),(24,24,'dpofka24@mail.ntua.gr'),(25,25,'dpofka25@mail.ntua.gr');
/*!40000 ALTER TABLE `HotelEmailAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelGroup`
--

DROP TABLE IF EXISTS `HotelGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelGroup` (
  `HotelGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `NumberOfHotels` int(11) NOT NULL DEFAULT '0',
  `Street` varchar(255) DEFAULT NULL,
  `StreetNumber` varchar(4) DEFAULT NULL,
  `PostalCode` varchar(5) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HotelGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelGroup`
--

LOCK TABLES `HotelGroup` WRITE;
/*!40000 ALTER TABLE `HotelGroup` DISABLE KEYS */;
INSERT INTO `HotelGroup` VALUES (1,6,'Peiraios','116','12345','Imittos'),(2,5,'Syggrou','100','12343','Athens'),(3,5,'Aristotelous','2','54321','Thessaloniki'),(4,5,'Mpoumpoulinas','42','18211','Patras'),(5,5,'Kolokotroni','17','18221','Dervenakia'),(6,10,'A street','4','17237','Athens'),(7,10,'ASdsa','4','17237','Athens'),(8,10,'5','2','Adsad','Athens'),(9,10,'5','2','17237','Athens'),(10,10,'A street','10','17237','Athens'),(11,20,'Str','10','17237','Athens'),(12,10,'12','33','21312','Athens'),(13,10,'12','33','21312','Athens'),(14,10,'3','3','17331','Athens'),(15,10,'4','3','24312','athens'),(16,40,'Archimandriti Archadjikaki 5','33','17243','Hymmetus, Athens'),(17,10,'Archimandriti Archadjikaki 5','3','17237','Hymmetus, Athens'),(18,10,'Archimandriti Archadjikaki 5','22','17237','Athens'),(19,10,'ASOIDJsa','3','2313','Athens'),(20,10,'ASOIDJsa','3','2313','Athens'),(21,20,'Archimandriti Archadjikaki 5','333','17237','Hymmetus, Athens');
/*!40000 ALTER TABLE `HotelGroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger delhotgr
before delete on HotelGroup
for each row
begin
delete from HotelGroupEmailAddress where HotelGroupID=old.HotelGroupID;
delete from HotelGroupPhoneNumbers where HotelGroupID=old.HotelGroupID;
delete from Hotel where HotelGroupID=old.HotelGroupID;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `HotelGroupEmailAddress`
--

DROP TABLE IF EXISTS `HotelGroupEmailAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelGroupEmailAddress` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `HotelGroupID` int(11) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AddressID`),
  KEY `HotelGroupID` (`HotelGroupID`),
  CONSTRAINT `HotelGroupEmailAddress_ibfk_1` FOREIGN KEY (`HotelGroupID`) REFERENCES `HotelGroup` (`HotelGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelGroupEmailAddress`
--

LOCK TABLES `HotelGroupEmailAddress` WRITE;
/*!40000 ALTER TABLE `HotelGroupEmailAddress` DISABLE KEYS */;
INSERT INTO `HotelGroupEmailAddress` VALUES (1,1,'ge14620272@mail.ntua.gr'),(2,2,'ge11653689@mail.ntua.gr'),(3,3,'ge19326669@mail.ntua.gr'),(4,4,'ge16674383@mail.ntua.gr'),(5,5,'ge19345984@mail.ntua.gr'),(6,1,'testemail@mail.ntua.gr'),(29,20,'mrmarios97@gmail.com'),(30,21,'mrmarios97@gmail.com'),(31,21,' pikouli@mail.ntua.gr');
/*!40000 ALTER TABLE `HotelGroupEmailAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelGroupPhoneNumbers`
--

DROP TABLE IF EXISTS `HotelGroupPhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelGroupPhoneNumbers` (
  `NumberID` int(11) NOT NULL AUTO_INCREMENT,
  `HotelGroupID` int(11) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NumberID`),
  KEY `HotelGroupID` (`HotelGroupID`),
  CONSTRAINT `HotelGroupPhoneNumbers_ibfk_1` FOREIGN KEY (`HotelGroupID`) REFERENCES `HotelGroup` (`HotelGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelGroupPhoneNumbers`
--

LOCK TABLES `HotelGroupPhoneNumbers` WRITE;
/*!40000 ALTER TABLE `HotelGroupPhoneNumbers` DISABLE KEYS */;
INSERT INTO `HotelGroupPhoneNumbers` VALUES (1,1,'1604042397'),(2,2,'1827094517'),(3,3,'1802094588'),(4,4,'1576973590'),(5,5,'1334325946'),(17,1,'6979614463'),(18,20,'6979614463'),(19,21,'6979614463');
/*!40000 ALTER TABLE `HotelGroupPhoneNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `HotelHotelRoom`
--

DROP TABLE IF EXISTS `HotelHotelRoom`;
/*!50001 DROP VIEW IF EXISTS `HotelHotelRoom`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `HotelHotelRoom` AS SELECT 
 1 AS `HotelID`,
 1 AS `HotelRoomID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `HotelPhoneNumbers`
--

DROP TABLE IF EXISTS `HotelPhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelPhoneNumbers` (
  `NumberID` int(11) NOT NULL AUTO_INCREMENT,
  `HotelID` int(11) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NumberID`),
  KEY `HotelID` (`HotelID`),
  CONSTRAINT `HotelPhoneNumbers_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `Hotel` (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelPhoneNumbers`
--

LOCK TABLES `HotelPhoneNumbers` WRITE;
/*!40000 ALTER TABLE `HotelPhoneNumbers` DISABLE KEYS */;
INSERT INTO `HotelPhoneNumbers` VALUES (1,1,'2103454333'),(2,2,'1851391598'),(3,3,'1423302058'),(4,4,'1391656269'),(5,5,'1449375211'),(6,6,'1593013229'),(7,7,'1097050142'),(8,8,'1187913665'),(9,9,'1860847820'),(10,10,'1106959246'),(11,11,'1238762441'),(12,12,'1825289995'),(13,13,'1313102017'),(14,14,'1029028119'),(15,15,'1366227363'),(16,16,'1094847198'),(17,17,'2109939785'),(18,18,'1608548919'),(19,19,'1582780041'),(20,20,'1450582443'),(21,21,'1322242695'),(22,22,'2058415666'),(23,23,'1878799270'),(24,24,'1354967203'),(25,25,'1370474408');
/*!40000 ALTER TABLE `HotelPhoneNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelRoom`
--

DROP TABLE IF EXISTS `HotelRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelRoom` (
  `HotelRoomID` int(11) NOT NULL AUTO_INCREMENT,
  `HotelID` int(11) NOT NULL,
  `Price` float DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `View` varchar(50) DEFAULT NULL,
  `Expandable` int(1) NOT NULL DEFAULT '0',
  `RepairsNeed` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`HotelRoomID`),
  UNIQUE KEY `HotelRoomID` (`HotelRoomID`,`HotelID`),
  KEY `HotelID` (`HotelID`,`HotelRoomID`),
  CONSTRAINT `HotelRoom_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `Hotel` (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelRoom`
--

LOCK TABLES `HotelRoom` WRITE;
/*!40000 ALTER TABLE `HotelRoom` DISABLE KEYS */;
INSERT INTO `HotelRoom` VALUES (1,1,11,1,'Sea',1,1),(2,1,178,2,'City',0,1),(3,1,94,3,'Sea',1,0),(4,1,294,4,'Mountain',0,0),(5,1,115,5,'City',0,1),(6,2,144,1,'City',0,1),(7,2,288,2,'City',1,1),(8,2,299,3,'City',0,1),(9,2,139,4,'City',0,1),(10,2,135,5,'Mountain',1,1),(11,3,116,1,'Sea',1,1),(12,3,199,2,'City',1,1),(13,3,247,3,'Mountain',1,0),(14,3,55,4,'Mountain',1,0),(15,3,79,5,'Mountain',0,0),(16,4,229,1,'Mountain',0,1),(17,4,75,2,'Sea',1,0),(18,4,115,3,'Sea',1,0),(19,4,291,4,'City',0,0),(20,4,64,5,'City',0,0),(21,5,231,1,'Sea',0,1),(22,5,121,2,'Mountain',1,1),(23,5,224,3,'Mountain',1,0),(24,5,69,4,'City',1,1),(25,5,154,5,'Sea',0,1),(26,6,138,1,'Sea',1,1),(27,6,136,2,'Mountain',1,0),(28,6,246,3,'Mountain',0,0),(29,6,57,4,'Sea',1,0),(30,6,204,5,'Mountain',1,0),(31,7,132,1,'City',1,1),(32,7,121,2,'Mountain',1,0),(33,7,140,3,'Mountain',0,1),(34,7,278,4,'City',0,1),(35,7,127,5,'City',1,1),(36,8,294,1,'Mountain',0,0),(37,8,70,2,'Mountain',0,0),(38,8,126,3,'Mountain',1,0),(39,8,59,4,'Mountain',1,0),(40,8,212,5,'Sea',1,0),(41,9,267,1,'City',0,0),(42,9,290,2,'City',0,0),(43,9,154,3,'City',1,1),(44,9,133,4,'Sea',0,0),(45,9,177,5,'Mountain',0,0),(46,10,256,1,'Sea',1,0),(47,10,200,2,'City',1,0),(48,10,276,3,'City',1,0),(49,10,70,4,'City',1,0),(50,10,168,5,'Mountain',1,1),(51,11,221,1,'City',1,0),(52,11,78,2,'City',1,0),(53,11,125,3,'Mountain',1,0),(54,11,152,4,'Mountain',1,1),(55,11,234,5,'Mountain',1,0),(56,12,208,1,'City',0,0),(57,12,252,2,'City',0,0),(58,12,216,3,'Sea',1,0),(59,12,164,4,'Mountain',1,1),(60,12,275,5,'Mountain',0,1),(61,13,56,1,'Sea',0,1),(62,13,96,2,'Mountain',0,0),(63,13,278,3,'City',0,0),(64,13,151,4,'Mountain',1,1),(65,13,273,5,'City',0,0),(66,14,254,1,'City',0,0),(67,14,296,2,'Mountain',0,0),(68,14,110,3,'City',1,1),(69,14,223,4,'City',0,0),(70,14,175,5,'City',0,0),(71,15,61,1,'Mountain',1,0),(72,15,238,2,'City',0,1),(73,15,149,3,'Sea',1,1),(74,15,175,4,'City',0,0),(75,15,289,5,'City',1,0),(76,16,139,1,'Sea',1,1),(77,16,229,2,'City',1,1),(78,16,149,3,'Sea',0,0),(79,16,219,4,'Mountain',1,0),(80,16,231,5,'Mountain',0,1),(81,17,120,1,'Mountain',1,1),(82,17,59,2,'Mountain',0,1),(83,17,215,3,'Mountain',1,0),(84,17,139,4,'Mountain',0,1),(85,17,271,5,'Sea',0,1),(86,18,96,1,'Sea',1,0),(87,18,78,2,'City',1,0),(88,18,200,3,'Mountain',0,0),(89,18,95,4,'City',0,0),(90,18,57,5,'City',1,1),(91,19,116,1,'Mountain',0,1),(92,19,216,2,'Sea',1,1),(93,19,199,3,'Mountain',0,1),(94,19,224,4,'Mountain',1,0),(95,19,164,5,'City',0,0),(96,20,223,1,'Mountain',0,0),(97,20,221,2,'City',0,1),(98,20,298,3,'Sea',1,0),(99,20,180,4,'City',1,1),(100,20,207,5,'City',1,1),(101,21,224,1,'Mountain',1,1),(102,21,120,2,'Mountain',0,1),(103,21,265,3,'Sea',1,1),(104,21,175,4,'City',0,1),(105,21,222,5,'Mountain',1,1),(106,22,258,1,'Sea',1,1),(107,22,225,2,'City',0,1),(108,22,83,3,'City',0,1),(109,22,259,4,'Sea',0,1),(110,22,100,5,'Mountain',0,0),(111,23,252,1,'Mountain',0,1),(112,23,140,2,'Mountain',1,1),(113,23,78,3,'City',0,1),(114,23,157,4,'Mountain',0,0),(115,23,94,5,'City',0,0),(116,24,124,1,'Mountain',1,1),(117,24,81,2,'Mountain',1,0),(118,24,248,3,'Sea',0,0),(119,24,71,4,'City',1,1),(120,24,64,5,'City',1,1),(121,25,281,1,'Sea',1,1),(122,25,149,2,'Sea',0,0),(123,25,267,3,'Sea',0,1),(124,25,250,4,'Mountain',1,1),(125,25,128,5,'Mountain',1,0),(126,5,100,10,'Maraca',1,1);
/*!40000 ALTER TABLE `HotelRoom` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger update_nr_rooms
before insert on HotelRoom
for each row
begin
	update Hotel set NumberOfRooms = NumberOfRooms + 1
    where HotelID = new.HotelID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger delroom
before delete on HotelRoom
for each row
begin
update Hotel set NumberOfRooms = NumberOfRooms - 1 where HotelRoomID = old.HotelRoomID;
delete from Amenities where HotelRoomID= old.HotelRoomID;
delete from Rents where HotelRoomID = old.HotelRoomID;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `HotelRoomCapacityView`
--

DROP TABLE IF EXISTS `HotelRoomCapacityView`;
/*!50001 DROP VIEW IF EXISTS `HotelRoomCapacityView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `HotelRoomCapacityView` AS SELECT 
 1 AS `HotelRoomID`,
 1 AS `HotelID`,
 1 AS `Price`,
 1 AS `Capacity`,
 1 AS `View`,
 1 AS `Expandable`,
 1 AS `RepairsNeed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `HotelRoomLocationView`
--

DROP TABLE IF EXISTS `HotelRoomLocationView`;
/*!50001 DROP VIEW IF EXISTS `HotelRoomLocationView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `HotelRoomLocationView` AS SELECT 
 1 AS `HotelRoomID`,
 1 AS `HotelID`,
 1 AS `Price`,
 1 AS `Expandable`,
 1 AS `RepairsNeed`,
 1 AS `Stars`,
 1 AS `Street`,
 1 AS `StreetNumber`,
 1 AS `PostalCode`,
 1 AS `-City`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Rents`
--

DROP TABLE IF EXISTS `Rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rents` (
  `RentID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerIRSNumber` int(11) DEFAULT NULL,
  `EmployeeIRSNumber` int(11) DEFAULT NULL,
  `HotelRoomID` int(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `PaymentAmount` int(11) DEFAULT NULL,
  `PaymentMethod` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RentID`),
  KEY `CustomerIRSNumber` (`CustomerIRSNumber`),
  KEY `EmployeeIRSNumber` (`EmployeeIRSNumber`),
  KEY `HotelRoomID` (`HotelRoomID`),
  KEY `rentindex` (`StartDate`,`FinishDate`),
  CONSTRAINT `Rents_ibfk_1` FOREIGN KEY (`CustomerIRSNumber`) REFERENCES `Customer` (`IRSNumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Rents_ibfk_2` FOREIGN KEY (`EmployeeIRSNumber`) REFERENCES `Employee` (`IRSNumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Rents_ibfk_3` FOREIGN KEY (`HotelRoomID`) REFERENCES `HotelRoom` (`HotelRoomID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rents`
--

LOCK TABLES `Rents` WRITE;
/*!40000 ALTER TABLE `Rents` DISABLE KEYS */;
INSERT INTO `Rents` VALUES (1,123214,6772345,12,'2020-10-02 12:01:00','2021-10-02 11:59:00',199,'CREDIT'),(2,123214,6772345,12,'2020-10-02 12:01:00','2021-10-02 11:59:00',199,'CREDIT');
/*!40000 ALTER TABLE `Rents` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger rentcheck
before insert on Rents
for each row
begin
IF EXISTS (
	select * from WorksHotelRoom where WorksHotelRoom.IRSNumber = new.EmployeeIRSNumber
    and WorksHotelRoom.HotelRoomID = new.HotelRoomID
		-- and CURRENT_TIMESTAMP between WorksHotelRoom.StartDate and WorksHotelRoom.FinishDate

 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Wrong Employee or Employee does not work here anymore!';
END IF;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Reserves`
--

DROP TABLE IF EXISTS `Reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reserves` (
  `ReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerIRSNumber` int(11) DEFAULT NULL,
  `HotelRoomID` int(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `Paid` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReservationID`),
  KEY `CustomerIRSNumber` (`CustomerIRSNumber`),
  KEY `HotelRoomID` (`HotelRoomID`),
  KEY `resindex` (`StartDate`,`FinishDate`),
  CONSTRAINT `Reserves_ibfk_1` FOREIGN KEY (`CustomerIRSNumber`) REFERENCES `Customer` (`IRSNumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Reserves_ibfk_2` FOREIGN KEY (`HotelRoomID`) REFERENCES `HotelRoom` (`HotelRoomID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserves`
--

LOCK TABLES `Reserves` WRITE;
/*!40000 ALTER TABLE `Reserves` DISABLE KEYS */;
INSERT INTO `Reserves` VALUES (1,3,1,'1970-01-01 00:00:01','1971-01-01 00:00:01',1),(3,123214,12,'2020-10-02 12:01:00','2021-10-02 11:59:00',0),(4,123214,12,'2100-02-01 12:01:00','2101-02-01 11:59:00',0);
/*!40000 ALTER TABLE `Reserves` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger nonoverlap
before insert on Reserves
for each row
begin
IF EXISTS (select * from Reserves
	where (HotelRoomID = new.HotelRoomID)
	and ( (new.StartDate between StartDate and FinishDate) or
		 (new.FinishDate between StartDate and FinishDate) or 
         (StartDate between new.StartDate and new.FinishDate) or
	     (FinishDate between new.StartDate and new.FinishDate))
 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Overlap found!';
END IF;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger history
after insert on Reserves
for each row
begin
	insert into History (CustomerIRSNumber, HotelRoomID, StartDate, FinishDate, Paid) values (new.CustomerIRSNumber, new.HotelRoomID, new.StartDate, new.FinishDate, new.Paid);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger history_upd
after update on Reserves
for each row
begin
	insert into History (CustomerIRSNumber, HotelRoomID, StartDate, FinishDate, Paid)
    values (new.CustomerIRSNumber, new.HotelRoomID, new.StartDate, new.FinishDate, new.Paid);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Works`
--

DROP TABLE IF EXISTS `Works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Works` (
  `WorksID` int(11) NOT NULL AUTO_INCREMENT,
  `IRSNumber` int(11) DEFAULT NULL,
  `HotelID` int(11) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  PRIMARY KEY (`WorksID`),
  KEY `IRSNumber` (`IRSNumber`),
  KEY `HotelID` (`HotelID`),
  CONSTRAINT `Works_ibfk_1` FOREIGN KEY (`IRSNumber`) REFERENCES `Employee` (`IRSNumber`),
  CONSTRAINT `Works_ibfk_2` FOREIGN KEY (`HotelID`) REFERENCES `Hotel` (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works`
--

LOCK TABLES `Works` WRITE;
/*!40000 ALTER TABLE `Works` DISABLE KEYS */;
INSERT INTO `Works` VALUES (1,6772345,1,'Manager','2000-03-03 00:00:00','2100-03-04 00:00:00'),(2,564398,2,'Manager','1990-02-02 00:00:00','2000-03-04 00:00:00'),(3,124670,3,'Manager','1990-02-04 00:00:00','2000-03-04 00:00:00'),(4,87654,4,'Manager','1990-02-05 00:00:00','2000-03-04 00:00:00'),(5,87546,5,'Manager','1997-02-06 00:00:00','2000-03-04 00:00:00'),(6,56780,6,'Manager','1998-04-05 00:00:00','2000-03-04 00:00:00'),(7,56745,7,'Manager','1994-05-03 00:00:00','2000-03-04 00:00:00'),(8,55431,8,'Manager','1987-06-08 00:00:00','2000-03-04 00:00:00'),(9,54452,9,'Manager','1999-05-07 00:00:00','2000-03-04 00:00:00'),(10,53418,10,'Manager','1990-04-01 00:00:00','2000-03-04 00:00:00'),(11,53412,11,'Manager','1990-01-01 00:00:00','2000-03-04 00:00:00'),(12,42365,12,'Manager','1990-01-02 00:00:00','2000-03-04 00:00:00'),(13,23453,13,'Manager','1990-04-05 00:00:00','2000-03-04 00:00:00'),(14,10123,14,'Manager','2000-02-06 00:00:00','2000-03-04 00:00:00'),(15,9076,15,'Manager','1990-05-09 00:00:00','2000-03-04 00:00:00'),(16,7562,16,'Manager','2000-06-03 00:00:00','2004-03-04 00:00:00'),(17,6789,17,'Manager','1996-07-05 00:00:00','2000-03-04 00:00:00'),(18,6541,18,'Manager','1990-06-04 00:00:00','2000-03-04 00:00:00'),(19,6532,19,'Manager','1999-06-05 00:00:00','2000-03-04 00:00:00'),(20,5234,20,'Manager','2000-01-01 00:00:00','2005-03-04 00:00:00'),(21,3678,21,'Manager','1999-03-01 00:00:00','2000-03-04 00:00:00'),(22,3333,22,'Manager','2000-01-04 00:00:00','2007-03-04 00:00:00'),(23,1237,23,'Manager','2001-01-01 00:00:00','2010-03-04 00:00:00'),(24,1233,24,'Manager','2002-02-02 00:00:00','2007-03-04 00:00:00'),(25,1233,25,'Manager','2002-02-02 00:00:00','2007-03-04 00:00:00'),(26,1233,25,'Cleaner','2007-03-04 00:00:00','2007-03-04 00:00:00');
/*!40000 ALTER TABLE `Works` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updatemgr
before update on Works
for each row
begin
IF  EXISTS (select * from Works where HotelID = old.HotelID and Position = 'Manager'
 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'No manager exists for this hotel!';
END IF;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger deletemgr
before delete on Works
for each row
begin
IF  EXISTS (select * from Works where HotelID = old.HotelID and Position = 'Manager'
 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'No manager exists for this hotel!';
END IF;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `WorksHotel`
--

DROP TABLE IF EXISTS `WorksHotel`;
/*!50001 DROP VIEW IF EXISTS `WorksHotel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `WorksHotel` AS SELECT 
 1 AS `IRSNumber`,
 1 AS `HotelID`,
 1 AS `StartDate`,
 1 AS `FinishDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WorksHotelRoom`
--

DROP TABLE IF EXISTS `WorksHotelRoom`;
/*!50001 DROP VIEW IF EXISTS `WorksHotelRoom`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `WorksHotelRoom` AS SELECT 
 1 AS `HotelID`,
 1 AS `HotelRoomID`,
 1 AS `IRSNumber`,
 1 AS `StartDate`,
 1 AS `FinishDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `HotelHotelRoom`
--

/*!50001 DROP VIEW IF EXISTS `HotelHotelRoom`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HotelHotelRoom` AS select `Hotel`.`HotelID` AS `HotelID`,`HotelRoom`.`HotelRoomID` AS `HotelRoomID` from (`HotelRoom` join `Hotel` on((`HotelRoom`.`HotelID` = `Hotel`.`HotelID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HotelRoomCapacityView`
--

/*!50001 DROP VIEW IF EXISTS `HotelRoomCapacityView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HotelRoomCapacityView` AS select `HotelRoom`.`HotelRoomID` AS `HotelRoomID`,`HotelRoom`.`HotelID` AS `HotelID`,`HotelRoom`.`Price` AS `Price`,`HotelRoom`.`Capacity` AS `Capacity`,`HotelRoom`.`View` AS `View`,`HotelRoom`.`Expandable` AS `Expandable`,`HotelRoom`.`RepairsNeed` AS `RepairsNeed` from `HotelRoom` order by `HotelRoom`.`Capacity` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HotelRoomLocationView`
--

/*!50001 DROP VIEW IF EXISTS `HotelRoomLocationView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HotelRoomLocationView` AS select `HotelRoom`.`HotelRoomID` AS `HotelRoomID`,`Hotel`.`HotelID` AS `HotelID`,`HotelRoom`.`Price` AS `Price`,`HotelRoom`.`Expandable` AS `Expandable`,`HotelRoom`.`RepairsNeed` AS `RepairsNeed`,`Hotel`.`Stars` AS `Stars`,`Hotel`.`Street` AS `Street`,`Hotel`.`StreetNumber` AS `StreetNumber`,`Hotel`.`PostalCode` AS `PostalCode`,-(`Hotel`.`City`) AS `-City` from (`HotelRoom` join `Hotel` on((`Hotel`.`HotelID` = `HotelRoom`.`HotelID`))) order by `Hotel`.`City` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WorksHotel`
--

/*!50001 DROP VIEW IF EXISTS `WorksHotel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `WorksHotel` AS select `Works`.`IRSNumber` AS `IRSNumber`,`Hotel`.`HotelID` AS `HotelID`,`Works`.`StartDate` AS `StartDate`,`Works`.`FinishDate` AS `FinishDate` from (`Works` join `Hotel` on((`Works`.`HotelID` = `Hotel`.`HotelID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WorksHotelRoom`
--

/*!50001 DROP VIEW IF EXISTS `WorksHotelRoom`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `WorksHotelRoom` AS select `WorksHotel`.`HotelID` AS `HotelID`,`HotelHotelRoom`.`HotelRoomID` AS `HotelRoomID`,`WorksHotel`.`IRSNumber` AS `IRSNumber`,`WorksHotel`.`StartDate` AS `StartDate`,`WorksHotel`.`FinishDate` AS `FinishDate` from (`HotelHotelRoom` join `WorksHotel` on((`WorksHotel`.`HotelID` = `HotelHotelRoom`.`HotelID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-28 16:57:12
