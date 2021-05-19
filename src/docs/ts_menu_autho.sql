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

-- Dumping structure for table ts_0002.ts_menu_autho
DROP TABLE IF EXISTS `ts_menu_autho`;
CREATE TABLE IF NOT EXISTS `ts_menu_autho` (
  `MENU_AUTHO_GROUP_IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '관리자 권한 그룹 테이블 순번',
  `GROUP_ID` int(11) NOT NULL COMMENT '메뉴 테이블의 그룹 ID',
  `MENU_ID` char(6) NOT NULL COMMENT '메뉴ID',
  `AUTHO_LIST` char(100) DEFAULT NULL COMMENT '리스트 조회권한',
  `AUTHO_VIEW` char(100) NOT NULL COMMENT '조회권한',
  `AUTHO_WRITE` char(100) NOT NULL COMMENT '작성권한',
  `AUTHO_MODIFY` char(100) NOT NULL COMMENT '수정권한',
  `AUTHO_DELETE` char(100) NOT NULL COMMENT '삭제권한',
  PRIMARY KEY (`MENU_AUTHO_GROUP_IDX`,`GROUP_ID`,`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 COMMENT='관리자 그룹별 메뉴 권한 적용 테이블	';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
