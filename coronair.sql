-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2020 at 11:58 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coronair`
--
CREATE DATABASE IF NOT EXISTS `coronair` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coronair`;

-- --------------------------------------------------------

--
-- Table structure for table `klient`
--

CREATE TABLE IF NOT EXISTS `klient` (
  `Klient_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` tinytext DEFAULT NULL,
  `Nazwisko` tinytext DEFAULT NULL,
  PRIMARY KEY (`Klient_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `klient`
--

INSERT INTO `klient` (`Klient_ID`, `Imie`, `Nazwisko`) VALUES
(1, 'Józef', 'Zbagien'),
(2, 'Hatsune', 'Miku'),
(3, 'Andrzej', 'Zguba'),
(4, 'Janne', 'Ahonen'),
(5, 'Piotr', 'Nowak');

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

CREATE TABLE IF NOT EXISTS `lot` (
  `Lot_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Trasa_ID` int(11) NOT NULL,
  `Samolot_ID` int(11) NOT NULL,
  `Poklad_ID` int(11) NOT NULL,
  PRIMARY KEY (`Lot_ID`),
  KEY `trasa_fk1` (`Trasa_ID`),
  KEY `samolot_fk1` (`Samolot_ID`),
  KEY `poklad_fk1` (`Poklad_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lot`
--

INSERT INTO `lot` (`Lot_ID`, `Trasa_ID`, `Samolot_ID`, `Poklad_ID`) VALUES
(12, 1, 1, 3),
(14, 5, 2, 4),
(15, 3, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `poklad`
--

CREATE TABLE IF NOT EXISTS `poklad` (
  `Poklad_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rezerwacja_ID` int(11),
  `Zaloga_ID` int(11),
  `Samolot_ID` int(11),
  `Zapelnienie` tinytext DEFAULT '/160',
  PRIMARY KEY (`Poklad_ID`),
  KEY `samolot_fk2` (`Samolot_ID`),
  KEY `rezerwacja_fk2` (`Rezerwacja_ID`),
  KEY `zaloga_fk2` (`Zaloga_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poklad`
--

INSERT INTO `poklad` (`Poklad_ID`, `Rezerwacja_ID`, `Zaloga_ID`, `Samolot_ID`, `Zapelnienie`) VALUES
(3, 1, 6, 1, '/104'),
(4, 1, 7, 2, '/660'),
(5, 3, 2, 1, '/104'),
(6, 2, 9, 2, '/660'),
(7, 3, 4, 2, '/160');

-- --------------------------------------------------------

--
-- Table structure for table `rezerwacja`
--

CREATE TABLE IF NOT EXISTS `rezerwacja` (
  `Rezerwacja_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Klient_ID` int(11) DEFAULT NULL,
  `Lot_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Rezerwacja_ID`),
  KEY `klient_fk3` (`Klient_ID`),
  KEY `lot_fk3` (`Lot_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rezerwacja`
--

INSERT INTO `rezerwacja` (`Rezerwacja_ID`, `Klient_ID`, `Lot_ID`) VALUES
(1, 1, 12),
(2, 4, 14),
(3, 3, 12),
(4, 4, 14);

-- --------------------------------------------------------

--
-- Table structure for table `samolot`
--

CREATE TABLE IF NOT EXISTS `samolot` (
  `Samolot_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Producent` text DEFAULT NULL,
  `Model` text DEFAULT NULL,
  `Rok_produkcji` year(4) DEFAULT NULL,
  `Zasieg` int(11) DEFAULT NULL COMMENT 'km',
  `Pojemnosc` int(11) DEFAULT NULL COMMENT 'osob',
  `Max_predkosc` text DEFAULT '0 km/h' COMMENT 'km/h',
  PRIMARY KEY (`Samolot_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `samolot`
--

INSERT INTO `samolot` (`Samolot_ID`, `Producent`, `Model`, `Rok_produkcji`, `Zasieg`, `Pojemnosc`, `Max_predkosc`) VALUES
(1, 'Boeing', 'B737-100', 2011, 3440, 104, '876 km/h'),
(2, 'Boeing', '747-400', 2009, 14815, 660, '977 km/h');

-- --------------------------------------------------------

--
-- Table structure for table `stanowisko`
--

CREATE TABLE IF NOT EXISTS `stanowisko` (
  `Stanowisko_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa_stanowiska` text DEFAULT NULL,
  PRIMARY KEY (`Stanowisko_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stanowisko`
--

INSERT INTO `stanowisko` (`Stanowisko_ID`, `Nazwa_stanowiska`) VALUES
(1, 'Administrator'),
(2, 'Pilot'),
(3, 'Steward'),
(4, 'Pracownik techniczny'),
(5, 'Obsługa klienta'),
(6, 'Szef');

-- --------------------------------------------------------

--
-- Table structure for table `stan_techniczny`
--

CREATE TABLE IF NOT EXISTS `stan_techniczny` (
  `Naprawa_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Samolot_ID` int(11) DEFAULT NULL,
  `Zatrudniony_ID` int(11) DEFAULT NULL,
  `Data_naprawy` date DEFAULT NULL,
  `Stan` text DEFAULT 'W użyciu',
  PRIMARY KEY (`Naprawa_ID`),
  KEY `samolot_fk4` (`Samolot_ID`),
  KEY `zatrudniony_fk4` (`Zatrudniony_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stan_techniczny`
--

INSERT INTO `stan_techniczny` (`Naprawa_ID`, `Samolot_ID`, `Zatrudniony_ID`, `Data_naprawy`, `Stan`) VALUES
(1, 1, 2, '2020-05-17', 'W użyciu'),
(2, 2, 2, '2020-05-17', 'W użyciu'),
(3, 2, 2, '2020-05-17', 'W użyciu');

-- --------------------------------------------------------

--
-- Table structure for table `trasa`
--

CREATE TABLE IF NOT EXISTS `trasa` (
  `Trasa_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Miejsce_wylotu` text DEFAULT 'Wroclaw',
  `Miejsce_przylotu` text DEFAULT 'Bieszczady',
  `Sr_czas_lotu` time DEFAULT NULL,
  `Cena` int(11) DEFAULT 0,
  PRIMARY KEY (`Trasa_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trasa`
--

INSERT INTO `trasa` (`Trasa_ID`, `Miejsce_wylotu`, `Miejsce_przylotu`, `Sr_czas_lotu`, `Cena`) VALUES
(1, 'Wroclaw', 'Rzeszów', '01:00:00', 169),
(2, 'Wroclaw', 'Gdańsk', '02:00:00', 289),
(3, 'Wroclaw', 'Oslo', '03:03:42', 349),
(4, 'Gdańsk', 'Wrocław', '02:00:00', 289),
(5, 'Oslo', 'Wrocław', '03:01:19', 349),
(6, 'Rzeszów', 'Wrocław', '01:00:00', 169);

-- --------------------------------------------------------

--
-- Table structure for table `zaloga`
--

CREATE TABLE IF NOT EXISTS `zaloga` (
  `Zaloga_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Zatrudniony_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Zaloga_ID`),
  KEY `zatrudniony_fk5` (`Zatrudniony_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zaloga`
--

INSERT INTO `zaloga` (`Zaloga_ID`, `Zatrudniony_ID`) VALUES
(1, 1),
(6, 2),
(7, 3),
(5, 4),
(2, 5),
(8, 6),
(4, 7),
(9, 8),
(10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `zatrudniony`
--

CREATE TABLE IF NOT EXISTS `zatrudniony` (
  `Zatrudniony_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` tinytext DEFAULT NULL,
  `Nazwisko` tinytext DEFAULT NULL,
  `Stanowisko_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Zatrudniony_ID`),
  KEY `stanowisko_fk6` (`Stanowisko_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zatrudniony`
--

INSERT INTO `zatrudniony` (`Zatrudniony_ID`, `Imie`, `Nazwisko`, `Stanowisko_ID`) VALUES
(1, 'Krzysztof', 'Reagan', 1),
(2, 'Kinga', 'Długa', 4),
(3, 'Łukasz', 'Chwastek', 1),
(4, 'Rocky', 'Balboa', 2),
(5, 'Jesus', 'Bezklapek', 3),
(6, 'Tomasz', 'Dejtrzy', 6),
(7, 'Joahim', 'Arenu', 5),
(8, 'Adam', 'Małysz', 2),
(9, 'Kaja', 'Bergovic', 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `poklad_fk1` FOREIGN KEY (`Poklad_ID`) REFERENCES `poklad` (`Poklad_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `samolot_fk1` FOREIGN KEY (`Samolot_ID`) REFERENCES `samolot` (`Samolot_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trasa_fk1` FOREIGN KEY (`Trasa_ID`) REFERENCES `trasa` (`Trasa_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poklad`
--
ALTER TABLE `poklad`
  ADD CONSTRAINT `rezerwacja_fk2` FOREIGN KEY (`Rezerwacja_ID`) REFERENCES `rezerwacja` (`Rezerwacja_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `samolot_fk2` FOREIGN KEY (`Samolot_ID`) REFERENCES `samolot` (`Samolot_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zaloga_fk2` FOREIGN KEY (`Zaloga_ID`) REFERENCES `zaloga` (`Zaloga_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD CONSTRAINT `klient_fk3` FOREIGN KEY (`Klient_ID`) REFERENCES `klient` (`Klient_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lot_fk3` FOREIGN KEY (`Lot_ID`) REFERENCES `lot` (`Lot_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stan_techniczny`
--
ALTER TABLE `stan_techniczny`
  ADD CONSTRAINT `samolot_fk4` FOREIGN KEY (`Samolot_ID`) REFERENCES `samolot` (`Samolot_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zatrudniony_fk4` FOREIGN KEY (`Zatrudniony_ID`) REFERENCES `zatrudniony` (`Zatrudniony_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zaloga`
--
ALTER TABLE `zaloga`
  ADD CONSTRAINT `zatrudniony_fk5` FOREIGN KEY (`Zatrudniony_ID`) REFERENCES `zatrudniony` (`Zatrudniony_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zatrudniony`
--
ALTER TABLE `zatrudniony`
  ADD CONSTRAINT `stanowisko_fk6` FOREIGN KEY (`Stanowisko_ID`) REFERENCES `stanowisko` (`Stanowisko_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
