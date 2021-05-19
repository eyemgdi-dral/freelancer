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

-- Dumping structure for table ts_0001.ts_base_cmomey
DROP TABLE IF EXISTS `ts_base_cmomey`;
CREATE TABLE IF NOT EXISTS `ts_base_cmomey` (
  `SITE_SEQ` int(11) NOT NULL COMMENT '사이트코드',
  `JOIN_CMOMEY` int(11) DEFAULT NULL COMMENT '회원가입 시 제공 적립금',
  `BOARD_CMOMEY` int(11) DEFAULT NULL COMMENT '게시글 작성 제공 적립금',
  `COMMENT_CMOMEY` int(11) DEFAULT NULL COMMENT '댓글 작성 적립금',
  `POLICY_TYPE` varchar(4) DEFAULT NULL COMMENT '구매적립금 정책 유형 (N: no, R: register, A: payment,P: purchase, E: rent)',
  `POLICY_VALUE` int(11) DEFAULT NULL COMMENT '구매 적립금 비율 또는 금액',
  `USE_MIN` int(11) DEFAULT NULL COMMENT '사용가능한 최소 적립금',
  `USE_MAX` int(11) DEFAULT NULL COMMENT '사용가능한 최대 적립금',
  PRIMARY KEY (`SITE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='적립금 정책';

-- Dumping data for table ts_0001.ts_base_cmomey: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_base_cmomey` DISABLE KEYS */;
INSERT INTO `ts_base_cmomey` (`SITE_SEQ`, `JOIN_CMOMEY`, `BOARD_CMOMEY`, `COMMENT_CMOMEY`, `POLICY_TYPE`, `POLICY_VALUE`, `USE_MIN`, `USE_MAX`) VALUES
	(1, 200, NULL, 100, 'N', 1000, 2000, 3000);
/*!40000 ALTER TABLE `ts_base_cmomey` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
