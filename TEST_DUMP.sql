-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: garagedb
-- ------------------------------------------------------
-- Server version	8.0.35

DROP SCHEMA IF EXISTS `garagedb`;
CREATE SCHEMA `garagedb`;
USE `garagedb`;

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
-- Temporary view structure for view `all_finances`
--

DROP TABLE IF EXISTS `all_finances`;
/*!50001 DROP VIEW IF EXISTS `all_finances`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_finances` AS SELECT 
 1 AS `Branch ID`,
 1 AS `Sum of Salaries`,
 1 AS `Electricity`,
 1 AS `Water Supply`,
 1 AS `Equipment`,
 1 AS `Total Income`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branchId` char(6) NOT NULL,
  `location` varchar(50) NOT NULL,
  `managerSsn` char(11) DEFAULT NULL,
  PRIMARY KEY (`branchId`),
  KEY `managerSsn_idx` (`managerSsn`),
  CONSTRAINT `managerSsn` FOREIGN KEY (`managerSsn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('471456','Edessa',NULL),('472489','Volos',NULL),('473274','Thessaloniki','12097445231'),('475067','Athens',NULL),('476054','Komotini',NULL),('476891','Poligiros','26087648973'),('477312','Thessaloniki',NULL),('478923','Kavala',NULL),('479435','Athens',NULL);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `licensePlateNum` char(8) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `yearReleased` year NOT NULL,
  `isModified` enum('Yes','No') NOT NULL,
  `ownerId` char(12) NOT NULL,
  PRIMARY KEY (`licensePlateNum`),
  KEY `ownerId_idx` (`ownerId`),
  CONSTRAINT `ownerId` FOREIGN KEY (`ownerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('HRA-1202','Mercedes Benz','E-Class',2015,'Yes','782130987456'),('INY-8914','Volkswagen','Golf',2006,'No','782187421963'),('IOR-4287','Hyundai','Atos Prime',2008,'No','782158136294'),('KBM-2421','BMW','Series 3',2002,'No','782142619857'),('LON-4961','Honda','Civic',2005,'Yes','782117593682'),('NEK-4367','Toyota','Corolla',2010,'No','782184720513'),('NHI-3339','Opel','Astra',2011,'Yes','782169052481'),('RMA-4902','Ford','Focus',2015,'No','782153218749'),('ΙΟΒ-3218','Volkswagen','Polo',2013,'No','782168493527');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `car_BEFORE_INSERT` BEFORE INSERT ON `car` FOR EACH ROW BEGIN
	IF (NEW.yearReleased < 1950) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `car_BEFORE_UPDATE` BEFORE UPDATE ON `car` FOR EACH ROW BEGIN
	IF (NEW.yearReleased < 1950) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` char(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phoneNum` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `accCreationDate` date NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('782117593682','Katerina Antoniou','6975123456','katerinantoniou@gmail.com','Aristotelous 15','2022-08-23'),('782130987456','Eleftheria Kostidou','6911876543','elekostidou@gmail.com','Agiou Markou 22','2022-07-17'),('782142619857','Dimitrios Vlachopoulos','6933234567','vlaxopoulos5@yahoo.gr','Dionisiou 45','2023-05-11'),('782153218749','Anastasia Stavrou','6902756491','astavrou@hotmail.com','Pireos 5','2022-11-04'),('782158136294','Andreas Pappas','6978765410','pappasandrew@hotmail.com','Aliakmonos 44','2021-02-28'),('782168493527','Giannis Papadopoulos','695743378','giannispap@gmail.com','Papandreou 3','2021-07-14'),('782169052481','Kiriakos Papadopoulos','6943168022','kiriakospapado@gmail.com','Diogenous 43','2021-03-09'),('782184720513','Nikos Georgopoulos','6944567890','georgenikos@gmail.com','Ermou 7','2021-12-04'),('782187421963','Dimos Petrou','6985134670','dimosp@gmail.com','Adrianoupoleos 24','2023-04-21');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customer_BEFORE_INSERT` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
	IF (NEW.accCreationDate < '2021-01-01') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customer_BEFORE_UPDATE` BEFORE UPDATE ON `customer` FOR EACH ROW BEGIN
	IF (NEW.accCreationDate < '2021-01-01') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_rates_branch`
--

DROP TABLE IF EXISTS `customer_rates_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_rates_branch` (
  `customerId` char(12) NOT NULL,
  `idBranch` char(6) NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`customerId`,`idBranch`),
  KEY `branchId_idx` (`idBranch`),
  CONSTRAINT `customerId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `idBranch` FOREIGN KEY (`idBranch`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_rates_branch`
--

LOCK TABLES `customer_rates_branch` WRITE;
/*!40000 ALTER TABLE `customer_rates_branch` DISABLE KEYS */;
INSERT INTO `customer_rates_branch` VALUES ('782117593682','478923',8),('782130987456','472489',9),('782142619857','477312',10),('782153218749','476891',8),('782158136294','476054',3),('782168493527','479435',9),('782169052481','471456',4),('782184720513','475067',5),('782187421963','473274',7);
/*!40000 ALTER TABLE `customer_rates_branch` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customer_rates_branch_BEFORE_INSERT` BEFORE INSERT ON `customer_rates_branch` FOR EACH ROW BEGIN
	IF ((NEW.rating < 1) OR (NEW.rating > 10)) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customer_rates_branch_BEFORE_UPDATE` BEFORE UPDATE ON `customer_rates_branch` FOR EACH ROW BEGIN
	IF ((NEW.rating < 1) OR (NEW.rating > 10)) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ssn` char(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNum` char(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `monthlySalary` decimal(8,2) NOT NULL,
  `conStartDate` date NOT NULL,
  `conEndDate` date NOT NULL,
  `branchId` char(6) DEFAULT NULL,
  `supervisorSsn` char(11) DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  KEY `branchId_idx` (`branchId`),
  KEY `supervisorSsn_idx` (`supervisorSsn`),
  CONSTRAINT `branchId` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `supervisorSsn` FOREIGN KEY (`supervisorSsn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('04089700759','Orestis Christou','orestisx4@gmail.com','6946803575','Averof 2',1000.00,'2023-09-01','2026-08-31','476891','26087648973'),('05028463985','Christos Papageorgiou','chrispap@hotmail.com','6952356897','Serron 9',1000.00,'2022-07-01','2024-06-30','472489',NULL),('05109250316','Nikos Georgiou','nikosg92@hotmail.com','6975678229','Leoforos Stratou 12',1050.00,'2021-06-28','2025-06-27','475067',NULL),('12097445231','Loukas Asimakopoulos','asimako@gmail.com','6943459672','Kleanthous 12',1300.00,'2021-01-01','2025-12-31','473274',NULL),('17048558426','Prodromos Paraschos','propar17@gmail.com','6987483589','Karamanli 10',980.00,'2021-03-18','2025-03-17','476054',NULL),('17068587429','Michalis Papadopoulos','mikepapado@gmail.com','6942345185','Alexandras 22',1000.00,'2021-02-14','2024-02-13','478923',NULL),('20017954678','Dimitris Poulopoulos','dimitrisp@gmail.com','6957638235','Mavili 15',1000.00,'2021-04-30','2024-04-29','479435',NULL),('21039803458','Dimitris Arnaoutoglou','arnaoutogloudim@yahoo.gr','6973814620','Kronou 59',950.00,'2023-02-01','2025-01-31','473274','12097445231'),('22037821687','Ioannis Katsaros','johnkatsaros@gmail.com','6932109768','Skra 3',970.00,'2021-05-04','2025-05-03','477312',NULL),('26087648973','Prokopis Anagnostou','prokoanagno@hotmail.com','6956345689','Grigoriou Lampraki 49',1300.00,'2021-01-01','2025-12-31','476891',NULL),('31019432481','Charalampos Dimitrakopoulos','mpampismitsakopoulos@hotmail.com','6981324490','Ioustinianou 102',980.00,'2022-03-05','2024-03-04','471456',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_BEFORE_INSERT` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN
	IF ((NEW.conStartDate < '2021-01-01') OR (NEW.conEndDate <= NEW.conStartDate)) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_BEFORE_UPDATE` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
	IF ((NEW.conStartDate < '2021-01-01') OR (NEW.conEndDate <= NEW.conStartDate)) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `monthly_branch_expenses`
--

DROP TABLE IF EXISTS `monthly_branch_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_branch_expenses` (
  `id_branch` char(6) NOT NULL,
  `month` enum('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec') NOT NULL,
  `year` year NOT NULL,
  `electricity` decimal(8,2) NOT NULL,
  `waterSupply` decimal(8,2) NOT NULL,
  `equipment` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_branch`,`month`,`year`),
  CONSTRAINT `id_branch` FOREIGN KEY (`id_branch`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_branch_expenses`
--

LOCK TABLES `monthly_branch_expenses` WRITE;
/*!40000 ALTER TABLE `monthly_branch_expenses` DISABLE KEYS */;
INSERT INTO `monthly_branch_expenses` VALUES ('471456','Nov',2021,281.40,110.40,1043.70),('471456','Dec',2021,278.39,125.41,1987.99),('472489','Apr',2022,299.70,135.00,4630.80),('472489','May',2022,238.40,156.79,2456.78),('473274','Oct',2023,321.40,108.20,1520.40),('473274','Nov',2023,295.50,101.13,1427.00),('475067','Feb',2021,246.10,119.30,1976.80),('475067','Mar',2021,342.00,186.04,1875.00),('476054','Jun',2021,257.49,184.30,2123.00),('476054','Jul',2021,340.87,201.00,1698.20),('476891','Aug',2023,202.80,194.30,2080.60),('476891','Sep',2023,230.90,178.00,1345.67),('477312','Sep',2023,286.90,146.40,3094.30),('477312','Oct',2023,299.00,157.64,2176.20),('478923','May',2022,198.00,146.10,2316.40),('478923','Jun',2022,320.00,145.00,1746.72),('479435','Sep',2022,425.00,206.88,1325.76);
/*!40000 ALTER TABLE `monthly_branch_expenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `monthly_branch_expenses_BEFORE_INSERT` BEFORE INSERT ON `monthly_branch_expenses` FOR EACH ROW BEGIN
	IF (NEW.year < 2021) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `monthly_branch_expenses_BEFORE_UPDATE` BEFORE UPDATE ON `monthly_branch_expenses` FOR EACH ROW BEGIN
	IF (NEW.year < 2021) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_includes_part`
--

DROP TABLE IF EXISTS `order_includes_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_includes_part` (
  `orderId` char(12) NOT NULL,
  `partId` char(8) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`orderId`,`partId`,`supplier`),
  KEY `partId_idx` (`partId`,`supplier`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `spare_parts_order` (`orderId`),
  CONSTRAINT `partId_and_supplier` FOREIGN KEY (`partId`, `supplier`) REFERENCES `spare_part` (`partId`, `supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_includes_part`
--

LOCK TABLES `order_includes_part` WRITE;
/*!40000 ALTER TABLE `order_includes_part` DISABLE KEYS */;
INSERT INTO `order_includes_part` VALUES ('614245321978','12039845','Hyundai',1),('614267850124','23789014','BMW',1),('614289234567','68534217','Mercedes Benz',1),('614298877665','45996312','Volkswagen',1);
/*!40000 ALTER TABLE `order_includes_part` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_includes_part_BEFORE_INSERT` BEFORE INSERT ON `order_includes_part` FOR EACH ROW BEGIN
	IF (NEW.quantity <= 0) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_includes_part_BEFORE_UPDATE` BEFORE UPDATE ON `order_includes_part` FOR EACH ROW BEGIN
	IF (NEW.quantity <= 0) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair` (
  `repairId` char(12) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `estDuration` int DEFAULT NULL,
  `requiresSpareParts` enum('Yes','No') DEFAULT NULL,
  `repairCost` decimal(8,2) DEFAULT NULL,
  `carPlateNum` char(8) NOT NULL,
  `mechanicSsn` char(11) NOT NULL,
  `branch_Id` char(6) NOT NULL,
  PRIMARY KEY (`repairId`),
  KEY `carPlateNum_idx` (`carPlateNum`),
  KEY `mechanicSsn_idx` (`mechanicSsn`),
  KEY `branchId_idx` (`branch_Id`),
  CONSTRAINT `branch_Id` FOREIGN KEY (`branch_Id`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `carPlateNum` FOREIGN KEY (`carPlateNum`) REFERENCES `car` (`licensePlateNum`),
  CONSTRAINT `mechanicSsn` FOREIGN KEY (`mechanicSsn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair`
--

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `repair` VALUES ('359823019876','2023-06-17','09:00:00','Brakes replacement',75,'Yes',270.00,'IOR-4287','17048558426','476054'),('359834761289','2023-07-10','08:30:00','Door replacement',90,'Yes',180.00,'KBM-2421','22037821687','477312'),('359846185023','2024-01-08','11:30:00',NULL,NULL,NULL,NULL,'NHI-3339','31019432481','471456'),('359856210987','2024-01-10','14:30:00',NULL,NULL,NULL,NULL,'LON-4961','17068587429','478923'),('359862739418','2023-12-19','13:15:00','Engine oil change',25,'No',60.00,'RMA-4902','04089700759','476891'),('359867549022','2022-09-08','11:00:00','Radio replacement',20,'Yes',30.00,'ΙΟΒ-3218','20017954678','479435'),('359879324856','2023-12-04','10:00:00','Headlights unblurring',30,'No',55.00,'INY-8914','21039803458','473274'),('359887450321','2023-07-14','12:00:00','Side mirror replacement',50,'Yes',240.00,'HRA-1202','05028463985','472489'),('359898501234','2024-01-07','16:00:00',NULL,NULL,NULL,NULL,'NEK-4367','05109250316','475067');
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `repair_BEFORE_INSERT` BEFORE INSERT ON `repair` FOR EACH ROW BEGIN
	IF ((NEW.estDuration <= 0) OR (NEW.date < '2021-01-01')) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `repair_BEFORE_UPDATE` BEFORE UPDATE ON `repair` FOR EACH ROW BEGIN
	IF ((NEW.estDuration <= 0) OR (NEW.date < '2021-01-01')) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `spare_part`
--

DROP TABLE IF EXISTS `spare_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spare_part` (
  `partId` char(8) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  PRIMARY KEY (`partId`,`supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_part`
--

LOCK TABLES `spare_part` WRITE;
/*!40000 ALTER TABLE `spare_part` DISABLE KEYS */;
INSERT INTO `spare_part` VALUES ('12039845','Hyundai','Brakes',295.00),('23789014','BMW','Door',625.30),('32568974','Volkswagen','Headlight',250.00),('45996312','Volkswagen','Radio',60.00),('46981230','Opel','Exhaust',78.40),('57382469','Honda','Brake pads',80.10),('68534217','Mercedes Benz','Side mirror',290.00),('80124756','Ford','Bumper',450.00),('91405682','Toyota','Suspension',300.00);
/*!40000 ALTER TABLE `spare_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spare_parts_order`
--

DROP TABLE IF EXISTS `spare_parts_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spare_parts_order` (
  `orderId` char(12) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `mechanic_Ssn` char(11) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `mechanicSsn_idx` (`mechanic_Ssn`),
  CONSTRAINT `mechanic_Ssn` FOREIGN KEY (`mechanic_Ssn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_parts_order`
--

LOCK TABLES `spare_parts_order` WRITE;
/*!40000 ALTER TABLE `spare_parts_order` DISABLE KEYS */;
INSERT INTO `spare_parts_order` VALUES ('614245321978','2023-06-17','10:15:00','17048558426'),('614267850124','2023-07-10','10:00:00','22037821687'),('614289234567','2023-07-14','12:50:00','05028463985'),('614298877665','2022-09-08','11:20:00','20017954678');
/*!40000 ALTER TABLE `spare_parts_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `spare_parts_order_BEFORE_INSERT` BEFORE INSERT ON `spare_parts_order` FOR EACH ROW BEGIN
	IF (NEW.date < '2021-01-01') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `spare_parts_order_BEFORE_UPDATE` BEFORE UPDATE ON `spare_parts_order` FOR EACH ROW BEGIN
	IF (NEW.date < '2021-01-01') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `todays_schedule`
--

DROP TABLE IF EXISTS `todays_schedule`;
/*!50001 DROP VIEW IF EXISTS `todays_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `todays_schedule` AS SELECT 
 1 AS `Repair ID`,
 1 AS `Time`,
 1 AS `Type`,
 1 AS `Estimated Duration`,
 1 AS `License Plate Number`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `all_finances`
--

/*!50001 DROP VIEW IF EXISTS `all_finances`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_finances` AS select `monthly_amenities_cost`.`id_branch` AS `Branch ID`,`monthly_salaries_cost`.`Sum_of_Salaries` AS `Sum of Salaries`,`monthly_amenities_cost`.`electricity` AS `Electricity`,`monthly_amenities_cost`.`waterSupply` AS `Water Supply`,`monthly_amenities_cost`.`equipment` AS `Equipment`,`monthly_repair_profits`.`Total_Income` AS `Total Income` from (((select sum(`employee`.`monthlySalary`) AS `Sum_of_Salaries` from `employee` where (`employee`.`branchId` = '473274')) `monthly_salaries_cost` join (select `monthly_branch_expenses`.`id_branch` AS `id_branch`,`monthly_branch_expenses`.`electricity` AS `electricity`,`monthly_branch_expenses`.`waterSupply` AS `waterSupply`,`monthly_branch_expenses`.`equipment` AS `equipment` from `monthly_branch_expenses` where ((`monthly_branch_expenses`.`id_branch` = '473274') and (`monthly_branch_expenses`.`month` = (case when (month(curdate()) = 1) then 'Dec' when (month(curdate()) = 2) then 'Jan' when (month(curdate()) = 3) then 'Feb' when (month(curdate()) = 4) then 'Mar' when (month(curdate()) = 5) then 'Apr' when (month(curdate()) = 6) then 'May' when (month(curdate()) = 7) then 'Jun' when (month(curdate()) = 8) then 'Jul' when (month(curdate()) = 9) then 'Aug' when (month(curdate()) = 10) then 'Sep' when (month(curdate()) = 11) then 'Oct' when (month(curdate()) = 12) then 'Nov' end)) and (`monthly_branch_expenses`.`year` = year(curdate())))) `monthly_amenities_cost`) join (select sum(`repair`.`repairCost`) AS `Total_Income` from `repair` where ((`repair`.`branch_Id` = '473274') and (`repair`.`date` >= date_format(now(),'%Y-%m-01')) and (`repair`.`date` <= last_day(curdate())))) `monthly_repair_profits`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `todays_schedule`
--

/*!50001 DROP VIEW IF EXISTS `todays_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `todays_schedule` AS select `repair`.`repairId` AS `Repair ID`,`repair`.`time` AS `Time`,`repair`.`type` AS `Type`,`repair`.`estDuration` AS `Estimated Duration`,`repair`.`carPlateNum` AS `License Plate Number` from `repair` where ((`repair`.`date` = curdate()) and (`repair`.`branch_Id` = '476891')) */;
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

-- Dump completed on 2023-12-20 15:55:47
