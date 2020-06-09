-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: CoronAir
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klient` (
  `Klient_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` tinytext DEFAULT NULL,
  `Nazwisko` tinytext DEFAULT NULL,
  PRIMARY KEY (`Klient_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klient`
--

LOCK TABLES `klient` WRITE;
/*!40000 ALTER TABLE `klient` DISABLE KEYS */;
INSERT INTO `klient` VALUES (1,'Józef','Zbagien'),(2,'Hatsune','Miku'),(3,'Andrzej','Zguba'),(4,'Janne','Ahonen'),(5,'Piotr','Nowak');
/*!40000 ALTER TABLE `klient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lot` (
  `Lot_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Trasa_ID` int(11) NOT NULL,
  `Samolot_ID` int(11) NOT NULL,
  `Poklad_ID` int(11) NOT NULL,
  PRIMARY KEY (`Lot_ID`),
  KEY `trasa_fk1` (`Trasa_ID`),
  KEY `samolot_fk1` (`Samolot_ID`),
  KEY `poklad_fk1` (`Poklad_ID`),
  CONSTRAINT `poklad_fk1` FOREIGN KEY (`Poklad_ID`) REFERENCES `poklad` (`Poklad_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `samolot_fk1` FOREIGN KEY (`Samolot_ID`) REFERENCES `samolot` (`Samolot_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trasa_fk1` FOREIGN KEY (`Trasa_ID`) REFERENCES `trasa` (`Trasa_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot`
--

LOCK TABLES `lot` WRITE;
/*!40000 ALTER TABLE `lot` DISABLE KEYS */;
INSERT INTO `lot` VALUES (12,1,1,3),(16,4,1,4);
/*!40000 ALTER TABLE `lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poklad`
--

DROP TABLE IF EXISTS `poklad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poklad` (
  `Poklad_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rezerwacja_ID` int(11),
  `Zaloga_ID` int(11),
  `Samolot_ID` int(11),
  `Zapelnienie` tinytext DEFAULT '/160',
  PRIMARY KEY (`Poklad_ID`),
  KEY `samolot_fk2` (`Samolot_ID`),
  KEY `rezerwacja_fk2` (`Rezerwacja_ID`),
  KEY `zaloga_fk2` (`Zaloga_ID`),
  CONSTRAINT `rezerwacja_fk2` FOREIGN KEY (`Rezerwacja_ID`) REFERENCES `rezerwacja` (`Rezerwacja_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `samolot_fk2` FOREIGN KEY (`Samolot_ID`) REFERENCES `samolot` (`Samolot_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zaloga_fk2` FOREIGN KEY (`Zaloga_ID`) REFERENCES `zaloga` (`Zaloga_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poklad`
--

LOCK TABLES `poklad` WRITE;
/*!40000 ALTER TABLE `poklad` DISABLE KEYS */;
INSERT INTO `poklad` VALUES (3,1,6,1,'/104'),(4,1,7,2,'/660'),(9,1,NULL,1,'/160'),(10,NULL,6,1,'/160');
/*!40000 ALTER TABLE `poklad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezerwacja`
--

DROP TABLE IF EXISTS `rezerwacja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezerwacja` (
  `Rezerwacja_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Klient_ID` int(11) DEFAULT NULL,
  `Lot_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Rezerwacja_ID`),
  KEY `klient_fk3` (`Klient_ID`),
  KEY `lot_fk3` (`Lot_ID`),
  CONSTRAINT `klient_fk3` FOREIGN KEY (`Klient_ID`) REFERENCES `klient` (`Klient_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lot_fk3` FOREIGN KEY (`Lot_ID`) REFERENCES `lot` (`Lot_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezerwacja`
--

LOCK TABLES `rezerwacja` WRITE;
/*!40000 ALTER TABLE `rezerwacja` DISABLE KEYS */;
INSERT INTO `rezerwacja` VALUES (1,1,12),(6,3,16);
/*!40000 ALTER TABLE `rezerwacja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `samolot`
--

DROP TABLE IF EXISTS `samolot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `samolot` (
  `Samolot_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Producent` text DEFAULT NULL,
  `Model` text DEFAULT NULL,
  `Rok_produkcji` year(4) DEFAULT NULL,
  `Zasieg` int(11) DEFAULT NULL COMMENT 'km',
  `Pojemnosc` int(11) DEFAULT NULL COMMENT 'osob',
  `Max_predkosc` text DEFAULT '0 km/h' COMMENT 'km/h',
  PRIMARY KEY (`Samolot_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samolot`
--

LOCK TABLES `samolot` WRITE;
/*!40000 ALTER TABLE `samolot` DISABLE KEYS */;
INSERT INTO `samolot` VALUES (1,'Boeing','B737-100',2011,3440,104,'876 km/h'),(2,'Boeing','747-400',2009,14815,660,'977 km/h');
/*!40000 ALTER TABLE `samolot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stan_techniczny`
--

DROP TABLE IF EXISTS `stan_techniczny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stan_techniczny` (
  `Naprawa_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Samolot_ID` int(11) DEFAULT NULL,
  `Zatrudniony_ID` int(11) DEFAULT NULL,
  `Data_naprawy` date DEFAULT NULL,
  `Stan` text DEFAULT 'W użyciu',
  PRIMARY KEY (`Naprawa_ID`),
  KEY `samolot_fk4` (`Samolot_ID`),
  KEY `zatrudniony_fk4` (`Zatrudniony_ID`),
  CONSTRAINT `samolot_fk4` FOREIGN KEY (`Samolot_ID`) REFERENCES `samolot` (`Samolot_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zatrudniony_fk4` FOREIGN KEY (`Zatrudniony_ID`) REFERENCES `zatrudniony` (`Zatrudniony_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stan_techniczny`
--

LOCK TABLES `stan_techniczny` WRITE;
/*!40000 ALTER TABLE `stan_techniczny` DISABLE KEYS */;
INSERT INTO `stan_techniczny` VALUES (1,1,2,'2020-05-17','W użyciu'),(2,2,2,'2020-05-17','W użyciu'),(3,2,2,'2020-05-13','Wycofany');
/*!40000 ALTER TABLE `stan_techniczny` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stanowisko`
--

DROP TABLE IF EXISTS `stanowisko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stanowisko` (
  `Stanowisko_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa_stanowiska` text DEFAULT NULL,
  PRIMARY KEY (`Stanowisko_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stanowisko`
--

LOCK TABLES `stanowisko` WRITE;
/*!40000 ALTER TABLE `stanowisko` DISABLE KEYS */;
INSERT INTO `stanowisko` VALUES (1,'Administrator'),(2,'Pilot'),(3,'Steward'),(4,'Pracownik techniczny'),(5,'Obsługa klienta'),(6,'Szef');
/*!40000 ALTER TABLE `stanowisko` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trasa`
--

DROP TABLE IF EXISTS `trasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trasa` (
  `Trasa_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Miejsce_wylotu` text DEFAULT 'Wroclaw',
  `Miejsce_przylotu` text DEFAULT 'Bieszczady',
  `Sr_czas_lotu` time DEFAULT NULL,
  `Cena` int(11) DEFAULT 0,
  PRIMARY KEY (`Trasa_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trasa`
--

LOCK TABLES `trasa` WRITE;
/*!40000 ALTER TABLE `trasa` DISABLE KEYS */;
INSERT INTO `trasa` VALUES (1,'Wroclaw','Rzeszów','01:00:00',169),(2,'Wroclaw','Gdańsk','02:00:00',289),(3,'Wroclaw','Oslo','03:03:42',349),(4,'Gdańsk','Wrocław','02:00:00',289),(5,'Oslo','Wrocław','03:01:19',349),(6,'Rzeszów','Wrocław','01:00:00',169);
/*!40000 ALTER TABLE `trasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaloga`
--

DROP TABLE IF EXISTS `zaloga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaloga` (
  `Zaloga_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Zatrudniony_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Zaloga_ID`),
  KEY `zatrudniony_fk5` (`Zatrudniony_ID`),
  CONSTRAINT `zatrudniony_fk5` FOREIGN KEY (`Zatrudniony_ID`) REFERENCES `zatrudniony` (`Zatrudniony_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaloga`
--

LOCK TABLES `zaloga` WRITE;
/*!40000 ALTER TABLE `zaloga` DISABLE KEYS */;
INSERT INTO `zaloga` VALUES (6,2),(7,3),(5,4),(2,5),(4,7),(9,8),(10,9);
/*!40000 ALTER TABLE `zaloga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zatrudniony`
--

DROP TABLE IF EXISTS `zatrudniony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zatrudniony` (
  `Zatrudniony_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` tinytext DEFAULT NULL,
  `Nazwisko` tinytext DEFAULT NULL,
  `Stanowisko_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Zatrudniony_ID`),
  KEY `stanowisko_fk6` (`Stanowisko_ID`),
  CONSTRAINT `stanowisko_fk6` FOREIGN KEY (`Stanowisko_ID`) REFERENCES `stanowisko` (`Stanowisko_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zatrudniony`
--

LOCK TABLES `zatrudniony` WRITE;
/*!40000 ALTER TABLE `zatrudniony` DISABLE KEYS */;
INSERT INTO `zatrudniony` VALUES (1,'Krzysztof','Reagan',1),(2,'Kinga','Długa',4),(3,'Łukasz','Chwastek',1),(4,'Rocky','Balboa',2),(5,'Jesus','Bezklapek',3),(6,'Tomasz','Dejtrzy',6),(7,'Joahim','Arenu',5),(8,'Adam','Małysz',2),(9,'Kaja','Bergovic',5);
/*!40000 ALTER TABLE `zatrudniony` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-09 12:19:15
