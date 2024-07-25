-- MariaDB dump 10.19  Distrib 10.5.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: gocdb
-- ------------------------------------------------------
-- Server version	10.5.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `gocdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gocdb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `gocdb`;

--
-- Table structure for table `APIAuthenticationEntities`
--

DROP TABLE IF EXISTS `APIAuthenticationEntities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APIAuthenticationEntities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `lastRenewTime` datetime NOT NULL DEFAULT current_timestamp(),
  `lastUseTime` datetime DEFAULT NULL,
  `allowAPIWrite` tinyint(1) NOT NULL DEFAULT 1,
  `parentSite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siteIdentifier` (`parentSite_id`,`type`,`identifier`),
  KEY `IDX_F246713E8F200B9F` (`parentSite_id`),
  KEY `IDX_F246713EA76ED395` (`user_id`),
  CONSTRAINT `FK_F246713E8F200B9F` FOREIGN KEY (`parentSite_id`) REFERENCES `Sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F246713EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APIAuthenticationEntities`
--

LOCK TABLES `APIAuthenticationEntities` WRITE;
/*!40000 ALTER TABLE `APIAuthenticationEntities` DISABLE KEYS */;
/*!40000 ALTER TABLE `APIAuthenticationEntities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArchivedNGIs`
--

DROP TABLE IF EXISTS `ArchivedNGIs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArchivedNGIs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deletedBy` varchar(255) NOT NULL,
  `deletedDate` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  `parentProjects` varchar(255) DEFAULT NULL,
  `originalCreationDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArchivedNGIs`
--

LOCK TABLES `ArchivedNGIs` WRITE;
/*!40000 ALTER TABLE `ArchivedNGIs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArchivedNGIs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArchivedServiceGroups`
--

DROP TABLE IF EXISTS `ArchivedServiceGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArchivedServiceGroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deletedBy` varchar(255) NOT NULL,
  `deletedDate` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  `services` varchar(500) DEFAULT NULL,
  `originalCreationDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArchivedServiceGroups`
--

LOCK TABLES `ArchivedServiceGroups` WRITE;
/*!40000 ALTER TABLE `ArchivedServiceGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArchivedServiceGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArchivedServices`
--

DROP TABLE IF EXISTS `ArchivedServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArchivedServices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deletedBy` varchar(255) NOT NULL,
  `deletedDate` datetime NOT NULL,
  `hostName` varchar(255) NOT NULL,
  `serviceType` varchar(255) NOT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  `parentSite` varchar(255) DEFAULT NULL,
  `monitored` tinyint(1) DEFAULT NULL,
  `beta` tinyint(1) DEFAULT NULL,
  `production` tinyint(1) DEFAULT NULL,
  `originalCreationDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArchivedServices`
--

LOCK TABLES `ArchivedServices` WRITE;
/*!40000 ALTER TABLE `ArchivedServices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArchivedServices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArchivedSites`
--

DROP TABLE IF EXISTS `ArchivedSites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArchivedSites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deletedBy` varchar(255) NOT NULL,
  `deletedDate` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  `CertStatus` varchar(255) DEFAULT NULL,
  `V4PrimaryKey` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `parentNgi` varchar(255) DEFAULT NULL,
  `Infrastructure` varchar(255) DEFAULT NULL,
  `originalCreationDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArchivedSites`
--

LOCK TABLES `ArchivedSites` WRITE;
/*!40000 ALTER TABLE `ArchivedSites` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArchivedSites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CertificationStatusLogs`
--

DROP TABLE IF EXISTS `CertificationStatusLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CertificationStatusLogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oldStatus` varchar(255) DEFAULT NULL,
  `newStatus` varchar(255) DEFAULT NULL,
  `addedBy` varchar(255) DEFAULT NULL,
  `addedDate` datetime DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `parentSite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AD3967FE8F200B9F` (`parentSite_id`),
  CONSTRAINT `FK_AD3967FE8F200B9F` FOREIGN KEY (`parentSite_id`) REFERENCES `Sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CertificationStatusLogs`
--

LOCK TABLES `CertificationStatusLogs` WRITE;
/*!40000 ALTER TABLE `CertificationStatusLogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `CertificationStatusLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CertificationStatuses`
--

DROP TABLE IF EXISTS `CertificationStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CertificationStatuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4E5B6D45E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CertificationStatuses`
--

LOCK TABLES `CertificationStatuses` WRITE;
/*!40000 ALTER TABLE `CertificationStatuses` DISABLE KEYS */;
INSERT INTO `CertificationStatuses` VALUES (1,'Candidate'),(2,'Certified'),(3,'Closed'),(4,'Suspended'),(5,'Uncertified');
/*!40000 ALTER TABLE `CertificationStatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DF97690E5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (1,'Bosnia and Herzegovina','BA'),(2,'New Zealand','NZ'),(3,'Indonesia','ID'),(4,'Moldova','MD'),(5,'Armenia','AM'),(6,'Albania','AL'),(7,'Georgia','GE'),(8,'Montenegro','ME'),(9,'Iran','IR'),(10,'Ukraine','UA'),(11,'Malaysia','MY'),(12,'Senegal','SN'),(13,'South Africa','ZA'),(14,'Belarus','BY'),(15,'Azerbaijan','AZ'),(16,'Austria','AT'),(17,'Hungary','HU'),(18,'Ireland','IE'),(19,'Israel','IL'),(20,'Italy','IT'),(21,'Japan','JP'),(22,'Netherlands','NL'),(23,'Pakistan','PK'),(24,'Poland','PL'),(25,'Portugal','PT'),(26,'Puerto Rico','PR'),(27,'Bulgaria','BG'),(28,'Romania','RO'),(29,'Russia','RU'),(30,'Slovakia','SK'),(31,'Spain','ES'),(32,'Sweden','SE'),(33,'Switzerland','CH'),(34,'Taiwan','TW'),(35,'United Kingdom','GB'),(36,'France','FR'),(37,'Greece','GR'),(38,'Germany','DE'),(39,'Czech Republic','CZ'),(40,'United States of America','US'),(41,'India','IN'),(42,'Canada','CA'),(43,'Brazil','BR'),(44,'Singapore','SG'),(45,'South Korea','KR'),(46,'Belgium','BE'),(47,'Slovenia','SI'),(48,'Serbia','RS'),(49,'Croatia','HR'),(50,'Turkey','TR'),(51,'Norway','NO'),(52,'China','CN'),(53,'Estonia','EE'),(54,'Latvia','LV'),(55,'Lithuania','LT'),(56,'Australia','AU'),(57,'Denmark','DK'),(58,'Finland','FI'),(59,'Cyprus','CY'),(60,'Republic of Macedonia','MK'),(61,'Colombia','CO'),(62,'Vietnam','VN'),(63,'Philippines','PH'),(64,'Morocco','MA'),(65,'Mexico','MX'),(66,'Argentina','AR'),(67,'Belize','BZ'),(68,'Bolivia','BO'),(69,'Chile','CL'),(70,'Costa Rica','CR'),(71,'Cuba','CU'),(72,'Dominican Republic','DO'),(73,'Ecuador','EC'),(74,'El Salvador','SV'),(75,'Guatemala','GT'),(76,'Haiti','HT'),(77,'Honduras','HN'),(78,'Nicaragua','NI'),(79,'Panama','PA'),(80,'Paraguay','PY'),(81,'Peru','PE'),(82,'Uruguay','UY'),(83,'Venezuela','VE'),(84,'Thailand','TH'),(85,'Afghanistan','AF'),(86,'Algeria','DZ'),(87,'American Samoa','AS'),(88,'Andorra','AD'),(89,'Angola','AO'),(90,'Anguilla','AI'),(91,'Antarctica','AQ'),(92,'Antigua and Barbuda','AG'),(93,'Aruba','AW'),(94,'Bahamas','BS'),(95,'Bahrain','BH'),(96,'Bangladesh','BD'),(97,'Barbados','BB'),(98,'Benin','BJ'),(99,'Bermuda','BM'),(100,'Bhutan','BT'),(101,'Botswana','BW'),(102,'British Indian Ocean Territory','IO'),(103,'British Virgin Islands','VG'),(104,'Brunei','BN'),(105,'Burkina Faso','BF'),(106,'Burma (Myanmar)','MM'),(107,'Burundi','BI'),(108,'Cambodia','KH'),(109,'Cameroon','CM'),(110,'Cape Verde','CV'),(111,'Cayman Islands','KY'),(112,'Central African Republic','CF'),(113,'Chad','TD'),(114,'Christmas Island','CX'),(115,'Cocos (Keeling) Islands','CC'),(116,'Comoros','KM'),(117,'Cook Islands','CK'),(118,'Democratic Republic of the Congo','CD'),(119,'Djibouti','DJ'),(120,'Dominica','DM'),(121,'Egypt','EG'),(122,'Equatorial Guinea','GQ'),(123,'Eritrea','ER'),(124,'Ethiopia','ET'),(125,'Falkland Islands','FK'),(126,'Faroe Islands','FO'),(127,'Fiji','FJ'),(128,'French Polynesia','PF'),(129,'Gabon','GA'),(130,'Gambia','GM'),(131,'Gaza St','ip'),(132,'Ghana','GH'),(133,'Gibraltar','GI'),(134,'Greenland','GL'),(135,'Grenada','GD'),(136,'Guam','GU'),(137,'Guinea','GN'),(138,'Guinea-Bissau','GW'),(139,'Guyana','GY'),(140,'Holy See (Vatican City)','VA'),(141,'Hong Kong','HK'),(142,'Iceland','IS'),(143,'Iraq','IQ'),(144,'Isle of Man','IM'),(145,'Ivory Coast','CI'),(146,'Jamaica','JM'),(147,'Jersey','JE'),(148,'Jordan','JO'),(149,'Kazakhstan','KZ'),(150,'Kenya','KE'),(151,'Kiribati','KI'),(152,'Kos','vo'),(153,'Kuwait','KW'),(154,'Kyrgyzstan','KG'),(155,'Laos','LA'),(156,'Lebanon','LB'),(157,'Lesotho','LS'),(158,'Liberia','LR'),(159,'Libya','LY'),(160,'Liechtenstein','LI'),(161,'Luxembourg','LU'),(162,'Macau','MO'),(163,'Madagascar','MG'),(164,'Malawi','MW'),(165,'Maldives','MV'),(166,'Mali','ML'),(167,'Malta','MT'),(168,'Marshall Islands','MH'),(169,'Mauritania','MR'),(170,'Mauritius','MU'),(171,'Mayotte','YT'),(172,'Micronesia','FM'),(173,'Monaco','MC'),(174,'Mongolia','MN'),(175,'Montserrat','MS'),(176,'Mozambique','MZ'),(177,'Namibia','NA'),(178,'Nauru','NR'),(179,'Nepal','NP'),(180,'Netherlands Antilles','AN'),(181,'New Caledonia','NC'),(182,'Niger','NE'),(183,'Nigeria','NG'),(184,'Niue','NU'),(185,'North Korea','KP'),(186,'Northern Mariana Islands','MP'),(187,'Oman','OM'),(188,'Palau','PW'),(189,'Papua New Guinea','PG'),(190,'Pitcairn Islands','PN'),(191,'Qatar','QA'),(192,'Republic of the Congo','CG'),(193,'Rwanda','RW'),(194,'Saint Barthelemy','BL'),(195,'Saint Helena','SH'),(196,'Saint Kitts and Nevis','KN'),(197,'Saint Lucia','LC'),(198,'Saint Martin','MF'),(199,'Saint Pierre and Miquelon','PM'),(200,'Saint Vincent and the Grenadines','VC'),(201,'Samoa','WS'),(202,'San Marino','SM'),(203,'Sao Tome and Principe','ST'),(204,'Saudi Arabia','SA'),(205,'Seychelles','SC'),(206,'Sierra Leone','SL'),(207,'Solomon Islands','SB'),(208,'Somalia','SO'),(209,'Sri Lanka','LK'),(210,'Sudan','SD'),(211,'Suriname','SR'),(212,'Svalbard','SJ'),(213,'Swaziland','SZ'),(214,'Syria','SY'),(215,'Tajikistan','TJ'),(216,'Tanzania','TZ'),(217,'Timor-Leste','TL'),(218,'Togo','TG'),(219,'Tokelau','TK'),(220,'Tonga','TO'),(221,'Trinidad and Tobago','TT'),(222,'Tunisia','TN'),(223,'Turkmenistan','TM'),(224,'Turks and Caicos Islands','TC'),(225,'Tuvalu','TV'),(226,'Uganda','UG'),(227,'United Arab Emirates','AE'),(228,'US Virgin Islands','VI'),(229,'Uzbekistan','UZ'),(230,'Vanuatu','VU'),(231,'Wallis and Futuna','WF'),(232,'Western Sahara','EH'),(233,'Yemen','YE'),(234,'Zambia','ZM'),(235,'Zimbabwe','ZW');
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Downtimes`
--

DROP TABLE IF EXISTS `Downtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Downtimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(4000) NOT NULL,
  `severity` varchar(255) NOT NULL,
  `classification` varchar(255) NOT NULL,
  `insertDate` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `primaryKey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AC786DACF5422415` (`primaryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Downtimes`
--

LOCK TABLES `Downtimes` WRITE;
/*!40000 ALTER TABLE `Downtimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Downtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Downtimes_EndpointLocations`
--

DROP TABLE IF EXISTS `Downtimes_EndpointLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Downtimes_EndpointLocations` (
  `downtime_id` int(11) NOT NULL,
  `endpointLocation_id` int(11) NOT NULL,
  PRIMARY KEY (`downtime_id`,`endpointLocation_id`),
  KEY `IDX_2467A3653943157B` (`downtime_id`),
  KEY `IDX_2467A365A251422F` (`endpointLocation_id`),
  CONSTRAINT `FK_2467A3653943157B` FOREIGN KEY (`downtime_id`) REFERENCES `Downtimes` (`id`),
  CONSTRAINT `FK_2467A365A251422F` FOREIGN KEY (`endpointLocation_id`) REFERENCES `EndpointLocations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Downtimes_EndpointLocations`
--

LOCK TABLES `Downtimes_EndpointLocations` WRITE;
/*!40000 ALTER TABLE `Downtimes_EndpointLocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Downtimes_EndpointLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Downtimes_Services`
--

DROP TABLE IF EXISTS `Downtimes_Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Downtimes_Services` (
  `downtime_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`downtime_id`,`service_id`),
  KEY `IDX_5CA34D143943157B` (`downtime_id`),
  KEY `IDX_5CA34D14ED5CA9E6` (`service_id`),
  CONSTRAINT `FK_5CA34D143943157B` FOREIGN KEY (`downtime_id`) REFERENCES `Downtimes` (`id`),
  CONSTRAINT `FK_5CA34D14ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Downtimes_Services`
--

LOCK TABLES `Downtimes_Services` WRITE;
/*!40000 ALTER TABLE `Downtimes_Services` DISABLE KEYS */;
/*!40000 ALTER TABLE `Downtimes_Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EndpointLocations`
--

DROP TABLE IF EXISTS `EndpointLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EndpointLocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `interfaceName` varchar(255) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `monitored` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_498F8DB5ED5CA9E6` (`service_id`),
  CONSTRAINT `FK_498F8DB5ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EndpointLocations`
--

LOCK TABLES `EndpointLocations` WRITE;
/*!40000 ALTER TABLE `EndpointLocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `EndpointLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Endpoint_Properties`
--

DROP TABLE IF EXISTS `Endpoint_Properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Endpoint_Properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyName` varchar(255) NOT NULL,
  `keyValue` varchar(255) DEFAULT NULL,
  `parentEndpoint_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `endpointproperty_keypairs` (`parentEndpoint_id`,`keyName`),
  KEY `IDX_AFD1580D833B85C9` (`parentEndpoint_id`),
  CONSTRAINT `FK_AFD1580D833B85C9` FOREIGN KEY (`parentEndpoint_id`) REFERENCES `EndpointLocations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Endpoint_Properties`
--

LOCK TABLES `Endpoint_Properties` WRITE;
/*!40000 ALTER TABLE `Endpoint_Properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `Endpoint_Properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Infrastructures`
--

DROP TABLE IF EXISTS `Infrastructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Infrastructures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_63154B605E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Infrastructures`
--

LOCK TABLES `Infrastructures` WRITE;
/*!40000 ALTER TABLE `Infrastructures` DISABLE KEYS */;
INSERT INTO `Infrastructures` VALUES (4,'PPS'),(1,'Production'),(3,'SC'),(2,'Test');
/*!40000 ALTER TABLE `Infrastructures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LinkIdentityRequests`
--

DROP TABLE IF EXISTS `LinkIdentityRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LinkIdentityRequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primaryIdString` varchar(255) NOT NULL,
  `currentIdString` varchar(255) NOT NULL,
  `confirmCode` varchar(255) NOT NULL,
  `primaryAuthType` varchar(255) NOT NULL,
  `currentAuthType` varchar(255) NOT NULL,
  `creationDate` datetime NOT NULL,
  `primaryUserId` int(11) NOT NULL,
  `currentUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EBD75E667C347DBB` (`primaryUserId`),
  UNIQUE KEY `UNIQ_EBD75E664D3CD362` (`currentUserId`),
  CONSTRAINT `FK_EBD75E664D3CD362` FOREIGN KEY (`currentUserId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EBD75E667C347DBB` FOREIGN KEY (`primaryUserId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LinkIdentityRequests`
--

LOCK TABLES `LinkIdentityRequests` WRITE;
/*!40000 ALTER TABLE `LinkIdentityRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `LinkIdentityRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NGIs`
--

DROP TABLE IF EXISTS `NGIs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NGIs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `rodEmail` varchar(255) DEFAULT NULL,
  `helpdeskEmail` varchar(255) DEFAULT NULL,
  `securityEmail` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ggus_Su` varchar(255) DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C7EDBF9D5E237E06` (`name`),
  CONSTRAINT `FK_C7EDBF9DBF396750` FOREIGN KEY (`id`) REFERENCES `OwnedEntities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NGIs`
--

LOCK TABLES `NGIs` WRITE;
/*!40000 ALTER TABLE `NGIs` DISABLE KEYS */;
/*!40000 ALTER TABLE `NGIs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NGIs_Scopes`
--

DROP TABLE IF EXISTS `NGIs_Scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NGIs_Scopes` (
  `ngi_Id` int(11) NOT NULL,
  `scope_Id` int(11) NOT NULL,
  PRIMARY KEY (`ngi_Id`,`scope_Id`),
  KEY `IDX_A4166208E284E4DD` (`ngi_Id`),
  KEY `IDX_A4166208FDAF7D93` (`scope_Id`),
  CONSTRAINT `FK_A4166208E284E4DD` FOREIGN KEY (`ngi_Id`) REFERENCES `NGIs` (`id`),
  CONSTRAINT `FK_A4166208FDAF7D93` FOREIGN KEY (`scope_Id`) REFERENCES `Scopes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NGIs_Scopes`
--

LOCK TABLES `NGIs_Scopes` WRITE;
/*!40000 ALTER TABLE `NGIs_Scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `NGIs_Scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OwnedEntities`
--

DROP TABLE IF EXISTS `OwnedEntities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OwnedEntities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discr` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OwnedEntities`
--

LOCK TABLES `OwnedEntities` WRITE;
/*!40000 ALTER TABLE `OwnedEntities` DISABLE KEYS */;
/*!40000 ALTER TABLE `OwnedEntities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrimaryKeys`
--

DROP TABLE IF EXISTS `PrimaryKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrimaryKeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrimaryKeys`
--

LOCK TABLES `PrimaryKeys` WRITE;
/*!40000 ALTER TABLE `PrimaryKeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `PrimaryKeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projects`
--

DROP TABLE IF EXISTS `Projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Projects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A5E5D1F25E237E06` (`name`),
  CONSTRAINT `FK_A5E5D1F2BF396750` FOREIGN KEY (`id`) REFERENCES `OwnedEntities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projects`
--

LOCK TABLES `Projects` WRITE;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `Projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projects_NGIs`
--

DROP TABLE IF EXISTS `Projects_NGIs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Projects_NGIs` (
  `project_Id` int(11) NOT NULL,
  `ngi_Id` int(11) NOT NULL,
  PRIMARY KEY (`project_Id`,`ngi_Id`),
  KEY `IDX_4A8D48A083E93B3E` (`project_Id`),
  KEY `IDX_4A8D48A0E284E4DD` (`ngi_Id`),
  CONSTRAINT `FK_4A8D48A083E93B3E` FOREIGN KEY (`project_Id`) REFERENCES `Projects` (`id`),
  CONSTRAINT `FK_4A8D48A0E284E4DD` FOREIGN KEY (`ngi_Id`) REFERENCES `NGIs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projects_NGIs`
--

LOCK TABLES `Projects_NGIs` WRITE;
/*!40000 ALTER TABLE `Projects_NGIs` DISABLE KEYS */;
/*!40000 ALTER TABLE `Projects_NGIs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoleActionRecords`
--

DROP TABLE IF EXISTS `RoleActionRecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleActionRecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actionDate` datetime NOT NULL,
  `updatedByUserId` int(11) NOT NULL,
  `updatedByUserPrinciple` varchar(255) NOT NULL,
  `roleId` int(11) NOT NULL,
  `rolePreStatus` varchar(255) NOT NULL,
  `roleNewStatus` varchar(255) NOT NULL,
  `roleTypeId` int(11) NOT NULL,
  `roleTypeName` varchar(255) NOT NULL,
  `roleTargetOwnedEntityId` int(11) NOT NULL,
  `roleTargetOwnedEntityType` varchar(255) NOT NULL,
  `roleUserId` int(11) NOT NULL,
  `roleUserPrinciple` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoleActionRecords`
--

LOCK TABLES `RoleActionRecords` WRITE;
/*!40000 ALTER TABLE `RoleActionRecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `RoleActionRecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoleTypes`
--

DROP TABLE IF EXISTS `RoleTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleTypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F99A26185E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoleTypes`
--

LOCK TABLES `RoleTypes` WRITE;
/*!40000 ALTER TABLE `RoleTypes` DISABLE KEYS */;
INSERT INTO `RoleTypes` VALUES (15,'CIC Staff'),(11,'COD Administrator'),(10,'COD Staff'),(13,'Chief Operations Officer'),(12,'EGI CSIRT Officer'),(8,'NGI Operations Deputy Manager'),(9,'NGI Operations Manager'),(7,'NGI Security Officer'),(5,'Regional First Line Support'),(16,'Regional Staff'),(6,'Regional Staff (ROD)'),(14,'Service Group Administrator'),(1,'Site Administrator'),(3,'Site Operations Deputy Manager'),(4,'Site Operations Manager'),(2,'Site Security Officer');
/*!40000 ALTER TABLE `RoleTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `roleType_id` int(11) DEFAULT NULL,
  `ownedEntity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NoDuplicateRoles` (`user_id`,`roleType_id`,`ownedEntity_id`),
  KEY `IDX_77FF01C358E4B33D` (`roleType_id`),
  KEY `IDX_77FF01C3A76ED395` (`user_id`),
  KEY `IDX_77FF01C31144F2F2` (`ownedEntity_id`),
  CONSTRAINT `FK_77FF01C31144F2F2` FOREIGN KEY (`ownedEntity_id`) REFERENCES `OwnedEntities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_77FF01C358E4B33D` FOREIGN KEY (`roleType_id`) REFERENCES `RoleTypes` (`id`),
  CONSTRAINT `FK_77FF01C3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scopes`
--

DROP TABLE IF EXISTS `Scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Scopes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_378E6065E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scopes`
--

LOCK TABLES `Scopes` WRITE;
/*!40000 ALTER TABLE `Scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceGroup_Properties`
--

DROP TABLE IF EXISTS `ServiceGroup_Properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceGroup_Properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyName` varchar(255) NOT NULL,
  `keyValue` varchar(255) DEFAULT NULL,
  `parentServiceGroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sgroup_keypairs` (`parentServiceGroup_id`,`keyName`),
  KEY `IDX_5553B348F68F1FEA` (`parentServiceGroup_id`),
  CONSTRAINT `FK_5553B348F68F1FEA` FOREIGN KEY (`parentServiceGroup_id`) REFERENCES `ServiceGroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceGroup_Properties`
--

LOCK TABLES `ServiceGroup_Properties` WRITE;
/*!40000 ALTER TABLE `ServiceGroup_Properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServiceGroup_Properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceGroups`
--

DROP TABLE IF EXISTS `ServiceGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceGroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `monitored` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_67F576C8BF396750` FOREIGN KEY (`id`) REFERENCES `OwnedEntities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceGroups`
--

LOCK TABLES `ServiceGroups` WRITE;
/*!40000 ALTER TABLE `ServiceGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServiceGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceGroups_Scopes`
--

DROP TABLE IF EXISTS `ServiceGroups_Scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceGroups_Scopes` (
  `serviceGroup_Id` int(11) NOT NULL,
  `scope_Id` int(11) NOT NULL,
  PRIMARY KEY (`serviceGroup_Id`,`scope_Id`),
  KEY `IDX_FEE72E22296A2C52` (`serviceGroup_Id`),
  KEY `IDX_FEE72E22FDAF7D93` (`scope_Id`),
  CONSTRAINT `FK_FEE72E22296A2C52` FOREIGN KEY (`serviceGroup_Id`) REFERENCES `ServiceGroups` (`id`),
  CONSTRAINT `FK_FEE72E22FDAF7D93` FOREIGN KEY (`scope_Id`) REFERENCES `Scopes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceGroups_Scopes`
--

LOCK TABLES `ServiceGroups_Scopes` WRITE;
/*!40000 ALTER TABLE `ServiceGroups_Scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServiceGroups_Scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceGroups_Services`
--

DROP TABLE IF EXISTS `ServiceGroups_Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceGroups_Services` (
  `serviceGroup_Id` int(11) NOT NULL,
  `service_Id` int(11) NOT NULL,
  PRIMARY KEY (`serviceGroup_Id`,`service_Id`),
  KEY `IDX_EE13D584296A2C52` (`serviceGroup_Id`),
  KEY `IDX_EE13D58478D88D44` (`service_Id`),
  CONSTRAINT `FK_EE13D584296A2C52` FOREIGN KEY (`serviceGroup_Id`) REFERENCES `ServiceGroups` (`id`),
  CONSTRAINT `FK_EE13D58478D88D44` FOREIGN KEY (`service_Id`) REFERENCES `Services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceGroups_Services`
--

LOCK TABLES `ServiceGroups_Services` WRITE;
/*!40000 ALTER TABLE `ServiceGroups_Services` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServiceGroups_Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceTypes`
--

DROP TABLE IF EXISTS `ServiceTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceTypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `monitoringException` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_13A6B93B5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceTypes`
--

LOCK TABLES `ServiceTypes` WRITE;
/*!40000 ALTER TABLE `ServiceTypes` DISABLE KEYS */;
INSERT INTO `ServiceTypes` VALUES (1,'CE','[Site service] The LCG Compute Element. Currently the standard CE within the gLite middleware stack. Soon to be replaced by the CREAM CE. ',0),(2,'UI','[User service] The User Interface. Can be installed by users but more commonly installed by a site. ',0),(3,'APEL','[Site service] This is a \"dummy\" Service Type to enable the monitoring tests for APEL accounting. All EGEE sites must have one instance of this Service Type, associated with a CE. ',0),(4,'RB','[OBSOLETE Central service] The LCG Resource Broker is now obsolete and is not supported. Please avoid using this middleware service. ',0),(5,'WMS','[Central service] gLite Workload Management Service. Acts as the broker for matching user jobs to available computing resources. ',0),(6,'gLite-CE','[OBSOLETE Site service] The gLite Compute Element is now obsolete and is not supported. Please avoid using this middleware service. ',0),(7,'Local-LFC','[Site service] An instance of the gLite file catalogue which holds entries for files owned by a particular VO, at your site. NOTE: An LFC can be both Central and Local. ',0),(8,'Top-BDII','[Central service] This is the \"top-level BDII\". These collect data from site-BDIIs and publish the data. Only a few instances per region are required. ',0),(9,'VOMS','[Central service]  VO Management System. Part of the authentication and authorization system. This service only needs to be installed on the request of a VO. ',0),(10,'VO-box','[Site service] The gLite VO box allows a VO to run their own services at a site. This service only needs to be installed on the request of a VO. ',0),(11,'Central-LFC','[Central service] An instance of the gLite file catalogue which holds entries for all files owned by a particular VO. NOTE: An LFC can be both Central and Local. ',0),(12,'Classic-SE','[OBSOLETE Site service] The Classic Storage Element is now obsolete and is not supported. Please avoid using this middleware service. ',0),(13,'MON','[Site service] The gLite MonBox hosts the site R-GMA services. ',0),(14,'Site-BDII','[Site service] This service collects and publishes site\'s data for the Information System. All sites MUST install one Site-BDII. ',0),(15,'MyProxy','[Central service] The My Proxy service is part of the authentication and authorization system. Often installed by sites installing the WMS service. ',0),(16,'FTS','[Central service] The gLite File Transfer Service manages the transfer of files between sites. This service only needs to be installed on the request of a VO. ',0),(17,'RGMA-IC','[Central service] This is the Registry for an R-GMA service. There will only ever be a few of these per grid. ',0),(18,'CREAM-CE','[Site service] The CREAM Compute Element is the new CE within the gLite middleware stack. ',0),(19,'ARC-CE','[Site service] The Compute Element within the ARC middleware stack. ',0),(20,'FTM','[Site service] gLite File Transfer Monitor. Monitors the FTS service at a site. ',0),(21,'AMGA','[Central service] gLite metadata catalogue. This service only needs to be installed on the request of a VO. ',0),(22,'LB','[Central service]  gLite Logging and Bookkeeping. Usually installed by sites running a WMS. One LB service can support several WMS instances. ',0),(23,'SRM','[Site service] Storage Resource Manager. Mandatory for all sites running an SRM enabled storage element. ',0),(24,'ngi.SAM','[Regional Service] NGI-level SAM monitoring box',0),(25,'OpsTool','[Central service] generic service representing an operation tool (topology repository, dashboard, helpdesk system...)',0),(26,'gLite-APEL','[Site service] The gLite-APEL hosts the site Accounting client (3.2 replacement of the MonBox)',0),(27,'globus-GRIDFTP','[Site service] storage endpoint and data transfer service for the Globus middleware stack',0),(28,'GRAM5','[Site service] job submission service for Globus version 5.x (GRAM5)',0),(29,'globus-GSISSHD','[Site service] certificate based interactive login service for the Globus middleware stack',0),(30,'unicore6.Registry','[Central service] All UNICORE services register here; clients ask the registry for available services in the Grid. Normally one Registry per Grid infrastructure which collects URLs of services.',0),(31,'unicore6.Gateway','[Site service] Sits in front of one or more UNICORE services as a gateway to the internet. Normally one Gateway per site.',0),(32,'gLExec','gLExec is a lightweight gatekeeper that takes local policy into account for authentication and authorization. ',0),(33,'egi.APELRepository','[Central Service] The central APEL Repository',0),(34,'egi.MetricsPortal','[Central Service] The central metrics portal',0),(35,'egi.OpsPortal','[Central Service] The central operations portal',0),(36,'egi.SAM','[Central Service] The central SAM monitoring',0),(37,'emi.ARGUS','[Site Service] The Argus Authorization Service renders XACML authorization decisions for distributed services, based on policies',0),(38,'SGAS','SGAS accounting service',0),(39,'egi.NetworkPortal','[Central Service] The central network portal',0),(40,'unicore6.StorageManagement','Provides an abstract filesystem-like view on a storage resource. A Storage Management Service (SMS) can be created by a Storage Factory or can be configured statically way by a config file.',0),(41,'unicore6.ServiceOrchestrator','Handles dispatching of a workflow\'s atomic jobs, and brokering. Normally there is one per grid infrastructure.',0),(42,'egi.AccountingPortal','[Central Service] The central Accounting Portal',0),(43,'egi.GGUS','[Central Service] The central GGUS',0),(44,'egi.GOCDB','[Central Service] The central GOCDB',0),(45,'egi.MSGBroker','[Central Service] The central message broker',0),(46,'egi.GRIDVIEW','[Central Service] The central Gridview',0),(47,'egi.GSTAT','[Central Service] The central GStat',0),(48,'ngi.OpsPortal','[NGI Service] A regional operations portal',0),(49,'unicore6.TargetSystemFactory','Used as an entry-point for submitting single jobs. It can create Target System Services (TSSs) and submit jobs to those TSSs',0),(50,'unicore6.StorageFactory','Creates StorageManagement instances. A user can create dynamic storage management services for own purposes with it. Often used to provide filespace during workflow execution. ',0),(51,'unicore6.WorkflowFactory','Used as an entrypoint for submitting workflow jobs. The Workflow factory is creating workflow instances and can submit workflows to them. It is the workflow submission equivalent to the Target System Factory used for single job submission. ',0),(52,'unicore6.UVOSAssertionQueryService','Provides data and user information via the SAML standard as needed for authorization and environment customization.',0),(53,'globus-RLS','The globus Replica Location Service',0),(54,'site.SAM','A SAM instance for a site',0),(55,'QCG.Computing','QosCosGrid (QCG) Basic Execution Service (BES) with advanced reservation support',0),(56,'QCG.Notification','QosCosGrid (QCG) notification middleware component using a brokered version of the OASIS WS-Notification standard',0),(57,'QCG.Broker','QosCosGrid (QCG) resource management and brokering service',0),(58,'CUSTOM_SERVICE','A proprietary service type',0),(59,'dg.CREAM-CE','CREAM gateway to Desktop Grid',0),(60,'dg.ARC-CE','ARC gateway to Desktop Grid',0),(61,'dg.TargetSystemFactory','UNICORE gateway to Desktop Grid',0),(62,'vo.SAM','A SAM instance for a Virtual Organization',0),(63,'CUSTOM.ch.cern.frontier.FroNTier','FroNTier N-Tier data distribution system. http://frontier.cern.ch/',0),(64,'org.irods.irods3','iRODS is a distributed file storage system',0),(65,'org.squid-cache.Squid','Squid proxy server / web cache. www.squid-cache.org',0),(66,'egi.AppDB','EGI Applications Database',0),(67,'egi.TMP','EGI Training Marketplace',0),(68,'egi.CRM','EGI Customer Relation Manager',0),(69,'egi.VODashboard','EGI VO Dashboard',0),(70,'org.ogf.bes.BESFactory','[site] BES job submission entry point.',0),(71,'net.perfSONAR.Bandwidth','perfSONAR (Bandwidth Test)',0),(72,'net.perfSONAR.Latency','perfSONAR (Latency Test)',0),(73,'CUSTOM.UserPortal','Generic user portal ',0),(74,'CUSTOM.RequestTracker','Generic request tracker',0),(75,'CUSTOM.pl.plgrid.Bazaar','SLA negotiation system between users and resource providers from NGI_PL grid ',0),(76,'CUSTOM.pl.plgrid.BazaarSAT','Bazaar Site Admin Toolkit from NGI_PL grid',0),(77,'CUSTOM.pl.plgrid.BAT.agent','Service for collecting accounting data from NGI_PL grid ',0),(78,'CUSTOM.pl.plgrid.QStorMan.UserInterface','A service to provide a user of the grid system with a certain level of quality from NGI_PL grid ',0),(79,'CUSTOM.pl.plgrid.KeyFS',' Key File System (KeyFS) service, installed on UI (User Interface) machines can provide a user with the grid credentials, from NGI_PL grid',0),(80,'pl.cyfronet.gridspace2','Virtual laboratory framework enabling researchers to conduct virtual experiments on Grid-based resources. ',0),(81,'pl.psnc.MigratingDesktop','Client framework for accessing the Grid resources',0),(82,'pl.cyfronet.InSilicoLab','InSilicoLab portal instance',0),(83,'com.adaptivecomputing.TorqueClient','TORQUE (Tera-scale Open-source Resource and QUEue manager) is a resource manager providing control over batch jobs and distributed compute nodes. Torque is based on OpenPBS.',0),(84,'org.vinetoolkit.VinePortal','Vine toolkit portal instance',0),(85,'eu.egi.cloud.vm-management.occi','EGI cloud service type',0),(86,'eu.egi.cloud.storage-management.cdmi','EGI cloud service type',0),(87,'eu.egi.cloud.vm-metadata.marketplace','EGI cloud service type',0),(88,'XRootD','XRootD storage implementation which supports xroot protocol',0),(89,'XRootD.Redirector','Data access redirection service using XRoot protocol',0),(90,'ch.cern.cvmfs.stratum.0','Service component (stratum.0) of CernVM file system',0),(91,'ch.cern.cvmfs.stratum.1','Service component (stratum.1) of CernVM file system',0),(92,'eu.egi.cloud.accounting','Service has required cloud accounting services',0),(93,'eu.egi.MPI','Defines an MPI test probe independent of a grid information system. This service will allow testing of sites which are offering MPI functionality but are not broadcasting it, or sites which are broadcasting the MPI/Parallel support in an incorrect way',0),(94,'eu.egi.cloud.information.bdii','FedCloud specific LDAP server which speaks GLUE2',0),(95,'uk.ac.gridpp.vac','A virtual machine factory system for operating clusters at grid sites',0),(96,'org.nordugrid.arex','ARC version 3',0);
/*!40000 ALTER TABLE `ServiceTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service_Properties`
--

DROP TABLE IF EXISTS `Service_Properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Service_Properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyName` varchar(255) NOT NULL,
  `keyValue` varchar(255) DEFAULT NULL,
  `parentService_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serv_keypairs` (`parentService_id`,`keyName`),
  KEY `IDX_389B3931ED624C5` (`parentService_id`),
  CONSTRAINT `FK_389B3931ED624C5` FOREIGN KEY (`parentService_id`) REFERENCES `Services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service_Properties`
--

LOCK TABLES `Service_Properties` WRITE;
/*!40000 ALTER TABLE `Service_Properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `Service_Properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `production` tinyint(1) NOT NULL,
  `beta` tinyint(1) NOT NULL,
  `monitored` tinyint(1) NOT NULL,
  `dn` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `ipV6Address` varchar(255) DEFAULT NULL,
  `operatingSystem` varchar(255) DEFAULT NULL,
  `architecture` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `url` varchar(255) DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `parentSite_id` int(11) DEFAULT NULL,
  `serviceType_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8A44833F8F200B9F` (`parentSite_id`),
  KEY `IDX_8A44833FCD0557BA` (`serviceType_id`),
  CONSTRAINT `FK_8A44833F8F200B9F` FOREIGN KEY (`parentSite_id`) REFERENCES `Sites` (`id`),
  CONSTRAINT `FK_8A44833FCD0557BA` FOREIGN KEY (`serviceType_id`) REFERENCES `ServiceTypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services`
--

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;
/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services_Scopes`
--

DROP TABLE IF EXISTS `Services_Scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Services_Scopes` (
  `service_Id` int(11) NOT NULL,
  `scope_Id` int(11) NOT NULL,
  PRIMARY KEY (`service_Id`,`scope_Id`),
  KEY `IDX_13D31A9E78D88D44` (`service_Id`),
  KEY `IDX_13D31A9EFDAF7D93` (`scope_Id`),
  CONSTRAINT `FK_13D31A9E78D88D44` FOREIGN KEY (`service_Id`) REFERENCES `Services` (`id`),
  CONSTRAINT `FK_13D31A9EFDAF7D93` FOREIGN KEY (`scope_Id`) REFERENCES `Scopes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services_Scopes`
--

LOCK TABLES `Services_Scopes` WRITE;
/*!40000 ALTER TABLE `Services_Scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Services_Scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Site_Properties`
--

DROP TABLE IF EXISTS `Site_Properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Site_Properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyName` varchar(255) NOT NULL,
  `keyValue` varchar(255) DEFAULT NULL,
  `parentSite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_keypairs` (`parentSite_id`,`keyName`),
  KEY `IDX_6052834C8F200B9F` (`parentSite_id`),
  CONSTRAINT `FK_6052834C8F200B9F` FOREIGN KEY (`parentSite_id`) REFERENCES `Sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Site_Properties`
--

LOCK TABLES `Site_Properties` WRITE;
/*!40000 ALTER TABLE `Site_Properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `Site_Properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sites`
--

DROP TABLE IF EXISTS `Sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sites` (
  `id` int(11) NOT NULL,
  `ngi_id` int(11) DEFAULT NULL,
  `infrastructure_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `timezone_id` int(11) DEFAULT NULL,
  `tier_id` int(11) DEFAULT NULL,
  `subgrid_id` int(11) DEFAULT NULL,
  `primaryKey` varchar(255) DEFAULT NULL,
  `shortName` varchar(255) NOT NULL,
  `officialName` varchar(255) DEFAULT NULL,
  `homeUrl` varchar(255) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `giisUrl` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `csirtEmail` varchar(255) DEFAULT NULL,
  `alarmEmail` varchar(255) DEFAULT NULL,
  `ipRange` varchar(255) DEFAULT NULL,
  `ipV6Range` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `csirtTel` varchar(255) DEFAULT NULL,
  `emergencyTel` varchar(255) DEFAULT NULL,
  `emergencyEmail` varchar(255) DEFAULT NULL,
  `helpdeskEmail` varchar(255) DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `certificationStatusChangeDate` datetime DEFAULT NULL,
  `timezoneId` varchar(255) DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `certificationStatus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7DC18567C43A885D` (`shortName`),
  UNIQUE KEY `UNIQ_7DC18567F5422415` (`primaryKey`),
  KEY `IDX_7DC185677700C07F` (`ngi_id`),
  KEY `IDX_7DC18567243E7A84` (`infrastructure_id`),
  KEY `IDX_7DC18567829B1E9` (`certificationStatus_id`),
  KEY `IDX_7DC18567F92F3E70` (`country_id`),
  KEY `IDX_7DC185673FE997DE` (`timezone_id`),
  KEY `IDX_7DC18567A354F9DC` (`tier_id`),
  KEY `IDX_7DC185676793C05A` (`subgrid_id`),
  CONSTRAINT `FK_7DC18567243E7A84` FOREIGN KEY (`infrastructure_id`) REFERENCES `Infrastructures` (`id`),
  CONSTRAINT `FK_7DC185673FE997DE` FOREIGN KEY (`timezone_id`) REFERENCES `Timezones` (`id`),
  CONSTRAINT `FK_7DC185676793C05A` FOREIGN KEY (`subgrid_id`) REFERENCES `SubGrids` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7DC185677700C07F` FOREIGN KEY (`ngi_id`) REFERENCES `NGIs` (`id`),
  CONSTRAINT `FK_7DC18567829B1E9` FOREIGN KEY (`certificationStatus_id`) REFERENCES `CertificationStatuses` (`id`),
  CONSTRAINT `FK_7DC18567A354F9DC` FOREIGN KEY (`tier_id`) REFERENCES `Tiers` (`id`),
  CONSTRAINT `FK_7DC18567BF396750` FOREIGN KEY (`id`) REFERENCES `OwnedEntities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7DC18567F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `Countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sites`
--

LOCK TABLES `Sites` WRITE;
/*!40000 ALTER TABLE `Sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sites_Scopes`
--

DROP TABLE IF EXISTS `Sites_Scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sites_Scopes` (
  `site_Id` int(11) NOT NULL,
  `scope_Id` int(11) NOT NULL,
  PRIMARY KEY (`site_Id`,`scope_Id`),
  KEY `IDX_B7074FAF633932E4` (`site_Id`),
  KEY `IDX_B7074FAFFDAF7D93` (`scope_Id`),
  CONSTRAINT `FK_B7074FAF633932E4` FOREIGN KEY (`site_Id`) REFERENCES `Sites` (`id`),
  CONSTRAINT `FK_B7074FAFFDAF7D93` FOREIGN KEY (`scope_Id`) REFERENCES `Scopes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sites_Scopes`
--

LOCK TABLES `Sites_Scopes` WRITE;
/*!40000 ALTER TABLE `Sites_Scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sites_Scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubGrids`
--

DROP TABLE IF EXISTS `SubGrids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubGrids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `NGI_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E199E8555E237E06` (`name`),
  KEY `IDX_E199E85584DB61D1` (`NGI_Id`),
  CONSTRAINT `FK_E199E85584DB61D1` FOREIGN KEY (`NGI_Id`) REFERENCES `NGIs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubGrids`
--

LOCK TABLES `SubGrids` WRITE;
/*!40000 ALTER TABLE `SubGrids` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubGrids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tiers`
--

DROP TABLE IF EXISTS `Tiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D78614A65E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tiers`
--

LOCK TABLES `Tiers` WRITE;
/*!40000 ALTER TABLE `Tiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Timezones`
--

DROP TABLE IF EXISTS `Timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Timezones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F7A34AFD5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Timezones`
--

LOCK TABLES `Timezones` WRITE;
/*!40000 ALTER TABLE `Timezones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Identifiers`
--

DROP TABLE IF EXISTS `User_Identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Identifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyName` varchar(255) NOT NULL,
  `keyValue` varchar(255) DEFAULT NULL,
  `parentUser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8EA654F1794DCE2` (`keyValue`),
  UNIQUE KEY `user_keypairs` (`parentUser_id`,`keyName`),
  KEY `IDX_8EA654F1DEF3CE4C` (`parentUser_id`),
  CONSTRAINT `FK_8EA654F1DEF3CE4C` FOREIGN KEY (`parentUser_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Identifiers`
--

LOCK TABLES `User_Identifiers` WRITE;
/*!40000 ALTER TABLE `User_Identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forename` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `workingHoursStart` varchar(255) DEFAULT NULL,
  `workingHoursEnd` varchar(255) DEFAULT NULL,
  `certificateDn` varchar(255) DEFAULT NULL,
  `username1` varchar(255) DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `homeSite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D5428AED3037A1E4` (`homeSite_id`),
  CONSTRAINT `FK_D5428AED3037A1E4` FOREIGN KEY (`homeSite_id`) REFERENCES `Sites` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-25 10:11:14
