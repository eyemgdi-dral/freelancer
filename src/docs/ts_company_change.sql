-- --------------------------------------------------------
-- Host:                         211.110.229.165
-- Server version:               10.3.11-MariaDB-1:10.3.11+maria~trusty-log - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table tagosolution1_0001.ts_member_company
DROP TABLE IF EXISTS `ts_member_company`;
CREATE TABLE IF NOT EXISTS `ts_member_company` (
  `USER_ID` varchar(24) NOT NULL COMMENT 'Member 테이블 User_ID',
  `OFFICE_NAME` varchar(100) DEFAULT NULL COMMENT '업점업체명',
  `OFFICE_NUM` varchar(20) DEFAULT NULL COMMENT '사업자번호',
  `OB_NUM` varchar(20) DEFAULT NULL COMMENT '통신판매번호',
  `B_TYPE` varchar(100) DEFAULT NULL COMMENT '업태',
  `BC_TYPE` varchar(100) DEFAULT NULL COMMENT '업종',
  `TAX_EMAIL` varchar(100) DEFAULT NULL COMMENT '계산서 이메일',
  `ZIP_CODE` varchar(6) DEFAULT NULL COMMENT '우편번호',
  `ADDR1` varchar(200) DEFAULT NULL COMMENT '우편번호 주소',
  `ADDR2` varchar(200) DEFAULT NULL COMMENT '상세주소',
  `OWNER_NAME` varchar(100) DEFAULT NULL COMMENT '대표자명',
  `OWNER_TEL` varchar(20) DEFAULT NULL COMMENT '대표자연락처',
  `STAFF_NAME` varchar(100) DEFAULT NULL COMMENT '담당자 이름',
  `STAFF_TEL` varchar(20) DEFAULT NULL COMMENT '담당자 연락처'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tagosolution1_0001.ts_member_company: ~10 rows (approximately)
/*!40000 ALTER TABLE `ts_member_company` DISABLE KEYS */;
INSERT INTO `ts_member_company` (`USER_ID`, `OFFICE_NAME`, `OFFICE_NUM`, `OB_NUM`, `B_TYPE`, `BC_TYPE`, `TAX_EMAIL`, `ZIP_CODE`, `ADDR1`, `ADDR2`, `OWNER_NAME`, `OWNER_TEL`, `STAFF_NAME`, `STAFF_TEL`) VALUES
	('tulgaaw3423', 'user', 'user', 'user', 'user', 'useruser', 'sdf', '', '', '', 'user', 'user', 'user', 'useru'),
	('teste', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('mongol', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('wellnow', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('108440031531899286571', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('ariunaa', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('test', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('skyline', '01010', '010101', 'tewt', '10101', '01010', 'tewt', '22155', '인천 미추홀구 미추홀대로657번길 1', '', '101010', '1010101', '01010', '10101010'),
	('1234', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('punch', '', '', 'mongol', '', '', 'skyle', '', '', '', '', '', '', ''),
	('testsky', 'testest', 'wetwe1', '12231321', '123123321', '132123213', '123123231', '13124', '경기 성남시 수정구 수정남로324번길 1', '', '01010', '121231', '21213132', '1231123');
/*!40000 ALTER TABLE `ts_member_company` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
