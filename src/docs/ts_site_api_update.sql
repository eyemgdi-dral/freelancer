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

-- Dumping structure for table ts_0001.ts_site_api
DROP TABLE IF EXISTS `ts_site_api`;
CREATE TABLE IF NOT EXISTS `ts_site_api` (
  `SITE_SEQ` int(11) NOT NULL COMMENT '사이트 순번',
  `MAP_TYPE` varchar(10) DEFAULT NULL COMMENT '지도 구분(naver, google, daum)',
  `MAP_KEY` varchar(1000) DEFAULT NULL COMMENT '지도에 키를 사용하면 입력',
  `EDITOR_TYPE` varchar(10) DEFAULT NULL COMMENT 'Editor 구분(CKEditor, naver)',
  `EDITOR_KEY` varchar(1000) DEFAULT NULL COMMENT 'Editor 키(있는 경우에 사용)',
  `UPLOAD_TYPE` varchar(10) DEFAULT NULL COMMENT 'upload 유형',
  `UPLOAD_KEY` varchar(1000) DEFAULT NULL COMMENT 'upload key(있는 경우에 사용)',
  `NAVER_LOG_ID` varchar(100) DEFAULT NULL COMMENT 'naver 로그분석 ID',
  `NAVER_LOG_VALUE` varchar(1000) DEFAULT NULL COMMENT 'naver 로그분석 전환값',
  `GOOGLE_LOG_ID` varchar(100) DEFAULT NULL COMMENT 'Google Analytics ID',
  `GOOGLE_LOG_VALUE` varchar(1000) DEFAULT NULL COMMENT 'naver 로그분석 전환값(필요한 경우에 사용)',
  `PHONE_CHECK_ID` varchar(20) DEFAULT NULL COMMENT '본인인증코드(ID)',
  `PHONE_CHECK_PW` varchar(20) DEFAULT NULL COMMENT '본인인증 비밀번호',
  `IPIN_ID` varchar(20) DEFAULT NULL COMMENT 'IPIN인증 코드(ID)',
  `IPIN_PW` varchar(20) DEFAULT NULL COMMENT 'IPIN인증 비밀번호',
  `FACEBOOK_KEY` varchar(1000) DEFAULT NULL COMMENT '페이스북 사용키(있는 경우에 사용)',
  `TWITTER_KEY` varchar(1000) DEFAULT NULL COMMENT '트위터 사용키(있는 경우에 사용)',
  `KAKAO_KEY` varchar(1000) DEFAULT NULL COMMENT '카카오스토리 사용키(있는 경우에 사용)',
  `NAVER_KEY` varchar(1000) DEFAULT NULL COMMENT '네이버 블로그 사용키(있는 경우에 사용)',
  PRIMARY KEY (`SITE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='사이트 테이블';

-- Dumping data for table ts_0001.ts_site_api: ~1 rows (approximately)
/*!40000 ALTER TABLE `ts_site_api` DISABLE KEYS */;
REPLACE INTO `ts_site_api` (`SITE_SEQ`, `MAP_TYPE`, `MAP_KEY`, `EDITOR_TYPE`, `EDITOR_KEY`, `UPLOAD_TYPE`, `UPLOAD_KEY`, `NAVER_LOG_ID`, `NAVER_LOG_VALUE`, `GOOGLE_LOG_ID`, `GOOGLE_LOG_VALUE`, `PHONE_CHECK_ID`, `PHONE_CHECK_PW`, `IPIN_ID`, `IPIN_PW`, `FACEBOOK_KEY`, `TWITTER_KEY`, `KAKAO_KEY`, `NAVER_KEY`) VALUES
	(1, 'naver', 'x7Q2bILKpMTpvVAR8Fvj', 'CKEditor', 'editor', 'DextUpload', 'upload', 'naid', '0', 'gaid', '0', '111', '111', '222', '222', 'yes', 'no', 'no', 'yes');
/*!40000 ALTER TABLE `ts_site_api` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
