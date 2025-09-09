-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: samplereg
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `a_materials`
--

DROP TABLE IF EXISTS `a_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_materials` (
  `MID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_materials`
--

LOCK TABLES `a_materials` WRITE;
/*!40000 ALTER TABLE `a_materials` DISABLE KEYS */;
INSERT INTO `a_materials` VALUES (1,'Кукуруза'),(2,'Рапс'),(3,'Тритикале'),(4,'Пшеница'),(5,'Подсолнечник'),(6,'Ячмень');
/*!40000 ALTER TABLE `a_materials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


ALTER TABLE `trucks`
	ADD COLUMN `a_numSpec` VARCHAR(50),
	ADD COLUMN `a_INN` VARCHAR(50),
	ADD COLUMN `a_numNakl` VARCHAR(50),
	ADD COLUMN `a_numVet` VARCHAR(50),
	ADD COLUMN `a_partHomo` VARCHAR(50),
	ADD COLUMN `a_partCont` VARCHAR(50),
	ADD COLUMN `a_wagState` VARCHAR(50),
	ADD COLUMN `a_glyuten` DOUBLE PRECISION,
	ADD COLUMN `a_humidity` DOUBLE PRECISION,
	ADD COLUMN `a_nature` DOUBLE PRECISION
	;

ALTER TABLE `samples`
	ADD COLUMN `a_noUploadFlag` INT(1) NOT NULL DEFAULT '0'
	;

ALTER TABLE `samples`
	ADD INDEX `samples_idx1` (`TS`, `CT`) USING BTREE,
	ADD INDEX `samples_idx2` (`CT`, `a_noUploadFlag`) USING BTREE
	;

update samples SET a_noUploadFlag = 1 WHERE samples.state & 8 > 0;

CREATE OR REPLACE VIEW v_trucks AS SELECT 
	CAST(CASE WHEN (SELECT s.State FROM samples s WHERE s.SID = `trucks`.SID LIMIT 1) & 8 > 0 THEN CASE WHEN (SELECT s.a_noUploadFlag FROM samples s WHERE s.SID = `trucks`.SID LIMIT 1) = 1 THEN `trucks`.TID ELSE NULL END ELSE NULL END AS CHAR(50)) TID,
	`trucks`.`SID` AS `SID`,
	`trucks`.`MID` AS `MID`,
	`trucks`.`LPR` AS `LPR`,
	CAST(CASE WHEN (SELECT s.State FROM samples s WHERE s.SID = `trucks`.SID LIMIT 1) & 8 > 0 THEN CASE WHEN (SELECT s.a_noUploadFlag FROM samples s WHERE s.SID = `trucks`.SID LIMIT 1) = 1 THEN `trucks`.LPN ELSE NULL END ELSE NULL END AS CHAR(50)) LPN,
	`trucks`.`LPNURL` AS `LPNURL`,
	`trucks`.`State` AS `State`,
	`trucks`.`User` AS `User`,
	`trucks`.`TS` AS `TS`,
	`trucks`.`CT` AS `CT`,
	`trucks`.`Pos` AS `Pos`,
	`trucks`.`Descript` AS `Descript` 
FROM `trucks`;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-09 15:08:03
