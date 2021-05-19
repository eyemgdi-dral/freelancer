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

-- Dumping structure for table ts_0002.ts_comm_contents
DROP TABLE IF EXISTS `ts_comm_contents`;
CREATE TABLE IF NOT EXISTS `ts_comm_contents` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CodeType : 000은 Type에 대한 정리 코드',
  `CONTENTS_TYPE` varchar(8) DEFAULT NULL COMMENT '약관 테이블의 Idx',
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='약관 테이블	';

-- Dumping data for table ts_0002.ts_comm_contents: ~7 rows (approximately)
/*!40000 ALTER TABLE `ts_comm_contents` DISABLE KEYS */;
INSERT INTO `ts_comm_contents` (`IDX`, `CONTENTS_TYPE`, `VERSION`, `TITLE`, `SUB_TITLE`, `LINK_URL`, `CONTENTS`, `VIEW_CNT`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(37, 'terms', 1, '이용약관', NULL, NULL, '이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관', NULL, 'U', 'tago', '2018-12-11 10:19:30', NULL, '2019-01-08 10:29:32'),
	(38, 'privacy', 1, '개인정보취급방침', NULL, NULL, '개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침', NULL, 'U', 'tago', '2018-12-11 10:20:03', NULL, '2019-01-08 10:29:56'),
	(39, 'privacy', 2, '개인정보취급방침', NULL, NULL, '개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침 come on123', NULL, 'U', 'tago', '2018-12-11 10:31:10', NULL, '2019-01-08 10:29:58'),
	(40, 'terms', 2, '이용약관', NULL, NULL, 'hereglegchiin zarchim ', NULL, 'U', 'tago', '2018-12-11 10:42:42', NULL, '2019-01-08 10:29:36'),
	(41, 'terms', 3, '이용약관', NULL, NULL, 'hereglegchiin zarchim test test', NULL, 'U', 'tago', '2018-12-11 10:46:11', NULL, '2019-01-08 10:29:39'),
	(44, 'terms', 4, '이용약관', NULL, NULL, 'hereglegchiin zarchim test test\r\nfds\r\nfd\r\nfsd\r\nfd\r\nfsd\r\nsfd\r\n', NULL, 'U', 'tago', '2018-12-12 12:04:00', NULL, '2019-01-08 11:30:10'),
	(45, 'privacy', 3, '개인정보취급방침', NULL, NULL, '개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방\r\nfdsf\r\ns\r\nsfd\r\nsfdf\r\n\r\n침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침 come on123', NULL, 'U', 'tago', '2018-12-12 12:04:15', NULL, '2019-01-08 12:55:24'),
	(49, 'terms', 5, 'test', NULL, NULL, 'test', NULL, 'U', 'tago', '2019-01-08 11:30:10', NULL, '2019-01-08 12:29:55'),
	(55, 'terms', 6, 'test', NULL, NULL, 'test1', NULL, 'U', 'tago', '2019-01-08 12:29:55', NULL, '2019-01-08 12:30:32'),
	(56, 'terms', 7, 'Mongolia', NULL, NULL, 'MongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliAMongoliA', NULL, 'U', 'tago', '2019-01-08 12:30:32', NULL, '2019-01-08 12:33:04'),
	(58, 'terms', 8, 'MasterBook', NULL, NULL, 'MasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBook', NULL, 'U', 'tago', '2019-01-08 12:33:04', NULL, '2019-01-08 12:33:45'),
	(59, 'terms', 9, 'MasterBook', NULL, NULL, 'MasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBookMasterBook\r\n\r\n\r\n\r\nMasterBookMasterBookMasterBookMasterBookMasterBook', NULL, 'U', 'tago', '2019-01-08 12:33:45', NULL, '2019-01-08 12:55:39'),
	(60, 'privacy', 0, '개인정보취급방침', NULL, NULL, 'privacy123', NULL, 'U', 'tago', '2019-01-08 12:55:24', NULL, NULL),
	(61, 'terms', 0, 'MasterBook', NULL, NULL, 'Terms and conditions', NULL, 'U', 'tago', '2019-01-08 12:55:39', NULL, NULL);
/*!40000 ALTER TABLE `ts_comm_contents` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
