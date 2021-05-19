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

-- Dumping structure for table ts_0001.ts_admin_grade
CREATE TABLE IF NOT EXISTS `ts_admin_grade` (
  `GRADE_LEVEL` smallint(6) NOT NULL COMMENT '레벨',
  `ICON` varchar(320) DEFAULT NULL COMMENT '아이콘',
  `GRADE_NAME` varchar(24) NOT NULL COMMENT '등급 이름',
  `GRADE_MEMO` varchar(400) DEFAULT NULL COMMENT '설명',
  PRIMARY KEY (`GRADE_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 등급 - 높은 등급 - 낮은 숫자 지정\r\n - 모델, 매퍼 구성';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
