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
DROP TABLE IF EXISTS `ts_admin_grade`;
CREATE TABLE IF NOT EXISTS `ts_admin_grade` (
  `GRADE_LEVEL` smallint(6) NOT NULL COMMENT '레벨',
  `ICON` varchar(320) DEFAULT NULL COMMENT '아이콘',
  `GRADE_NAME` varchar(24) NOT NULL COMMENT '등급 이름',
  `GRADE_MEMO` varchar(400) DEFAULT NULL COMMENT '설명',
  PRIMARY KEY (`GRADE_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 등급 - 높은 등급 - 낮은 숫자 지정\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0001.ts_admin_grade: ~2 rows (approximately)
/*!40000 ALTER TABLE `ts_admin_grade` DISABLE KEYS */;
INSERT INTO `ts_admin_grade` (`GRADE_LEVEL`, `ICON`, `GRADE_NAME`, `GRADE_MEMO`) VALUES
	(1, NULL, '전체메뉴', '전체메뉴'),
	(2, NULL, '운영팀', '운영팀'),
	(3, NULL, '재무팀', 'санхүүгйин баг');
/*!40000 ALTER TABLE `ts_admin_grade` ENABLE KEYS */;

-- Dumping structure for table ts_0001.ts_menu_auth_group
DROP TABLE IF EXISTS `ts_menu_auth_group`;
CREATE TABLE IF NOT EXISTS `ts_menu_auth_group` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_SEQ` int(11) NOT NULL COMMENT '	사이트 순번 TS_SITE 테이블의 SITE_SEQ	',
  `ADMIN_GRADE` smallint(6) DEFAULT NULL COMMENT 'Admin privelledge',
  `AUTHO_TITLE` varchar(200) DEFAULT NULL COMMENT '	권한명	',
  `AUTHO_CONTENTS` varchar(4000) DEFAULT NULL COMMENT '	권한설명	',
  `USE_FLAG` char(1) NOT NULL COMMENT '	사용유무(U: 사용, S:미사용, D:삭제)	',
  `REG_USER` varchar(20) NOT NULL COMMENT '	등록자ID	',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '	수정자ID	',
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='관리자 권한 그룹 테이블';

-- Dumping data for table ts_0001.ts_menu_auth_group: ~3 rows (approximately)
/*!40000 ALTER TABLE `ts_menu_auth_group` DISABLE KEYS */;
INSERT INTO `ts_menu_auth_group` (`IDX`, `SITE_SEQ`, `ADMIN_GRADE`, `AUTHO_TITLE`, `AUTHO_CONTENTS`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(1, 1, 3, 'this is group title', 'This is group content', 'U', 'tago', '2018-10-26 16:26:12', 'tago', '2018-11-05 11:08:01'),
	(2, 1, 2, 'ewr111', 'ewr1111', 'U', 'tago', '2018-10-26 16:26:17', 'tago', '2018-11-05 11:02:53'),
	(3, 1, 2, 'check bro11', 'ewr11', 'U', 'tago', '2018-10-26 16:27:55', 'tago', '2018-11-05 09:30:00'),
	(4, 1, 1, NULL, 'alright lets do it', 'U', 'tago', '2018-11-05 09:38:02', 'tago', '2018-11-05 10:42:26');
/*!40000 ALTER TABLE `ts_menu_auth_group` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
