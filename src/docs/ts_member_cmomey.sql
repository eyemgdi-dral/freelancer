-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table ts_0001.ts_member_cmomey
DROP TABLE IF EXISTS `ts_member_cmomey`;
CREATE TABLE IF NOT EXISTS `ts_member_cmomey` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_SEQ` int(11) NOT NULL,
  `USER_ID` varchar(24) DEFAULT NULL,
  `C_MONEY` int(11) NOT NULL,
  `SUMMARY` text DEFAULT NULL,
  `ORDER_UID` int(11) NOT NULL DEFAULT 0,
  `EDITOR_NAME` varchar(100) DEFAULT NULL,
  `REASON` varchar(100) DEFAULT NULL,
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `USE_FLAG` char(1) DEFAULT 'Y',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
