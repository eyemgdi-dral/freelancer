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

-- Dumping structure for table ts_0001.ts_prd_category
DROP TABLE IF EXISTS `ts_prd_category`;
CREATE TABLE IF NOT EXISTS `ts_prd_category` (
  `CATE_ID` varchar(50) NOT NULL COMMENT '카테고리 코드',
  `CATE_LEVEL` smallint(6) NOT NULL DEFAULT 1 COMMENT '레벨',
  `PARENT_ID` varchar(50) NOT NULL DEFAULT '0' COMMENT '부모 카테고리 코드',
  `CATE_NAME` varchar(96) NOT NULL COMMENT '카테고리 이름',
  `CATE_DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '설명',
  `PRD_COUNT` varchar(200) DEFAULT '0',
  `SORT_NUM` varchar(50) DEFAULT NULL COMMENT '정렬번호 - 기본값 CATE_CODE',
  `USE_FLAG` char(1) NOT NULL DEFAULT 'U' COMMENT '사용유무(U: 사용, S:미사용, D:삭제)',
  `REG_USER` varchar(50) NOT NULL DEFAULT '',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` varchar(50) NOT NULL,
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`CATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 카테고리 - 주의 : 트리거 있음';

-- Dumping data for table ts_0001.ts_prd_category: ~6 rows (approximately)
/*!40000 ALTER TABLE `ts_prd_category` DISABLE KEYS */;
INSERT INTO `ts_prd_category` (`CATE_ID`, `CATE_LEVEL`, `PARENT_ID`, `CATE_NAME`, `CATE_DESCRIPTION`, `PRD_COUNT`, `SORT_NUM`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	('010000', 1, '', 'test1', 'test1', 'test1', '1', 'U', 'tago', '2018-12-07 16:26:52', 'tago', '2018-12-07 18:44:22'),
	('010100', 2, '010000', 'test2', 'test2', 'test2', '1.1', 'U', 'tago', '2018-12-07 16:30:31', '', '2018-12-07 18:45:24'),
	('010101', 3, '010100', 'test3', 'test3', 'test3', '1.1.1', 'U', 'tago', '2018-12-07 16:30:53', 'tago', '2018-12-07 18:45:32'),
	('010102', 3, '010100', 'test5', 'test5', '56', '1.1.2', 'U', 'tago', '2018-12-07 16:34:58', '', '2018-12-07 18:45:48'),
	('010200', 2, '010000', 'submenu1', 'submenu1', '123', '1.2', 'S', 'tago', '2018-12-07 16:31:18', 'tago', '2018-12-07 18:45:54'),
	('020000', 1, '', 'test1000', 'test1000', 'test1000', '2', 'U', 'tago', '2018-12-07 17:26:38', '', '2018-12-07 18:46:03');
/*!40000 ALTER TABLE `ts_prd_category` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
