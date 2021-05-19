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

-- Dumping structure for table ts_0002.ts_admin
DROP TABLE IF EXISTS `ts_admin`;
CREATE TABLE IF NOT EXISTS `ts_admin` (
  `ADMIN_ID` varchar(24) NOT NULL COMMENT '관리자 아이디',
  `ADMIN_PWD` varchar(256) NOT NULL COMMENT '비밀번호',
  `ADMIN_NAME` varchar(24) DEFAULT NULL COMMENT '이름',
  `NICKNAME` varchar(24) DEFAULT NULL COMMENT '별명',
  `ICON` varchar(320) DEFAULT NULL COMMENT '아이콘',
  `EMAIL` varchar(24) DEFAULT NULL COMMENT '이메일',
  `PHONE` varchar(24) DEFAULT NULL COMMENT '전화',
  `MOBILE` varchar(24) DEFAULT NULL COMMENT '핸드폰',
  `MEMO` varchar(1000) DEFAULT NULL COMMENT '메모',
  `AUTHS` mediumtext DEFAULT NULL COMMENT '권한 [미정]',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `MOD_DATE` datetime DEFAULT NULL COMMENT '수정일',
  `USE_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `AUTH_GROUP_IDX` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_admin: ~5 rows (approximately)
/*!40000 ALTER TABLE `ts_admin` DISABLE KEYS */;
INSERT INTO `ts_admin` (`ADMIN_ID`, `ADMIN_PWD`, `ADMIN_NAME`, `NICKNAME`, `ICON`, `EMAIL`, `PHONE`, `MOBILE`, `MEMO`, `AUTHS`, `REG_DATE`, `MOD_DATE`, `USE_FLAG`, `AUTH_GROUP_IDX`) VALUES
	('admin', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', '관리자1', NULL, NULL, 'asda@sdfgs.com', '', '', '', NULL, '2017-07-18 15:46:00', '2018-12-28 16:28:06', 'Y', 5),
	('bace', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', 'батцэцэг', NULL, NULL, 'bace_n20@yahoo.com', '', '', '', NULL, '2018-11-13 16:36:29', '2018-12-28 10:29:11', 'Y', 6),
	('bronze', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', 'baaal', NULL, '/image/admin/20180921154009683001.jpg', 'bal@g.com', '', '', '', NULL, '2018-09-21 15:38:57', '2018-12-28 10:29:27', 'Y', 7),
	('executer', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', 'Bayraa1111', NULL, '/image/admin/20180921145204687001.png', 'bayar@g.com', '010-9999-9999', '010-8888-8888', 'This is test admin', NULL, '2018-09-21 14:48:58', '2018-12-28 10:29:36', 'Y', 8),
	('tagotest', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', '문양희', NULL, NULL, 'cmccmc@naver.com', '070-8244-5807', '010-2297-4223', '타고플러스 테스트 계정\r\n슈퍼 관리자 아님.', NULL, '2018-11-19 16:59:22', NULL, 'Y', 2);
/*!40000 ALTER TABLE `ts_admin` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_menu_auth_group
DROP TABLE IF EXISTS `ts_menu_auth_group`;
CREATE TABLE IF NOT EXISTS `ts_menu_auth_group` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `AUTHO_TITLE` varchar(200) DEFAULT NULL COMMENT '	권한명	',
  `AUTHO_CONTENTS` varchar(4000) DEFAULT NULL COMMENT '	권한설명	',
  `USE_FLAG` char(1) NOT NULL COMMENT '	사용유무(U: 사용, S:미사용, D:삭제)	',
  `REG_USER` varchar(20) NOT NULL COMMENT '	등록자ID	',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '	수정자ID	',
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='관리자 권한 그룹 테이블';

-- Dumping data for table ts_0002.ts_menu_auth_group: ~4 rows (approximately)
/*!40000 ALTER TABLE `ts_menu_auth_group` DISABLE KEYS */;
INSERT INTO `ts_menu_auth_group` (`IDX`, `AUTHO_TITLE`, `AUTHO_CONTENTS`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(5, 'G-Group', 'this is operational team', 'U', 'tago', '2018-11-21 18:51:23', 'tago', '2018-12-28 10:25:25'),
	(6, 'SkylineGroup', '재무팀 테스트 계정 come naan', 'U', 'tago', '2018-11-23 12:44:13', 'tago', '2018-12-28 10:25:12'),
	(7, 'Test Group', '', 'U', 'tago', '2018-11-23 15:51:50', 'tago', '2018-12-28 10:24:58'),
	(8, 'AdminGroup', 'WOOOOOOOOOOOOOW', 'U', 'tago', '2018-12-11 18:16:25', 'tago', '2018-12-28 10:08:17');
/*!40000 ALTER TABLE `ts_menu_auth_group` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- Dumping structure for table ts_0001.ts_admin_grade
DROP TABLE IF EXISTS `ts_admin_grade`;
