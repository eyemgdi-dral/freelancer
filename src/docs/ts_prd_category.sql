-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.13 - MySQL Community Server - GPL
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
  `CATE_LEVEL` smallint(6) NOT NULL DEFAULT '1' COMMENT '레벨',
  `PARENT_ID` varchar(50) NOT NULL DEFAULT '0' COMMENT '부모 카테고리 코드',
  `CATE_NAME` varchar(96) NOT NULL COMMENT '카테고리 이름',
  `CATE_DESCRIPTION` double DEFAULT NULL COMMENT '설명',
  `PRD_COUNT` varchar(200) NOT NULL DEFAULT '0',
  `SORT_NUM` varchar(50) NOT NULL COMMENT '정렬번호 - 기본값 CATE_CODE',
  `USE_FLAG` char(1) NOT NULL DEFAULT 'U' COMMENT '사용유무(U: 사용, S:미사용, D:삭제)',
  `REG_USER` varchar(50) NOT NULL,
  `REG_DATE` datetime NOT NULL,
  `MOD_USER` varchar(50) NOT NULL,
  `MOD_DATE` datetime NOT NULL,
  PRIMARY KEY (`CATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 카테고리 - 주의 : 트리거 있음';

-- Dumping data for table ts_0001.ts_prd_category: ~6 rows (approximately)
DELETE FROM `ts_prd_category`;
/*!40000 ALTER TABLE `ts_prd_category` DISABLE KEYS */;
INSERT INTO `ts_prd_category` (`CATE_ID`, `CATE_LEVEL`, `PARENT_ID`, `CATE_NAME`, `CATE_DESCRIPTION`, `PRD_COUNT`, `SORT_NUM`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	('10', 1, '10', '문자 솔루션', NULL, '0', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
	('20', 1, '10', 'Bizwiz 그룹웨어', NULL, '0', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
	('30', 1, '10', '중고차 솔루션', NULL, '0', '3', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
	('40', 1, '10', '부동산 솔루션', NULL, '0', '4', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
	('50', 1, '10', '콜센터 솔루션', NULL, '0', '5', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
	('60', 1, '10', '쇼핑몰 솔루션', NULL, '0', '6', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ts_prd_category` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
