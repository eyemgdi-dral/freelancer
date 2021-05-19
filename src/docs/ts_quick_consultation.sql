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

-- Dumping structure for table ts_0001.ts_quick_consultation
DROP TABLE IF EXISTS `ts_quick_consultation`;
CREATE TABLE IF NOT EXISTS `ts_quick_consultation` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` text NOT NULL COMMENT '이름',
  `CONTACT` text NOT NULL COMMENT '연락처',
  `EMAIL` text NOT NULL COMMENT '이메일',
  `CONTENT` longtext NOT NULL COMMENT '상담할 내용을 입력해 주세요.',
  `ANSWER` longtext DEFAULT NULL,
  `USE_FLAG` char(50) NOT NULL,
  `REG_USER` text NOT NULL DEFAULT '',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` text DEFAULT NULL,
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='quick consultation';

-- Dumping data for table ts_0001.ts_quick_consultation: ~4 rows (approximately)
/*!40000 ALTER TABLE `ts_quick_consultation` DISABLE KEYS */;
REPLACE INTO `ts_quick_consultation` (`IDX`, `USER_NAME`, `CONTACT`, `EMAIL`, `CONTENT`, `ANSWER`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(1, 'wdasd', '2132312', 'bilguun783@gmail.com', 'dfsdfd+fsdfsdfsdfdf', 'sdsdas231231231231', 'Y', 'wdasd', '2018-11-28 09:20:06', 'tago', '2018-11-29 09:58:02'),
	(2, 'DASDASD', '21212', 'testtesttesttesttest', 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest', 'sdsadasdasdasdasdfsdfasdfsdf sdfasdfasd fa', 'Y', 'DASDASD', '2018-11-28 00:00:00', 'tago', '2018-11-28 18:56:26'),
	(3, 'sas', '1221', 'testtesttesttesttesttesttest', 'testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++', NULL, 'D', 'sas', '2018-11-28 10:18:48', NULL, '2018-11-28 18:54:19'),
	(4, 'qweqwe', '1232', 'dsasdsd', 'sadasd', 'sdadsasdsfasdfsdfafsfdsdfsdfa', 'D', 'qweqwe', '2018-11-28 10:29:01', NULL, '2018-11-28 18:53:29');
/*!40000 ALTER TABLE `ts_quick_consultation` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
