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

-- Dumping structure for table ts_0001.ts_comm_group
DROP TABLE IF EXISTS `ts_comm_group`;
CREATE TABLE IF NOT EXISTS `ts_comm_group` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '자동증가순번',
  `SITE_SEQ` int(11) DEFAULT NULL COMMENT '사이트순번',
  `GROUP_DIV` varchar(20) DEFAULT NULL COMMENT '컨텐츠 유형 Content Type',
  `TITLE` varchar(200) DEFAULT NULL COMMENT '제목',
  `SUB_TITLE` varchar(400) DEFAULT NULL COMMENT '부제목(설명)',
  `LINK_URL` varchar(200) DEFAULT NULL COMMENT '해당 내용의 링크',
  `SORT_NUM` smallint(6) DEFAULT NULL COMMENT '글의 순서',
  `USE_FLAG` char(10) NOT NULL DEFAULT 'U' COMMENT '사용유무(U: 사용, S:미사용, D:삭제)',
  `REG_USER` varchar(20) DEFAULT NULL COMMENT '등록자ID',
  `REG_DATE` datetime DEFAULT current_timestamp() COMMENT '등록일',
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '수정자ID',
  `MOD_DATE` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='게시물, 약관 내용이 큰 컨텐츠의 내용을 한곳에서 관리	';

-- Dumping data for table ts_0001.ts_comm_group: ~19 rows (approximately)
/*!40000 ALTER TABLE `ts_comm_group` DISABLE KEYS */;
INSERT IGNORE INTO `ts_comm_group` (`IDX`, `SITE_SEQ`, `GROUP_DIV`, `TITLE`, `SUB_TITLE`, `LINK_URL`, `SORT_NUM`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(23, 1, 'TBMeta', '1234', '9999', NULL, 1, 'U', 'tago', '2018-11-05 16:24:06', 'tago', '2018-11-06 12:32:06'),
	(24, 1, 'TBMeta', '11', '11', NULL, 1, 'U', 'tago', '2018-11-05 16:47:32', NULL, '2018-11-05 16:47:32'),
	(25, 1, 'TBMeta', 'ee', 'eeeeee', NULL, 1, 'U', 'tago', '2018-11-05 17:11:03', NULL, '2018-11-05 17:11:03'),
	(26, 1, 'TBMeta', 'w2', 'w2', NULL, 333, 'U', 'tago', '2018-11-05 17:35:29', NULL, '2018-11-06 14:45:47'),
	(27, 1, 'TBMeta', 'w23', 'w23', NULL, 4, 'U', 'tago', '2018-11-05 17:35:34', 'tago', '2018-11-06 14:44:01'),
	(28, 1, 'TBMeta', 'ee11', 'aaaa1', NULL, 1, 'U', 'tago', '2018-11-06 10:09:00', NULL, '2018-11-06 10:09:00'),
	(29, 1, 'TBMeta', '1234', '12344', NULL, 1, 'U', 'tago', '2018-11-06 10:20:29', NULL, '2018-11-06 10:20:29'),
	(30, 1, 'TBMeta', '11', '777', NULL, 1, 'D', 'tago', '2018-11-06 10:20:35', 'tago', '2018-11-06 14:17:14'),
	(31, 1, 'TBMeta', '1122', '12344', NULL, 11, 'D', 'tago', '2018-11-06 10:20:48', NULL, '2018-11-06 14:44:58'),
	(32, 1, 'TBMeta', '1234', '5556', NULL, 1, 'D', 'tago', '2018-11-06 10:21:10', NULL, '2018-11-06 11:58:08'),
	(33, 1, 'TBMeta', 'ee443311', 'eeeeee443311', NULL, 1, 'D', 'tago', '2018-11-06 10:27:19', 'tago', '2018-11-06 11:41:14'),
	(34, 1, 'TBMeta', 'new group', 'new groupnot ', NULL, 1, 'D', 'tago', '2018-11-06 10:28:11', 'tago', '2018-11-06 11:38:04'),
	(35, 1, 'TBMeta', '132', '456456', NULL, 1, 'D', 'tago', '2018-11-06 12:32:14', 'tago', '2018-11-06 12:37:31'),
	(36, 1, 'TBMeta', '777', '77711', NULL, 1, 'U', 'tago', '2018-11-06 14:17:21', 'tago', '2018-11-06 14:17:49'),
	(37, 1, 'TBMeta', 'nerr', 'nrerr', NULL, 133, 'U', 'tago', '2018-11-06 14:42:52', NULL, '2018-11-06 14:45:38'),
	(38, 1, 'TBMeta', 'qwe', 'qweqwe', NULL, 2, 'U', 'tago', '2018-11-06 14:43:51', NULL, '2018-11-06 14:43:51'),
	(39, 1, 'TBMeta', 'as dfasd f', 'a sdfa sdf', NULL, 3, 'U', 'tago', '2018-11-06 14:43:56', NULL, '2018-11-06 14:43:56'),
	(40, 1, 'TBMeta', 'sdfsadf', 'asdfasdf', NULL, 334, 'D', 'tago', '2018-11-06 14:45:57', 'tago', '2018-11-07 12:17:46'),
	(41, 1, 'TBMeta', 'ree', 'eeeeqqq', NULL, 335, 'U', 'tago', '2018-11-15 10:55:06', NULL, '2018-11-15 10:55:06');
/*!40000 ALTER TABLE `ts_comm_group` ENABLE KEYS */;

-- Dumping structure for table ts_0001.ts_site_meta
DROP TABLE IF EXISTS `ts_site_meta`;
CREATE TABLE IF NOT EXISTS `ts_site_meta` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '코드Type',
  `SITE_SEQ` int(11) NOT NULL COMMENT '사이트순번',
  `GROUP_IDX` int(11) DEFAULT NULL COMMENT '그룹순번',
  `PAGE_NAME` varchar(200) DEFAULT NULL COMMENT '페이지명',
  `PAGE_LINK` varchar(500) DEFAULT NULL COMMENT '페이지 주소(도메인 뒤)',
  `META_TITLE` varchar(1000) DEFAULT NULL COMMENT 'Meta Tatle',
  `META_KEYWORDS` varchar(1000) DEFAULT NULL COMMENT 'Meta Keywords',
  `META_SUBJECT` varchar(1000) DEFAULT NULL COMMENT 'Meta Subject',
  `META_DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT 'Meta Description',
  `USE_FLAG` char(10) NOT NULL DEFAULT 'U' COMMENT '사용유무(U: 사용, S:미사용, D:삭제)',
  `REG_USER` varchar(20) DEFAULT NULL COMMENT '등록자ID',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '수정자ID',
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '수정일',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='사이트의 메타태그	';

-- Dumping data for table ts_0001.ts_site_meta: ~8 rows (approximately)
/*!40000 ALTER TABLE `ts_site_meta` DISABLE KEYS */;
INSERT IGNORE INTO `ts_site_meta` (`IDX`, `SITE_SEQ`, `GROUP_IDX`, `PAGE_NAME`, `PAGE_LINK`, `META_TITLE`, `META_KEYWORDS`, `META_SUBJECT`, `META_DESCRIPTION`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(1, 1, 38, '11', '11', '11', '11', '11', '11', 'S', 'tago', '2018-11-06 20:07:43', 'tago', '2018-11-14 12:02:17'),
	(2, 1, NULL, '3', '3', '3', '3', '3', '3', 'D', 'tago', '2018-11-07 10:24:05', 'tago', '2018-11-07 12:11:02'),
	(3, 1, NULL, '4', '4', '4', '4', '4', '4', 'D', 'tago', '2018-11-07 10:24:14', NULL, '2018-11-07 11:38:08'),
	(4, 1, NULL, '2', '2', '2', '2', '2', '2', 'D', 'tago', '2018-11-07 12:11:18', 'tago', '2018-11-07 12:15:34'),
	(5, 1, NULL, '2', '2', '2', '2', '2', '2', 'D', 'tago', '2018-11-12 09:47:18', 'tago', '2018-11-12 09:47:41'),
	(6, 1, 39, '13', '13', '13', '13', '13', '13', 'U', 'tago', '2018-11-12 10:15:11', 'tago', '2018-11-12 11:25:27'),
	(7, 1, 25, '14', '14', '14', '14', '14', '14', 'D', 'tago', '2018-11-12 10:16:32', 'tago', '2018-11-12 11:25:30'),
	(8, 1, 28, '4', '4', '4', '4', '4', '4', 'U', 'tago', '2018-11-15 10:55:18', NULL, NULL);
/*!40000 ALTER TABLE `ts_site_meta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
