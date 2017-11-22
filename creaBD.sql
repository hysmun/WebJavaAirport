-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_airport
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `idAgents` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAgents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (100,'Brajkovic','Antoine','admin'),(404,'Mauhin','Remy','cuisinier'),(1337,'root','toor','superadmin');
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bagages`
--

DROP TABLE IF EXISTS `bagages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bagages` (
  `idBagages` varchar(100) NOT NULL,
  `valise` char(1) DEFAULT NULL,
  `poids` double DEFAULT NULL,
  `receptionne` varchar(1) DEFAULT NULL,
  `chargeSoute` varchar(1) DEFAULT NULL,
  `verifDouane` varchar(1) DEFAULT NULL,
  `remarques` varchar(100) DEFAULT NULL,
  `idTicket` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBagages`),
  KEY `idTicketFK_idx` (`idTicket`),
  CONSTRAINT `idTicketFK` FOREIGN KEY (`idTicket`) REFERENCES `ticket` (`idTicket`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bagages`
--

LOCK TABLES `bagages` WRITE;
/*!40000 ALTER TABLE `bagages` DISABLE KEYS */;
INSERT INTO `bagages` VALUES ('111','N',14,'N','N','N','NEANT',NULL),('111-111-11-1111-111','Y',25,'N','N','N','NEANT',NULL),('159-489-26-1430-000','N',10,'N','N','N','NEANT',NULL),('222','Y',25.6,'O','R','O','NEANT',NULL),('222-222-22-2222-222','N',19,'N','N','N','NEANT',NULL),('333','Y',10,'O','O','O','NEANT',NULL),('444','N',15,'O','N','N','NEANT',NULL),('555','Y',13,'N','N','N','NEANT',NULL),('666','Y',10,'O','N','N','NEANT',NULL),('777','N',12,'N','N','N','NEANT',NULL),('888','N',11,'N','N','N','NEANT',NULL),('999','N',2,'O','N','N','NEANT',NULL);
/*!40000 ALTER TABLE `bagages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billets`
--

DROP TABLE IF EXISTS `billets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billets` (
  `idBillets` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `numCarteID` varchar(45) DEFAULT NULL,
  `idVols` int(11) DEFAULT NULL,
  `idBagages` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idBillets`),
  KEY `idVols_idx` (`idVols`),
  KEY `idBagages_idx` (`idBagages`),
  CONSTRAINT `idBagages` FOREIGN KEY (`idBagages`) REFERENCES `bagages` (`idBagages`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idVols` FOREIGN KEY (`idVols`) REFERENCES `vols` (`idVols`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billets`
--

LOCK TABLES `billets` WRITE;
/*!40000 ALTER TABLE `billets` DISABLE KEYS */;
INSERT INTO `billets` VALUES (684,'Dieu',NULL,'666',333,'111'),(1111,'Truc','Bidule','6842846',222,'222'),(2222,'Machin','Chouette','6824',111,NULL),(3333,'Marie','Marie','3',222,'333'),(4444,'Bernard','Bernard','12531',999,'222-222-22-2222-222'),(5555,'Truc','Much','231235',111,'444'),(6666,'Seb','Seb','5312',111,'999'),(7777,'Phil','Phil','31231',NULL,'555'),(8888,'sophie','sophie','21312',NULL,'888'),(9999,'Maud','Maud','3155',111,'666'),(13215,'Brajkovic','Antoine','342834',444,'111-111-11-1111-111'),(22135,'Mauhin','Remy','6842',444,'777');
/*!40000 ALTER TABLE `billets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `identifiant` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (111,'ggbrogg','ggbrogg'),(222,'user','user'),(333,'test','test'),(444,'client','client'),(555,'antoine','antoine'),(666,'remy','remy'),(777,'patate','patate'),(888,'aaa','aaa'),(999,'bbb','bbb');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `idTicket` int(11) NOT NULL,
  `idVols` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  PRIMARY KEY (`idTicket`),
  KEY `idVols_idx` (`idVols`),
  KEY `idClient_idx` (`idClient`),
  CONSTRAINT `idClient` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idVolsFK` FOREIGN KEY (`idVols`) REFERENCES `vols` (`idVols`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (111,222,111),(222,444,111),(333,222,111),(444,444,333),(555,333,444),(666,222,555),(777,444,666),(888,555,777),(999,222,222);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vols`
--

DROP TABLE IF EXISTS `vols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vols` (
  `idVols` int(11) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `heureArriver` datetime DEFAULT NULL,
  `heureDepart` datetime DEFAULT NULL,
  `nbrBillet` int(11) DEFAULT NULL,
  `nbrDispo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVols`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vols`
--

LOCK TABLES `vols` WRITE;
/*!40000 ALTER TABLE `vols` DISABLE KEYS */;
INSERT INTO `vols` VALUES (111,'Rio',NULL,NULL,200,200),(222,'New-york',NULL,NULL,150,146),(333,'Ici',NULL,NULL,300,299),(444,'La',NULL,NULL,104,101),(555,'Ailleur',NULL,NULL,205,204),(666,'Enfer',NULL,NULL,102,102),(777,'DTC',NULL,NULL,1054,1054),(888,'Europe',NULL,NULL,25,25),(999,'Moon',NULL,NULL,356,356);
/*!40000 ALTER TABLE `vols` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-22 11:09:58
