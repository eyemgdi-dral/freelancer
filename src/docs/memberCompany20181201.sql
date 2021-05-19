-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table ts_0002.ts_member_company
DROP TABLE IF EXISTS `ts_member_company`;
CREATE TABLE IF NOT EXISTS `ts_member_company` (
  `SITE_SEQ` int(11) NOT NULL COMMENT '사이트 키',
  `USER_ID` varchar(24) NOT NULL COMMENT 'Member 테이블 User_ID',
  `OFFICE_NAME` varchar(100) DEFAULT NULL COMMENT '업점업체명',
  `OFFICE_NUM` varchar(20) DEFAULT NULL COMMENT '사업자번호',
  `OB_NUM` varchar(20) DEFAULT NULL COMMENT '통신판매번호',
  `B_TYPE` varchar(100) DEFAULT NULL COMMENT '업태',
  `BC_TYPE` varchar(100) DEFAULT NULL COMMENT '업종',
  `TAX_EMAIL` varchar(10) DEFAULT NULL COMMENT '계산서 이메일',
  `ZIP_CODE` varchar(6) DEFAULT NULL COMMENT '우편번호',
  `ADDR1` varchar(200) DEFAULT NULL COMMENT '우편번호 주소',
  `ADDR2` varchar(200) DEFAULT NULL COMMENT '상세주소',
  `OWNER_NAME` varchar(100) DEFAULT NULL COMMENT '대표자명',
  `OWNER_TEL` varchar(20) DEFAULT NULL COMMENT '대표자연락처',
  `STAFF_NAME` varchar(100) DEFAULT NULL COMMENT '담당자 이름',
  `STAFF_TEL` varchar(20) DEFAULT NULL COMMENT '담당자 연락처'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ts_0002.ts_member_company: ~1 rows (approximately)
/*!40000 ALTER TABLE `ts_member_company` DISABLE KEYS */;
INSERT IGNORE INTO `ts_member_company` (`SITE_SEQ`, `USER_ID`, `OFFICE_NAME`, `OFFICE_NUM`, `OB_NUM`, `B_TYPE`, `BC_TYPE`, `TAX_EMAIL`, `ZIP_CODE`, `ADDR1`, `ADDR2`, `OWNER_NAME`, `OWNER_TEL`, `STAFF_NAME`, `STAFF_TEL`) VALUES
	(1, 'tulgaaw3423', 'user', 'user', 'user', 'user', 'useruser', 'sdf', '', '', '', 'user', 'user', 'user', 'useru');
/*!40000 ALTER TABLE `ts_member_company` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
