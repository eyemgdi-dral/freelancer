-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table ts_0001.ts_comm_contents
DROP TABLE IF EXISTS `ts_comm_contents`;
CREATE TABLE IF NOT EXISTS `ts_comm_contents` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CodeType : 000은 Type에 대한 정리 코드',
  `SITE_SEQ` int(11) NOT NULL COMMENT 'ts_site 테이블의 SITE_SEQ',
  `TB_IDX` int(11) DEFAULT NULL COMMENT '약관 테이블의 Idx',
  `VERSION` smallint(6) NOT NULL COMMENT '버젼관리가 필요한 글인 경우 사용',
  `TITLE` varchar(200) DEFAULT NULL,
  `SUB_TITLE` varchar(400) DEFAULT NULL,
  `LINK_URL` varchar(400) DEFAULT NULL,
  `CONTENTS` longtext DEFAULT NULL,
  `VIEW_CNT` int(11) DEFAULT NULL,
  `USE_FLAG` char(1) NOT NULL COMMENT '사용유무(U: 사용, S:미사용, D:삭제)',
  `REG_USER` varchar(20) DEFAULT NULL COMMENT '등록자ID',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '수정자ID',
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='약관 테이블	';

-- Dumping data for table ts_0001.ts_comm_contents: ~25 rows (approximately)
/*!40000 ALTER TABLE `ts_comm_contents` DISABLE KEYS */;
INSERT INTO `ts_comm_contents` (`IDX`, `SITE_SEQ`, `TB_IDX`, `VERSION`, `TITLE`, `SUB_TITLE`, `LINK_URL`, `CONTENTS`, `VIEW_CNT`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(37, 1, 1, 0, '이용약관', NULL, NULL, '이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관', NULL, 'U', 'tago', '2018-12-11 10:19:30', NULL, NULL),
	(38, 1, 2, 0, '개인정보취급방침', NULL, NULL, '개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침', NULL, 'U', 'tago', '2018-12-11 10:20:03', NULL, NULL);
/*!40000 ALTER TABLE `ts_comm_contents` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
