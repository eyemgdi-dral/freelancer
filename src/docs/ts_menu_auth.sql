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

-- Dumping structure for table ts_0001.ts_menu_autho
DROP TABLE IF EXISTS `ts_menu_autho`;
CREATE TABLE IF NOT EXISTS `ts_menu_autho` (
  `MENU_AUTHO_GROUP_IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '관리자 권한 그룹 테이블 순번',
  `SITE_SEQ` int(11) NOT NULL COMMENT '사이트 순번',
  `GROUP_ID` int(11) NOT NULL COMMENT '메뉴 테이블의 그룹 ID',
  `MENU_ID` varchar(6) NOT NULL COMMENT '메뉴ID',
  `AUTHO_LIST` char(1) DEFAULT NULL COMMENT '리스트 조회권한',
  `AUTHO_VIEW` char(1) NOT NULL COMMENT '조회권한',
  `AUTHO_WRITE` char(1) NOT NULL COMMENT '작성권한',
  `AUTHO_MODIFY` char(1) NOT NULL COMMENT '수정권한',
  `AUTHO_DELETE` char(1) NOT NULL COMMENT '삭제권한',
  PRIMARY KEY (`MENU_AUTHO_GROUP_IDX`,`SITE_SEQ`,`GROUP_ID`,`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='관리자 그룹별 메뉴 권한 적용 테이블	';

-- Data exporting was unselected.
-- Dumping structure for table ts_0001.ts_menu_auth_group
DROP TABLE IF EXISTS `ts_menu_auth_group`;
CREATE TABLE IF NOT EXISTS `ts_menu_auth_group` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_SEQ` int(11) NOT NULL COMMENT '	사이트 순번 TS_SITE 테이블의 SITE_SEQ	',
  `AUTHO_TITLE` varchar(200) DEFAULT NULL COMMENT '	권한명	',
  `AUTHO_CONTENTS` varchar(4000) DEFAULT NULL COMMENT '	권한설명	',
  `USE_FLAG` char(1) NOT NULL COMMENT '	사용유무(U: 사용, S:미사용, D:삭제)	',
  `REG_USER` varchar(20) NOT NULL COMMENT '	등록자ID	',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '	수정자ID	',
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='관리자 권한 그룹 테이블';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
