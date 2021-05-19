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


-- Dumping database structure for ts_0002
CREATE DATABASE IF NOT EXISTS `ts_0002` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ts_0002`;

-- Dumping structure for function ts_0002.GET_CODE_NAME
DROP FUNCTION IF EXISTS `GET_CODE_NAME`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `GET_CODE_NAME`(
	`P_CODE_CODE` VARCHAR(50)
) RETURNS varchar(50) CHARSET utf8
    COMMENT 'TS_FIXED_CODE 이름 반환'
BEGIN
	Declare V_RTN VARCHAR(50);
 
   SELECT CODE_NAME INTO V_RTN
   FROM TS_FIXED_CODE
   WHERE CODE_CODE = P_CODE_CODE
   AND SUBSTR(CODE_CODE, 4, 3) != '000';
   
   RETURN V_RTN;   
END//
DELIMITER ;

-- Dumping structure for function ts_0002.GET_USER_NAME
DROP FUNCTION IF EXISTS `GET_USER_NAME`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `GET_USER_NAME`(
	`P_USER_ID` VARCHAR(50)

) RETURNS varchar(50) CHARSET utf8
BEGIN
	Declare V_RTN VARCHAR(50);

   SELECT A.USER_NAME INTO V_RTN
   FROM (
   	SELECT
			USER_NAME,
			USER_ID
		FROM TS_MEMBER_INFO
   	UNION ALL
		SELECT
			ADMIN_NAME,
			ADMIN_ID
		FROM TS_ADMIN
		)	A
	WHERE A.USER_ID = P_USER_ID;

   RETURN V_RTN;
END//
DELIMITER ;

-- Dumping structure for table ts_0002.hibernate_sequence
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table ts_0002.hibernate_sequence: 2 rows
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(1),
	(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

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

-- Dumping structure for table ts_0002.ts_banner_info
DROP TABLE IF EXISTS `ts_banner_info`;
CREATE TABLE IF NOT EXISTS `ts_banner_info` (
  `BANNER_SEQ` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '배너 순번',
  `BM_SEQ` smallint(6) DEFAULT NULL COMMENT '배너 마스터 순번',
  `ORDERING` smallint(6) NOT NULL DEFAULT 0 COMMENT '우선순위',
  `USE_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `LINK_URL` varchar(320) DEFAULT NULL COMMENT '링크 주소',
  `LINK_TARGET` varchar(10) NOT NULL COMMENT '링크 타겟 [_self:자신, _blank:새창]',
  `BANNER_TYPE` varchar(1) NOT NULL COMMENT '이미지/HTML 구분 [I:이미지, B:HTML]',
  `BODY` mediumtext DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`BANNER_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='배너 정보\r\n';

-- Dumping data for table ts_0002.ts_banner_info: ~11 rows (approximately)
/*!40000 ALTER TABLE `ts_banner_info` DISABLE KEYS */;
INSERT INTO `ts_banner_info` (`BANNER_SEQ`, `BM_SEQ`, `ORDERING`, `USE_FLAG`, `LINK_URL`, `LINK_TARGET`, `BANNER_TYPE`, `BODY`) VALUES
	(2, 2, 1, 'Y', 'www.naver.com', '_blank', 'I', 'banner'),
	(3, 22, 1, 'Y', '', '_blank', 'B', '<p class="tel">1644-5805</p>\r\n\r\n<p class="fax">Fax : 02.6919.1793</p>\r\n\r\n<p class="time"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">9:00 ~ 18:00 </font></font><br />\r\n<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">(Saturday / Sunday public holidays) </font></font><br />\r\n<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">(Lunch time 12:00 ~ 13:00)</font></font></p>\r\n'),
	(4, 23, 1, 'Y', '', '_self', 'I', ''),
	(5, 23, 1, 'Y', '', '_blank', 'I', ''),
	(6, 23, 1, 'Y', '', '_self', 'I', ''),
	(7, 23, 1, 'Y', '', '_self', 'I', ''),
	(8, 24, 4, 'Y', '', '_blank', 'B', '<ul>\r\n	<li class="ban4">\r\n	<p class="sb"><a href="/pages/consulting.jsp">맞춤 홈페이지 제작<img class="mL5" src="/images/main/btn_more.png" /></a></p>\r\n\r\n	<p class="ex"><a href="/pages/consulting.jsp">나만의 스타일과 필요한<br />\r\n	기능으로 맞품제작 합니다.</a></p>\r\n	</li>\r\n</ul>\r\n'),
	(9, 24, 3, 'Y', '', '_blank', 'B', '<ul>\r\n	<li class="ban3">\r\n	<p class="sb"><a href="/pages/addition/sms_service.jsp">부가서비스 안내<img class="mL5" src="/images/main/btn_more.png" /></a></p>\r\n\r\n	<p class="ex"><a href="/pages/addition/sms_service.jsp">SMS, 웹호스팅, 온라인검색<br />\r\n	서비스를 도와드립니다.</a></p>\r\n	</li>\r\n</ul>\r\n'),
	(10, 24, 2, 'Y', '', '_blank', 'B', '<ul>\r\n	<li class="ban2">\r\n	<p class="sb"><a href="/pages/consulting.jsp">제작의뢰 안내<img class="mL5" src="/images/main/btn_more.png" /></a></p>\r\n\r\n	<p class="ex"><a href="/pages/consulting.jsp">고객 맞춤형 솔루션으로<br />\r\n	복잡한 과정을 절약합니다.</a></p>\r\n	</li>\r\n</ul>\r\n'),
	(11, 24, 1, 'Y', '', '_blank', 'B', '<ul>\r\n	<li class="ban1">\r\n	<p class="sb"><a href="/pages/customer/estimate.jsp">상담/견적 문의<img class="mL5" src="/images/main/btn_more.png" /></a></p>\r\n\r\n	<p class="ex"><a href="/pages/customer/estimate.jsp">홈페이지 제작 상담<br />\r\n	솔루션 상담 의뢰</a></p>\r\n	</li>\r\n</ul>\r\n'),
	(12, 23, 1, 'Y', '', '_blank', 'I', '<br />\r\n&nbsp;테스트');
/*!40000 ALTER TABLE `ts_banner_info` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_banner_master
DROP TABLE IF EXISTS `ts_banner_master`;
CREATE TABLE IF NOT EXISTS `ts_banner_master` (
  `BM_SEQ` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '배너 마스터 순번',
  `MASTER_CODE` varchar(24) NOT NULL COMMENT '배너 마스터 코드',
  `MASTER_NAME` varchar(24) NOT NULL COMMENT '배너 마스터 이름',
  `DIRECTION` varchar(1) NOT NULL COMMENT '배너 형태 [H:가로, V:세로]',
  `LF_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '배너 갯수 [가로일 경우 해당 갯수 이후 줄 바꿈]',
  `MARGIN` varchar(4) NOT NULL COMMENT '배너 간격',
  `USE_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용 여부',
  PRIMARY KEY (`BM_SEQ`),
  UNIQUE KEY `UIN_TS_BM_MASTER_CODE` (`MASTER_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='배너 마스터 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_banner_master: ~4 rows (approximately)
/*!40000 ALTER TABLE `ts_banner_master` DISABLE KEYS */;
INSERT INTO `ts_banner_master` (`BM_SEQ`, `MASTER_CODE`, `MASTER_NAME`, `DIRECTION`, `LF_COUNT`, `MARGIN`, `USE_FLAG`) VALUES
	(2, 'code', 'banner', 'V', 3, '1', 'Y'),
	(22, 'leftbanner', '레프트바 고객센터', 'H', 1, '', 'Y'),
	(23, 'mainb', '메인', 'H', 2, '', 'Y'),
	(24, 'main2', '메인2', 'H', 2, '', 'Y');
/*!40000 ALTER TABLE `ts_banner_master` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_base_cmomey
DROP TABLE IF EXISTS `ts_base_cmomey`;
CREATE TABLE IF NOT EXISTS `ts_base_cmomey` (
  `SITE_SEQ` tinyint(4) NOT NULL COMMENT '사이트코드',
  `JOIN_CMOMEY` int(11) DEFAULT NULL COMMENT '회원가입 시 제공 적립금',
  `BOARD_CMOMEY` int(11) DEFAULT NULL COMMENT '게시글 작성 제공 적립금',
  `COMMENT_CMOMEY` int(11) DEFAULT NULL COMMENT '댓글 작성 적립금',
  `POLICY_TYPE` varchar(4) DEFAULT NULL COMMENT '구매적립금 정책 유형 (N: no, R: register, A: payment,P: purchase, E: rent)',
  `POLICY_VALUE` int(11) DEFAULT NULL COMMENT '구매 적립금 비율 또는 금액',
  `USE_MIN` int(11) DEFAULT NULL COMMENT '사용가능한 최소 적립금',
  `USE_MAX` int(11) DEFAULT NULL COMMENT '사용가능한 최대 적립금',
  PRIMARY KEY (`SITE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='적립금 정책';

-- Dumping data for table ts_0002.ts_base_cmomey: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_base_cmomey` DISABLE KEYS */;
INSERT INTO `ts_base_cmomey` (`SITE_SEQ`, `JOIN_CMOMEY`, `BOARD_CMOMEY`, `COMMENT_CMOMEY`, `POLICY_TYPE`, `POLICY_VALUE`, `USE_MIN`, `USE_MAX`) VALUES
	(1, 15000, NULL, 1000, 'N', 14, 1000, 30000);
/*!40000 ALTER TABLE `ts_base_cmomey` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_board_category
DROP TABLE IF EXISTS `ts_board_category`;
CREATE TABLE IF NOT EXISTS `ts_board_category` (
  `BC_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시판 카테고리 순번',
  `BOARD_CODE` varchar(24) NOT NULL COMMENT '게시판 코드',
  `CATE_NAME` varchar(120) NOT NULL COMMENT '카테고리 이름',
  `MOUSEOVER_IMAGE` varchar(320) DEFAULT NULL COMMENT '카테고리 mouseover 이미지',
  `MOUSEOUT_IMAGE` varchar(320) DEFAULT NULL COMMENT '카테고리 mouseout 이미지',
  `ORDERING` smallint(6) NOT NULL DEFAULT 0 COMMENT '순서',
  PRIMARY KEY (`BC_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='게시판 카테고리[탭] 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_board_category: ~6 rows (approximately)
/*!40000 ALTER TABLE `ts_board_category` DISABLE KEYS */;
INSERT INTO `ts_board_category` (`BC_SEQ`, `BOARD_CODE`, `CATE_NAME`, `MOUSEOVER_IMAGE`, `MOUSEOUT_IMAGE`, `ORDERING`) VALUES
	(1, 'wwwwwwww', 'category', NULL, NULL, 0),
	(2, 'faqbbs', '솔루션', NULL, NULL, 0),
	(3, 'faqbbs', '홈페이지', NULL, NULL, 0),
	(4, 'boardcode', '카테고리1', NULL, NULL, 0),
	(5, 'faqbbs', '모듈', NULL, NULL, 0),
	(6, 'image', 'fsdfdsfdsfds', NULL, NULL, 0);
/*!40000 ALTER TABLE `ts_board_category` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_board_info
DROP TABLE IF EXISTS `ts_board_info`;
CREATE TABLE IF NOT EXISTS `ts_board_info` (
  `BOARD_SEQ` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '게시물 순번',
  `BOARD_CODE` varchar(24) NOT NULL COMMENT '게시판 코드',
  `BC_SEQ` int(11) NOT NULL DEFAULT 0 COMMENT '게시물 카테고리 코드',
  `PRODUCT_CODE` varchar(24) DEFAULT NULL COMMENT '제품 코드',
  `H_GROUP` bigint(20) NOT NULL DEFAULT 0 COMMENT '그룹번호-계층형',
  `H_ORDER` int(11) NOT NULL DEFAULT 0 COMMENT '정렬번호-계층형',
  `H_DEPTH` int(11) NOT NULL DEFAULT 0 COMMENT '깊이번호-계층형',
  `STAR` smallint(6) NOT NULL DEFAULT 0 COMMENT '별점',
  `NOTICE_YN` varchar(1) DEFAULT NULL COMMENT '공지 여부',
  `USER_NAME` varchar(24) DEFAULT NULL COMMENT '이름',
  `NICKNAME` varchar(24) DEFAULT NULL COMMENT '닉네임',
  `EMAIL` varchar(96) DEFAULT NULL COMMENT '이메일',
  `PHONE` varchar(24) DEFAULT NULL COMMENT '전화',
  `MOBILE` varchar(24) DEFAULT NULL COMMENT '휴대폰',
  `ZIPCODE` varchar(6) DEFAULT NULL COMMENT '우편번호',
  `ADDR1` varchar(320) DEFAULT NULL COMMENT '주소1',
  `ADDR2` varchar(320) DEFAULT NULL COMMENT '주소2',
  `SUBJECT` varchar(400) NOT NULL COMMENT '제목',
  `BODY` mediumtext DEFAULT NULL COMMENT '내용',
  `ANSWER` mediumtext DEFAULT NULL COMMENT '답변',
  `HTML_YN` varchar(1) DEFAULT NULL COMMENT 'HTML 사용 여부',
  `SECRET_YN` varchar(1) DEFAULT NULL COMMENT '비밀글 여부',
  `PWD` varchar(256) DEFAULT NULL COMMENT '비밀번호',
  `READ_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT '조회 수',
  `RECOMM_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT '추천 수',
  `NOT_RECOMM_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT '비추천 수',
  `COMMENT_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT '댓글 수',
  `ALOW_COM_YN` varchar(1) DEFAULT NULL,
  `IP_ADDR` int(11) DEFAULT NULL COMMENT 'IP주소',
  `REG_USER` varchar(24) DEFAULT NULL COMMENT '등록자',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `MOD_USER` varchar(24) DEFAULT NULL COMMENT '수정자',
  `MOD_DATE` datetime DEFAULT NULL COMMENT '수정일',
  `FAQ_FIXED_CODE` varchar(6) DEFAULT NULL COMMENT 'FAQ-고정코드[007]',
  `LINK_URL` varchar(320) DEFAULT NULL COMMENT '링크URL',
  `STATUS_FIXED_CODE` varchar(6) DEFAULT NULL COMMENT '처리 상태 고정 코드[003000]',
  `ADD_COL1` varchar(400) DEFAULT NULL COMMENT '여분 필드1',
  `ADD_COL2` varchar(400) DEFAULT NULL COMMENT '여분 필드2',
  `ADD_COL3` varchar(400) DEFAULT NULL COMMENT '여분 필드3',
  `ADD_COL4` varchar(400) DEFAULT NULL COMMENT '여분 필드4',
  `USE_FLAG` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`BOARD_SEQ`),
  KEY `XIN_TS_BOARD_INFO_BOARD_CODE` (`BOARD_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='게시물 정보';

-- Dumping data for table ts_0002.ts_board_info: ~57 rows (approximately)
/*!40000 ALTER TABLE `ts_board_info` DISABLE KEYS */;
INSERT INTO `ts_board_info` (`BOARD_SEQ`, `BOARD_CODE`, `BC_SEQ`, `PRODUCT_CODE`, `H_GROUP`, `H_ORDER`, `H_DEPTH`, `STAR`, `NOTICE_YN`, `USER_NAME`, `NICKNAME`, `EMAIL`, `PHONE`, `MOBILE`, `ZIPCODE`, `ADDR1`, `ADDR2`, `SUBJECT`, `BODY`, `ANSWER`, `HTML_YN`, `SECRET_YN`, `PWD`, `READ_COUNT`, `RECOMM_COUNT`, `NOT_RECOMM_COUNT`, `COMMENT_COUNT`, `ALOW_COM_YN`, `IP_ADDR`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`, `FAQ_FIXED_CODE`, `LINK_URL`, `STATUS_FIXED_CODE`, `ADD_COL1`, `ADD_COL2`, `ADD_COL3`, `ADD_COL4`, `USE_FLAG`) VALUES
	(1, 'test', 0, NULL, 1, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'nice', 'Hello GOOd one', NULL, 'Y', 'N', NULL, 1, 0, 0, 0, 'N', NULL, 'tago', '2018-09-14 16:18:40', 'tago', '2018-09-19 17:59:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(8, 'image', 0, NULL, 8, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'Test', '2313123123123test', NULL, 'Y', 'N', NULL, 40, 0, 0, 0, 'N', NULL, 'tago', '2018-09-18 19:27:42', 'tago', '2018-09-19 17:19:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(9, 'Tagorent', 0, NULL, 9, 1, 1, 0, 'N', 'hyundai', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'Suzuki, hyundai', 'hyundaihyundaihyundaihyundaihyundai<strong>hyundaihyundaihyundaihyundaihyundaihyundai<s>hyundaihyundaihyundai</s></strong>hyundaihyundaihyundai', NULL, 'Y', 'N', NULL, 1, 0, 0, 0, 'N', NULL, 'tago', '2018-09-19 15:14:37', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(10, 'image', 0, NULL, 10, 1, 1, 0, 'N', 'Tenger', NULL, NULL, '', '', NULL, NULL, NULL, 'Test', 'testsetetseets123123123123', NULL, 'Y', 'N', NULL, 2, 0, 0, 0, 'N', NULL, 'skyline', '2018-09-24 12:05:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(11, 'image', 0, NULL, 11, 1, 1, 0, 'N', 'admin', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'React', 'this bitch, asss , what ever ma good fuck', NULL, 'Y', 'N', NULL, 176, 0, 0, 0, 'Y', NULL, 'skyline', '2018-09-24 15:01:51', 'tago', '2018-09-27 15:19:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(12, 'image', 0, NULL, 12, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'REACT RENT CAR', 'React now to god adad', NULL, 'Y', 'N', NULL, 40, 0, 0, 0, 'N', NULL, 'tago', '2018-09-27 18:31:23', 'tago', '2018-11-01 10:54:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(13, 'image', 0, NULL, 13, 1, 1, 0, 'N', 'Tenger', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'allow react now', 'ewrwerwerwerwerwer', NULL, 'Y', 'N', NULL, 56, 0, 0, 0, 'N', NULL, 'skyline', '2018-09-27 18:37:40', 'tago', '2018-11-13 17:26:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(14, 'image', 0, NULL, 14, 1, 1, 0, 'N', 'batceceg', NULL, NULL, '', '', NULL, NULL, NULL, '코메트 쓰기', 'ㄺㅎㅇㄶㄴ휼율유', NULL, 'Y', 'N', NULL, 3, 0, 0, 0, NULL, NULL, 'bagi', '2018-10-08 16:33:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(15, 'boardcode', 0, NULL, 15, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'ddfsdfsdfsd', 'fsdafsdafa<br />\r\nfdas<br />\r\nf<br />\r\nsdaf<br />\r\nsdfa', NULL, 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-14 12:58:03', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(16, 'faqbbs', 3, NULL, 16, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'All Flash 홈페이지도 가능한가요? 궁금해요 ', '홈페이지 전체를 플레쉬로 제작이 가능합니다.<br />\r\n단지 일반 홈페이지의 디자인 및 프로그램 개발 보다 제작 공수면에서 시간이 많이 걸리기 때문에 그만큼의 제작 비용도 상승합니다.<br />\r\n<br />\r\n플레쉬로도 DB 연동이 가능 하며.. 쇼핑몰이나 기타 커뮤니티 제작 또한 가능합니다', NULL, 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-14 15:42:04', 'tago', '2018-11-17 15:53:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(17, 'faqbbs', 2, NULL, 17, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'Why does the price of my homepage vary from one company to another?', '<p>홈페이지라는 것이 일반 상품과 달라서 같은 내용을 제작하더라도 업체에 따라서 결과물의 Quality부분에 있어서 차이가 많이 날 수 있습니다.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>업체에 의뢰하신 것인지, 개인에게 의뢰 하신 것인지에 따라서의 차이 뿐 아니라, 업체라 할지라도 어느 정도 수준의 업체인지, 어떤 Quality의 인력을 투입해서 만들었는지에 따라서 결과물의 차이가 큽니다.</p>\r\n\r\n<p><br />\r\n간단한 예로, 짜장면 한 그릇을 먹더라도 어느 짜장면집에서 먹느냐에 따라서 맛, 재료, 인테리어, 서비스 등 전반적인 차이가 있고, 이에 따라 가격의 차이가 생깁니다.</p>\r\n', NULL, 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-14 15:42:42', 'tago', '2018-11-17 15:53:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(18, 'consulting', 0, NULL, 18, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'asdasd', 'asdasdasdasdasdasdasdasd', 'asdasd', 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-14 15:46:50', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(19, 'consulting', 0, NULL, 19, 1, 1, 0, 'N', 'tago11', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '문의함', 'ㅁㄴㅇ', '11234', 'Y', 'N', NULL, 7, 0, 0, 0, 'N', NULL, 'tago', '2018-11-14 15:47:37', 'tago', '2018-11-17 12:02:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(20, 'notice', 0, NULL, 20, 1, 1, 0, 'Y', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '공지사항 4 넷- 공지사항입니다. 가나다라마바사', '<img alt="" src="/upload/editor/20181119160113641001.jpg" style="width: 170px; height: 33px;" />공지사항 4 넷- 공지사항입니다. 가나다라마바사<br />\r\n<br />\r\n공지사항 4 넷- 공지사항입니다. 가나다라마바사', NULL, 'Y', 'N', NULL, 133, 0, 0, 0, 'N', NULL, 'tago', '2018-11-14 15:55:01', 'tago', '2018-11-19 16:01:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(21, 'test', 0, NULL, 21, 1, 1, 0, NULL, 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '에스에코', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Y', NULL, 'tago', '2018-11-14 17:33:00', 'tago', '2018-11-14 17:33:56', NULL, 'http://seco9.com/', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(22, 'portfolio', 0, NULL, 22, 1, 1, 0, NULL, 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '에스에코', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-14 17:39:37', 'tago', NULL, NULL, 'http://seco9.com/', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(23, 'test', 0, NULL, 23, 1, 1, 0, NULL, 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '영광미성영어조합', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-15 10:40:15', 'tago', NULL, NULL, 'http://ohwa.tagoplus.co.kr/main/main_real.asp', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(24, 'test', 0, NULL, 24, 1, 1, 0, NULL, 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '브이메트릭스', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-15 10:40:54', 'tago', NULL, NULL, 'http://www.vmatrix.co.kr/', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(25, 'portfolio', 0, NULL, 25, 1, 1, 0, NULL, 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '영광미성영어조합', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-15 11:33:35', 'tago', NULL, NULL, 'http://ohwa.tagoplus.co.kr/main/main_real.asp', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(26, 'portfolio', 0, NULL, 26, 1, 1, 0, NULL, 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '브이메트릭스', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-15 11:33:53', 'tago', NULL, NULL, 'http://브이메트릭스', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(27, 'portfolio', 0, NULL, 27, 1, 1, 0, NULL, 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '발자취', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-15 11:34:59', 'tago', NULL, NULL, 'http://baljachwi.com/', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(28, 'portfolio', 0, NULL, 28, 1, 1, 0, NULL, 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '옥션카즈', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-15 11:35:28', 'tago', NULL, NULL, 'http://greencar.tagoplus.co.kr/', NULL, NULL, NULL, NULL, NULL, 'Y'),
	(29, 'image', 0, NULL, 29, 1, 1, 0, 'N', 'smilepyw', NULL, NULL, '', '', NULL, NULL, NULL, '테스트', '&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;게시판 테스트 김치', NULL, 'Y', 'N', NULL, 8, 0, 0, 0, NULL, NULL, '961790161', '2018-11-17 12:39:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(30, 'image', 0, NULL, 30, 1, 1, 0, 'N', 'smilepyw', NULL, NULL, '', '', NULL, NULL, NULL, '테스트 김치 2', '&lt;img alt=&quot;&quot; src=&quot;/upload/editor/20181117124028998002.jpg&quot; style=&quot;width: 186px; height: 186px;&quot; /&gt;', NULL, 'Y', 'N', NULL, 5, 0, 0, 0, 'N', NULL, '961790161', '2018-11-17 12:40:54', 'tagotest', '2018-11-19 17:01:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(31, 'image', 0, NULL, 31, 1, 1, 0, 'N', 'smilepyw', NULL, NULL, '', '', NULL, NULL, NULL, '테스트 김치 3', '&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;김치', NULL, 'Y', 'N', NULL, 3, 0, 0, 0, NULL, NULL, '961790161', '2018-11-17 12:42:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(32, 'image', 0, NULL, 32, 1, 1, 0, 'N', 'smilepyw', NULL, NULL, '', '', NULL, NULL, NULL, '김치 테스트 중', '&lt;img alt=&quot;&quot; src=&quot;/upload/editor/20181117124300445004.jpg&quot; style=&quot;width: 186px; height: 186px;&quot; /&gt;&lt;br /&gt; &lt;br /&gt; &amp;nbsp;김치 김치&amp;nbsp;', NULL, 'Y', 'N', NULL, 3, 0, 0, 0, 'N', NULL, '961790161', '2018-11-17 12:43:15', 'tagotest', '2018-11-19 17:01:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(33, 'image', 0, NULL, 33, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '김치는 테스트 용도', '<br />\r\n<br />\r\n&nbsp;테스트 성공?', NULL, 'Y', 'N', NULL, 3, 0, 0, 0, 'N', NULL, 'tago', '2018-11-17 12:44:05', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(34, 'image', 0, NULL, 34, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '김치 미안', '<img alt="" src="/upload/editor/20181117124443888006.jpg" style="width: 186px; height: 186px;" /><br />\r\n<br />\r\n&nbsp;이번에는 성공인가요', NULL, 'Y', 'N', NULL, 5, 0, 0, 0, 'N', NULL, 'tago', '2018-11-17 12:45:06', 'tagotest', '2018-11-19 17:01:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(35, 'image', 0, NULL, 35, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '김치 미안 미안', '<img alt="" src="/upload/editor/20181117124544593007.jpg" style="width: 186px; height: 186px;" /><br />\r\n<br />\r\n&nbsp;김치 맛있겠다', NULL, 'Y', 'N', NULL, 5, 0, 0, 0, 'N', NULL, 'tago', '2018-11-17 12:46:06', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(36, 'image', 0, NULL, 36, 1, 1, 0, 'N', 'smilepyw', NULL, NULL, '', '', NULL, NULL, NULL, '김치와 소주', '&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/upload/editor/20181117124755250009.jpg&amp;quot; style=&amp;quot;width: 186px; height: 186px;&amp;quot; /&amp;gt;&amp;lt;br /&amp;gt;\r\n&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;김치와 소주 테스트 단지 테스트 중입니다', NULL, 'Y', 'N', NULL, 3, 0, 0, 0, NULL, NULL, '961790161', '2018-11-17 12:48:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(37, 'image', 0, NULL, 37, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '개발부장 좋아하는 소주', '<br />\r\n&nbsp;테스트 테스트 테스트', NULL, 'Y', 'N', NULL, 2, 0, 0, 0, 'N', NULL, 'tago', '2018-11-17 12:50:14', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(38, 'image', 0, NULL, 38, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '테스트 확인', '<img alt="" src="/upload/editor/20181117125105495012.jpg" style="width: 186px; height: 186px;" /><br />\r\n<br />\r\n<br />\r\n&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;김치&nbsp;', NULL, 'Y', 'N', NULL, 11, 0, 0, 0, 'N', NULL, 'tago', '2018-11-17 12:51:35', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(39, 'image', 0, NULL, 39, 1, 1, 0, 'N', 'smilepyw', NULL, NULL, '', '', NULL, NULL, NULL, '테스트 중입니다 김치', '&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;김치 테스트', NULL, 'Y', 'N', NULL, 14, 0, 0, 0, NULL, NULL, '961790161', '2018-11-17 13:00:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(40, 'faqbbs', 0, NULL, 40, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, '자주하는 질문 FAQ  테스트1', 'Байнга асуугддаг асуулт&nbsp;', NULL, 'Y', '', NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-11-17 15:52:34', 'tago', '2018-11-17 15:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(41, 'consulting', 0, '', 41, 1, 1, 0, 'N', 'Munkhtenger Gankhuyag', NULL, NULL, '', '', NULL, NULL, NULL, 'Test', 'coeme oosadsdas', NULL, 'Y', 'N', NULL, 7, 0, 0, 0, NULL, NULL, '108440031531899286571', '2018-11-17 18:00:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(42, 'consulting', 0, '', 42, 1, 1, 0, 'N', 'batceceg', '', NULL, '', '', NULL, NULL, NULL, '2233', 'ㄹㅇㄹㄴㅇㅎㅇㄶㄷㄱ', NULL, 'Y', 'N', NULL, 7, 0, 0, 0, NULL, NULL, 'bagi', '2018-11-19 16:06:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(43, 'picture', 0, NULL, 43, 1, 1, 0, 'N', '문양희', NULL, NULL, '', '', NULL, NULL, NULL, 'fdsdfsdf', 'sdfsdfsdf<br />\r\nsd<br />\r\nfs<br />\r\ndf<br />\r\nsdf<br />\r\nsfd<br />\r\n&nbsp;', NULL, 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tagotest', '2018-11-19 17:01:20', 'tagotest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(44, 'faqbbs', 5, NULL, 44, 1, 1, 0, 'N', '문양희', NULL, NULL, '', '', NULL, NULL, NULL, 'ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹ', 'ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇ<br />\r\nㄹ<br />\r\nㄴ<br />\r\n<br />\r\nㄴㅇㄹ<br />\r\nㄴㅇ<br />\r\nㄹㄴ', NULL, 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tagotest', '2018-11-19 17:03:49', 'tagotest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(45, 'image', 0, NULL, 45, 1, 1, 0, 'N', 'batceceg', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'test zurag oruulah ', '<img alt="" src="/upload/editor/20181121155852465001.jpg" style="width: 1024px; height: 768px;" />', NULL, 'Y', 'N', NULL, 31, 0, 0, 0, 'Y', NULL, 'bagi', '2018-11-20 17:53:35', 'tago', '2018-11-21 15:59:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(46, 'consulting', 0, NULL, 46, 1, 1, 0, 'Y', 'billy_d', NULL, NULL, '', '', NULL, NULL, NULL, '11', '&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/upload/editor/20181121203437620001.jpg&amp;quot; style=&amp;quot;width: 1024px; height: 768px;&amp;quot; /&amp;gt;', NULL, 'Y', 'Y', NULL, 3, 0, 0, 0, NULL, NULL, 'billy_d', '2018-11-21 20:34:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(47, 'image', 0, NULL, 47, 1, 1, 0, 'N', 'billy_d', NULL, NULL, '', '', NULL, NULL, NULL, 'йЫйыЙЫЙЫйы', '&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/upload/editor/20181122120659716002.jpg&amp;quot; style=&amp;quot;width: 223px; height: 168px;&amp;quot; /&amp;gt;&amp;lt;br /&amp;gt;\r\nыйбыбыбйыбыыйбйыйыбйыбйы', NULL, 'Y', 'N', NULL, 4, 0, 0, 0, NULL, NULL, 'billy_d', '2018-11-22 12:07:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(48, 'consulting', 0, NULL, 48, 1, 1, 0, 'N', 'aaa', '', NULL, '', '', NULL, NULL, NULL, 'tsdfsdfsdfsdf', 'dfadsfasdf&amp;lt;br /&amp;gt;\r\nsda&amp;lt;br /&amp;gt;\r\nf&amp;lt;br /&amp;gt;\r\nsdf&amp;lt;br /&amp;gt;\r\nsda&amp;lt;br /&amp;gt;\r\nfsd&amp;lt;br /&amp;gt;\r\nf', NULL, 'Y', 'N', NULL, 1, 0, 0, 0, NULL, NULL, 'aaaa', '2018-11-29 11:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(49, 'consulting', 0, NULL, 49, 1, 1, 0, 'N', 'aaa', '', NULL, '', '', NULL, NULL, NULL, 'fdsafdsf', 'safdfsdaf&amp;lt;br /&amp;gt;\r\ndas&amp;lt;br /&amp;gt;\r\nfda&amp;lt;br /&amp;gt;\r\nsf&amp;lt;br /&amp;gt;\r\nsdafs', NULL, 'Y', 'Y', NULL, 2, 0, 0, 0, NULL, NULL, 'aaaa', '2018-11-29 11:29:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(50, 'consulting', 0, NULL, 50, 1, 1, 0, 'N', 'aaa', '', NULL, '', '', NULL, NULL, NULL, 'fsdfsdfsdfsdf', 'asdfsdaf&amp;lt;br /&amp;gt;\r\nsdafsdafsda&amp;lt;br /&amp;gt;\r\nfsdafsfd&amp;lt;br /&amp;gt;\r\nsfda&amp;lt;br /&amp;gt;\r\nsfda&amp;lt;br /&amp;gt;\r\nsfda&amp;lt;br /&amp;gt;\r\nsfda&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;', NULL, 'Y', 'N', NULL, 1, 0, 0, 0, NULL, NULL, 'aaaa', '2018-11-29 11:30:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(51, 'consulting', 0, NULL, 51, 1, 1, 0, 'N', 'aaa', '', NULL, '', '', NULL, NULL, NULL, 'fdasfsdfasdfsdf', 'sdafsdfsadf&amp;lt;br /&amp;gt;\r\nfsda&amp;lt;br /&amp;gt;\r\nfsda&amp;lt;br /&amp;gt;\r\nf&amp;lt;br /&amp;gt;\r\nsda&amp;lt;br /&amp;gt;\r\nfsd', NULL, '', 'N', NULL, 5, 0, 0, 0, NULL, NULL, 'aaaa', '2018-11-29 11:30:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(52, 'consulting', 0, NULL, 52, 1, 1, 0, 'N', 'aaa', '', NULL, '', '', NULL, NULL, NULL, 'adsfdsa', '&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/upload/editor/20181129151437878001.png&amp;quot; style=&amp;quot;width: 1181px; height: 818px;&amp;quot; /&amp;gt;', NULL, 'Y', 'N', NULL, 3, 0, 0, 0, NULL, NULL, 'aaaa', '2018-11-29 15:14:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(53, 'image', 0, NULL, 53, 1, 1, 0, 'N', '아류나', NULL, NULL, '', '', NULL, NULL, NULL, 'fdfd', 'fhfdfgfdgd', NULL, 'Y', 'N', NULL, 1, 0, 0, 0, NULL, NULL, 'ariun1', '2018-11-29 17:24:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(54, 'image', 0, NULL, 54, 1, 1, 0, 'N', '아류나', NULL, NULL, '', '', NULL, NULL, NULL, 'test test', 'test test', NULL, 'Y', 'N', NULL, 2, 0, 0, 0, NULL, NULL, 'ariun1', '2018-11-29 17:24:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(55, 'image', 0, NULL, 55, 1, 1, 0, 'N', '아류나', NULL, NULL, '', '', NULL, NULL, NULL, 'dahiad test', 'dahiad', NULL, 'Y', 'N', NULL, 1, 0, 0, 0, NULL, NULL, 'ariun1', '2018-11-29 17:24:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(56, 'image', 0, NULL, 56, 1, 1, 0, 'N', '아류나', NULL, NULL, '', '', NULL, NULL, NULL, 'dahiad dahiad', 'test', NULL, 'Y', 'N', NULL, 3, 0, 0, 0, NULL, NULL, 'ariun1', '2018-11-29 17:25:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(57, 'image', 0, NULL, 57, 1, 1, 0, 'N', '문양희', '', NULL, '', '', NULL, NULL, NULL, 'tested', '&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/upload/editor/20181210163327245001.jpg&amp;quot; style=&amp;quot;width: 1128px; height: 877px;&amp;quot; /&amp;gt;', NULL, 'Y', 'N', NULL, 2, 0, 0, 0, NULL, NULL, 'cmccmc', '2018-12-10 16:33:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(58, 'image', 0, NULL, 58, 1, 1, 0, 'N', '문양희', '', NULL, '', '', NULL, NULL, NULL, 'sdfsdfsdf', '&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/upload/editor/20181211152446484002.jpg&amp;quot; style=&amp;quot;width: 1109px; height: 753px;&amp;quot; /&amp;gt;', NULL, 'Y', 'N', NULL, 2, 0, 0, 0, NULL, NULL, 'cmccmc', '2018-12-11 15:24:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(59, 'notice', 0, NULL, 59, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'fdasfdsfadfsdafdsafsdafsdafsdfsdfsdafsdfsdafsdfsd', 'dfffdfdf<br />\r\nd<br />\r\nfd<br />\r\nfd<br />\r\nfd<br />\r\nf<br />\r\ndf<br />\r\nd<br />\r\nf', '', 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-12-12 12:16:07', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(60, 'notice', 0, NULL, 60, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'fsdfsdfsdfsdfsdfsdfsdf', 'fdsfsdf<br />\r\nsdf<br />\r\nsdf<br />\r\nsdf<br />\r\nsd<br />\r\nfsd<br />\r\nfds<br />\r\nsfd<br />\r\nsfd<br />\r\nsfd<br />\r\nsfd<br />\r\nsfd', '', 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-12-12 12:16:24', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(61, 'notice', 0, NULL, 61, 1, 1, 0, 'Y', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'fsdfsdfsdfsdfsdfdfds', 'fsdfdsfsdfsd<br />\r\nf<br />\r\nsdf<br />\r\nsd<br />\r\nf<br />\r\nsdf<br />\r\nsdf<br />\r\nsd<br />\r\nfsfd<br />\r\nsfd<br />\r\nsfd<br />\r\nsfd<br />\r\nsfd<br />\r\nsfd<br />\r\n&nbsp;', '', 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-12-12 12:16:40', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(62, 'notice', 0, NULL, 62, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'fdsfsdfdfahafjkdlajgkldjggas', 'gsdagsdagsadgsd<br />\r\ng<br />\r\nsdag<br />\r\nsda<br />\r\ng<br />\r\nasdg<br />\r\nd', '', 'Y', 'N', NULL, 0, 0, 0, 0, 'N', NULL, 'tago', '2018-12-12 12:16:51', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(63, 'image', 0, NULL, 63, 1, 1, 0, 'N', '문양희', '', NULL, '', '', NULL, NULL, NULL, 'gffgdfgdfggfdgfd', 'gfdgfdgfdgfd<br />\r\n<img alt="" src="/upload/editor/20181212144224689001.jpg" style="width: 300px; height: 174px;" /><br />\r\n<br />\r\ngfdgfdg<br />\r\ngdfgdf<br />\r\ngdf<br />\r\ngdfg<br />\r\nfgdg fgff&nbsp;&nbsp;&nbsp;&nbsp; ffgfgfg @@&nbsp;', NULL, 'Y', 'N', NULL, 6, 0, 0, 0, NULL, NULL, 'cmccmc', '2018-12-12 14:42:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y');
/*!40000 ALTER TABLE `ts_board_info` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_board_master
DROP TABLE IF EXISTS `ts_board_master`;
CREATE TABLE IF NOT EXISTS `ts_board_master` (
  `BOARD_CODE` varchar(24) NOT NULL COMMENT '게시판 코드',
  `BOARD_TYPE_FIXED_CODE` varchar(6) DEFAULT NULL COMMENT '게시판 유형 고정 코드[001000]',
  `BOARD_NAME` varchar(64) NOT NULL COMMENT '게시판 이름',
  `GROUP_SEQ` int(11) DEFAULT NULL COMMENT '게시판 그룹 순번',
  `PRIORITY` int(11) NOT NULL DEFAULT 0 COMMENT '게시판 그룹 [우선순위]',
  `BOARD_ADMIN` varchar(400) DEFAULT NULL COMMENT '게시판 관리자[구분자 "|"]',
  `AUTH_LIST` smallint(6) NOT NULL DEFAULT 0 COMMENT '목록 보기 권한 [회원 레벨] - 0:전체',
  `AUTH_VIEW` smallint(6) NOT NULL DEFAULT 0 COMMENT '내용 보기 권한 [회원 레벨] - 0:전체',
  `AUTH_WRITE` smallint(6) NOT NULL DEFAULT 0 COMMENT '글쓰기 권한 [회원 레벨] - 0:전체',
  `AUTH_REPLY` smallint(6) NOT NULL DEFAULT 0 COMMENT '답글 권한 [회원 레벨] - 0:전체',
  `AUTH_COMMENT` smallint(6) NOT NULL DEFAULT 0 COMMENT '댓글 권한 [회원 레벨] - 0:전체',
  `DATE_FORMAT_LIST` varchar(24) DEFAULT NULL COMMENT '날짜 형식 - 목록',
  `DATE_FORMAT_VIEW` varchar(24) DEFAULT NULL COMMENT '날짜 형식 - 보기',
  `CSS_PREFIX` varchar(32) DEFAULT NULL COMMENT '스킨[CSS 접두어]',
  `CSS_PREFIX_MOBILE` varchar(32) DEFAULT NULL COMMENT '스킨-모바일[CSS접두어]',
  `NO_AUTH_MSG` varchar(120) NOT NULL COMMENT '권한 없음 경고 메시지',
  `NO_AUTH_REDIRECT` varchar(320) DEFAULT NULL COMMENT '권한 없음 리디렉션',
  `EDITOR_YN` varchar(1) DEFAULT NULL COMMENT '웹 에디터 사용 여부',
  `USE_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '게시판 사용 여부',
  `AUTO_SECRET_YN` varchar(1) DEFAULT NULL COMMENT '자동 비밀글 사용 여부',
  `COMMENT_YN` varchar(1) DEFAULT NULL COMMENT '댓글 사용 여부',
  `COMMENT_LEVEL` int(11) DEFAULT NULL COMMENT 'Comment Max Level',
  `SHOW_LIST_YN` varchar(1) DEFAULT NULL COMMENT '상세 페이지 - 목록 노출 여부',
  `SHOW_PREV_NEXT_YN` varchar(1) DEFAULT NULL COMMENT '상세 페이지 - 이전, 다음글 노출 여부',
  `PREVIEW_IMAGE_YN` varchar(1) DEFAULT NULL COMMENT '이미지 미리보기 여부 [only 갤러리]',
  `PREVIEW_IMAGE_ALIGN` varchar(10) DEFAULT NULL COMMENT '이미지 미리보기 시 정렬 ',
  `RECOMM_YN` varchar(1) DEFAULT NULL COMMENT '추천 기능 사용 여부',
  `CHECK_SPAM_YN` varchar(1) DEFAULT NULL COMMENT '스팸 체크 사용 여부',
  `WRITE_BUTTON_YN` varchar(1) DEFAULT NULL COMMENT '권한 없을 때 글쓰기 버튼 노출 여부',
  `FILTERING_YN` varchar(1) DEFAULT NULL COMMENT '비속어 필터링 사용 여부',
  `FILTER` mediumtext DEFAULT NULL COMMENT '비속어 필터',
  `SMS_YN` varchar(1) DEFAULT NULL COMMENT 'SMS 발송 여부',
  `FILE_UPLOAD_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '파일 업로드 갯수',
  `MOVIE_UPLOAD_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '동영상 업로드 갯수',
  `IMAGE_SIZE_LIST` smallint(6) NOT NULL DEFAULT 0 COMMENT '목록 페이지 이미지 크기',
  `IMAGE_SIZE_VIEW` smallint(6) NOT NULL DEFAULT 0 COMMENT '상세 페이지 이미지 크기',
  `PAGER_ROW_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '페이저 - 레코드 수',
  `PAGER_BLOCK_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '페이저 - 블럭 수',
  `NEW_PERIOD` smallint(6) NOT NULL DEFAULT 0 COMMENT 'NEW 기간 설정',
  `HOT_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT 'HOT 조회수',
  `LF_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '줄바꿈 게시물 수[only갤러리]',
  `SUBJECT_CHAR_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '제목 글자수',
  `POINT_VIEW` int(11) NOT NULL DEFAULT 0 COMMENT '보기 포인트 [오버라이드]',
  `POINT_WRITE` int(11) NOT NULL DEFAULT 0 COMMENT '글쓰기 포인트 [오버라이드]',
  `POINT_REPLY` int(11) NOT NULL DEFAULT 0 COMMENT '답글 포인트 [오버라이드]',
  `POINT_RECOMM` int(11) NOT NULL DEFAULT 0 COMMENT '추천 포인트 [오버라이드]',
  `POINT_DOWNLOAD` int(11) NOT NULL DEFAULT 0 COMMENT '다운로드 포인트 [오버라이드]',
  `POINT_COMMENT` int(11) NOT NULL DEFAULT 0 COMMENT '댓글 포인트 [오버라이드]',
  `POINT_NO_MSG` varchar(96) DEFAULT NULL COMMENT '포인트 없음 메시지 [오버라이드]',
  `WRITER_FORMAT_FIXED_CODE` varchar(6) NOT NULL COMMENT '작성자 형식 고정 코드[002000]',
  `REG_USER` varchar(24) NOT NULL COMMENT '등록자',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `MOD_USER` varchar(24) DEFAULT NULL COMMENT '수정자',
  `MOD_DATE` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`BOARD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판 마스터 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_board_master: ~11 rows (approximately)
/*!40000 ALTER TABLE `ts_board_master` DISABLE KEYS */;
INSERT INTO `ts_board_master` (`BOARD_CODE`, `BOARD_TYPE_FIXED_CODE`, `BOARD_NAME`, `GROUP_SEQ`, `PRIORITY`, `BOARD_ADMIN`, `AUTH_LIST`, `AUTH_VIEW`, `AUTH_WRITE`, `AUTH_REPLY`, `AUTH_COMMENT`, `DATE_FORMAT_LIST`, `DATE_FORMAT_VIEW`, `CSS_PREFIX`, `CSS_PREFIX_MOBILE`, `NO_AUTH_MSG`, `NO_AUTH_REDIRECT`, `EDITOR_YN`, `USE_FLAG`, `AUTO_SECRET_YN`, `COMMENT_YN`, `COMMENT_LEVEL`, `SHOW_LIST_YN`, `SHOW_PREV_NEXT_YN`, `PREVIEW_IMAGE_YN`, `PREVIEW_IMAGE_ALIGN`, `RECOMM_YN`, `CHECK_SPAM_YN`, `WRITE_BUTTON_YN`, `FILTERING_YN`, `FILTER`, `SMS_YN`, `FILE_UPLOAD_COUNT`, `MOVIE_UPLOAD_COUNT`, `IMAGE_SIZE_LIST`, `IMAGE_SIZE_VIEW`, `PAGER_ROW_COUNT`, `PAGER_BLOCK_COUNT`, `NEW_PERIOD`, `HOT_COUNT`, `LF_COUNT`, `SUBJECT_CHAR_COUNT`, `POINT_VIEW`, `POINT_WRITE`, `POINT_REPLY`, `POINT_RECOMM`, `POINT_DOWNLOAD`, `POINT_COMMENT`, `POINT_NO_MSG`, `WRITER_FORMAT_FIXED_CODE`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	('boardcode', '001006', 'board name', 0, 1, '', 0, 0, 0, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd', '', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'Y', NULL, 'N', 'N', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 1, NULL, '', 'tago', '2018-11-13 17:08:08', 'tago', '2018-11-28 17:32:30'),
	('consulting', '001003', '1:1 상담', 3, 1, '', 4, 4, 4, 4, 4, 'yyyy-MM-dd', 'yyyy-MM-dd', '', NULL, '권한이 없습니다.', '/login', 'Y', 'Y', 'N', 'N', NULL, 'N', 'N', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-11-14 15:46:16', 'tago', '2018-12-03 11:31:27'),
	('faqbbs', '001004', 'FAQ', 3, 1, '', 0, 0, 0, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd', '', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'N', NULL, 'N', 'N', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-11-14 15:39:42', 'tago', '2018-11-14 15:44:20'),
	('image', '001006', '이미지', 0, 1, '', 0, 0, 0, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd', '', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'Y', 4, 'N', 'N', 'Y', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 8, 12, 2, 100, 4, 50, 0, 0, 0, 0, 0, 1, NULL, '', 'tago', '2018-09-18 09:30:07', 'tago', '2018-12-12 14:45:55'),
	('notice', '001003', '공지사항', 0, 1, '', 0, 0, 1, 1, 1, 'yyyy-MM-dd HH:mm', 'yyyy-MM-dd', 'bbsNotice', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'Y', NULL, 'Y', 'Y', 'N', 'center', 'Y', 'Y', NULL, 'N', '바보,ㅇㅇ', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 1, NULL, '002004', 'tago', '2018-11-14 15:53:33', 'tago', '2018-11-28 17:35:33'),
	('picture', '001006', '사진', 0, 1, '', 3, 3, 3, 3, 3, 'yyyy-MM-dd', 'yyyy-MM-dd', '', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'Y', 3, 'N', 'N', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-11-14 15:18:24', 'tago', '2018-11-15 13:13:05'),
	('portfolio', '001005', '포트폴리오-웹', 0, 1, '', 0, 0, 1, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd HH:mm', '', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'N', NULL, 'N', 'N', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 12, 12, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-11-14 17:31:35', 'tago', '2018-11-20 17:57:05'),
	('portfolio2', '001005', 'portfolio2', 0, 1, '', 0, 0, 0, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd', '', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'N', NULL, 'N', 'N', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-11-14 17:41:18', NULL, NULL),
	('Tagorent', '001006', 'Tago Cheju Rent Car', 2, 1, 'admin', 0, 0, 0, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd', 'blue', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'Y', NULL, 'N', 'N', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-09-19 15:10:33', 'tago', '2018-09-19 15:13:05'),
	('test', '001005', 'Portfolio', 1, 1, '', 0, 0, 0, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd', 'blue', NULL, '권한이 없습니다.', 'Warning', 'Y', 'Y', 'Y', 'Y', NULL, 'N', 'Y', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-09-14 16:18:07', 'tago', '2018-11-15 10:26:07'),
	('wwwwwwww', '001001', 'ww', 0, 1, 'admin', 0, 0, 0, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd', '', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'N', NULL, 'N', 'N', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-11-14 15:00:37', NULL, NULL);
/*!40000 ALTER TABLE `ts_board_master` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_board_status
DROP TABLE IF EXISTS `ts_board_status`;
CREATE TABLE IF NOT EXISTS `ts_board_status` (
  `BOARD_CODE` varchar(24) NOT NULL COMMENT '게시판 코드',
  `STATUS_FIXED_CODE` varchar(6) NOT NULL COMMENT '처리 상태 고정 코드[003000]',
  PRIMARY KEY (`STATUS_FIXED_CODE`,`BOARD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판 - 처리 상태';

-- Dumping data for table ts_0002.ts_board_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_board_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_board_status` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_clause
DROP TABLE IF EXISTS `ts_clause`;
CREATE TABLE IF NOT EXISTS `ts_clause` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '코드Type',
  `CLAUSE_NAME` int(11) NOT NULL COMMENT '사이트순번',
  `USE_FLAG` char(10) NOT NULL COMMENT '사용유무(U: 사용, S:미사용, D:삭제)',
  `REG_USER` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DATE` datetime NOT NULL COMMENT '등록일',
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '수정자ID',
  `MOD_DATE` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='그룹을 하나의 테이블에서 관리	';

-- Dumping data for table ts_0002.ts_clause: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_clause` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_clause` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_comment
DROP TABLE IF EXISTS `ts_comment`;
CREATE TABLE IF NOT EXISTS `ts_comment` (
  `COMMENT_SEQ` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '댓글 순번',
  `PARENT_SEQ` bigint(20) NOT NULL DEFAULT 0,
  `BOARD_SEQ` bigint(20) DEFAULT NULL COMMENT '게시물 순번',
  `BOARD_CODE` varchar(24) NOT NULL COMMENT '게시판 코드',
  `PRODUCT_CODE` varchar(24) DEFAULT NULL COMMENT '제품 코드',
  `H_GROUP` bigint(20) DEFAULT 0,
  `H_ORDER` int(11) DEFAULT 0,
  `H_DEPTH` int(11) DEFAULT 0,
  `STAR` smallint(6) DEFAULT 0,
  `USER_NAME` varchar(24) DEFAULT NULL COMMENT '이름',
  `USER_NICKNAME` varchar(24) DEFAULT NULL COMMENT '닉네임',
  `BODY` mediumtext DEFAULT NULL COMMENT '내용',
  `PWD` varchar(256) DEFAULT NULL COMMENT '비밀번호',
  `REG_USER` varchar(24) NOT NULL COMMENT '등록자',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `IP_ADDR` int(10) unsigned DEFAULT NULL COMMENT 'IP주소',
  `DISPLAY_YN` varchar(1) DEFAULT 'Y' COMMENT '표시 여부 - 관리자용',
  `USE_FLAG` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`COMMENT_SEQ`),
  KEY `BOARD_CODE` (`BOARD_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='댓글 정보';

-- Dumping data for table ts_0002.ts_comment: ~67 rows (approximately)
/*!40000 ALTER TABLE `ts_comment` DISABLE KEYS */;
INSERT INTO `ts_comment` (`COMMENT_SEQ`, `PARENT_SEQ`, `BOARD_SEQ`, `BOARD_CODE`, `PRODUCT_CODE`, `H_GROUP`, `H_ORDER`, `H_DEPTH`, `STAR`, `USER_NAME`, `USER_NICKNAME`, `BODY`, `PWD`, `REG_USER`, `REG_DATE`, `IP_ADDR`, `DISPLAY_YN`, `USE_FLAG`) VALUES
	(6, 0, 11, 'image', '', 11, NULL, NULL, NULL, 'Tenger', NULL, 'alright lest do it', NULL, 'skyline', '2018-10-03 20:20:22', NULL, 'N', 'Y'),
	(7, 0, 11, 'image', '', 11, NULL, NULL, NULL, 'Tenger', NULL, 'werwerewr', NULL, 'skyline', '2018-10-03 20:20:51', NULL, 'Y', 'Y'),
	(8, 0, 11, 'image', '', 11, NULL, NULL, NULL, 'Tenger', NULL, 'alright lets fucking do it', NULL, 'skyline', '2018-10-03 20:38:08', NULL, 'Y', 'Y'),
	(9, 0, 13, 'image', '', 13, NULL, NULL, NULL, 'Tenger', NULL, 'cehck gooodness', NULL, 'skyline', '2018-10-04 12:37:04', NULL, 'Y', 'N'),
	(10, 9, 13, 'image', '', 13, NULL, NULL, NULL, 'Tenger', NULL, 'homeiee checkehcek', NULL, 'skyline', '2018-10-04 12:37:28', NULL, 'Y', 'N'),
	(11, 9, 13, 'image', '', 13, NULL, NULL, NULL, 'Tenger', NULL, 'sain bainuu! 123', NULL, 'skyline', '2018-10-04 12:40:01', NULL, 'Y', 'N'),
	(12, 11, 13, 'image', '', 13, NULL, NULL, NULL, 'Tenger', NULL, 'cehck mee homee', NULL, 'skyline', '2018-10-04 12:40:13', NULL, 'Y', 'N'),
	(13, 12, 13, 'image', '', 13, NULL, NULL, NULL, 'Tenger', NULL, 'werwrwe', NULL, 'skyline', '2018-10-04 12:40:35', NULL, 'Y', 'N'),
	(14, 12, 13, 'image', '', 13, NULL, NULL, NULL, 'moon_ts', NULL, 'mono baby', NULL, 'moon', '2018-10-04 12:42:35', NULL, 'Y', 'Y'),
	(15, 12, 13, 'image', '', 13, NULL, NULL, NULL, 'moon_ts', NULL, 'fuck bitch cehk', NULL, 'moon', '2018-10-04 12:43:27', NULL, 'Y', 'Y'),
	(16, 0, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, ' ass\r\n', NULL, 'bagi', '2018-10-04 13:03:38', NULL, 'Y', 'N'),
	(17, 0, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, 'you are ass', NULL, 'bagi', '2018-10-04 13:03:57', NULL, 'Y', 'N'),
	(18, 0, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, 'vgiin aldaA NMUU\r\n', NULL, 'bagi', '2018-10-04 13:06:43', NULL, 'Y', 'N'),
	(19, 12, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, 'adadaaaaaada', NULL, 'bagi', '2018-10-04 13:17:22', NULL, 'Y', 'N'),
	(20, 9, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, 'aAda', NULL, 'bagi', '2018-10-04 13:17:25', NULL, 'Y', 'N'),
	(21, 0, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, 'ADDADASC', NULL, 'bagi', '2018-10-04 13:17:29', NULL, 'Y', 'Y'),
	(22, 12, 13, 'image', '', 13, NULL, NULL, NULL, 'Tenger', NULL, 'my comment', NULL, 'skyline', '2018-10-04 16:12:23', NULL, 'Y', 'N'),
	(23, 11, 13, 'image', '', 13, NULL, NULL, NULL, 'Tenger', NULL, 'this is good comment', NULL, 'skyline', '2018-10-04 16:12:40', NULL, 'Y', 'Y'),
	(24, 6, 11, 'image', '', 11, NULL, NULL, NULL, 'user', NULL, 'reply 2', NULL, 'user', '2018-10-05 10:43:58', NULL, 'Y', 'Y'),
	(25, 24, 11, 'image', '', 11, NULL, NULL, NULL, 'user', NULL, 'reply 3', NULL, 'user', '2018-10-05 10:44:20', NULL, 'Y', 'N'),
	(26, 25, 11, 'image', '', 11, NULL, NULL, NULL, 'user', NULL, 'reply 4', NULL, 'user', '2018-10-05 10:44:49', NULL, 'Y', 'Y'),
	(27, 0, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, 'sns бүртгэл\r\n', NULL, 'bagi', '2018-10-08 16:22:01', NULL, 'Y', 'N'),
	(28, 27, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, '12', NULL, 'bagi', '2018-10-08 16:23:07', NULL, 'Y', 'Y'),
	(29, 27, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, '13\r\n\r\n\r\n', NULL, 'bagi', '2018-10-08 16:23:15', NULL, 'Y', 'N'),
	(30, 27, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, '14\r\n', NULL, 'bagi', '2018-10-08 16:23:24', NULL, 'Y', 'N'),
	(31, 27, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, '15', NULL, 'bagi', '2018-10-08 16:23:33', NULL, 'Y', 'N'),
	(32, 27, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, '16', NULL, 'bagi', '2018-10-08 16:23:44', NULL, 'Y', 'N'),
	(33, 28, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, 'хххх', NULL, 'bagi', '2018-10-08 16:24:19', NULL, 'Y', 'N'),
	(34, 33, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, 'ххмхм', NULL, 'bagi', '2018-10-08 16:24:28', NULL, 'Y', 'N'),
	(35, 0, 14, 'image', '', 14, NULL, NULL, NULL, 'batceceg', NULL, 'ㅓ.ㅓㅏ.', NULL, 'bagi', '2018-10-08 16:33:35', NULL, 'Y', 'N'),
	(36, 0, 13, 'image', '', 13, NULL, NULL, NULL, 'Tenger', NULL, 'test t213', NULL, 'skyline', '2018-10-16 13:08:14', NULL, 'Y', 'Y'),
	(37, 0, 12, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', '*t*e*s*t* *m*e*e*e*', NULL, 'bagi', '2018-11-15 13:21:36', NULL, 'Y', 'Y'),
	(38, 0, 12, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'hauhxshxuasux', NULL, 'bagi', '2018-11-16 15:33:14', NULL, 'Y', 'Y'),
	(39, 0, 12, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'dcdcadcdcad', NULL, 'bagi', '2018-11-16 18:39:00', NULL, 'Y', 'Y'),
	(40, 0, 12, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'vdsvdvadsvadvdfv', NULL, 'bagi', '2018-11-16 18:39:13', NULL, 'Y', 'Y'),
	(41, 0, 12, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'hbhbhbhbh', NULL, 'bagi', '2018-11-16 19:45:25', NULL, 'Y', 'Y'),
	(42, 0, 8, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'vhjkkmkmxckk', NULL, 'bagi', '2018-11-16 19:47:37', NULL, 'Y', 'Y'),
	(43, 0, 8, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'jxncjnkckmclk', NULL, 'bagi', '2018-11-16 19:47:41', NULL, 'Y', 'N'),
	(44, 0, 8, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', '테스트 1 입니다. 테스트 1 입니다테스트 1 입니다ㅍㅍ테스트 1 입니다테스트 1 입니다테스트 1 입니다테스트 1 입니다테스트 1 입니다테스트 1 입니다', NULL, 'bagi', '2018-11-16 19:49:53', NULL, 'Y', 'Y'),
	(45, 0, 8, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', '테스트 2 테스트 2 테스트 2 테스트 2 테스트 2 테스트 2 테스트 2 테스트 2 ㅍㅍ테스트 2 테스트 2 ', NULL, 'bagi', '2018-11-16 19:50:12', NULL, 'Y', 'N'),
	(46, 0, 8, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', '테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 ', NULL, 'bagi', '2018-11-16 19:50:36', NULL, 'Y', 'Y'),
	(47, 0, 38, 'image', '', NULL, NULL, NULL, NULL, 'smilepyw', NULL, ' 김치로 테스트', NULL, '961790161', '2018-11-17 12:51:53', NULL, 'Y', 'Y'),
	(48, 0, 45, 'image', '', NULL, NULL, NULL, NULL, 'Munkhtenger Gankhuyag', NULL, 'check check', NULL, '108440031531899286571', '2018-11-28 15:20:42', NULL, 'Y', 'Y'),
	(49, 48, 45, 'image', '', NULL, NULL, NULL, NULL, 'Munkhtenger Gankhuyag', NULL, 'test now', NULL, '108440031531899286571', '2018-11-28 15:21:51', NULL, 'Y', 'Y'),
	(50, 0, 45, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'хуримтлал тохиргоо үүсэх тест үзэж байна\r\n', NULL, 'bagi', '2018-11-28 15:47:25', NULL, 'Y', 'Y'),
	(51, 0, 45, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'коммент тест хийж байна\r\n', NULL, 'bace20', '2018-11-28 15:51:28', NULL, 'Y', 'Y'),
	(52, 0, 39, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'тест хийж байна', NULL, 'bace20', '2018-11-28 15:55:56', NULL, 'Y', 'Y'),
	(53, 0, 39, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'хуримтлал үүсэх тохиргоо\r\n', NULL, 'bagi', '2018-11-28 16:09:52', NULL, 'Y', 'Y'),
	(54, 0, 39, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'хуримтлал\r\n', NULL, 'bagi', '2018-11-28 16:10:30', NULL, 'Y', 'Y'),
	(55, 0, 38, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'хуримтлал', NULL, 'bace20', '2018-11-28 16:11:29', NULL, 'Y', 'Y'),
	(56, 0, 45, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'хуримтлал', NULL, 'bace20', '2018-11-28 16:12:38', NULL, 'Y', 'Y'),
	(57, 0, 34, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'бёбыёйы', NULL, 'bace20', '2018-11-28 16:13:14', NULL, 'Y', 'Y'),
	(58, 0, 33, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'кимчи идмээр байна\r\n', NULL, 'bace20', '2018-11-28 17:36:19', NULL, 'Y', 'Y'),
	(59, 0, 45, 'image', '', NULL, NULL, NULL, NULL, '아류나', NULL, 'test', NULL, 'ariun1', '2018-11-29 10:25:52', NULL, 'Y', 'Y'),
	(60, 0, 38, 'image', '', NULL, NULL, NULL, NULL, 'batceceg', '', 'шатлал', NULL, 'bace20', '2018-11-29 10:27:55', NULL, 'Y', 'Y'),
	(61, 0, 39, 'image', '', NULL, NULL, NULL, NULL, '아류나', NULL, 'комментын пойнт орж ирэхгүй байнаааа', NULL, 'ariun1', '2018-11-29 10:42:21', NULL, 'Y', 'Y'),
	(62, 54, 39, 'image', '', NULL, NULL, NULL, NULL, '아류나', NULL, 'пойнт авъяааа хэхэхэх', NULL, 'ariun1', '2018-11-29 10:42:57', NULL, 'Y', 'Y'),
	(63, 0, 8, 'image', '', NULL, NULL, NULL, NULL, '아류나', NULL, 'fdjfldsjklgjlg', NULL, 'ariun1', '2018-11-29 15:44:37', NULL, 'Y', 'Y'),
	(64, 0, 29, 'image', '', NULL, NULL, NULL, NULL, '아류나', NULL, 'point point', NULL, 'ariun1', '2018-11-29 15:45:29', NULL, 'Y', 'Y'),
	(65, 0, 54, 'image', '', NULL, NULL, NULL, NULL, '아류나', NULL, 'dahiad neg yum testleedhii', NULL, 'ariun1', '2018-11-30 13:35:01', NULL, 'Y', 'Y'),
	(66, 53, 39, 'image', '', NULL, NULL, NULL, NULL, '아류나', NULL, 'testiin test', NULL, 'ariun1', '2018-11-30 17:11:40', NULL, 'Y', 'Y'),
	(67, 0, 56, 'image', '', NULL, NULL, NULL, NULL, '문양희', '', 'dfsdfsdf', NULL, 'cmccmc', '2018-12-11 15:23:51', NULL, 'Y', 'Y'),
	(68, 67, 56, 'image', '', NULL, NULL, NULL, NULL, '문양희', '', 'fsdfsdfsdfds', NULL, 'cmccmc', '2018-12-11 15:23:57', NULL, 'Y', 'Y'),
	(69, 68, 56, 'image', '', NULL, NULL, NULL, NULL, '문양희', '', 'fsdfsdfsdfsdfdsfsdf\r\nsdfdsf\r\nsdf\r\nsdfd', NULL, 'cmccmc', '2018-12-11 15:24:05', NULL, 'Y', 'Y'),
	(70, 0, 63, 'image', '', NULL, NULL, NULL, NULL, '문양희', '', 'fsdfsdfdsf\r\nfds\r\n\r\nfds\r\nf\r\ndsfdsffds', NULL, 'cmccmc', '2018-12-12 14:43:35', NULL, 'Y', 'Y'),
	(71, 0, 63, 'image', '', NULL, NULL, NULL, NULL, '문양희', '', 'fdsfdfsdf\r\nds\r\nfds\r\nfds\r\nf\r\ndsf\r\nfdsfdsfdsdfsdfsfdsdsfdfs', NULL, 'cmccmc', '2018-12-12 14:43:43', NULL, 'Y', 'Y'),
	(72, 71, 63, 'image', '', NULL, NULL, NULL, NULL, '문양희', '', 'fdsfdsfdsf\r\nf\r\nds\r\nf\r\ndsf\r\nsd\r\nf', NULL, 'cmccmc', '2018-12-12 14:43:54', NULL, 'Y', 'Y');
/*!40000 ALTER TABLE `ts_comment` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_comm_contents
DROP TABLE IF EXISTS `ts_comm_contents`;
CREATE TABLE IF NOT EXISTS `ts_comm_contents` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CodeType : 000은 Type에 대한 정리 코드',
  `TB_IDX` int(11) DEFAULT NULL COMMENT '약관 테이블의 Idx',
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='약관 테이블	';

-- Dumping data for table ts_0002.ts_comm_contents: ~9 rows (approximately)
/*!40000 ALTER TABLE `ts_comm_contents` DISABLE KEYS */;
INSERT INTO `ts_comm_contents` (`IDX`, `TB_IDX`, `VERSION`, `TITLE`, `SUB_TITLE`, `LINK_URL`, `CONTENTS`, `VIEW_CNT`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(37, 1, 1, '이용약관', NULL, NULL, '이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관이용약관', NULL, 'U', 'tago', '2018-12-11 10:19:30', NULL, '2018-12-11 10:42:42'),
	(38, 2, 1, '개인정보취급방침', NULL, NULL, '개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침', NULL, 'U', 'tago', '2018-12-11 10:20:03', NULL, '2018-12-11 10:31:10'),
	(39, 2, 2, '개인정보취급방침', NULL, NULL, '개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침 come on123', NULL, 'U', 'tago', '2018-12-11 10:31:10', NULL, '2018-12-12 12:04:15'),
	(40, 1, 2, '이용약관', NULL, NULL, 'hereglegchiin zarchim ', NULL, 'U', 'tago', '2018-12-11 10:42:42', NULL, '2018-12-11 10:46:11'),
	(41, 1, 3, '이용약관', NULL, NULL, 'hereglegchiin zarchim test test', NULL, 'U', 'tago', '2018-12-11 10:46:11', NULL, '2018-12-12 12:04:00'),
	(42, 3, 1, 'hereglegchiin shine zarchim', NULL, NULL, 'office-iin tsonh evdersen bolohoor huiten bnaa', NULL, 'U', 'tago', '2018-12-11 10:47:34', NULL, '2018-12-12 10:00:17'),
	(43, 3, 0, 'hereglegchiin shine zarchim', NULL, NULL, 'office-iin tsonh evdersen bolohoor huiten bnaa, uu tmuu hze zasagdah ym boloo?\r\n', NULL, 'U', 'tago', '2018-12-12 10:00:17', NULL, NULL),
	(44, 1, 0, '이용약관', NULL, NULL, 'hereglegchiin zarchim test test\r\nfds\r\nfd\r\nfsd\r\nfd\r\nfsd\r\nsfd\r\n', NULL, 'U', 'tago', '2018-12-12 12:04:00', NULL, NULL),
	(45, 2, 0, '개인정보취급방침', NULL, NULL, '개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방\r\nfdsf\r\ns\r\nsfd\r\nsfdf\r\n\r\n침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침개인정보취급방침 come on123', NULL, 'U', 'tago', '2018-12-12 12:04:15', NULL, NULL);
/*!40000 ALTER TABLE `ts_comm_contents` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_comm_group
DROP TABLE IF EXISTS `ts_comm_group`;
CREATE TABLE IF NOT EXISTS `ts_comm_group` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '자동증가순번',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='게시물, 약관 내용이 큰 컨텐츠의 내용을 한곳에서 관리	';

-- Dumping data for table ts_0002.ts_comm_group: ~3 rows (approximately)
/*!40000 ALTER TABLE `ts_comm_group` DISABLE KEYS */;
INSERT INTO `ts_comm_group` (`IDX`, `GROUP_DIV`, `TITLE`, `SUB_TITLE`, `LINK_URL`, `SORT_NUM`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(1, 'TBMeta', 'Front End', 'THIS IS FRONT SIDE', NULL, 4, 'U', 'tago', '2018-11-21 18:27:02', NULL, '2018-12-13 15:34:34'),
	(2, 'TBMeta', 'new new  new ', '12344888', NULL, 1, 'D', 'tago', '2018-12-13 11:37:31', 'tago', '2018-12-13 11:57:15'),
	(3, 'TBMeta', 'sdfsadf', 'asdfasdf', NULL, 3, 'U', 'tago', '2018-12-13 15:32:10', NULL, '2018-12-13 15:34:34');
/*!40000 ALTER TABLE `ts_comm_group` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_file
DROP TABLE IF EXISTS `ts_file`;
CREATE TABLE IF NOT EXISTS `ts_file` (
  `FILE_SEQ` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '첨부파일 순번',
  `TABLE_NAME` varchar(48) NOT NULL COMMENT '테이블 이름',
  `ORIGINAL_FILENAME` varchar(320) NOT NULL COMMENT '원본 파일명',
  `SAVE_FILENAME` varchar(320) NOT NULL COMMENT '저장 파일명',
  `MIME_TYPE` varchar(48) NOT NULL COMMENT 'MIME 형식',
  `REF_SEQ` bigint(20) NOT NULL DEFAULT 0 COMMENT '참조 순번 [게시물 순번, ...]',
  `ORDERING` smallint(6) NOT NULL DEFAULT 0 COMMENT '정렬번호[게시물 업로드 단순 순서]',
  `UPLOAD_TYPE_FIXED_CODE` varchar(6) DEFAULT NULL COMMENT '업로드 유형 고정 코드[004000]',
  `MASTER_SEQ` int(11) DEFAULT NULL COMMENT '마스터PK',
  `REF_USER_ID` varchar(24) NOT NULL COMMENT '참조 아이디 [회원 아이디, ...]',
  `FILE_SIZE` varchar(24) DEFAULT NULL COMMENT '파일크기(문자열)',
  PRIMARY KEY (`FILE_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='첨부 파일 - 가상디렉토리 이후 경로까지 저장';

-- Dumping data for table ts_0002.ts_file: ~30 rows (approximately)
/*!40000 ALTER TABLE `ts_file` DISABLE KEYS */;
INSERT INTO `ts_file` (`FILE_SEQ`, `TABLE_NAME`, `ORIGINAL_FILENAME`, `SAVE_FILENAME`, `MIME_TYPE`, `REF_SEQ`, `ORDERING`, `UPLOAD_TYPE_FIXED_CODE`, `MASTER_SEQ`, `REF_USER_ID`, `FILE_SIZE`) VALUES
	(6, 'TS_BOARD_INFO', '20180122190922_beat.png', '/board/image/20180918170625492002.png', 'image/png', 7, 1, NULL, 0, 'tago', '2.15KB'),
	(7, 'TS_BOARD_INFO', 'anniversary-art-birthday-269887.jpg', '/board/image/20180927103420775002.jpg', 'image/jpeg', 8, 1, NULL, 0, 'tago', '1.84MB'),
	(8, 'TS_BOARD_INFO', 'E-gmat.png', '/board/Tagorent/20180919151438000001.png', 'image/png', 9, 1, NULL, 0, 'tago', '6.65KB'),
	(9, 'TS_BOARD_INFO', 'smartmockup.png', '/board/image/20180927103325267001.png', 'image/png', 11, 1, NULL, 0, 'skyline', '1.3MB'),
	(10, 'TS_BOARD_INFO', 'auto.jpg', '/board/image/20181101102410022001.jpg', 'image/jpeg', 13, 1, NULL, 0, 'skyline', '1.43MB'),
	(11, 'TS_BOARD_INFO', 'manhattan.png', '/board/image/20180927101335658001.png', 'image/png', 14, 1, NULL, 0, 'skyline', '7.59KB'),
	(12, 'TS_BOARD_INFO', 'tabletmockup.png', '/board/image/20181101105403732001.png', 'image/png', 12, 1, NULL, 0, 'tago', '762.73KB'),
	(13, 'TS_BOARD_INFO', '20180709165807998003.jpg', '/board/test/20181114173329785001.jpg', 'image/jpeg', 21, 1, NULL, 0, 'tago', '43.57KB'),
	(14, 'TS_BOARD_INFO', '20180709165807998003.jpg', '/board/portfolio/20181114173937082002.jpg', 'image/jpeg', 22, 1, NULL, 0, 'tago', '43.57KB'),
	(15, 'TS_BOARD_INFO', '20180709165525503002.jpg', '/board/test/20181115104015677001.jpg', 'image/jpeg', 23, 1, NULL, 0, 'tago', '91.45KB'),
	(16, 'TS_BOARD_INFO', '20180530171133803003.png', '/board/test/20181115104054796002.png', 'image/png', 24, 1, NULL, 0, 'tago', '458.04KB'),
	(17, 'banner', '20171027112539129005.png', '/banner/20181115105729887003.png', 'image/png', 2, 1, '004002', 2, 'tago', '13.26KB'),
	(18, 'TS_BOARD_INFO', '20180709165525503002.jpg', '/board/portfolio/20181115113335094004.jpg', 'image/jpeg', 25, 1, NULL, 0, 'tago', '91.45KB'),
	(19, 'TS_BOARD_INFO', '20180530171133803003.png', '/board/portfolio/20181115113353529005.png', 'image/png', 26, 1, NULL, 0, 'tago', '458.04KB'),
	(20, 'TS_BOARD_INFO', '20180530171209971004.png', '/board/portfolio/20181115113459721006.png', 'image/png', 27, 1, NULL, 0, 'tago', '2.47MB'),
	(21, 'TS_BOARD_INFO', '20180530171811111001.png', '/board/portfolio/20181115113528641007.png', 'image/png', 28, 1, NULL, 0, 'tago', '805.4KB'),
	(22, 'TS_BOARD_INFO', '김치.jpg', '/board/image/20181117123941284001.jpg', 'image/jpeg', 29, 1, NULL, 0, '961790161', '9.74KB'),
	(23, 'TS_BOARD_INFO', '김치.jpg', '/board/image/20181117124222906003.jpg', 'image/jpeg', 31, 1, NULL, 0, '961790161', '9.74KB'),
	(24, 'TS_BOARD_INFO', '김치.jpg', '/board/image/20181117124405083005.jpg', 'image/jpeg', 33, 1, NULL, 0, 'tago', '9.74KB'),
	(25, 'TS_BOARD_INFO', '김치.jpg', '/board/image/20181117124606614008.jpg', 'image/jpeg', 35, 1, NULL, 0, 'tago', '9.74KB'),
	(26, 'TS_BOARD_INFO', '소주.jpg', '/board/image/20181117124822806010.jpg', 'image/jpeg', 36, 1, NULL, 0, '961790161', '4.51KB'),
	(27, 'TS_BOARD_INFO', '소주.jpg', '/board/image/20181117125014821011.jpg', 'image/jpeg', 37, 1, NULL, 0, 'tago', '4.51KB'),
	(28, 'TS_BOARD_INFO', '소주.jpg', '/board/image/20181117125135391013.jpg', 'image/jpeg', 38, 1, NULL, 0, 'tago', '4.51KB'),
	(29, 'TS_BOARD_INFO', '김치.jpg', '/board/image/20181117130034111014.jpg', 'image/jpeg', 39, 1, NULL, 0, '961790161', '9.74KB'),
	(30, 'banner', '김치.jpg', '/banner/20181117131059103015.jpg', 'image/jpeg', 12, 1, '004002', 23, 'tago', '9.74KB'),
	(32, 'TS_BOARD_INFO', '해피윈터.jpg', '/board/picture/20181119170120253003.jpg', 'image/jpeg', 43, 1, NULL, 0, 'tagotest', '19.07KB'),
	(33, 'TS_BOARD_INFO', '나비.jpg', '/board/image/20181119170136557004.jpg', 'image/jpeg', 34, 1, NULL, 0, 'tago', '34.48KB'),
	(34, 'TS_BOARD_INFO', '나비.jpg', '/board/image/20181119170149804005.jpg', 'image/jpeg', 32, 1, NULL, 0, '961790161', '34.48KB'),
	(35, 'TS_BOARD_INFO', '해피윈터.jpg', '/board/image/20181119170159101006.jpg', 'image/jpeg', 30, 1, NULL, 0, '961790161', '19.07KB'),
	(36, 'TS_BOARD_INFO', '20170908105611489001.jpg', '/board/image/20181121155906127002.jpg', 'image/jpeg', 45, 1, NULL, 0, 'bagi', '762.53KB');
/*!40000 ALTER TABLE `ts_file` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_fixed_code
DROP TABLE IF EXISTS `ts_fixed_code`;
CREATE TABLE IF NOT EXISTS `ts_fixed_code` (
  `CODE_CODE` varchar(6) NOT NULL COMMENT '코드 코드',
  `CODE_NAME` varchar(96) NOT NULL COMMENT '코드 이름',
  `CODE_DESC` varchar(120) DEFAULT NULL COMMENT '코드 설명',
  `CODE_DESC2` varchar(120) DEFAULT NULL COMMENT '코드 설명2',
  PRIMARY KEY (`CODE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='고정 코드\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_fixed_code: ~42 rows (approximately)
/*!40000 ALTER TABLE `ts_fixed_code` DISABLE KEYS */;
INSERT INTO `ts_fixed_code` (`CODE_CODE`, `CODE_NAME`, `CODE_DESC`, `CODE_DESC2`) VALUES
	('001000', '게시판 유형', 'TS_BOARD_MASTER.BOARD_TYPE_FIXED_CODE', ''),
	('001001', '일반형 게시판', '일반 게시판', NULL),
	('001002', '계층형 게시판', '계층형 답글 단계 사용', NULL),
	('001003', '답변형 게시판', '답변 게시판', NULL),
	('001004', 'FAQ게시판', NULL, NULL),
	('001005', '썸네일 게시판', '이미지 클릭시 URL이동 (상세X)', NULL),
	('001006', '이미지 게시판', NULL, NULL),
	('001007', '예약 게시판', '답변형과 동일 - 예약중, 예약완료 플래그 추가', NULL),
	('002000', '작성자 형식', 'TS_BOARD_MASTER.WRITER_FORMAT_FIXED_CODE', ''),
	('002001', '이름', '', ''),
	('002002', '닉네임', '', ''),
	('002003', '닉네임(이름)', '', ''),
	('002004', '이름(아이디)', '', ''),
	('002005', '닉네임(아이디)', '', ''),
	('003000', '처리상태', 'TS_BOARD_INFO.STATUS_FIXED_CODE', ''),
	('003001', '예약대기', '', ''),
	('003002', '예약완료', '', ''),
	('003003', '접수대기', '', ''),
	('003004', '접수완료', '', ''),
	('003005', '답변완료', '', ''),
	('004000', '업로드 유형', 'TS_FILE.UPLOAD_TYPE_FIXED_CODE', ''),
	('004001', '일반', '', ''),
	('004002', '이미지', '', ''),
	('004003', '동영상', '', ''),
	('005000', '게시판 유형', '관리자용 TS_SITE.USE_MENU', ''),
	('005001', '기본설정', '/base/basic/site_info', ''),
	('005002', '게시판관리', '/board/manage/board_list', ''),
	('005003', '회원관리', '/member/manage/member_list', ''),
	('005004', '페이지관리', '/page/page_list', ''),
	('005010', '폼메일관리', '/formmail/manage/list', NULL),
	('005020', '배너관리', '/banner/manage/banner_list', ''),
	('005030', '통계관리', '/stat/manage/stat_list', NULL),
	('005040', '상품관리', '/prd/manage/prd_list', NULL),
	('006000', '날짜형식', '사용안함', NULL),
	('006001', 'yy/MM/dd\r\n', '', NULL),
	('006002', 'yy.MM.dd', NULL, NULL),
	('006003', 'yy-MM-dd', NULL, NULL),
	('006004', 'yyyy/MM/dd', NULL, NULL),
	('006005', 'yyyy.MM.dd\r\n', NULL, NULL),
	('006006', 'yyyy-MM-dd\r\n', NULL, NULL),
	('006007', 'yyyy-MM-dd HH:mm', NULL, NULL),
	('006008', 'yyyy-MM-dd a hh:mm', NULL, NULL);
/*!40000 ALTER TABLE `ts_fixed_code` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_form
DROP TABLE IF EXISTS `ts_form`;
CREATE TABLE IF NOT EXISTS `ts_form` (
  `FORM_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '폼메일 순번',
  `FORM_CODE` varchar(24) DEFAULT NULL COMMENT '폼메일 코드',
  `FORM_NAME` varchar(24) DEFAULT NULL COMMENT '폼메일명',
  `TERMS_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '약관 사용 여부',
  `TERMS_BODY` varchar(1000) DEFAULT NULL COMMENT '약관 내용',
  `CSS_PREFIX` varchar(24) DEFAULT NULL COMMENT '스킨',
  `BOARD_RECEIVE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '게시판수신 여부',
  `EMAIL_RECEIVE_YN` varchar(500) NOT NULL DEFAULT 'Y' COMMENT '이메일수신 여부',
  `SMS_RECEIVE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT 'SMS수신 여부',
  `EMAIL_RECEIVE` varchar(150) DEFAULT NULL COMMENT '이메일 수신 - 필드',
  `SMS_RECEIVE` varchar(150) DEFAULT NULL COMMENT 'SMS 수신 - 필드',
  `REG_USER` varchar(24) NOT NULL COMMENT '등록자',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  PRIMARY KEY (`FORM_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='폼메일 정보';

-- Dumping data for table ts_0002.ts_form: ~3 rows (approximately)
/*!40000 ALTER TABLE `ts_form` DISABLE KEYS */;
INSERT INTO `ts_form` (`FORM_SEQ`, `FORM_CODE`, `FORM_NAME`, `TERMS_YN`, `TERMS_BODY`, `CSS_PREFIX`, `BOARD_RECEIVE_YN`, `EMAIL_RECEIVE_YN`, `SMS_RECEIVE_YN`, `EMAIL_RECEIVE`, `SMS_RECEIVE`, `REG_USER`, `REG_DATE`) VALUES
	(1, NULL, 'estimate', 'Y', '견적 문의를 최대한 빠른 시간내 친절하고 상세하게 상담해 드리겠습니다.<br>연락 가능한 연락처를 정확히 남겨 주시기 바랍니다.', '1', 'Y', 'N', 'Y', '', '', 'tago', '2018-10-10 16:06:37'),
	(2, NULL, 'form mail name ', 'Y', 'form mail heregleh zarchim ', '1', 'Y', 'Y', 'Y', 'bace_n20@yahoo.com', '', 'tago', '2018-11-13 14:58:55'),
	(3, NULL, '테스트', 'Y', 'ㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇ<br>ㄹ<br>ㄴㅇㄹㅇ<br>ㄴㅇ<br>ㄴㄹㅇ<br>', '2', 'Y', 'Y', 'Y', 'cmccmc@naver.com', '', 'tago', '2018-11-23 13:51:18');
/*!40000 ALTER TABLE `ts_form` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_form_info
DROP TABLE IF EXISTS `ts_form_info`;
CREATE TABLE IF NOT EXISTS `ts_form_info` (
  `FORM_INFO_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '항목 순번',
  `FORM_SEQ` int(11) NOT NULL COMMENT '폼메일 순번',
  `FORM_INFO_NAME` varchar(24) DEFAULT NULL COMMENT '항목명',
  `PROPERTY` varchar(24) DEFAULT NULL COMMENT '항목속성',
  `SIZE` int(11) NOT NULL DEFAULT 0 COMMENT '항목사이즈',
  `DETAIL_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT '세부항목개수',
  `DETAIL_NAME` mediumtext DEFAULT NULL COMMENT '세부항목',
  `ORDERING` smallint(6) NOT NULL DEFAULT 0 COMMENT '우선순위',
  `REQUIRED_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '항목명 필수 여부',
  PRIMARY KEY (`FORM_INFO_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='폼메일 항목';

-- Dumping data for table ts_0002.ts_form_info: ~15 rows (approximately)
/*!40000 ALTER TABLE `ts_form_info` DISABLE KEYS */;
INSERT INTO `ts_form_info` (`FORM_INFO_SEQ`, `FORM_SEQ`, `FORM_INFO_NAME`, `PROPERTY`, `SIZE`, `DETAIL_COUNT`, `DETAIL_NAME`, `ORDERING`, `REQUIRED_YN`) VALUES
	(2, 1, '견적종류', 'radio', 11, 4, '솔루션 상담¤웹사이트 개발¤모바일 제작¤어플 제작', 1, 'Y'),
	(3, 1, '회사구분', 'radio', 11, 2, '개인¤회사', 2, 'Y'),
	(6, 1, '작성자 ', 'text', 45, 1, '', 4, 'Y'),
	(7, 1, '이메일', 'email', 11, 1, '', 5, 'Y'),
	(8, 1, '휴대전화 ', 'phone', 10, 1, '', 6, 'Y'),
	(9, 1, '일반전화', 'phone', 10, 1, '', 7, 'N'),
	(10, 1, '작업내용', 'radio', 10, 2, '신규¤리뉴얼', 8, 'N'),
	(11, 1, '희망 오픈일	', 'pdate', 11, 1, '', 9, 'N'),
	(12, 1, '기존 홈페이지	', 'text', 20, 1, '', 11, 'N'),
	(13, 1, '참고 사이트 ', 'text', 20, 1, '', 12, 'Y'),
	(14, 1, '상담내용', 'textarea', 20, 1, '', 13, 'N'),
	(15, 1, '확인비밀번호', 'text', 20, 1, '', 14, 'N'),
	(16, 1, '희망 예산	', 'text', 20, 1, '만원', 10, 'N'),
	(19, 2, 'jhjh', 'text', 20, 2, 'dfdf¤ere', 2, 'Y'),
	(20, 2, 'test', 'text', 23, 1, 'test', 3, 'N');
/*!40000 ALTER TABLE `ts_form_info` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_form_value
DROP TABLE IF EXISTS `ts_form_value`;
CREATE TABLE IF NOT EXISTS `ts_form_value` (
  `FORM_VALUE_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '항목 내용 순번',
  `FORM_WRITING_SEQ` int(11) NOT NULL COMMENT '작성폼메일 순번',
  `FORM_INFO_NAME` varchar(24) DEFAULT NULL COMMENT '항목명',
  `FORM_INFO_VALUE` mediumtext DEFAULT NULL COMMENT '항목내용',
  `PROPERTY` varchar(24) DEFAULT NULL COMMENT '항목속성',
  PRIMARY KEY (`FORM_VALUE_SEQ`),
  UNIQUE KEY `XPK_TS_FORM_VALUE` (`FORM_VALUE_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='폼메일 항목내용';

-- Dumping data for table ts_0002.ts_form_value: ~39 rows (approximately)
/*!40000 ALTER TABLE `ts_form_value` DISABLE KEYS */;
INSERT INTO `ts_form_value` (`FORM_VALUE_SEQ`, `FORM_WRITING_SEQ`, `FORM_INFO_NAME`, `FORM_INFO_VALUE`, `PROPERTY`) VALUES
	(1, 1, '견적종류', '솔루션 상담', 'radio'),
	(2, 1, '회사구분', '개인', 'radio'),
	(3, 1, '작성자 ', 'test', 'text'),
	(4, 1, '이메일', 'test@test', 'email'),
	(5, 1, '휴대전화 ', '213-2131-123', 'phone'),
	(6, 1, '일반전화', '123-1231-312', 'phone'),
	(7, 1, '작업내용', '신규', 'radio'),
	(8, 1, '희망 예산	', 'test', 'text'),
	(9, 1, '희망 오픈일	', '2018-11-20', 'pdate'),
	(10, 1, '기존 홈페이지	', 'test', 'text'),
	(11, 1, '참고 사이트 ', 'tes', 'text'),
	(12, 1, '상담내용', 'test', 'textarea'),
	(13, 1, '확인비밀번호', 'test', 'text'),
	(14, 2, '견적종류', '솔루션 상담', 'radio'),
	(15, 2, '회사구분', '개인', 'radio'),
	(16, 2, '작성자 ', '테스트', 'text'),
	(17, 2, '이메일', 'smilepyw@gmail.com', 'email'),
	(18, 2, '휴대전화 ', '010-8912-0958', 'phone'),
	(19, 2, '일반전화', '', 'phone'),
	(20, 2, '작업내용', '신규', 'radio'),
	(21, 2, '희망 예산	', '1000', 'text'),
	(22, 2, '희망 오픈일	', '2018-12-20', 'pdate'),
	(23, 2, '기존 홈페이지	', '', 'text'),
	(24, 2, '참고 사이트 ', 'www.daum.net', 'text'),
	(25, 2, '상담내용', '테스트입니다', 'textarea'),
	(26, 2, '확인비밀번호', '1111', 'text'),
	(27, 3, '견적종류', '웹사이트 개발', 'radio'),
	(28, 3, '회사구분', '개인', 'radio'),
	(29, 3, '작성자 ', 'ariun', 'text'),
	(30, 3, '이메일', 'aajiina@gmail.com', 'email'),
	(31, 3, '휴대전화 ', '976-8966-4900', 'phone'),
	(32, 3, '일반전화', '', 'phone'),
	(33, 3, '작업내용', '', 'radio'),
	(34, 3, '희망 오픈일	', '', 'pdate'),
	(35, 3, '희망 예산	', '', 'text'),
	(36, 3, '기존 홈페이지	', '', 'text'),
	(37, 3, '참고 사이트 ', 'http://tagoplus3.cafe24.com/pages/customer/estimate.jsp', 'text'),
	(38, 3, '상담내용', 'test hiij bnoo', 'textarea'),
	(39, 3, '확인비밀번호', '', 'text');
/*!40000 ALTER TABLE `ts_form_value` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_form_writing
DROP TABLE IF EXISTS `ts_form_writing`;
CREATE TABLE IF NOT EXISTS `ts_form_writing` (
  `FORM_WRITING_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '작성 순번',
  `FORM_SEQ` int(11) NOT NULL COMMENT '폼메일 순번',
  `SUBJECT` varchar(24) DEFAULT NULL COMMENT '제목',
  `PHONE` varchar(24) DEFAULT NULL COMMENT '연락처',
  `EMAIL` varchar(24) DEFAULT NULL COMMENT '이메일',
  `NAME` varchar(24) DEFAULT NULL COMMENT '이름',
  `PROCESS` varchar(1) DEFAULT 'W' COMMENT '처리상태[W:대기중, P:처리중, C:처리완료]',
  `BODY` mediumtext DEFAULT NULL COMMENT '답변내용',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `REG_USER` varchar(24) NOT NULL COMMENT '등록자',
  PRIMARY KEY (`FORM_WRITING_SEQ`),
  UNIQUE KEY `XPK_TS_FORM_WRITING` (`FORM_WRITING_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='폼메일 작성';

-- Dumping data for table ts_0002.ts_form_writing: ~3 rows (approximately)
/*!40000 ALTER TABLE `ts_form_writing` DISABLE KEYS */;
INSERT INTO `ts_form_writing` (`FORM_WRITING_SEQ`, `FORM_SEQ`, `SUBJECT`, `PHONE`, `EMAIL`, `NAME`, `PROCESS`, `BODY`, `REG_DATE`, `REG_USER`) VALUES
	(1, 1, 'estimate1', NULL, NULL, NULL, 'W', NULL, '2018-11-20 20:47:43', 'tago'),
	(2, 1, 'estimate2', '', '', '', 'C', '&lt;br /&gt;\r\n&amp;nbsp; 테스트에 대한 답변입니다', '2018-11-22 19:48:25', 'tago'),
	(3, 1, 'estimate3', NULL, NULL, NULL, 'W', NULL, '2018-11-30 10:44:34', 'tago');
/*!40000 ALTER TABLE `ts_form_writing` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_group
DROP TABLE IF EXISTS `ts_group`;
CREATE TABLE IF NOT EXISTS `ts_group` (
  `GROUP_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '그룹 순번',
  `GROUP_TYPE` varchar(1) NOT NULL COMMENT '그룹 종류 [B:게시판, P:페이지]',
  `GROUP_NAME` varchar(96) NOT NULL COMMENT '그룹 이름',
  PRIMARY KEY (`GROUP_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='그룹 정보 - 게시판, 페이지\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_group: ~6 rows (approximately)
/*!40000 ALTER TABLE `ts_group` DISABLE KEYS */;
INSERT INTO `ts_group` (`GROUP_SEQ`, `GROUP_TYPE`, `GROUP_NAME`) VALUES
	(1, 'B', 'Portfolio'),
	(2, 'B', 'Car Rent'),
	(3, 'B', 'manager'),
	(4, 'P', '부가서비스1'),
	(5, 'P', '모바일 앱/웹 제작'),
	(6, 'P', '회사소개');
/*!40000 ALTER TABLE `ts_group` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_history_hit
DROP TABLE IF EXISTS `ts_history_hit`;
CREATE TABLE IF NOT EXISTS `ts_history_hit` (
  `IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '자동증가키',
  `HIT_DATE` varchar(10) NOT NULL COMMENT '접속일자',
  `HIT_TIME` varchar(2) NOT NULL COMMENT '접속시간',
  `HIT_CNT` int(11) DEFAULT NULL COMMENT '접속',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=678 DEFAULT CHARSET=utf8 COMMENT='접속자수 집계 테이블';

-- Dumping data for table ts_0002.ts_history_hit: ~180 rows (approximately)
/*!40000 ALTER TABLE `ts_history_hit` DISABLE KEYS */;
INSERT INTO `ts_history_hit` (`IDX`, `HIT_DATE`, `HIT_TIME`, `HIT_CNT`) VALUES
	(474, '20181122', '10', 13),
	(475, '20181122', '11', 25),
	(476, '20181122', '12', 70),
	(477, '20181122', '13', 113),
	(478, '20181122', '15', 12),
	(479, '20181122', '17', 41),
	(480, '20181122', '18', 62),
	(481, '20181122', '19', 89),
	(482, '20181122', '20', 58),
	(483, '20181122', '21', 34),
	(484, '20181122', '22', 5),
	(485, '20181121', '09', 22),
	(486, '20181121', '10', 53),
	(487, '20181121', '11', 50),
	(488, '20181121', '12', 7),
	(489, '20181121', '13', 7),
	(490, '20181121', '15', 9),
	(491, '20181121', '16', 90),
	(492, '20181121', '17', 54),
	(493, '20181121', '18', 41),
	(494, '20181121', '19', 57),
	(495, '20181121', '20', 38),
	(496, '20181120', '02', 1),
	(497, '20181120', '09', 3),
	(498, '20181120', '10', 12),
	(499, '20181120', '11', 24),
	(500, '20181120', '12', 4),
	(501, '20181120', '14', 1),
	(502, '20181120', '15', 6),
	(503, '20181120', '16', 6),
	(504, '20181120', '17', 99),
	(505, '20181120', '18', 84),
	(506, '20181120', '19', 31),
	(507, '20181120', '20', 113),
	(508, '20181119', '09', 3),
	(509, '20181119', '10', 44),
	(510, '20181119', '11', 21),
	(511, '20181119', '12', 59),
	(512, '20181119', '13', 27),
	(513, '20181119', '14', 1),
	(514, '20181119', '15', 6),
	(515, '20181119', '16', 49),
	(516, '20181119', '17', 99),
	(517, '20181119', '18', 8),
	(518, '20181119', '19', 1),
	(519, '20181118', '01', 1),
	(520, '20181118', '14', 9),
	(521, '20181118', '18', 28),
	(522, '20181117', '10', 126),
	(523, '20181117', '11', 50),
	(524, '20181117', '12', 153),
	(525, '20181117', '13', 41),
	(526, '20181117', '15', 90),
	(527, '20181117', '16', 106),
	(528, '20181117', '17', 90),
	(529, '20181117', '18', 66),
	(530, '20181117', '19', 58),
	(531, '20181116', '10', 28),
	(532, '20181116', '11', 46),
	(533, '20181116', '12', 128),
	(534, '20181116', '13', 62),
	(535, '20181116', '14', 40),
	(536, '20181116', '15', 127),
	(537, '20181116', '16', 223),
	(538, '20181116', '17', 43),
	(539, '20181116', '18', 38),
	(540, '20181116', '19', 58),
	(541, '20181116', '20', 7),
	(542, '20181115', '09', 3),
	(543, '20181115', '10', 192),
	(544, '20181115', '11', 121),
	(545, '20181115', '12', 311),
	(546, '20181115', '13', 175),
	(547, '20181115', '14', 5),
	(548, '20181115', '15', 160),
	(549, '20181115', '16', 93),
	(550, '20181114', '09', 20),
	(551, '20181114', '10', 76),
	(552, '20181114', '11', 100),
	(553, '20181114', '12', 130),
	(554, '20181114', '13', 235),
	(555, '20181114', '14', 5),
	(556, '20181114', '15', 161),
	(557, '20181114', '16', 184),
	(558, '20181114', '17', 353),
	(559, '20181114', '18', 553),
	(560, '20181114', '19', 101),
	(561, '20181113', '10', 3),
	(562, '20181113', '11', 4),
	(563, '20181113', '12', 57),
	(564, '20181113', '13', 91),
	(565, '20181113', '14', 22),
	(566, '20181113', '15', 54),
	(567, '20181113', '16', 84),
	(568, '20181113', '17', 185),
	(569, '20181113', '18', 68),
	(570, '20181113', '19', 150),
	(571, '20181113', '20', 150),
	(572, '20181113', '21', 46),
	(573, '20181113', '22', 1),
	(574, '20181113', '23', 1),
	(575, '20181112', '10', 1),
	(576, '20181112', '11', 1),
	(577, '20181112', '12', 1),
	(578, '20181112', '17', 9),
	(579, '20181112', '18', 4),
	(580, '20181112', '19', 13),
	(581, '20181112', '20', 9),
	(582, '20181112', '21', 2),
	(583, '20181129', '10', 65),
	(584, '20181129', '11', 157),
	(585, '20181129', '12', 3),
	(586, '20181129', '13', 28),
	(587, '20181129', '14', 20),
	(588, '20181129', '15', 192),
	(589, '20181129', '16', 83),
	(590, '20181129', '17', 239),
	(591, '20181129', '18', 105),
	(592, '20181129', '19', 8),
	(593, '20181129', '20', 5),
	(594, '20181129', '23', 1),
	(595, '20181128', '09', 3),
	(596, '20181128', '10', 20),
	(597, '20181128', '11', 13),
	(598, '20181128', '12', 40),
	(599, '20181128', '13', 31),
	(600, '20181128', '15', 129),
	(601, '20181128', '16', 46),
	(602, '20181128', '17', 71),
	(603, '20181128', '18', 68),
	(604, '20181128', '19', 29),
	(605, '20181127', '10', 5),
	(606, '20181127', '11', 66),
	(607, '20181127', '12', 129),
	(608, '20181127', '13', 15),
	(609, '20181127', '15', 36),
	(610, '20181127', '16', 41),
	(611, '20181127', '17', 20),
	(612, '20181127', '18', 90),
	(613, '20181127', '19', 6),
	(614, '20181127', '21', 2),
	(615, '20181126', '12', 16),
	(616, '20181126', '14', 1),
	(617, '20181126', '15', 1),
	(618, '20181126', '16', 3),
	(619, '20181126', '17', 25),
	(620, '20181126', '19', 2),
	(621, '20181125', '12', 1),
	(622, '20181125', '14', 8),
	(623, '20181125', '15', 21),
	(624, '20181125', '16', 1),
	(625, '20181125', '17', 5),
	(626, '20181125', '18', 12),
	(627, '20181125', '19', 9),
	(628, '20181124', '12', 11),
	(629, '20181124', '13', 39),
	(630, '20181124', '14', 51),
	(631, '20181124', '15', 15),
	(632, '20181124', '16', 49),
	(633, '20181124', '18', 17),
	(634, '20181123', '02', 1),
	(635, '20181123', '09', 2),
	(636, '20181123', '10', 58),
	(637, '20181123', '11', 30),
	(638, '20181123', '12', 31),
	(639, '20181123', '13', 6),
	(640, '20181123', '14', 7),
	(641, '20181123', '15', 57),
	(642, '20181123', '16', 65),
	(643, '20181123', '17', 28),
	(644, '20181123', '18', 82),
	(645, '20181123', '19', 32),
	(670, '20181203', '09', 2),
	(671, '20181203', '10', 6),
	(672, '20181203', '11', 16),
	(673, '20181203', '12', 1),
	(674, '20181203', '13', 1),
	(675, '20181203', '14', 5),
	(676, '20181203', '15', 12),
	(677, '20181203', '18', 1);
/*!40000 ALTER TABLE `ts_history_hit` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_history_host
DROP TABLE IF EXISTS `ts_history_host`;
CREATE TABLE IF NOT EXISTS `ts_history_host` (
  `IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '자동증가키 ',
  `HIT_DATE` varchar(10) NOT NULL COMMENT '접속일자 ',
  `HIT_TIME` varchar(2) DEFAULT NULL COMMENT '접속시간',
  `HIT_HOST` varchar(100) DEFAULT NULL COMMENT '접속경로 도메인',
  `HIT_CNT` int(11) DEFAULT NULL COMMENT '접속',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='접속경로 집계 테이블 ';

-- Dumping data for table ts_0002.ts_history_host: ~150 rows (approximately)
/*!40000 ALTER TABLE `ts_history_host` DISABLE KEYS */;
INSERT INTO `ts_history_host` (`IDX`, `HIT_DATE`, `HIT_TIME`, `HIT_HOST`, `HIT_CNT`) VALUES
	(2, '20181126', '12', '(direct)', 16),
	(3, '20181126', '14', '(direct)', 1),
	(4, '20181126', '15', '(direct)', 1),
	(5, '20181126', '16', '(direct)', 3),
	(6, '20181126', '17', '(direct)', 25),
	(7, '20181126', '19', '(direct)', 2),
	(8, '20181125', '12', '(direct)', 1),
	(9, '20181125', '14', '(direct)', 8),
	(10, '20181125', '15', '(direct)', 21),
	(11, '20181125', '16', '(direct)', 1),
	(12, '20181125', '17', '(direct)', 5),
	(13, '20181125', '18', '(direct)', 12),
	(14, '20181125', '19', '(direct)', 9),
	(15, '20181124', '12', '(direct)', 11),
	(16, '20181124', '13', '(direct)', 39),
	(17, '20181124', '14', '(direct)', 51),
	(18, '20181124', '15', '(direct)', 15),
	(19, '20181124', '16', '(direct)', 49),
	(20, '20181124', '18', '(direct)', 17),
	(21, '20181123', '02', 'gw.bizwiz.co.kr', 1),
	(22, '20181123', '09', '(direct)', 2),
	(23, '20181123', '10', '(direct)', 58),
	(24, '20181123', '11', '(direct)', 30),
	(25, '20181123', '12', '(direct)', 31),
	(26, '20181123', '13', '(direct)', 6),
	(27, '20181123', '14', '(direct)', 7),
	(28, '20181123', '15', '(direct)', 57),
	(29, '20181123', '16', '(direct)', 65),
	(30, '20181123', '17', '(direct)', 28),
	(31, '20181123', '18', '(direct)', 82),
	(32, '20181123', '19', '(direct)', 32),
	(33, '20181122', '10', '(direct)', 13),
	(34, '20181122', '11', '(direct)', 25),
	(35, '20181122', '12', '(direct)', 70),
	(36, '20181122', '13', '(direct)', 113),
	(37, '20181122', '15', '(direct)', 12),
	(38, '20181122', '17', '(direct)', 41),
	(39, '20181122', '18', '(direct)', 62),
	(40, '20181122', '19', '(direct)', 89),
	(41, '20181122', '20', '(direct)', 58),
	(42, '20181122', '21', '(direct)', 34),
	(43, '20181122', '22', '(direct)', 5),
	(44, '20181121', '09', '(direct)', 22),
	(45, '20181121', '10', '(direct)', 53),
	(46, '20181121', '11', '(direct)', 50),
	(47, '20181121', '12', '(direct)', 7),
	(48, '20181121', '13', '(direct)', 7),
	(49, '20181121', '15', '(direct)', 9),
	(50, '20181121', '16', '(direct)', 90),
	(51, '20181121', '17', '(direct)', 54),
	(52, '20181121', '18', '(direct)', 41),
	(53, '20181121', '19', '(direct)', 57),
	(54, '20181121', '20', '(direct)', 38),
	(55, '20181120', '02', 'gw.bizwiz.co.kr', 1),
	(56, '20181120', '09', '(direct)', 3),
	(57, '20181120', '10', '(direct)', 12),
	(58, '20181120', '11', '(direct)', 24),
	(59, '20181120', '12', '(direct)', 4),
	(60, '20181120', '14', '(direct)', 1),
	(61, '20181120', '15', '(direct)', 6),
	(62, '20181120', '16', '(direct)', 6),
	(63, '20181120', '17', '(direct)', 99),
	(64, '20181120', '18', '(direct)', 84),
	(65, '20181120', '19', '(direct)', 31),
	(66, '20181120', '20', '(direct)', 113),
	(67, '20181119', '09', '(direct)', 3),
	(68, '20181119', '10', '(direct)', 44),
	(69, '20181119', '11', '(direct)', 21),
	(70, '20181119', '12', '(direct)', 59),
	(71, '20181119', '13', '(direct)', 27),
	(72, '20181119', '14', '(direct)', 1),
	(73, '20181119', '15', '(direct)', 6),
	(74, '20181119', '16', '(direct)', 49),
	(75, '20181119', '17', '(direct)', 99),
	(76, '20181119', '18', '(direct)', 8),
	(77, '20181119', '19', '(direct)', 1),
	(78, '20181118', '01', '(direct)', 1),
	(79, '20181118', '14', '(direct)', 9),
	(80, '20181118', '18', '(direct)', 28),
	(81, '20181117', '10', '(direct)', 126),
	(82, '20181117', '11', '(direct)', 50),
	(83, '20181117', '12', '(direct)', 153),
	(84, '20181117', '13', '(direct)', 41),
	(85, '20181117', '15', '(direct)', 90),
	(86, '20181117', '16', '(direct)', 106),
	(87, '20181117', '17', '(direct)', 90),
	(88, '20181117', '18', '(direct)', 66),
	(89, '20181117', '19', '(direct)', 58),
	(90, '20181116', '10', '(direct)', 28),
	(91, '20181116', '11', '(direct)', 46),
	(92, '20181116', '12', '(direct)', 128),
	(93, '20181116', '13', '(direct)', 62),
	(94, '20181116', '14', '(direct)', 40),
	(95, '20181116', '15', '(direct)', 127),
	(96, '20181116', '16', '(direct)', 223),
	(97, '20181116', '17', '(direct)', 43),
	(98, '20181116', '18', '(direct)', 38),
	(99, '20181116', '19', '(direct)', 58),
	(100, '20181116', '20', '(direct)', 7),
	(101, '20181115', '09', '(direct)', 3),
	(102, '20181115', '10', '(direct)', 192),
	(103, '20181115', '11', '(direct)', 121),
	(104, '20181115', '12', '(direct)', 311),
	(105, '20181115', '13', '(direct)', 175),
	(106, '20181115', '14', '(direct)', 5),
	(107, '20181115', '15', '(direct)', 160),
	(108, '20181115', '16', '(direct)', 93),
	(109, '20181114', '09', '(direct)', 20),
	(110, '20181114', '10', '(direct)', 76),
	(111, '20181114', '11', '(direct)', 100),
	(112, '20181114', '12', '(direct)', 130),
	(113, '20181114', '13', '(direct)', 235),
	(114, '20181114', '14', '(direct)', 5),
	(115, '20181114', '15', '(direct)', 161),
	(116, '20181114', '16', '(direct)', 184),
	(117, '20181114', '17', '(direct)', 353),
	(118, '20181114', '18', '(direct)', 553),
	(119, '20181114', '19', '(direct)', 101),
	(120, '20181113', '10', '(direct)', 3),
	(121, '20181113', '11', '(direct)', 4),
	(122, '20181113', '12', '(direct)', 57),
	(123, '20181113', '13', '(direct)', 91),
	(124, '20181113', '14', '(direct)', 22),
	(125, '20181113', '15', '(direct)', 54),
	(126, '20181113', '16', '(direct)', 84),
	(127, '20181113', '17', '(direct)', 185),
	(128, '20181113', '18', '(direct)', 68),
	(129, '20181113', '19', '(direct)', 150),
	(130, '20181113', '20', '(direct)', 150),
	(131, '20181113', '21', '(direct)', 46),
	(132, '20181113', '22', '(direct)', 1),
	(133, '20181113', '23', '(direct)', 1),
	(134, '20181112', '10', '(direct)', 1),
	(135, '20181112', '11', '(direct)', 1),
	(136, '20181112', '12', '(direct)', 1),
	(137, '20181112', '17', '(direct)', 9),
	(138, '20181112', '18', '(direct)', 4),
	(139, '20181112', '19', '(direct)', 13),
	(140, '20181112', '20', '(direct)', 9),
	(141, '20181112', '21', '(direct)', 2),
	(152, '20181203', '09', '(direct)', 2),
	(153, '20181203', '10', '(direct)', 1),
	(154, '20181203', '10', 'blog.naver.com', 5),
	(155, '20181203', '11', '(direct)', 8),
	(156, '20181203', '11', 'blog.naver.com', 8),
	(157, '20181203', '12', '(direct)', 1),
	(158, '20181203', '13', '(direct)', 1),
	(159, '20181203', '14', '(direct)', 5),
	(160, '20181203', '15', '(direct)', 12),
	(161, '20181203', '18', '(direct)', 1);
/*!40000 ALTER TABLE `ts_history_host` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_history_login
DROP TABLE IF EXISTS `ts_history_login`;
CREATE TABLE IF NOT EXISTS `ts_history_login` (
  `IDX` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '자동증가키 ',
  `USER_TYPE` varchar(1) NOT NULL COMMENT '로그인한 User의 유형   A:관리자админ , U:일반사용자',
  `USER_ID` varchar(20) DEFAULT NULL COMMENT '로그인한 사람의 ID',
  `USER_IP` varchar(20) DEFAULT NULL COMMENT '로그인한 사람의 IP',
  `SESSON_INFO` varchar(50) DEFAULT NULL COMMENT '로그인한 사람의 Session 값',
  `ALL_INFO` longtext DEFAULT NULL COMMENT '로그인한 사람의 All_HTTP 정보',
  `REG_DATE` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '로그인 시간',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='로그인 이력 테이블';

-- Dumping data for table ts_0002.ts_history_login: ~21 rows (approximately)
/*!40000 ALTER TABLE `ts_history_login` DISABLE KEYS */;
INSERT INTO `ts_history_login` (`IDX`, `USER_TYPE`, `USER_ID`, `USER_IP`, `SESSON_INFO`, `ALL_INFO`, `REG_DATE`) VALUES
	(1, 'A', 'tago', '192.168.0.156', '슈퍼유저', NULL, NULL),
	(2, 'A', 'tago', '192.168.0.156', '슈퍼유저', NULL, NULL),
	(3, 'A', 'tago', '192.168.0.156', '슈퍼유저', NULL, NULL),
	(4, 'A', 'tago', '192.168.0.156', '슈퍼유저', NULL, NULL),
	(5, 'A', 'tago', '192.168.0.156', '슈퍼유저', NULL, NULL),
	(6, 'A', 'tago', '192.168.0.156', '슈퍼유저', NULL, '2018-11-27 10:38:21'),
	(7, 'A', 'tago', '192.168.0.156', '슈퍼유저', NULL, '2018-11-27 10:41:41'),
	(8, 'A', 'tago', '192.168.0.156', '슈퍼유저', NULL, '2018-11-27 10:42:54'),
	(9, 'U', 'tago', '192.168.0.156', '슈퍼유저', NULL, '2018-11-27 10:43:05'),
	(10, 'U', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-04 18:19:05'),
	(11, 'U', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-04 18:19:44'),
	(12, 'U', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-04 18:19:50'),
	(13, 'A', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-04 18:20:36'),
	(14, 'A', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-04 18:20:54'),
	(15, 'A', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-04 18:32:27'),
	(16, 'A', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-05 10:26:01'),
	(17, 'A', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-05 12:08:53'),
	(18, 'A', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-05 12:08:59'),
	(19, 'A', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-05 14:36:16'),
	(20, 'A', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-05 14:47:38'),
	(21, 'A', 'tago', '192.168.1.189', '슈퍼유저', NULL, '2018-12-05 15:33:26'),
	(22, 'U', 'skyline', '192.168.0.175', 'tenger', NULL, '2018-12-27 11:36:55');
/*!40000 ALTER TABLE `ts_history_login` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_mail_tmpl
DROP TABLE IF EXISTS `ts_mail_tmpl`;
CREATE TABLE IF NOT EXISTS `ts_mail_tmpl` (
  `MAIL_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '메일 순번',
  `MAIL_NAME` varchar(24) DEFAULT NULL COMMENT '분류명',
  `ADMIN_SEND_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '관리자 발송 여부',
  `USER_SEND_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '회원 발송 여부',
  `BODY` mediumtext DEFAULT NULL COMMENT '내용',
  `SUBJECT` varchar(24) DEFAULT NULL COMMENT '제목',
  PRIMARY KEY (`MAIL_SEQ`),
  UNIQUE KEY `XPK_TS_MEMBER_MAIL` (`MAIL_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='회원 메일 설정';

-- Dumping data for table ts_0002.ts_mail_tmpl: ~2 rows (approximately)
/*!40000 ALTER TABLE `ts_mail_tmpl` DISABLE KEYS */;
INSERT INTO `ts_mail_tmpl` (`MAIL_SEQ`, `MAIL_NAME`, `ADMIN_SEND_YN`, `USER_SEND_YN`, `BODY`, `SUBJECT`) VALUES
	(1, 'this is test', 'N', 'Y', '', 'my mail'),
	(2, 'type of mail', 'N', 'N', '', '코메트 쓰기');
/*!40000 ALTER TABLE `ts_mail_tmpl` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_member_cmomey
DROP TABLE IF EXISTS `ts_member_cmomey`;
CREATE TABLE IF NOT EXISTS `ts_member_cmomey` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(24) DEFAULT NULL,
  `C_MONEY` int(11) NOT NULL,
  `SUMMARY` text DEFAULT NULL,
  `ORDER_UID` int(11) NOT NULL DEFAULT 0,
  `EDITOR_NAME` varchar(100) DEFAULT NULL,
  `REASON` varchar(100) DEFAULT NULL,
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `USE_FLAG` char(1) DEFAULT 'Y',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table ts_0002.ts_member_cmomey: ~25 rows (approximately)
/*!40000 ALTER TABLE `ts_member_cmomey` DISABLE KEYS */;
INSERT INTO `ts_member_cmomey` (`IDX`, `USER_ID`, `C_MONEY`, `SUMMARY`, `ORDER_UID`, `EDITOR_NAME`, `REASON`, `REG_DATE`, `USE_FLAG`) VALUES
	(6, '108440031531899286571', 1000, 'JOIN', 0, 'tago', 'not now', '2018-11-28 15:16:32', 'Y'),
	(7, '108440031531899286571', 500, 'COMMENT', 0, NULL, NULL, '2018-11-28 15:21:51', 'Y'),
	(8, 'ariun', 1000, 'JOIN', 0, NULL, NULL, '2018-11-28 15:40:01', 'N'),
	(9, 'bagi', 500, 'COMMENT', 0, NULL, NULL, '2018-11-28 15:47:25', 'Y'),
	(10, 'bace20', 1000, 'JOIN', 0, NULL, NULL, '2018-11-28 15:50:17', 'Y'),
	(11, 'bace20', 500, 'сэтгэгдэл бичих', 0, 'tago', NULL, '2018-11-28 15:51:28', 'Y'),
	(12, 'bataa', 15000, 'JOIN', 0, NULL, NULL, '2018-11-28 16:00:20', 'Y'),
	(13, 'bace20', 1000, 'COMMENT', 0, NULL, NULL, '2018-11-28 17:36:19', 'Y'),
	(14, 'ariun1', 15000, 'JOIN', 0, NULL, NULL, '2018-11-28 17:40:08', 'Y'),
	(15, 'ariun1', 1233, 'COMMENT', 0, 'tago', 'yagaad bolohgui bnaa', '2018-11-29 10:25:52', 'Y'),
	(16, 'bace20', 1000, 'COMMENT', 0, NULL, NULL, '2018-11-29 10:27:55', 'Y'),
	(17, 'ariun1', 1000, 'COMMENT', 0, NULL, NULL, '2018-11-29 10:42:21', 'Y'),
	(18, 'ariun1', 1000, 'COMMENT', 0, NULL, NULL, '2018-11-29 10:42:57', 'Y'),
	(19, 'ariun1', 1000, 'COMMENT', 0, NULL, NULL, '2018-11-29 15:44:37', 'Y'),
	(20, 'ariun1', 1000, 'COMMENT', 0, NULL, NULL, '2018-11-29 15:45:29', 'Y'),
	(21, 'ariun1', 1000, 'COMMENT', 0, NULL, NULL, '2018-11-30 13:35:01', 'Y'),
	(22, '107532058942820424970', 15000, 'JOIN', 0, NULL, NULL, '2018-11-30 17:04:00', 'Y'),
	(23, 'ariun1', 1000, 'COMMENT', 0, NULL, NULL, '2018-11-30 17:11:40', 'Y'),
	(24, 'billy_d', 15000, 'JOIN', 0, NULL, NULL, '2018-11-30 18:40:15', 'Y'),
	(25, 'teste', 15000, 'JOIN', 0, NULL, NULL, '2018-12-06 10:45:54', 'Y'),
	(26, 'mongol', 15000, 'JOIN', 0, NULL, NULL, '2018-12-07 14:27:51', 'Y'),
	(27, 'wellnow', 15000, 'JOIN', 0, NULL, NULL, '2018-12-07 14:46:31', 'Y'),
	(28, '108440031531899286571', 150001, 'JOIN', 0, NULL, NULL, '2018-12-13 17:23:59', 'Y'),
	(29, 'mongol', 1000, 'COMMENT', 0, NULL, NULL, '2018-12-17 17:48:23', 'Y'),
	(30, 'skyline', 15000, 'JOIN', 0, NULL, NULL, '2018-12-27 11:30:09', 'Y'),
	(33, '960391018', 15000, 'JOIN', 0, NULL, NULL, '2018-12-27 19:39:45', 'Y');
/*!40000 ALTER TABLE `ts_member_cmomey` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_member_company
DROP TABLE IF EXISTS `ts_member_company`;
CREATE TABLE IF NOT EXISTS `ts_member_company` (
  `USER_ID` varchar(24) NOT NULL COMMENT 'Member 테이블 User_ID',
  `OFFICE_NAME` varchar(100) DEFAULT NULL COMMENT '업점업체명',
  `OFFICE_NUM` varchar(20) DEFAULT NULL COMMENT '사업자번호',
  `OB_NUM` varchar(20) DEFAULT NULL COMMENT '통신판매번호',
  `B_TYPE` varchar(100) DEFAULT NULL COMMENT '업태',
  `BC_TYPE` varchar(100) DEFAULT NULL COMMENT '업종',
  `TAX_EMAIL` varchar(10) DEFAULT NULL COMMENT '계산서 이메일',
  `ZIP_CODE` varchar(6) DEFAULT NULL COMMENT '우편번호',
  `ADDR1` varchar(200) DEFAULT NULL COMMENT '우편번호 주소',
  `ADDR2` varchar(200) DEFAULT NULL COMMENT '상세주소',
  `OWNER_NAME` varchar(100) DEFAULT NULL COMMENT '대표자명',
  `OWNER_TEL` varchar(20) DEFAULT NULL COMMENT '대표자연락처',
  `STAFF_NAME` varchar(100) DEFAULT NULL COMMENT '담당자 이름',
  `STAFF_TEL` varchar(20) DEFAULT NULL COMMENT '담당자 연락처'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ts_0002.ts_member_company: ~8 rows (approximately)
/*!40000 ALTER TABLE `ts_member_company` DISABLE KEYS */;
INSERT INTO `ts_member_company` (`USER_ID`, `OFFICE_NAME`, `OFFICE_NUM`, `OB_NUM`, `B_TYPE`, `BC_TYPE`, `TAX_EMAIL`, `ZIP_CODE`, `ADDR1`, `ADDR2`, `OWNER_NAME`, `OWNER_TEL`, `STAFF_NAME`, `STAFF_TEL`) VALUES
	('tulgaaw3423', 'user', 'user', 'user', 'user', 'useruser', 'sdf', '', '', '', 'user', 'user', 'user', 'useru'),
	('teste', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('mongol', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('wellnow', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('108440031531899286571', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('skyline', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('test', '', '', 'test', '', '', '', '', '', '', '', '', '', ''),
	('test', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	('960391018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `ts_member_company` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_member_grade
DROP TABLE IF EXISTS `ts_member_grade`;
CREATE TABLE IF NOT EXISTS `ts_member_grade` (
  `GRADE_LEVEL` smallint(6) NOT NULL COMMENT '레벨',
  `ICON` varchar(320) DEFAULT NULL COMMENT '아이콘',
  `GRADE_NAME` varchar(24) NOT NULL COMMENT '등급 이름',
  `GRADE_MEMO` varchar(400) DEFAULT NULL COMMENT '설명',
  PRIMARY KEY (`GRADE_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 등급 - 높은 등급 - 낮은 숫자 지정\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_member_grade: ~3 rows (approximately)
/*!40000 ALTER TABLE `ts_member_grade` DISABLE KEYS */;
INSERT INTO `ts_member_grade` (`GRADE_LEVEL`, `ICON`, `GRADE_NAME`, `GRADE_MEMO`) VALUES
	(1, NULL, '관리자', '관리자 등급 자동 등록'),
	(3, NULL, 'golden', 'Golden'),
	(4, NULL, 'silver', '123');
/*!40000 ALTER TABLE `ts_member_grade` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_member_info
DROP TABLE IF EXISTS `ts_member_info`;
CREATE TABLE IF NOT EXISTS `ts_member_info` (
  `MEMBER_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원 순번',
  `USER_ID` varchar(24) NOT NULL COMMENT '회원 아이디',
  `GRADE_LEVEL` smallint(6) DEFAULT NULL COMMENT '레벨',
  `USER_PWD` varchar(256) NOT NULL COMMENT '비밀번호',
  `PWD_CHANGE_DATE` datetime DEFAULT NULL COMMENT '비밀번호 변경일',
  `USER_NAME` varchar(100) DEFAULT NULL COMMENT '이름',
  `PHOTO` varchar(320) DEFAULT NULL COMMENT '사진',
  `ICON` varchar(320) DEFAULT NULL COMMENT '아이콘',
  `NICKNAME` varchar(48) DEFAULT NULL COMMENT '닉네임',
  `VIRTUAL_NUMBER` varchar(13) DEFAULT NULL COMMENT '주민번호[가상주민번호 : 아이핀]',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT '이메일',
  `PHONE` varchar(24) DEFAULT NULL COMMENT '전화',
  `MOBILE` varchar(24) DEFAULT NULL COMMENT '핸드폰',
  `COMP_PHONE` varchar(24) DEFAULT NULL COMMENT '회사전화',
  `HOMEPAGE` varchar(24) DEFAULT NULL COMMENT '홈페이지',
  `ZIPCODE` varchar(24) DEFAULT NULL COMMENT '우편번호',
  `ADDR1` varchar(1000) DEFAULT NULL COMMENT '주소1',
  `ADDR2` varchar(1000) DEFAULT NULL COMMENT '주소2',
  `EMAIL_YN` varchar(1) DEFAULT NULL COMMENT '메일 수신 여부',
  `SMS_YN` varchar(1) DEFAULT NULL COMMENT 'SMS 수신 여부',
  `BIRTH_DT` varchar(24) DEFAULT NULL COMMENT '생년월일 [아이핀]',
  `IS_LUNAR` varchar(24) DEFAULT NULL COMMENT '양력/음력 [아이핀]',
  `RECOMM_USER_ID` varchar(24) DEFAULT NULL COMMENT '추천인',
  `LOGIN_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT '로그인수',
  `RECENT_LOGIN_DATE` datetime DEFAULT NULL COMMENT '최근 로그인',
  `MEMO` varchar(2000) DEFAULT NULL COMMENT '메모',
  `MEMO_ADMIN` varchar(2000) DEFAULT NULL COMMENT '메모-관리자용',
  `ADDITIONAL_ITEM1` varchar(100) DEFAULT NULL COMMENT '추가항목',
  `ADDITIONAL_ITEM2` varchar(100) DEFAULT NULL COMMENT '추가항목',
  `ADDITIONAL_ITEM3` varchar(100) DEFAULT NULL COMMENT '추가항목',
  `ADDITIONAL_ITEM4` varchar(100) DEFAULT NULL COMMENT '추가항목',
  `ADDITIONAL_ITEM5` varchar(100) DEFAULT NULL COMMENT '추가항목',
  `JOB` varchar(100) DEFAULT NULL COMMENT '직업',
  `EDUCATION` varchar(100) DEFAULT NULL COMMENT '학력',
  `MONTH_INCOME` varchar(100) DEFAULT NULL COMMENT '월평균소득',
  `HOBBY` varchar(100) DEFAULT NULL COMMENT '관심분야',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `USE_FLAG` varchar(1) DEFAULT 'Y' COMMENT '사용 여부 - 관리자',
  `WITHDRAWAL_YN` varchar(1) DEFAULT 'N' COMMENT '탈퇴 여부',
  `WITHDRAWAL_REASON` varchar(500) DEFAULT NULL COMMENT '탈퇴 사유',
  `WITHDRAWAL_DT` varchar(10) DEFAULT NULL COMMENT '탈퇴일',
  PRIMARY KEY (`MEMBER_SEQ`),
  UNIQUE KEY `UIN_TS_MEMBER_INFO_USER_ID` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3058 DEFAULT CHARSET=utf8 COMMENT='회원 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_member_info: ~21 rows (approximately)
/*!40000 ALTER TABLE `ts_member_info` DISABLE KEYS */;
INSERT INTO `ts_member_info` (`MEMBER_SEQ`, `USER_ID`, `GRADE_LEVEL`, `USER_PWD`, `PWD_CHANGE_DATE`, `USER_NAME`, `PHOTO`, `ICON`, `NICKNAME`, `VIRTUAL_NUMBER`, `EMAIL`, `PHONE`, `MOBILE`, `COMP_PHONE`, `HOMEPAGE`, `ZIPCODE`, `ADDR1`, `ADDR2`, `EMAIL_YN`, `SMS_YN`, `BIRTH_DT`, `IS_LUNAR`, `RECOMM_USER_ID`, `LOGIN_COUNT`, `RECENT_LOGIN_DATE`, `MEMO`, `MEMO_ADMIN`, `ADDITIONAL_ITEM1`, `ADDITIONAL_ITEM2`, `ADDITIONAL_ITEM3`, `ADDITIONAL_ITEM4`, `ADDITIONAL_ITEM5`, `JOB`, `EDUCATION`, `MONTH_INCOME`, `HOBBY`, `REG_DATE`, `USE_FLAG`, `WITHDRAWAL_YN`, `WITHDRAWAL_REASON`, `WITHDRAWAL_DT`) VALUES
	(3015, '169810071', 4, '', '2018-11-16 14:39:38', 'tago plus', NULL, '/image/member/20181207113614640002.jpg', '123', 'test45', 'tago-test-analytics@naver.com', '010-2222-2222', '', '', 'test', '46912', '부산 사상구 낙동대로1234번길 3', 'cehev', 'Y', 'Y', '06-15', NULL, '', 0, NULL, 'test', 'etset', 'test3', '2018-11-14 06:11', 'test3', 'desc4', '145-4545-4545', 'job', 'edu', 'income', 'interest', '2018-11-16 12:46:07', 'Y', 'N', NULL, '2018-12-18'),
	(3018, '115500842080145374681', 4, '', NULL, 'Batceceg Bace', NULL, NULL, NULL, NULL, 'batcecegn20@gmail.com', '', '', NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-16 13:31:15', 'Y', 'N', NULL, NULL),
	(3019, 'bagi', 4, 'jZae727K08KaOmKSgOaGzww_XVqGr_PKEgIMkjrcbJI', '2018-11-27 12:21:41', 'batceceg', NULL, NULL, '', '', 'bace_n20@yahoo.com', '', '010-1515-5415', '', '', '', '', '', 'Y', 'Y', '', NULL, '', 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-16 15:31:43', 'Y', 'N', NULL, '2018-11-27'),
	(3023, '114033678650248871722', NULL, '', NULL, 'billy bill', NULL, NULL, NULL, NULL, 'bilguun783@gmail.com', '', '', NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 11:16:36', 'Y', 'N', NULL, NULL),
	(3025, 'smilepyw', NULL, 'NIHZXyYyW_bnzrXpqr1eRtnfC_bp6rvn1Z6Q9dCuvDQ', NULL, '박영욱', NULL, NULL, NULL, '8888888888888', '@', '', '', '000-0000', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 18:49:55', 'Y', 'Y', ' 테스트', '2018-11-17'),
	(3026, '106846827462129672917', NULL, '', NULL, '박영욱', NULL, NULL, NULL, NULL, 'smilepyw@gmail.com', '', '', NULL, NULL, NULL, 'ko', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 18:54:23', 'Y', 'N', NULL, NULL),
	(3027, 'hinky139', NULL, '7nmXbJOA1eM3_BwJXs6MjyL5HzBs7rFh-lH-zt4sS6E', NULL, '황인규', NULL, NULL, NULL, '8888888888888', 'hink139@hanmail.net', '', '', '000-0000', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 19:29:10', 'Y', 'N', NULL, NULL),
	(3028, '961790161', NULL, '', NULL, 'smilepyw', NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 19:36:13', 'Y', 'N', NULL, NULL),
	(3029, '117063501355314487757', NULL, '', NULL, 'tagoplus billy', NULL, NULL, NULL, NULL, 'tagoplus.billy@gmail.com', '', '', NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-20 20:18:07', 'Y', 'N', NULL, NULL),
	(3032, 'aaaa', 4, 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', '2018-11-29 11:21:00', 'aaa', NULL, NULL, '', '', 'aaaa@gmail.com', '', '', '', '', '', '', '', 'Y', 'Y', '', NULL, '', 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-23 15:45:32', 'N', 'N', NULL, '2018-11-29'),
	(3034, 'ariun', 4, '73l8gRjwLftklgfdXT-MdiMEjJwGPVMsyVxe16iYpk8', NULL, 'ariun', NULL, NULL, NULL, '', 'aaa@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 15:40:01', 'Y', 'N', NULL, NULL),
	(3035, 'bace20', 4, 't56he3xcqP6czNjNum6PjtCzyUj59wntD0fS_Uf8uoI', NULL, 'batceceg', NULL, NULL, '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', NULL, '', 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 15:50:17', 'Y', 'N', NULL, '2018-11-28'),
	(3036, 'bataa', 4, 'SySaQxrL5EgQHXa_t7oLBmq5ParT37sDyT2Q6BcwDOM', NULL, 'batceceg', NULL, NULL, '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', NULL, '', 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 16:00:20', 'Y', 'N', NULL, NULL),
	(3037, 'ariun1', 4, '73l8gRjwLftklgfdXT-MdiMEjJwGPVMsyVxe16iYpk8', NULL, '아류나', NULL, NULL, NULL, '', 'aajiina@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 17:40:08', 'Y', 'N', NULL, '2018-11-30'),
	(3038, '107532058942820424970', 4, '47DEQpj8HBSa-_TImW-5JCeuQeRkm5NMpJWZG3hSuFU', NULL, 'Test test', NULL, NULL, NULL, NULL, 'tago.test.analytics@gmail.com', '', '', NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 17:04:00', 'Y', 'N', NULL, NULL),
	(3039, 'billy_d', 4, 'PwjY-ttLZ_sFZiNWXtu8LHiAkdeP0ky8Rz_OMEPONHM', NULL, 'billy_d', NULL, NULL, NULL, '', 'bilguun783@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 18:40:15', 'Y', 'N', NULL, NULL),
	(3041, 'teste', 4, '0UcifyAOG849jLZ57uo_AR65XQq3NplKUnRLeneeJPU', NULL, 'tenger', NULL, NULL, NULL, '', 'gg@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-06 10:45:54', 'Y', 'N', NULL, NULL),
	(3042, 'mongol', 4, '0UcifyAOG849jLZ57uo_AR65XQq3NplKUnRLeneeJPU', NULL, 'teest', NULL, NULL, NULL, '', 'sad@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, '2018-12-19', 'fsfds', 'tooooooooooool', '/image/member/20181207143428705001.jpg', '05315~서울 강동구 양재대로123길 16~rer', 'programmer', 'master', '400', 'wat', '2018-12-07 14:27:51', 'Y', 'N', NULL, '2018-12-07'),
	(3043, 'wellnow', 4, '0UcifyAOG849jLZ57uo_AR65XQq3NplKUnRLeneeJPU', NULL, 'tengsdad', NULL, NULL, NULL, '', 'sick@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, '2019-01-02', 'fsfds', 'tetstst', '/image/member/20181207144631372002.jpg', '14631~경기 부천시 장말로343번길 5~test', 'programmer', 'master', '300', 'wat', '2018-12-07 14:46:31', 'N', 'N', NULL, '2018-12-07'),
	(3051, '108440031531899286571', 4, '47DEQpj8HBSa-_TImW-5JCeuQeRkm5NMpJWZG3hSuFU', NULL, 'Munkhtenger Gankhuyag', NULL, NULL, 'rwar', 'wrwar', 'skyline.mn12@gmail.com', '010-1111-1111', '010-1111-1010', '', NULL, '08739', '서울 관악구 남부순환로231길 5 (봉천동)', 'wqeqw', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, '', '', NULL, '', '', 'job', 'edu', 'income', 'interest', '2018-12-13 17:23:54', 'Y', 'N', NULL, '2018-12-13'),
	(3054, 'skyline', 4, 'dX-tDq7Wyq6UVSlJn0wo6c6sWD4---A-WhMH77EA37E', NULL, 'tenger', NULL, NULL, 'tenger', 'sssald123', 'skype@gmail.com', '010-0215-5121', '', '7799655', NULL, '13591', '경기 성남시 분당구 황새울로342번길 11 (서현동)', '123123', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, '', '', NULL, '', '', 'job', 'edu', 'income', 'interest', '2018-12-27 11:30:05', 'Y', 'N', NULL, NULL),
	(3057, '960391018', 4, '47DEQpj8HBSa-_TImW-5JCeuQeRkm5NMpJWZG3hSuFU', NULL, 'tago', NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-27 19:39:45', 'Y', 'N', NULL, NULL);
/*!40000 ALTER TABLE `ts_member_info` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_member_setting
DROP TABLE IF EXISTS `ts_member_setting`;
CREATE TABLE IF NOT EXISTS `ts_member_setting` (
  `SITE_SEQ` tinyint(4) NOT NULL COMMENT '	사이트 순번	',
  `NAVER_API` varchar(1) DEFAULT NULL COMMENT '	네이버 API 사용구분	',
  `NAVER_KEY` varchar(1000) DEFAULT NULL COMMENT '	네이버 API 키	',
  `GOOGLE_API` varchar(1) DEFAULT NULL COMMENT '	구글 API 사용구분	',
  `GOOGLE_KEY` varchar(1000) DEFAULT NULL COMMENT '	구글 API 키	',
  `KAKAO_API` varchar(1) DEFAULT NULL COMMENT '	카카오 API 사용구분	',
  `KAKAO_KEY` varchar(1000) DEFAULT NULL COMMENT '	카카오 API 키	',
  `FACEBOOK_API` varchar(1) DEFAULT NULL COMMENT '	페이스북 API 사용구분	',
  `FACEBOOK_KEY` varchar(1000) DEFAULT NULL COMMENT '	페이스북 API 키	',
  `ID_FLAG` varchar(1) NOT NULL DEFAULT '1' COMMENT '	ID사용 구분	',
  `PASSWORD_FLAG` varchar(1) NOT NULL DEFAULT '1' COMMENT '	비밀번호 사용 구분	',
  `NAME_FLAG` varchar(1) NOT NULL DEFAULT '1' COMMENT '	이름 사용 구분	',
  `EMAIL_FLAG` varchar(1) NOT NULL DEFAULT '1' COMMENT '	이메일 구분	',
  `JUMIN_FLAG` varchar(1) DEFAULT NULL COMMENT '	주민등록번호 구분	',
  `ADDR_FLAG` varchar(1) DEFAULT NULL COMMENT '	주소 구분	',
  `PHONE_FLAG` varchar(1) DEFAULT NULL COMMENT '	전화번호 구분	',
  `MOBILETEL_FLAG` varchar(1) DEFAULT NULL COMMENT '	휴대폰 구분	',
  `COMPHONE_FLAG` varchar(1) DEFAULT NULL COMMENT '	회사 연락처 구분	',
  `FAX_FLAG` varchar(1) DEFAULT NULL COMMENT '	팩스 구분	',
  `OFFICE_NAME_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_NUM_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_OB_NUM_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_B_TYPE_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_BC_TYPE_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_TAX_MAIL_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_ADDR_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_OWNER_NAME_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_OWNER_TEL_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_STAFF_NAME_FLAG` varchar(1) DEFAULT NULL,
  `OFFICE_STAFF_TEL_FLAG` varchar(1) DEFAULT NULL,
  `RECOMMEND_FLAG` varchar(1) DEFAULT NULL COMMENT '	추천인 구분	',
  `EMAILRECEIVE_FLAG` varchar(1) DEFAULT NULL COMMENT '	이메일 수신 구분	',
  `SMSRECEIVE_FLAG` varchar(1) DEFAULT NULL COMMENT '	SMS수신 구분	',
  `NICKNAME_FLAG` varchar(1) DEFAULT NULL COMMENT '	닉네임 구분	',
  `ICON_FLAG` varchar(1) DEFAULT NULL COMMENT '	아이콘 구분	',
  `PHOTO_FLAG` varchar(1) DEFAULT NULL COMMENT '	사진 구분	',
  `HOMEPAGE_FLAG` varchar(1) DEFAULT NULL COMMENT '	홈페이지 구분	',
  `BIRTHDAY_FLAG` varchar(1) DEFAULT NULL COMMENT '	생일 구분	',
  `JOB_FLAG` varchar(1) DEFAULT NULL COMMENT '	직업 구분	',
  `JOB_TYPE` varchar(1000) DEFAULT NULL COMMENT '	직업 유형	',
  `INTEREST_FLAG` varchar(1) DEFAULT NULL COMMENT '	관심분야 구분	',
  `INTEREST_TYPE` varchar(1000) DEFAULT NULL COMMENT '	관심분야 유형	',
  `HOBBY_FLAG` varchar(1) DEFAULT NULL COMMENT '	취미 구분	',
  `EDUCATION_FLAG` varchar(1) DEFAULT NULL COMMENT '	학력 구분	',
  `EDUCATION_TYPE` varchar(1000) DEFAULT NULL COMMENT '	학력 유형	',
  `SELFINTRO_FLAG` varchar(1) DEFAULT NULL COMMENT '	자기소개 구분	',
  `MARRIAGE_FLAG` varchar(1) DEFAULT NULL COMMENT '	결혼여부 구분	',
  `MARRIAGEDATE_FLAG` varchar(1) DEFAULT NULL COMMENT '	결혼기념일 구분	',
  `INCOME_FLAG` varchar(1) DEFAULT NULL COMMENT '	월평균소득 구분	',
  `INCOME_TYPE` varchar(1000) DEFAULT NULL COMMENT '	월평균소득 유형	',
  `CAR_FLAG` varchar(1) DEFAULT NULL COMMENT '	자동차소유 구분	',
  `ETC1_FLAG` varchar(1) DEFAULT NULL COMMENT '	추가항목1구분	',
  `ETC2_FLAG` varchar(1) DEFAULT NULL COMMENT '	추가항목2구분	',
  `ETC3_FLAG` varchar(1) DEFAULT NULL COMMENT '	추가항목3구분	',
  `ETC4_FLAG` varchar(1) DEFAULT NULL COMMENT '	추가항목4구분	',
  `ETC5_FLAG` varchar(1) DEFAULT NULL COMMENT '	추가항목5구분	',
  `ETC1_NAME` varchar(100) DEFAULT NULL COMMENT '	추가항목 이름	',
  `ETC1_TYPE` varchar(10) DEFAULT NULL COMMENT '	추가항목 Type	',
  `ETC1_SIZE` int(11) DEFAULT NULL COMMENT '	추가항목 Size	',
  `ETC1_COUNT` int(11) DEFAULT NULL COMMENT '	추가항목의 세부항목 개수	',
  `ETC1_DESC` varchar(1000) DEFAULT NULL,
  `ETC2_NAME` varchar(100) DEFAULT NULL COMMENT '	추가항목 이름	',
  `ETC2_TYPE` varchar(10) DEFAULT NULL COMMENT '	추가항목 Type	',
  `ETC2_SIZE` int(11) DEFAULT NULL COMMENT '	추가항목 Size	',
  `ETC2_COUNT` int(11) DEFAULT NULL COMMENT '	추가항목의 세부항목 개수	',
  `ETC2_DESC` varchar(1000) DEFAULT NULL,
  `ETC3_NAME` varchar(100) DEFAULT NULL COMMENT '	추가항목 이름	',
  `ETC3_TYPE` varchar(10) DEFAULT NULL COMMENT '	추가항목 Type	',
  `ETC3_SIZE` int(11) DEFAULT NULL COMMENT '	추가항목 Size	',
  `ETC3_COUNT` int(11) DEFAULT NULL COMMENT '	추가항목의 세부항목 개수	',
  `ETC3_DESC` varchar(1000) DEFAULT NULL,
  `ETC4_NAME` varchar(100) DEFAULT NULL COMMENT '	추가항목 이름	',
  `ETC4_TYPE` varchar(10) DEFAULT NULL COMMENT '	추가항목 Type	',
  `ETC4_SIZE` int(11) DEFAULT NULL COMMENT '	추가항목 Size	',
  `ETC4_COUNT` int(11) DEFAULT NULL COMMENT '	추가항목의 세부항목 개수	',
  `ETC4_DESC` varchar(1000) DEFAULT NULL,
  `ETC5_NAME` varchar(100) DEFAULT NULL COMMENT '	추가항목 이름	',
  `ETC5_TYPE` varchar(10) DEFAULT NULL COMMENT '	추가항목 Type	',
  `ETC5_SIZE` int(11) DEFAULT NULL COMMENT '	추가항목 Size	',
  `ETC5_COUNT` int(11) DEFAULT NULL COMMENT '	추가항목의 세부항목 개수	',
  `ETC5_DESC` varchar(1000) DEFAULT NULL,
  `MEMREG_URL` varchar(100) DEFAULT NULL,
  `MEMINFO_URL` varchar(100) DEFAULT NULL,
  `MEMLOGIN_URL` varchar(100) DEFAULT NULL,
  `MEMFIND_URL` varchar(100) DEFAULT NULL,
  `MEMLOGOUT_URL` varchar(100) DEFAULT NULL,
  `MEMLOGIN_IMG` varchar(100) DEFAULT NULL,
  `MEMLOGOUT_IMG` varchar(100) DEFAULT NULL,
  `MEMREG_IMG` varchar(100) DEFAULT NULL,
  `MEMMYPAGE_IMG` varchar(100) DEFAULT NULL,
  `MEM_MAIL_YN` char(1) DEFAULT 'Y',
  `MEM_SKIN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SITE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	관리자 그룹별 메뉴 권한 적용 테이블	';

-- Dumping data for table ts_0002.ts_member_setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_member_setting` DISABLE KEYS */;
INSERT INTO `ts_member_setting` (`SITE_SEQ`, `NAVER_API`, `NAVER_KEY`, `GOOGLE_API`, `GOOGLE_KEY`, `KAKAO_API`, `KAKAO_KEY`, `FACEBOOK_API`, `FACEBOOK_KEY`, `ID_FLAG`, `PASSWORD_FLAG`, `NAME_FLAG`, `EMAIL_FLAG`, `JUMIN_FLAG`, `ADDR_FLAG`, `PHONE_FLAG`, `MOBILETEL_FLAG`, `COMPHONE_FLAG`, `FAX_FLAG`, `OFFICE_NAME_FLAG`, `OFFICE_NUM_FLAG`, `OFFICE_OB_NUM_FLAG`, `OFFICE_B_TYPE_FLAG`, `OFFICE_BC_TYPE_FLAG`, `OFFICE_TAX_MAIL_FLAG`, `OFFICE_ADDR_FLAG`, `OFFICE_OWNER_NAME_FLAG`, `OFFICE_OWNER_TEL_FLAG`, `OFFICE_STAFF_NAME_FLAG`, `OFFICE_STAFF_TEL_FLAG`, `RECOMMEND_FLAG`, `EMAILRECEIVE_FLAG`, `SMSRECEIVE_FLAG`, `NICKNAME_FLAG`, `ICON_FLAG`, `PHOTO_FLAG`, `HOMEPAGE_FLAG`, `BIRTHDAY_FLAG`, `JOB_FLAG`, `JOB_TYPE`, `INTEREST_FLAG`, `INTEREST_TYPE`, `HOBBY_FLAG`, `EDUCATION_FLAG`, `EDUCATION_TYPE`, `SELFINTRO_FLAG`, `MARRIAGE_FLAG`, `MARRIAGEDATE_FLAG`, `INCOME_FLAG`, `INCOME_TYPE`, `CAR_FLAG`, `ETC1_FLAG`, `ETC2_FLAG`, `ETC3_FLAG`, `ETC4_FLAG`, `ETC5_FLAG`, `ETC1_NAME`, `ETC1_TYPE`, `ETC1_SIZE`, `ETC1_COUNT`, `ETC1_DESC`, `ETC2_NAME`, `ETC2_TYPE`, `ETC2_SIZE`, `ETC2_COUNT`, `ETC2_DESC`, `ETC3_NAME`, `ETC3_TYPE`, `ETC3_SIZE`, `ETC3_COUNT`, `ETC3_DESC`, `ETC4_NAME`, `ETC4_TYPE`, `ETC4_SIZE`, `ETC4_COUNT`, `ETC4_DESC`, `ETC5_NAME`, `ETC5_TYPE`, `ETC5_SIZE`, `ETC5_COUNT`, `ETC5_DESC`, `MEMREG_URL`, `MEMINFO_URL`, `MEMLOGIN_URL`, `MEMFIND_URL`, `MEMLOGOUT_URL`, `MEMLOGIN_IMG`, `MEMLOGOUT_IMG`, `MEMREG_IMG`, `MEMMYPAGE_IMG`, `MEM_MAIL_YN`, `MEM_SKIN`) VALUES
	(1, '1', 'C1u5os6o4bKHECMY78fF', '1', '543421548837-qvqn1d39nggpgguqk13h0csf6a4cgrm1.apps.googleusercontent.com', '1', '611a73d0255f4e5455c14160306351fa', '1', '357068818393225', '1', '1', '1', '1', '2', '2', '2', '1', '1', '2', '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2', '1', '2', '2', '1', '2', '1', '2', 'job,test', '1', 'interest,play, rteaw, Coeme on,1', '1', '1', 'edu', '1', '1', '1', '1', 'income', '1', '1', '1', '1', '1', '1', 'нас ', 'textarea', 200, 1, 'desc1', 'он сар өдөр ', 'dtimepick', 0, 1, 'desc2', 'овог', 'checkbox', 300, 3, 'test1,test2,test3', '4', 'email', 0, 1, 'desc4', '5', 'mobileno', 0, 1, 'desc5', '/test', '/test1', '/test2', '/test3', '/test4', '/img1', '/img2', '/img3', '/img4', 'Y', 'memberBasic');
/*!40000 ALTER TABLE `ts_member_setting` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_menu
DROP TABLE IF EXISTS `ts_menu`;
CREATE TABLE IF NOT EXISTS `ts_menu` (
  `MENU_ID` varchar(6) NOT NULL COMMENT '	메뉴 ID	',
  `MENU_LEVEL` smallint(6) DEFAULT NULL COMMENT '	메뉴 LEVEL	',
  `PARENT_ID` varchar(6) DEFAULT NULL COMMENT '	부모 메뉴의 ID	',
  `MENU_NAME` varchar(50) DEFAULT NULL COMMENT '	메뉴명	',
  `MENU_TABLE` varchar(30) DEFAULT NULL COMMENT '	메뉴에서 사용하는 테이블	',
  `FOLDER_PATH` varchar(50) DEFAULT NULL COMMENT '	메뉴의 경로	',
  `SORT_NUM` varchar(50) DEFAULT NULL COMMENT '	순서	',
  `USE_FLAG` char(1) NOT NULL COMMENT '	사용유무(U: 사용, S:미사용, D:삭제)	',
  `REG_USER` varchar(20) NOT NULL COMMENT '	등록자ID	',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '	수정자ID	',
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '	수정일	',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	관리자 페이지 메뉴를 구성. FOLDERPATH, FILENAME 등은 JAVA의 특성에 맞춰서 변경.	';

-- Dumping data for table ts_0002.ts_menu: ~70 rows (approximately)
/*!40000 ALTER TABLE `ts_menu` DISABLE KEYS */;
INSERT INTO `ts_menu` (`MENU_ID`, `MENU_LEVEL`, `PARENT_ID`, `MENU_NAME`, `MENU_TABLE`, `FOLDER_PATH`, `SORT_NUM`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	('060000', 1, '', '게시판관리', 'зарлалын самбар тохиргоо ', '/board/manage/board_list', '5', 'U', 'tago', '2018-10-23 10:51:03', 'tago', '2018-11-28 18:07:09'),
	('060100', 2, '060000', '게시판 관리', 'Level 2', '/board/manage/board_list', '5.1', 'U', 'tago', '2018-10-24 12:56:24', 'tago', '2018-12-13 15:08:25'),
	('060101', 3, '060100', '게시판 관리', 'Level 3', '/board/manage/board_list', '5.1.1', 'U', 'tago', '2018-10-24 13:40:55', 'tago', '2018-12-13 15:08:25'),
	('060102', 3, '060100', '게시물 통합관리', 'Level 3', '/board/manage/article_list', '5.1.2', 'U', 'tago', '2018-10-24 13:41:26', 'tago', '2018-12-13 15:08:25'),
	('060103', 3, '060100', '코멘트 통합관리', 'Level 3', '/board/manage/comment_list', '5.1.5', 'U', 'tago', '2018-10-24 13:42:03', 'tago', '2018-12-13 15:08:25'),
	('060104', 3, '060100', '게시판 통계', 'Level 3', '/board/manage/board_statistics', '5.1.5', 'U', 'tago', '2018-10-24 13:42:36', 'tago', '2018-12-13 15:08:25'),
	('061400', 2, '060000', '간편 상담', '', '/board/quick_list', '5.2', 'U', 'tago', '2018-11-29 12:29:07', 'tago', '2018-12-13 15:08:25'),
	('061434', 3, '061400', '간편 상담', '', '/board/quick_list', '5.2.1', 'U', 'tago', '2018-11-29 12:30:39', 'tago', '2018-12-13 15:08:25'),
	('070000', 1, '', '회원관리', ' гишүүнчлэл тохиргоо', '/member/manage/member_list', '3', 'U', 'tago', '2018-10-23 10:51:29', 'tago', '2018-11-29 15:58:18'),
	('070100', 2, '070000', '회원 관리', 'Level 2', '/member/manage/member_list', '3.1', 'U', 'tago', '2018-10-24 12:57:27', 'tago', '2018-11-27 11:43:24'),
	('070101', 3, '070100', '회원 관리', 'Level 3', '/member/manage/member_list', '3.1.1', 'U', 'tago', '2018-10-24 13:52:12', 'tago', '2018-11-29 16:01:51'),
	('070102', 3, '070100', '회원등급 관리', 'Level 3', '/member/manage/grade_list', '3.1.2', 'U', 'tago', '2018-10-24 13:52:47', 'tago', '2018-11-27 11:43:24'),
	('070103', 3, '070100', '탈퇴 회원', 'level 3', '/member/manage/withdrawal_list', '3.1.3', 'U', 'tago', '2018-10-24 13:53:32', 'tago', '2018-11-27 11:43:24'),
	('070104', 3, '070100', '이메일 설정', 'Level 3', '/member/manage/mail_list', '3.1.5', 'U', 'tago', '2018-10-24 13:54:34', 'tago', '2018-11-27 11:43:24'),
	('070107', 3, '070100', '단체 메일 발송', 'Level 3', '/member/manage/mailer_test', '3.1.3', 'U', 'tago', '2018-10-24 13:57:05', 'tago', '2018-11-27 11:43:24'),
	('070700', 2, '070000', 'ded menu', '', '', '4.2', 'D', 'tago', '2018-11-23 12:35:58', 'tago', '2018-11-26 16:26:41'),
	('070717', 3, '070700', 'this is test', '', '/sadasd', '4.2.1', 'D', 'tago', '2018-11-23 16:45:50', 'tago', '2018-11-26 16:27:20'),
	('080000', 1, '', '폼메일관리', 'form mail тохиргоо', '/formmail/manage/list', '6', 'U', 'tago', '2018-10-23 10:52:06', 'tago', '2018-11-27 11:52:56'),
	('080100', 2, '080000', '폼메일 관리', 'Level 2', '/formmail/manage/list', '6.1', 'U', 'tago', '2018-10-24 12:58:02', 'tago', '2018-11-25 12:05:04'),
	('080101', 3, '080100', '폼메일관리', 'Level 3', '/formmail/manage/list', '6.1.1', 'U', 'tago', '2018-10-24 13:58:05', 'tago', '2018-11-25 12:05:14'),
	('080113', 3, '080100', '폼메일생성', 'Level 3', '/formmail/manage/formmail_list', '6.1.2', 'U', 'tago', '2018-11-20 11:53:47', NULL, '2018-11-25 12:05:22'),
	('090000', 1, '', '배너관리', 'Pop up banner тохиргоо', '/banner/manage/banner_list', '7', 'U', 'tago', '2018-10-23 10:52:32', 'tago', '2018-11-25 12:00:06'),
	('090100', 2, '090000', '배너 관리', 'Level 2', '/banner/manage/banner_list', '7.1', 'U', 'tago', '2018-10-24 12:59:12', 'tago', '2018-11-25 12:05:33'),
	('090101', 3, '090100', '배너 관리', 'Level 3', '/banner/manage/banner_list', '7.1.1', 'U', 'tago', '2018-10-24 14:02:37', 'tago', '2018-11-25 12:05:41'),
	('100000', 1, '', '통계관리', 'Statistics', '/stat/manage/stat_list', '8', 'U', 'tago', '2018-10-23 10:52:55', 'tago', '2018-12-13 14:45:13'),
	('100100', 2, '100000', '접속통계', 'Level 2', '/stat/manage/stat_user', '8.1', 'U', 'tago', '2018-10-24 13:00:31', 'tago', '2018-12-13 14:45:13'),
	('100101', 3, '100100', '접속자 분석', 'Level 3', '/stat/manage/stat_user', '8.1.2', 'U', 'tago', '2018-10-24 14:04:20', 'tago', '2018-12-13 14:45:13'),
	('100102', 3, '100100', '접속경로 분석', 'Level 3', '/stat/manage/stat_path', '8.1.1', 'U', 'tago', '2018-10-24 14:04:51', 'tago', '2018-12-13 14:45:13'),
	('100103', 3, '100100', '검색 키워드 분석', 'Level 3', '/stat/manage/stat_keyword', '8.1.4', 'U', 'tago', '2018-10-24 14:05:14', 'tago', '2018-12-13 15:07:18'),
	('100104', 3, '100100', 'OS/브라우저', 'Level 3', '/stat/manage/stat_operator', '8.1.3', 'U', 'tago', '2018-10-24 14:05:53', 'tago', '2018-12-13 15:07:18'),
	('110000', 1, '', '페이지관리', 'Page Config', '/page/page_list', '4', 'U', 'tago', '2018-11-20 09:38:14', 'tago', '2018-11-28 18:07:09'),
	('110500', 2, '110000', '페이지 관리', 'Level 2', '/page/page_list', '4.1', 'U', 'tago', '2018-11-20 12:16:31', NULL, '2018-11-28 18:07:09'),
	('110514', 3, '110500', '페이지관리', 'Level 3', '/page/page_list', '4.1.1', 'U', 'tago', '2018-11-20 12:17:08', NULL, '2018-11-28 18:07:09'),
	('120000', 1, '', '상품관리', 'Product', '/prd/manage/list', '9', 'U', 'tago', '2018-11-20 10:18:03', 'tago', '2018-12-13 14:45:18'),
	('120600', 2, '120000', '상품 관리', 'Level 2', '/prd/manage/list', '9.1', 'U', 'tago', '2018-11-20 12:19:01', 'tago', '2018-12-13 14:45:18'),
	('120615', 3, '120600', '상품 관리', 'Level 3', '/prd/manage/prd_list', '9.1.1', 'S', 'tago', '2018-11-20 12:20:10', 'tago', '2018-12-13 14:45:18'),
	('120616', 3, '120600', '카테고리 관리', 'Level 3', '/prd/manage/list', '9.1.2', 'U', 'tago', '2018-11-20 12:21:03', 'tago', '2018-12-13 14:45:18'),
	('130000', 1, '', '기본설정', 'basic settings', '/base/basic/site_info', '2', 'U', 'tago', '2018-11-20 10:32:16', 'tago', '2018-11-25 17:50:42'),
	('130400', 2, '130000', '기본설정', 'Level 2', '/base/basic/site_info', '2.1', 'U', 'tago', '2018-11-20 11:25:59', 'tago', '2018-11-25 17:50:42'),
	('130408', 3, '130400', '사이트 정보', 'Level 3', '/base/basic/site_info', '2.1.1', 'U', 'tago', '2018-11-20 11:29:56', NULL, '2018-11-25 17:50:42'),
	('130409', 3, '130400', '관리자 설정', 'Level 3', '/base/basic/admin_list', '2.1.2', 'U', 'tago', '2018-11-20 11:30:42', NULL, '2018-11-25 17:50:42'),
	('130410', 3, '130400', '관리자권한 그룹', 'Level 3', '/base/basic/grade_list', '2.1.3', 'U', 'tago', '2018-11-20 11:31:47', NULL, '2018-11-25 17:50:42'),
	('130411', 3, '130400', '팝업 관리', 'Level 3', '/base/basic/popup_list', '2.1.4', 'U', 'tago', '2018-11-20 11:32:19', NULL, '2018-11-25 17:50:42'),
	('130412', 3, '130400', '가입약관 및 개인정보 보호정책', 'Level 3', '/base/basic/policies/list', '2.1.5', 'U', 'tago', '2018-11-20 11:33:02', NULL, '2018-11-25 17:50:42'),
	('140000', 1, '', '환경설정', 'level 1', '/config/basic/sys_config', '1', 'U', 'tago', '2018-11-26 16:46:10', 'tago', '2018-11-30 17:39:48'),
	('140700', 2, '140000', '기본설정', 'Level 2', '/config/basic/sys_config', '1.1', 'U', 'tago', '2018-11-26 16:48:55', NULL, '2018-11-27 10:57:13'),
	('140717', 3, '140700', '기본설정', 'level 3', '/config/basic/sys_config', '1.1.1', 'U', 'tago', '2018-11-26 16:49:29', NULL, '2018-11-27 10:57:13'),
	('140718', 3, '140700', '로그분석', 'level 3', '/config/basic/log', '1.1.2', 'U', 'tago', '2018-11-26 16:51:18', NULL, '2018-11-27 10:57:13'),
	('140719', 3, '140700', '팝업관리', 'level 3', '/config/basic/popup', '1.1.3', 'U', 'tago', '2018-11-26 16:52:01', NULL, '2018-11-27 10:57:13'),
	('140720', 3, '140700', '폼메일', 'level 3', '/config/basic/form', '1.1.4', 'U', 'tago', '2018-11-26 16:52:30', NULL, '2018-11-27 10:57:13'),
	('140721', 3, '140700', '배너관리', '', '/config/basic/banner', '1.1.5', 'U', 'tago', '2018-11-26 16:52:56', 'tago', '2018-11-27 10:57:13'),
	('140722', 3, '140700', '페이지관리', '', '/config/basic/page', '1.1.6', 'U', 'tago', '2018-11-26 16:55:19', 'tago', '2018-11-27 11:03:00'),
	('140723', 3, '140700', '페이지 접근권한', '', '/config/basic/auth_page', '1.1.7', 'U', 'tago', '2018-11-26 16:59:17', NULL, '2018-11-27 10:57:13'),
	('140736', 3, '140700', 'undsen tohirgoo', '', '', '1.1.8', 'D', 'tago', '2018-11-27 11:08:19', 'tago', '2018-11-27 11:09:23'),
	('140800', 2, '140000', '게시판', '', '/config/board/manage', '1.2', 'U', 'tago', '2018-11-26 17:03:40', NULL, '2018-11-27 10:57:12'),
	('140824', 3, '140800', '게시판', '', '/config/board/manage', '1.2.1', 'U', 'tago', '2018-11-26 17:04:40', NULL, '2018-11-27 10:57:12'),
	('140825', 3, '140800', '메인게시물', '', '/config/board/main_manage', '1.2.2', 'U', 'tago', '2018-11-26 17:05:21', NULL, '2018-11-27 10:57:12'),
	('140900', 2, '140000', '상품 관리', '', '/config/prd/manage', '1.3', 'U', 'tago', '2018-11-26 17:05:53', NULL, NULL),
	('140926', 3, '140900', '상품 리스트', '', '/config/prd/manage', '1.3.1', 'U', 'tago', '2018-11-26 17:06:23', NULL, NULL),
	('140927', 3, '140900', '메인 &amp; 추천 상품', '', '/config/prd/main_manage', '1.3.2', 'U', 'tago', '2018-11-26 17:06:58', NULL, NULL),
	('141000', 2, '140000', '회원관리', '', '/config/member/manage', '1.4', 'U', 'tago', '2018-11-26 17:08:16', NULL, NULL),
	('141028', 3, '141000', 'SNS설정', '', '/config/member/sns', '1.4.2', 'U', 'tago', '2018-11-26 17:09:32', NULL, '2018-11-26 17:10:34'),
	('141029', 3, '141000', '회원가입설정', '', '/config/member/manage', '1.4.1', 'U', 'tago', '2018-11-26 17:10:24', NULL, '2018-11-26 17:10:34'),
	('141100', 2, '140000', 'API관리', '', '/config/siteapi/api', '1.5', 'U', 'tago', '2018-11-26 17:11:35', NULL, NULL),
	('141130', 3, '141100', 'API관리', '', '/config/siteapi/api', '1.5.1', 'U', 'tago', '2018-11-26 17:12:00', 'tago', '2018-11-26 17:12:07'),
	('141200', 2, '140000', '포인트관리', '', '/config/point/manage', '1.6', 'U', 'tago', '2018-11-26 17:12:41', NULL, NULL),
	('141231', 3, '141200', '포인트관리', '', '/config/point/manage', '1.6.1', 'U', 'tago', '2018-11-26 17:13:09', NULL, NULL),
	('141300', 2, '140000', 'SEO관리', '', '/config/sitemeta/list', '1.7', 'U', 'tago', '2018-11-26 17:14:09', NULL, NULL),
	('141332', 3, '141300', 'SEO관리', '', '/config/sitemeta/list', '1.7.1', 'U', 'tago', '2018-11-26 17:14:31', NULL, NULL),
	('141333', 3, '141300', '그룹관리', '', '/config/commgroup/list', '1.7.2', 'U', 'tago', '2018-11-26 17:15:23', NULL, NULL),
	('150000', 1, '', 'test1', 'test1', '/test1', '10', 'D', 'tago', '2018-12-27 19:34:02', 'tago', '2018-12-27 19:34:19');
/*!40000 ALTER TABLE `ts_menu` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_menu_autho
DROP TABLE IF EXISTS `ts_menu_autho`;
CREATE TABLE IF NOT EXISTS `ts_menu_autho` (
  `MENU_AUTHO_GROUP_IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '관리자 권한 그룹 테이블 순번',
  `GROUP_ID` int(11) NOT NULL COMMENT '메뉴 테이블의 그룹 ID',
  `MENU_ID` char(6) NOT NULL COMMENT '메뉴ID',
  `AUTHO_LIST` char(1) DEFAULT NULL COMMENT '리스트 조회권한',
  `AUTHO_VIEW` char(1) NOT NULL COMMENT '조회권한',
  `AUTHO_WRITE` char(1) NOT NULL COMMENT '작성권한',
  `AUTHO_MODIFY` char(1) NOT NULL COMMENT '수정권한',
  `AUTHO_DELETE` char(1) NOT NULL COMMENT '삭제권한',
  PRIMARY KEY (`MENU_AUTHO_GROUP_IDX`,`GROUP_ID`,`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='관리자 그룹별 메뉴 권한 적용 테이블	';

-- Dumping data for table ts_0002.ts_menu_autho: ~123 rows (approximately)
/*!40000 ALTER TABLE `ts_menu_autho` DISABLE KEYS */;
INSERT INTO `ts_menu_autho` (`MENU_AUTHO_GROUP_IDX`, `GROUP_ID`, `MENU_ID`, `AUTHO_LIST`, `AUTHO_VIEW`, `AUTHO_WRITE`, `AUTHO_MODIFY`, `AUTHO_DELETE`) VALUES
	(76, 5, '060000', '1', '1', '1', '1', '1'),
	(77, 5, '060100', '1', '1', '1', '1', '1'),
	(78, 5, '060101', '1', '1', '1', '1', '1'),
	(79, 5, '060102', '1', '1', '1', '1', '1'),
	(80, 5, '060103', '1', '1', '1', '1', '1'),
	(81, 5, '060104', '1', '1', '1', '1', '1'),
	(82, 6, '070000', '1', '1', '0', '0', '0'),
	(83, 7, '060000', '1', '1', '1', '1', '1'),
	(84, 7, '060100', '1', '1', '1', '1', '1'),
	(85, 7, '060101', '1', '1', '1', '1', '1'),
	(86, 7, '060102', '1', '1', '1', '1', '1'),
	(87, 7, '060103', '1', '1', '1', '1', '1'),
	(88, 7, '060104', '1', '1', '1', '1', '1'),
	(89, 7, '070000', '1', '1', '1', '1', '1'),
	(90, 7, '070100', '1', '1', '1', '1', '1'),
	(91, 7, '070101', '1', '1', '1', '1', '1'),
	(92, 7, '070102', '1', '1', '1', '1', '1'),
	(93, 7, '070103', '1', '1', '1', '1', '1'),
	(94, 7, '070104', '1', '1', '1', '1', '1'),
	(95, 7, '070107', '1', '1', '1', '1', '1'),
	(96, 7, '070800', '1', '1', '1', '1', '1'),
	(97, 7, '080000', '1', '1', '1', '1', '1'),
	(98, 7, '080100', '1', '1', '1', '1', '1'),
	(99, 7, '080101', '1', '1', '1', '1', '1'),
	(100, 7, '080113', '1', '1', '1', '1', '1'),
	(101, 7, '090000', '1', '1', '1', '1', '1'),
	(102, 7, '090100', '1', '1', '1', '1', '1'),
	(103, 7, '090101', '1', '1', '1', '1', '1'),
	(104, 7, '100000', '1', '1', '1', '1', '1'),
	(105, 7, '100100', '1', '1', '1', '1', '1'),
	(106, 7, '100101', '1', '1', '1', '1', '1'),
	(107, 7, '100102', '1', '1', '1', '1', '1'),
	(108, 7, '100103', '1', '1', '1', '1', '1'),
	(109, 7, '100104', '1', '1', '1', '1', '1'),
	(110, 7, '110000', '1', '1', '1', '1', '1'),
	(111, 7, '110500', '1', '1', '1', '1', '1'),
	(112, 7, '110514', '1', '1', '1', '1', '1'),
	(113, 7, '120000', '1', '1', '1', '1', '1'),
	(114, 7, '120600', '1', '1', '1', '1', '1'),
	(115, 7, '120615', '1', '1', '1', '1', '1'),
	(116, 7, '120616', '1', '1', '1', '1', '1'),
	(117, 7, '130000', '1', '1', '1', '1', '1'),
	(118, 7, '130400', '1', '1', '1', '1', '1'),
	(119, 7, '130408', '1', '1', '1', '1', '1'),
	(120, 7, '130409', '1', '1', '1', '1', '1'),
	(121, 7, '130410', '1', '1', '1', '1', '1'),
	(122, 7, '130411', '1', '1', '1', '1', '1'),
	(123, 7, '130412', '1', '1', '1', '1', '1'),
	(124, 7, '140000', '1', '1', '1', '1', '1'),
	(125, 7, '140700', '1', '1', '1', '1', '1'),
	(126, 6, '060000', '1', '1', '1', '1', '1'),
	(127, 6, '141300', '1', '1', '1', '1', '1'),
	(128, 6, '141332', '1', '1', '1', '1', '1'),
	(129, 6, '141333', '1', '1', '1', '1', '1'),
	(130, 6, '150000', '1', '1', '1', '1', '1'),
	(131, 8, '060000', '1', '1', '1', '1', '1'),
	(132, 8, '060100', '1', '1', '1', '1', '1'),
	(133, 8, '060101', '1', '1', '1', '1', '1'),
	(134, 8, '060102', '1', '1', '1', '1', '1'),
	(135, 8, '060103', '1', '1', '1', '1', '1'),
	(136, 8, '060104', '1', '1', '1', '1', '1'),
	(137, 8, '061400', '1', '1', '1', '1', '1'),
	(138, 8, '061434', '1', '1', '1', '1', '1'),
	(139, 8, '070000', '1', '1', '1', '1', '1'),
	(140, 8, '070100', '1', '1', '1', '1', '1'),
	(141, 8, '070101', '1', '1', '1', '1', '1'),
	(142, 8, '070102', '1', '1', '1', '1', '1'),
	(143, 8, '070103', '1', '1', '1', '1', '1'),
	(144, 8, '070104', '1', '1', '1', '1', '1'),
	(145, 8, '070107', '1', '1', '1', '1', '1'),
	(146, 8, '080000', '1', '1', '1', '1', '1'),
	(147, 8, '080100', '1', '1', '1', '1', '1'),
	(148, 8, '080101', '1', '1', '1', '1', '1'),
	(149, 8, '080113', '1', '1', '1', '1', '1'),
	(150, 8, '090000', '1', '1', '1', '1', '1'),
	(151, 8, '090100', '1', '1', '1', '1', '1'),
	(152, 8, '090101', '1', '1', '1', '1', '1'),
	(153, 8, '100000', '1', '1', '1', '1', '1'),
	(154, 8, '100100', '1', '1', '1', '1', '1'),
	(155, 8, '100101', '1', '1', '1', '1', '1'),
	(156, 8, '100102', '1', '1', '1', '1', '1'),
	(157, 8, '100103', '1', '1', '1', '1', '1'),
	(158, 8, '100104', '1', '1', '1', '1', '1'),
	(159, 8, '110000', '1', '1', '1', '1', '1'),
	(160, 8, '110500', '1', '1', '1', '1', '1'),
	(161, 8, '110514', '1', '1', '1', '1', '1'),
	(162, 8, '120000', '1', '1', '1', '1', '1'),
	(163, 8, '120600', '1', '1', '1', '1', '1'),
	(164, 8, '120615', '1', '1', '1', '1', '1'),
	(165, 8, '120616', '1', '1', '1', '1', '1'),
	(166, 8, '130000', '1', '1', '1', '1', '1'),
	(167, 8, '130400', '1', '1', '1', '1', '1'),
	(168, 8, '130408', '1', '1', '1', '1', '1'),
	(169, 8, '130409', '1', '1', '1', '1', '1'),
	(170, 8, '130410', '1', '1', '1', '1', '1'),
	(171, 8, '130411', '1', '1', '1', '1', '1'),
	(172, 8, '130412', '1', '1', '1', '1', '1'),
	(173, 8, '140000', '1', '1', '1', '1', '1'),
	(174, 8, '140700', '1', '1', '1', '1', '1'),
	(175, 8, '140717', '1', '1', '1', '1', '1'),
	(176, 8, '140718', '1', '1', '1', '1', '1'),
	(177, 8, '140719', '1', '1', '1', '1', '1'),
	(178, 8, '140720', '1', '1', '1', '1', '1'),
	(179, 8, '140721', '1', '1', '1', '1', '1'),
	(180, 8, '140722', '1', '1', '1', '1', '1'),
	(181, 8, '140723', '1', '1', '1', '1', '1'),
	(182, 8, '140800', '1', '1', '1', '1', '1'),
	(183, 8, '140824', '1', '1', '1', '1', '1'),
	(184, 8, '140825', '1', '1', '1', '1', '1'),
	(185, 8, '140900', '1', '1', '1', '1', '1'),
	(186, 8, '140926', '1', '1', '1', '1', '1'),
	(187, 8, '140927', '1', '1', '1', '1', '1'),
	(188, 8, '141000', '1', '1', '1', '1', '1'),
	(189, 8, '141028', '1', '1', '1', '1', '1'),
	(190, 8, '141029', '1', '1', '1', '1', '1'),
	(191, 8, '141100', '1', '1', '1', '1', '1'),
	(192, 8, '141130', '1', '1', '1', '1', '1'),
	(193, 8, '141200', '1', '1', '1', '1', '1'),
	(194, 8, '141231', '1', '1', '1', '1', '1'),
	(195, 8, '141300', '1', '1', '1', '1', '1'),
	(196, 8, '141332', '1', '1', '1', '1', '1'),
	(197, 8, '141333', '1', '1', '1', '1', '1'),
	(198, 8, '150000', '1', '1', '1', '1', '1');
/*!40000 ALTER TABLE `ts_menu_autho` ENABLE KEYS */;

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

-- Dumping structure for table ts_0002.ts_page
DROP TABLE IF EXISTS `ts_page`;
CREATE TABLE IF NOT EXISTS `ts_page` (
  `PAGE_SEQ` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '페이지 순번',
  `PAGE_CODE` varchar(24) DEFAULT NULL COMMENT '페이지 코드',
  `PAGE_NAME` varchar(200) NOT NULL COMMENT '페이지 이름',
  `PAGE_GROUP_SEQ` int(11) DEFAULT NULL COMMENT '페이지 그룹 순번',
  `PRIORITY` int(11) NOT NULL DEFAULT 0 COMMENT '페이지 그룹 [우선순위]',
  `PAGE_URL` varchar(320) DEFAULT NULL COMMENT '페이지 URL',
  `PAGE_GRADE` smallint(6) NOT NULL DEFAULT 0 COMMENT '페이지 등급',
  `PAGE_BODY` mediumtext DEFAULT NULL COMMENT '페이지 내용',
  `REG_USER` varchar(24) NOT NULL COMMENT '등록자',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  PRIMARY KEY (`PAGE_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='페이지 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_page: ~12 rows (approximately)
/*!40000 ALTER TABLE `ts_page` DISABLE KEYS */;
INSERT INTO `ts_page` (`PAGE_SEQ`, `PAGE_CODE`, `PAGE_NAME`, `PAGE_GROUP_SEQ`, `PRIORITY`, `PAGE_URL`, `PAGE_GRADE`, `PAGE_BODY`, `REG_USER`, `REG_DATE`) VALUES
	(13, NULL, '견적안내', 0, 1, '/pages/consulting.jsp', 0, '<div class="web_top1">\r\n<p class="mT7"><img src="/images/web_top_txt1.png" title="타고플러스의 홈페이지 상품안내입니다." /></p>\r\n\r\n<p class="sub_top_ex">(주)타고플러스는 클라이언트의 소중한 의견에 귀를 기울여 기업의 이미지와 이념에 맞춘<br />\r\n만족할 만한 홈페이지를 제작하여 드리겠습니다.</p>\r\n</div>\r\n<script>\r\nfunction tabchk(num) {\r\n  if(num == "01"){\r\n  tab01.style.display="";tab02.style.display="none";tab03.style.display="none";tab04.style.display="none";\r\n  }\r\n\r\n  if(num == "02"){\r\n  tab01.style.display="none";tab02.style.display="";tab03.style.display="none";tab04.style.display="none";\r\n  }\r\n  \r\n  if(num == "03"){\r\n  tab01.style.display="none";tab02.style.display="none";tab03.style.display="";tab04.style.display="none";\r\n  }\r\n  \r\n  if(num == "04"){\r\n  tab01.style.display="none";tab02.style.display="none";tab03.style.display="none";tab04.style.display="";\r\n  }\r\n\r\n }\r\n </script>\r\n\r\n<div class="mT40" id="tab01" style="display:block;">\r\n<ul class="nor_tab">\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(01)") --><a class="on">기본형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(02)") --><a>중급형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(03)") --><a>고급형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(04)") --><a class="right_line">맞춤형</a></li>\r\n</ul>\r\n\r\n<div class="inner2 mT40">\r\n<p class="fleft web_sb"><span class="sb">기본형</span><span class="price">150만원</span><span class="vat">(VAT별도)</span></p>\r\n\r\n<p class="fright"><a class="btn_est" href="/pages/customer/estimate.jsp"><span>견적문의</span></a></p>\r\n</div>\r\n\r\n<ul class="web_part_ex mT15">\r\n	<li class="red bold">최소의 경비로 회사의 홍보성 홈페이지를 만들고자 하시는 분에게 추천합니다.</li>\r\n	<li>2주 이내의 짧은 기간 동안에 신속히 제작하여 오픈해 드립니다.</li>\r\n	<li>하단의 샘플 사이트맵을 참고하여 홈페이지에 각 메뉴에 해당하는 내용들을 준비하여 업무당당자에게 주시면 됩니다.</li>\r\n</ul>\r\n\r\n<div class="stit mT40">제작사양 안내</div>\r\n\r\n<div class="he22 f13">메인페이지 디자인 : 1페이지<br />\r\n서브페이지 디자인 : 10페이지 내외<br />\r\n게시판 : 공지사항 및 온라인문의, 갤러리 제공 3개 내외<br />\r\n관리자 모드 : 관리자 관리, 게시판 관리, 관리자 메뉴 권한 관리</div>\r\n<!---\r\n				\r\n				&lt;div class="stit mT40"&gt;포트폴리오&lt;/div&gt;\r\n				&lt;ul class="web_port"&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li class="last"&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n				&lt;/ul&gt;\r\n--->\r\n\r\n<div class="stit mT40">컨설팅 내역</div>\r\n\r\n<div class="he22 f13">홈페이지 구축부터 운영 및 기간 &middot; 단체별 마케팅 전략수립 및 마스터플랜 작성<br />\r\n경쟁사 분석 및 벤치마킹을 통해 성공적인 사이트 운영방안 제시<br />\r\n홈페이지 사업계획을 구체적으로 구현 &middot; 유지 &middot; 발전시키는 전략수립<br />\r\n홈페이지의 고객 접근 경로 분석 및 설계<br />\r\nOn/Off-Line의 효과적인 연계방안 제시 및 전략수립<br />\r\n홈페이지 광고비, 시스템 유지비, 인건비 등의 자금소요 예측 지원</div>\r\n\r\n<div class="stit mT40">페이지 구성</div>\r\n\r\n<div class="acen"><img src="/images/web_form1.gif" /></div>\r\n</div>\r\n<!-- 기본형 -->\r\n\r\n<div class="mT40" id="tab02" style="display:none;">\r\n<ul class="nor_tab">\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(01)") --><a>기본형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(02)") --><a class="on">중급형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(03)") --><a>고급형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(04)") --><a class="right_line">맞춤형</a></li>\r\n</ul>\r\n\r\n<div class="inner2 mT40">\r\n<p class="fleft web_sb"><span class="sb">중급형</span><span class="price">250만원 ~ 300만원</span><span class="vat">(VAT별도)</span></p>\r\n\r\n<p class="fright"><a class="btn_est" href="/pages/customer/estimate.jsp"><span>견적문의</span></a></p>\r\n</div>\r\n\r\n<ul class="web_part_ex mT15">\r\n	<li class="red bold">15~30페이지 이내로 회사 및 귀사의 제품을 소개하는 용도로 적합합니다.</li>\r\n	<li>3주 이내의 제작기간안에 신속하게 제작하여 드리며, 저렴한 제작 비용을 원하시는 고객분께 추천합니다.</li>\r\n	<li>하단의 샘플 사이트맵을 참고하여 홈페이지에 각 메뉴에 해당하는 내용들을 준비하여 업무당당자에게 주시면 됩니다.</li>\r\n</ul>\r\n\r\n<div class="stit mT40">제작사양 안내</div>\r\n\r\n<div class="he22 f13">메인페이지 디자인 : 1페이지<br />\r\n서브페이지 디자인 : 15~30페이지 내외<br />\r\n게시판 : 공지사항 및 온라인문의, 갤러리 제공 3개 내외<br />\r\n관리자 모드 : 관리자 관리, 게시판 관리, 관리자 메뉴 권한 관리</div>\r\n<!----\r\n				\r\n				&lt;div class="stit mT40"&gt;포트폴리오&lt;/div&gt;\r\n				&lt;ul class="web_port"&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li class="last"&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n				&lt;/ul&gt;\r\n\r\n----->\r\n\r\n<div class="stit mT40">컨설팅 내역</div>\r\n\r\n<div class="he22 f13">홈페이지 구축부터 운영 및 기간 &middot; 단체별 마케팅 전략수립 및 마스터플랜 작성<br />\r\n경쟁사 분석 및 벤치마킹을 통해 성공적인 사이트 운영방안 제시<br />\r\n홈페이지 사업계획을 구체적으로 구현 &middot; 유지 &middot; 발전시키는 전략수립<br />\r\n홈페이지의 고객 접근 경로 분석 및 설계<br />\r\nOn/Off-Line의 효과적인 연계방안 제시 및 전략수립<br />\r\n홈페이지 광고비, 시스템 유지비, 인건비 등의 자금소요 예측 지원</div>\r\n\r\n<div class="stit mT40">페이지 구성</div>\r\n\r\n<div class="acen"><img src="/images/web_form2.gif" /></div>\r\n</div>\r\n<!-- 중급형 -->\r\n\r\n<div class="mT40" id="tab03" style="display:none;">\r\n<ul class="nor_tab">\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(01)") --><a>기본형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(02)") --><a>중급형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(03)") --><a class="on">고급형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(04)") --><a class="right_line">맞춤형</a></li>\r\n</ul>\r\n\r\n<div class="inner2 mT40">\r\n<p class="fleft web_sb"><span class="sb">고급형</span><span class="price">300만원 ~ 500만원</span><span class="vat">(VAT별도)</span></p>\r\n\r\n<p class="fright"><a class="btn_est" href="/customer/estimate.asp?EType=W&amp;PType=003"><span>견적문의</span></a></p>\r\n</div>\r\n\r\n<ul class="web_part_ex mT15">\r\n	<li class="red bold">30~50페이지 이내의 홍보 사이트 및 제품소개하는 사이트에 적합합니다.</li>\r\n	<li>4~5주 이내의 제작기간이 소요되며 고급스러운 퀄리를 원하시는 고객분께 추천합니다.</li>\r\n	<li>하단의 샘플 사이트맵을 참고하여 홈페이지에 각 메뉴에 해당하는 내용들을 준비하여 업무당당자에게 주시면 됩니다.</li>\r\n</ul>\r\n\r\n<div class="stit mT40">제작사양 안내</div>\r\n\r\n<div class="he22 f13">메인페이지 디자인 : 시안2페이지<br />\r\n서브페이지 디자인 : 30~50페이지 내외<br />\r\n게시판 : 공지사항 및 온라인문의, 갤러리 제공 등 20개 내외<br />\r\n관리자 모드 : 관리자 관리, 게시판 관리, 관리자 메뉴 권한 관리, 회원관리, 접속통계, 온라인 견적 및 문의 관리 등</div>\r\n<!---				\r\n				&lt;div class="stit mT40"&gt;포트폴리오&lt;/div&gt;\r\n				&lt;ul class="web_port"&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li class="last"&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n				&lt;/ul&gt;\r\n--->\r\n\r\n<div class="stit mT40">컨설팅 내역</div>\r\n\r\n<div class="he22 f13">홈페이지 구축부터 운영 및 기간 &middot; 단체별 마케팅 전략수립 및 마스터플랜 작성<br />\r\n경쟁사 분석 및 벤치마킹을 통해 성공적인 사이트 운영방안 제시<br />\r\n홈페이지 사업계획을 구체적으로 구현 &middot; 유지 &middot; 발전시키는 전략수립<br />\r\n홈페이지의 고객 접근 경로 분석 및 설계<br />\r\nOn/Off-Line의 효과적인 연계방안 제시 및 전략수립<br />\r\n홈페이지 광고비, 시스템 유지비, 인건비 등의 자금소요 예측 지원</div>\r\n\r\n<div class="stit mT40">페이지 구성</div>\r\n\r\n<div class="acen"><img src="/images/web_form3.gif" /></div>\r\n</div>\r\n<!-- 고급형 -->\r\n\r\n<div class="mT40" id="tab04" style="display:none;">\r\n<ul class="nor_tab">\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(01)") --><a>기본형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(02)") --><a>중급형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(03)") --><a>고급형</a></li>\r\n	<li style="width:160px;"><!-- Not Allowed Attribute Filtered ( href="javascript:tabchk(04)") --><a class="on">맞춤형</a></li>\r\n</ul>\r\n\r\n<div class="inner2 mT40">\r\n<p class="fleft web_sb"><span class="sb">맞춤형</span><span class="price">별도문의</span></p>\r\n\r\n<p class="fright"><a class="btn_est" href="/pages/customer/estimate.jsp"><span>견적문의</span></a></p>\r\n</div>\r\n\r\n<ul class="web_part_ex mT15">\r\n	<li class="red bold">30~50페이지 이내의 홍보 사이트 및 제품소개하는 사이트에 적합합니다.</li>\r\n	<li>4~5주 이내의 제작기간이 소요되며 고급스러운 퀄리를 원하시는 고객분께 추천합니다.</li>\r\n	<li>하단의 샘플 사이트맵을 참고하여 홈페이지에 각 메뉴에 해당하는 내용들을 준비하여 업무당당자에게 주시면 됩니다.</li>\r\n</ul>\r\n\r\n<div class="stit mT40">제작사양 안내</div>\r\n\r\n<div class="he22 f13">메인페이지 디자인 : 시안2페이지<br />\r\n서브페이지 디자인 : 30~50페이지 내외<br />\r\n게시판 : 공지사항 및 온라인문의, 갤러리 제공 등 20개 내외<br />\r\n관리자 모드 : 관리자 관리, 게시판 관리, 관리자 메뉴 권한 관리, 회원관리, 접속통계, 온라인 견적 및 문의 관리 등</div>\r\n<!---\r\n				\r\n				&lt;div class="stit mT40"&gt;포트폴리오&lt;/div&gt;\r\n				&lt;ul class="web_port"&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n					&lt;li class="last"&gt;&lt;p class="ph"&gt;&lt;img src="/images/sample1.jpg" /&gt;&lt;/p&gt;\r\n						&lt;p class="sb"&gt;샘플사이트&lt;/p&gt;&lt;/li&gt;\r\n				&lt;/ul&gt;\r\n--->\r\n\r\n<div class="stit mT40">컨설팅 내역</div>\r\n\r\n<div class="he22 f13">홈페이지 구축부터 운영 및 기간 &middot; 단체별 마케팅 전략수립 및 마스터플랜 작성<br />\r\n경쟁사 분석 및 벤치마킹을 통해 성공적인 사이트 운영방안 제시<br />\r\n홈페이지 사업계획을 구체적으로 구현 &middot; 유지 &middot; 발전시키는 전략수립<br />\r\n홈페이지의 고객 접근 경로 분석 및 설계<br />\r\nOn/Off-Line의 효과적인 연계방안 제시 및 전략수립<br />\r\n홈페이지 광고비, 시스템 유지비, 인건비 등의 자금소요 예측 지원</div>\r\n\r\n<div class="stit mT40">페이지 구성</div>\r\n\r\n<div class="acen"><img src="/images/web_form3.gif" /></div>\r\n</div>\r\n<!-- 고급형 -->\r\n\r\n<div class="stit mT40">제작절차</div>\r\n\r\n<div><img src="/images/web_process.gif" /></div>\r\n\r\n<div class="stit mT40">사이트를 만들기전에 고객님께서 준비해야 할 사항</div>\r\n\r\n<ul class="web_ready">\r\n	<li>\r\n	<p class="sb">1. 도메인 선택 (사이트의 주소)</p>\r\n\r\n	<p class="ex">도메인이란 www.tagoplus.co.kr 과 같은 인터넷상의 주소 입니다. 인터넷이란 넓은 바다에서 찾아 갈 수 있도록 하는 유일한 주소로 IP주소를 영문으로 쉽게 표현한 것이 도메인(사이트) 주소 입니다. 제작하실 홈페이지를 가장 잘 표현할 수 있는 단어를 활용하여 이름을 지어보세요.</p>\r\n	</li>\r\n	<li>\r\n	<p class="sb">2. 홈페이지 제작목적</p>\r\n\r\n	<p class="ex">홈페이지를 제작 하시려는 목적이 무엇인지. 제작할 홈페이지의 주요 방문자 및 홈페이지의 용도 (단순 회사 홍보용 또는 기능 위주인 온라인 서비스, 쇼핑몰)등 제작 의도를 정리하여 보세요.</p>\r\n	</li>\r\n	<li>\r\n	<p class="sb">3. 벤치마킹</p>\r\n\r\n	<p class="ex">회사 업종 혹은 디자인적, 기능적으로 고객님게서 관심있게 보신 사이트를 알려주시면 제작시 도움이 됩니다.</p>\r\n	</li>\r\n	<li>\r\n	<p class="sb">4. 사이트맵</p>\r\n\r\n	<p class="ex">홈페이지 제작시 고객님의 사이트에 맞게 기획을 합니다.<br />\r\n	기획이 어려우실 경우 (주)타고플러스는 고객님과 함께 홈페이지 기획을 도와드립니다.</p>\r\n	</li>\r\n	<li>\r\n	<p class="sb">5. 프로그램 기능정리</p>\r\n\r\n	<p class="ex">웹프로그램은 일반적으로 관리자 모드와 DB를 구축하여 일반이 글 및 자료를 업로드 할 수 있도록 프로그램을 구축하는 것을 말합니다. 게시판(게시판, 자료실, 질문과 답변 등)과 갤러리(갤러리. 동영상), 상담문의, 제품관리, 회원관리 등이 있으며 특수한 목적의 프로그램을 필요로 하는 경우도 있습니다.</p>\r\n	</li>\r\n	<li>\r\n	<p class="sb">6. 자료준비 ( 문서 &amp; 이미지요약 )</p>\r\n\r\n	<p class="ex">홈페이지를 구성하는 자료(회사소개 및 각 메뉴별 내용, 이미지 등)들을 준비하여 통합관리 시스템에 자료를 올려주세요.</p>\r\n	</li>\r\n</ul>\r\n', 'tago', '2018-11-14 17:47:10'),
	(14, NULL, '웹/앱 제작', 5, 1, '/pages/app/app1.jsp', 0, '<div class="app_top1">\r\n<p class="mT7"><img src="/images/app_top_txt1.png" title="타고플러스 모바일 홈페이지 제작입니다." /></p>\r\n\r\n<p class="sub_top_ex">스마트폰 5000만대 시대! 이제 모바일은 선택이 아니라 필수입니다.<br />\r\n내 업체를 브랜딩하고 모바일이라는 보다 넓고 빠른 신세계로 당신을 안내합니댜.</p>\r\n</div>\r\n\r\n<div class="app_top_ex mT40">타고플러스가 제공하는 모바일 홈페이지는?</div>\r\n\r\n<div class="inner2 mT20">\r\n<ul class="app_char">\r\n	<li>\r\n	<div class="app_img app_img1">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb mT35">모든 기종에 최적화</p>\r\n\r\n	<p class="ex">아이폰, 안드로이드 등 모든 환경에 맞춘<br />\r\n	모바일 웹 표준과 시스템으로 어떠한 기종에도<br />\r\n	최적화된 화면 재기능을 할 수 있는<br />\r\n	모바일 웹 제작</p>\r\n	</div>\r\n	</li>\r\n	<li style="background:#f8f8f8; border-left:1px solid #CACACA; ">\r\n	<div class="app_img app_img2">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb mT45">게시판 연동</p>\r\n\r\n	<p class="ex">공지사항, Q&amp;A, 갤러리 등 홈페이지와 연동하여<br />\r\n	모바일웹에 노출 제어 (홈페이지 및 모바일 신규<br />\r\n	통합신청에 한함)</p>\r\n	</div>\r\n	</li>\r\n	<li style="background:#f8f8f8;">\r\n	<div class="app_img app_img3">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb mT55">SNS 연동</p>\r\n\r\n	<p class="ex">페이스북, 카카오톡, 트위터 등 SNS 연동을<br />\r\n	통하여 기업홍보 및 마케팅 가능</p>\r\n	</div>\r\n	</li>\r\n	<li style="border-left:1px solid #CACACA; ">\r\n	<div class="app_img app_img4">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb mT55">앱과 연동</p>\r\n\r\n	<p class="ex">많은 장점을 가진 앱과 완벽하게 연동된<br />\r\n	모바일 홈페이지</p>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="app_img app_img5">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb mT55">빠른 정보전달</p>\r\n\r\n	<p class="ex">많은 정보 보다 주요 정보를 전달하며,<br />\r\n	장소에 구애받지 않으며 빠른 정보의 전달</p>\r\n	</div>\r\n	</li>\r\n	<li style="background:#f8f8f8; border-left:1px solid #CACACA; ">\r\n	<div class="app_img app_img6">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb mT55">바로 전화연결</p>\r\n\r\n	<p class="ex">모바일 웹에서 전화번호를 누르지 않고<br />\r\n	클릭 한번으로 전화 연결 가능</p>\r\n	</div>\r\n	</li>\r\n	<li style="background:#f8f8f8;">\r\n	<div class="app_img app_img7">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb mT45">QR 코드 발급</p>\r\n\r\n	<p class="ex">웹사이트, 명함, 전단지, 카달로그, 기념품 등<br />\r\n	어디서든 스마트폰으로 비추기만 하면<br />\r\n	모바일 홈페이지로 이동이 가능</p>\r\n	</div>\r\n	</li>\r\n	<li style="border-left:1px solid #CACACA; ">\r\n	<div class="app_img app_img8">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb mT55">지도 API</p>\r\n\r\n	<p class="ex">네이버, 다음의 지도 API를 연동하여<br />\r\n	매장위치, 대중교통 정보 경로탐색 등이 가능</p>\r\n	</div>\r\n	</li>\r\n</ul>\r\n</div>\r\n', 'tago', '2018-11-14 17:45:56'),
	(15, NULL, '맞춤 앱 개발', 5, 1, '/pages/app/app2.jsp', 0, '<div class="app_top1">\r\n<p class="mT7"><img src="/images/app_top_txt2.png" title="타고플러스 맞춤 앱 개발입니다." /></p>\r\n\r\n<p class="sub_top_ex">스마트폰 5000만 시대! 이제 모바일은 선택이 아니라 필수입니다.<br />\r\n내 업체를 브랜딩하고 모바일이라는 보다 넓고 빠른 신세계로 당신을 안내합니댜.</p>\r\n</div>\r\n\r\n<div class="mT60 acen"><img src="/images/app_img1.png" /></div>\r\n\r\n<div class="app_deve mT60">\r\n<div class="con1">\r\n<p class="sb sb1">강력한 부가기능</p>\r\n\r\n<p class="ex">스마트폰 푸쉬 알림, 위치기반 서비스,<br />\r\n카메라 등 다양한 기능 및 센서를 활용합니다.</p>\r\n</div>\r\n\r\n<div class="con2">\r\n<p class="sb sb2">다양한 서비스</p>\r\n\r\n<p class="ex">게시판, 쇼핑몰, 소셜서비스, 갤러리 지도 등<br />\r\n다양한 모바일 서비스를 연동 할 수 있습니다.</p>\r\n</div>\r\n\r\n<div class="con3">\r\n<p class="sb sb3">아이폰 및 안드로이드 앱</p>\r\n\r\n<p class="ex">다양한 모바일서비스를 연동해 아이폰 및<br />\r\n안드로이드 APP으로 출시합니다.</p>\r\n</div>\r\n</div>\r\n', 'tago', '2018-11-14 17:44:47'),
	(17, NULL, '온라인 광고 검색', 4, 1, '/pages/addition/online_ad.jsp', 0, '<script>\r\nfunction tabchk(num) {\r\n  if(num == "01"){\r\n  tab01.style.display="";tab02.style.display="none";\r\n  }\r\n\r\n  if(num == "02"){\r\n  tab01.style.display="none";tab02.style.display="";\r\n  }\r\n\r\n }\r\n </script>\r\n			<div id="tab01" style="display:block;">\r\n				<ul class="nor_tab">\r\n					<li style="width:165px;"><a href="javascript:tabchk(01)" class="on">오버추어</a></li>\r\n					<li style="width:165px;"><a href="javascript:tabchk(02)" class="right_line">구글</a></li>\r\n				</ul>\r\n				<div class="add_online_top1">\r\n					<p class="mT7"><img src="/images/add_top_txt2.png" title="오버추어 광고검색"/></p>\r\n					<p class="sub_top_ex"><b>네이버, 야휴, 네이트 등 국내포털 사이트</b>의 검색결과시 첫페이지 상단에 노출시키는 <br />\r\n	광고방식으로 가장 많이 사용하시는 광고 효과중 하나입니다.</p>\r\n				</div>\r\n				<div class="inner2 mT40">\r\n					<p class="stit fleft">파트너 네트워크</p><p class="stit_ex">국내 주요 포털  사이트 통합 검색 페이지 동시 노출</p>\r\n				</div>\r\n				<div class="mT20"><img src="/images/add_online_img1.png" /></div>\r\n				<div class="inner mT20">\r\n					<p class="stit fleft">노출화면</p><p class="stit_ex">국내 주요 포털  사이트 최상위 검색페이지 노출</p>\r\n				</div>\r\n				<ul class="adver">\r\n					<li><p class="sb">네이버 검색결과</p>\r\n						<p class="adver_img"><img src="/images/adver_img1.gif" /></p></li>\r\n					<li><p class="sb">네이트 검색결과</p>\r\n						<p class="adver_img"><img src="/images/adver_img2.gif" /></p></li>\r\n					<li><p class="sb">야후 검색결과</p>\r\n						<p class="adver_img"><img src="/images/adver_img3.gif" /></p></li>\r\n					<li class="last"><p class="sb">MSN 검색결과</p>\r\n						<p class="adver_img"><img src="/images/adver_img4.gif" /></p></li>\r\n				</ul>\r\n				<div class="stit mT40">회원등급별 가격</div>\r\n				<table class="cons_list">\r\n					<colgroup>	\r\n						<col width="200px"><col width="340px"><col width="*">\r\n					</colgroup>\r\n					<thead>\r\n						<tr>\r\n							<th></th><th>MEDIA INFO</th><th>AD INFO</th>\r\n						</tr>\r\n					</thead>\r\n					<tbody>\r\n						<tr>\r\n							<td>매 체</td>\r\n							<td>Overture</td>\r\n							<td rowspan="5"  class="line_none">오버추어 파트너사인 네이버,엠파스<br />\r\n	야후. 네이트,파란등 검색 첫 페이지에 <br />\r\n	<스폰서링크>영역으로 동시노출</td>\r\n						</tr>\r\n						<tr>\r\n							<td>노출위치</td>\r\n							<td>오버추어 코리아 제휴메체/ 스펀서 링크</td>\r\n						</tr>\r\n						<tr>\r\n							<td>노출형태</td>\r\n							<td>텍스트 (제목: 15자/ 설명문구:45자)</td>\r\n						</tr>\r\n						<tr>\r\n							<td>광고비</td>\r\n							<td>클릭당 충전그에서 과금</td>\r\n						</tr>\r\n						<tr>\r\n							<td>기 간</td>\r\n							<td>충전금 소진시까지</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				<div class="inner2 mT40">\r\n					<p class="stit fleft">오버추어 신청절차</p><p class="stit_ex">오버추어를 사용 하실때 꼭 필요한 절차입니다.</p>\r\n				</div>\r\n				<ul class="adver_step">\r\n					<li>\r\n						<p><img src="/images/adver_step1.png" /></p>\r\n						<p class="num">01</p>\r\n						<p class="mT5">오버추어를 사용하시기 위해<br />신청서를 작성하셔야 합니다.</p>\r\n					</li>\r\n					<li>\r\n						<p><img src="/images/adver_step2.png" /></p>\r\n						<p class="num">02</p>\r\n						<p class="mT5">광고를 진행하기 위해<br />결제를 해주시면 됩니다.</p>\r\n					</li>\r\n					<li>\r\n						<p><img src="/images/adver_step3.png" /></p>\r\n						<p class="num">03</p>\r\n						<p class="mT5">클라이언트 요건에 맞는<br />키워드를 제안합니다.</p>\r\n					</li>\r\n					<li>\r\n						<p><img src="/images/adver_step4.png" /></p>\r\n						<p class="num">04</p>\r\n						<p class="mT5">세팅과 심사과정을<br />거칩니다.</p>\r\n					</li>\r\n					<li class="last">\r\n						<p><img src="/images/adver_step5.png" /></p>\r\n						<p class="num">05</p>\r\n						<p class="mT5">통과된 키워드의<br />광고를 개시합니다.</p>\r\n					</li>\r\n				</ul>\r\n			</div><!-- 오버추어 -->\r\n			<div id="tab02" style="display:none;">\r\n				<ul class="nor_tab">\r\n					<li style="width:165px;"><a href="javascript:tabchk(01)" >오버추어</a></li>\r\n					<li style="width:165px;"><a href="javascript:tabchk(02)" class="on right_line">구글</a></li>\r\n				</ul>\r\n				<div class="add_online_top2">\r\n					<p class="mT7"><img src="/images/add_top_txt3.png" title="구글 애드워즈"/></p>\r\n					<p class="sub_top_ex">신세계 인터넷 사용자의 88%에게 도달하고, 250개 국가 및 14개 언어로 광고를<br> 타켓팅 할 수 있으며,\r\n구글검색 파트너인 다음과 옥션, 인터파크 등 검색 첫 페이지에 함께<br />거재 할 수 있습니다.</p>\r\n				</div>\r\n				<div class="inner2 mT40">\r\n					<p class="stit fleft">파트너 네트워크</p><p class="stit_ex">국내 주요 포털  사이트 통합 검색 페이지 동시 노출</p>\r\n				</div>\r\n				<div class="mT20"><img src="/images/add_online_img1.png" /></div>\r\n				<div class="inner2 mT20">\r\n					<p class="stit fleft">노출화면</p><p class="stit_ex">국내 주요 포털  사이트 최상위 검색페이지 노출</p>\r\n				</div>\r\n				<ul class="adver">\r\n					<li><p class="sb">네이버 검색결과</p>\r\n						<p class="adver_img"><img src="/images/adver_img1.gif" /></p></li>\r\n					<li><p class="sb">네이트 검색결과</p>\r\n						<p class="adver_img"><img src="/images/adver_img2.gif" /></p></li>\r\n					<li><p class="sb">야후 검색결과</p>\r\n						<p class="adver_img"><img src="/images/adver_img3.gif" /></p></li>\r\n					<li class="last"><p class="sb">MSN 검색결과</p>\r\n						<p class="adver_img"><img src="/images/adver_img4.gif" /></p></li>\r\n				</ul>\r\n				<div class="stit mT40">회원등급별 가격</div>\r\n				<table class="cons_list">\r\n					<colgroup>	\r\n						<col width="200px"><col width="340px"><col width="*">\r\n					</colgroup>\r\n					<thead>\r\n						<tr>\r\n							<th></th><th>MEDIA INFO</th><th>AD INFO</th>\r\n						</tr>\r\n					</thead>\r\n					<tbody>\r\n						<tr>\r\n							<td>매 체</td>\r\n							<td>Daum,Google등</td>\r\n							<td rowspan="5"  class="line_none">구글검색 파트너인 다음,옥션,인터파크 등<br />\r\n검색 첫 페이지에 <스폰서링크>영역으로 동시노출</td>\r\n						</tr>\r\n						<tr>\r\n							<td>노출위치</td>\r\n							<td>Google Adwords</td>\r\n						</tr>\r\n						<tr>\r\n							<td>노출형태</td>\r\n							<td>텍스트 (제목: 15자/ 설명문구:45자)</td>\r\n						</tr>\r\n						<tr>\r\n							<td>광고비</td>\r\n							<td>클릭당 충전금에서 과금</td>\r\n						</tr>\r\n						<tr>\r\n							<td>기 간</td>\r\n							<td>충전금 소진시까지</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				<div class="inner2 mT40">\r\n					<p class="stit fleft">구글 애드워즈 신청절차</p><p class="stit_ex">구글 애드워즈광고를를 사용 하실때 꼭 필요한 절차입니다.</p>\r\n				</div>\r\n				<ul class="adver_step">\r\n					<li>\r\n						<p><img src="/images/adver_step1.png" /></p>\r\n						<p class="num">01</p>\r\n						<p class="mT5">구글 애드워즈를 사용하시기 위해<br />신청서를 작성하셔야 합니다.</p>\r\n					</li>\r\n					<li>\r\n						<p><img src="/images/adver_step2.png" /></p>\r\n						<p class="num">02</p>\r\n						<p class="mT5">광고를 진행하기 위해<br />결제를 해주시면 됩니다.</p>\r\n					</li>\r\n					<li>\r\n						<p><img src="/images/adver_step3.png" /></p>\r\n						<p class="num">03</p>\r\n						<p class="mT5">클라이언트 요건에 맞는<br />키워드를 제안합니다.</p>\r\n					</li>\r\n					<li>\r\n						<p><img src="/images/adver_step4.png" /></p>\r\n						<p class="num">04</p>\r\n						<p class="mT5">세팅과 심사과정을<br />거칩니다.</p>\r\n					</li>\r\n					<li class="last">\r\n						<p><img src="/images/adver_step5.png" /></p>\r\n						<p class="num">05</p>\r\n						<p class="mT5">통과된 키워드의<br />광고를 개시합니다.</p>\r\n					</li>\r\n				</ul>\r\n			</div><!-- 구글애즈워드 -->\r\n', 'tago', '2018-11-14 17:25:22'),
	(18, NULL, 'sms서비스', 4, 1, '/pages/addition/sms_service.jsp', 0, '<div class="add_sms_top">\r\n<p class="mT7"><img src="/images/add_top_txt1.png" title="TAGOSMS This is the strength!" /></p>\r\n\r\n<p class="sub_top_ex"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">New solution! </font><font style="vertical-align: inherit;">New program! </font></font><br />\r\n<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">We will take the lead in </font><font style="vertical-align: inherit;">creating new technology and high value </font><font style="vertical-align: inherit;">.</font></font></p>\r\n</div>\r\n\r\n<div class="stit mT40"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">TATO SMS Features</font></font></div>\r\n\r\n<div class="add_sms">\r\n<div class="txt1">\r\n<p class="sb1">Lowest price</p>\r\n\r\n<p class="ex"><br />\r\n<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Providing various services ranging from the </font><font style="vertical-align: inherit;">lowest- </font><font style="vertical-align: inherit;">priced </font><font style="vertical-align: inherit;">supply </font><font style="vertical-align: inherit;">short-lived, long, to MMS in </font><font style="vertical-align: inherit;">Korea</font></font></p>\r\n</div>\r\n\r\n<div class="txt2">\r\n<p class="sb2">Payment</p>\r\n\r\n<p class="ex"><br />\r\n<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Various payment system including </font><font style="vertical-align: inherit;">card, mobile phone, real-time account,</font></font></p>\r\n</div>\r\n\r\n<div class="txt3">\r\n<p class="sb1">Grasp</p>\r\n\r\n<p class="ex"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Real-time Shipment Checker </font></font><br />\r\n<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Manager Login Triple Security System</font></font></p>\r\n</div>\r\n</div>\r\n\r\n<div class="stit mT40"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Price by membership level</font></font></div>\r\n<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Go to =&gt; </font></font><a href="http://www.smsfax.co.kr" target="_blank"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">www.smsfax.co.kr</font></font></a>\r\n\r\n<table class="cons_list">\r\n	<tbody>\r\n	</tbody>\r\n</table>\r\n', 'tago', '2018-11-14 16:40:45'),
	(22, NULL, '회사개요', 6, 1, '/pages/company/intro.jsp', 0, '<div class="acen"><img src="/images/com_top_txt1.gif" title="인터넷 비즈니스의 파트너! 한발 앞서가는 타고플러스" /></div>\r\n\r\n<div class="sub_top_ex acen">(주)타고플러스는 웹기반의 각종 솔루션 및 어플리케이션 개발, 인터넷 마케팅, 그룹웨어 서비스에서 개발까지<br />\r\n인터넷상의 다양한 업무들을 수행하고 있습니다.</div>\r\n\r\n<ul class="intro">\r\n	<li class="intro1">\r\n	<div class="img">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb">자체적인 브랜드</p>\r\n\r\n	<p class="ex">타고플러스는 자체적인 브랜드 <span class="blue bold">BIZWIZ(Business+Wizard) 시리즈를 개발</span>하여 출시하고 있습니다.<br />\r\n	BIZWIZ GROUPWARE, BIZWIZ CALLCENTER, BIZWIZ SMS, BIZWIZ ARS 등을 개발하여 국내뿐만<br />\r\n	아니라 일본과 인도네시아 까지도 수출하여 그 기술력 및 성능을 인정받고 있습니다.</p>\r\n	</div>\r\n	</li>\r\n	<li class="intro2">\r\n	<div class="img">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb">웹표준, 웹접근성</p>\r\n\r\n	<p class="ex">기업의 얼굴이라고 할수도 있는 홈페이지 분야에서도 다년간의 경험으로 <span class="blue bold">모바일웹, 웹표준, 웹접근성</span> 등을<br />\r\n	이용한 많은 프로젝트를 수행한 바 있습니다. 저희 임직원들은 기업의 홈페이지를 제작해 주는 일을 의미있는<br />\r\n	작업이라 생각하며 항상 최선을 다하고 있습니다.</p>\r\n	</div>\r\n	</li>\r\n	<li class="intro3">\r\n	<div class="img">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb">웹기술의 선진화</p>\r\n\r\n	<p class="ex">향후 타고플러스에서는 21세기 기업간 경쟁력의 쟁점이 되고 있는 인터넷의 발전과 디지털 산업의 활성화를<br />\r\n	목적으로 인터넷 인프라 구상을 위한 전반적 시스템 수립에 박차를 가함으로써 신기술을 타기업보다 앞서<br />\r\n	진행을 하고 있습니다.<br />\r\n	이를 위해 해당분야의 우수기업들과의 전략적 제휴를 통해서 웹기술의 선진화에 앞장서고 있습니다.</p>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="img">&nbsp;</div>\r\n\r\n	<div class="cons" style="padding:0;">&nbsp;</div>\r\n	</li>\r\n</ul>\r\n\r\n<div class="intro_bo">타고플러스(他故+Plus)의 의미처럼 남들과는 다른 사고로 창조적이고 독창적으로 한발 더 나아가 IT사업의 주도적인 업체가 되기 위해서<br />\r\n최선을 다하고 앞으로도 노력하는 기업, 신뢰있는 기업이 되기 위해 열심히 뛰겠습니다.</div>\r\n\r\n<table class="board_write mT40">\r\n	<colgroup>\r\n		<col width="150px" />\r\n		<col width="*" />\r\n		<col width="150px" />\r\n		<col width="290px" />\r\n	</colgroup>\r\n	<tbody>\r\n		<tr>\r\n			<th>사업자등록번호</th>\r\n			<td>113-86-13483</td>\r\n			<th>통신판매신고번호</th>\r\n			<td>구로 제 2008-00086호</td>\r\n		</tr>\r\n		<tr>\r\n			<th>법인명</th>\r\n			<td>(주)타고플러스</td>\r\n			<th>대표이사</th>\r\n			<td>문양희</td>\r\n		</tr>\r\n		<tr>\r\n			<th>업 태</th>\r\n			<td>서비스업, 소매업</td>\r\n			<th>종 목</th>\r\n			<td>소프트웨어, 그룹웨어 등의 솔루션 개발 전자상거래</td>\r\n		</tr>\r\n		<tr>\r\n			<th>설립입</th>\r\n			<td colspan="3">2003년 11월 1일 아이티위즈 창업<br />\r\n			2007년 5월 8일 (주)타고플러스로 법인 전화</td>\r\n		</tr>\r\n		<tr>\r\n			<th>본점소재지</th>\r\n			<td colspan="3">서울시 금천구 가산동 327-32번지 대륭테크노타운 12차 703호</td>\r\n		</tr>\r\n		<tr>\r\n			<th>대표번호</th>\r\n			<td>02-1644-5805</td>\r\n			<th>팩스번호</th>\r\n			<td>02-6919-1793</td>\r\n		</tr>\r\n		<tr>\r\n			<th>대표메일</th>\r\n			<td colspan="3"><a href="">admin@tagoplus.co.kr</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'tago', '2018-11-14 18:57:04'),
	(23, NULL, '회사 연혁', 6, 1, '/pages/company/history.jsp', 0, '<div class="acen"><img src="/images/com_top_txt2.gif" title="타고플러스의 역사속에서 새로운 미래가 시작됩니다." /></div>\r\n\r\n<div class="sub_top_ex acen">(주)타고플러스는 TAGOPLUS 웹기반의 각종 솔루션 및 러플리케이션 개발, 인터넷 마케팅, 인터넷 관련<br />\r\n솔루션 개발까지 인터넷상의 여러가지 업무들을 수행하고 있습니다.</div>\r\n<script>\r\nfunction tabchk(num) {\r\n  if(num == "01"){\r\n  tab01.style.display="";tab02.style.display="none";tab03.style.display="none";\r\n  }\r\n\r\n  if(num == "02"){\r\n  tab01.style.display="none";tab02.style.display="";tab03.style.display="none";\r\n  }\r\n  \r\n  if(num == "03"){\r\n  tab01.style.display="none";tab02.style.display="none";tab03.style.display="";\r\n  }\r\n\r\n }\r\n </script>\r\n\r\n<div id="tab01" style="display:block;">\r\n<ul class="his_tab">\r\n	<li><a class="on" href="javascript:tabchk(01)">현재 ~ 2011</a></li>\r\n	<li><a href="javascript:tabchk(02)">2010 ~ 2006</a></li>\r\n	<li><a href="javascript:tabchk(03)">2005 ~ 2000</a></li>\r\n</ul>\r\n\r\n<ul class="history">\r\n	<li>\r\n	<div class="year">2015</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">02월</div>\r\n\r\n		<div class="cons">\r\n		<p>문자솔루션(SMS) 3.0버전 출시</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">01월</div>\r\n\r\n		<div class="cons">\r\n		<p>사단법인 한국웹에이전시연합회 임원사</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="year">2014</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">02월</div>\r\n\r\n		<div class="cons">\r\n		<p>점포 매매 부동산 솔루션 출시</p>\r\n\r\n		<p>경동 택배 / 합동택배 전국 통합 콜센타 개발 런칭 계약</p>\r\n\r\n		<p>인도네시아 그룹웨어 제휴 런칭</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">08월</div>\r\n\r\n		<div class="cons">\r\n		<p>문자 솔루션 2.0 버전 출시</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">11월</div>\r\n\r\n		<div class="cons">\r\n		<p>경동택배/합동택배 국제 특송 업무 프로그램 개발</p>\r\n\r\n		<p>국제 특송 TNT 연계 전산 시스템 개발</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="year">2013</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">02월</div>\r\n\r\n		<div class="cons">\r\n		<p>중고차 솔루션 출시(Bizwiz 중고차)</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">06월</div>\r\n\r\n		<div class="cons">\r\n		<p>트럭중고차 솔루션 출시(Bizwiz 트럭 중고차)</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="year">2012</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">01월</div>\r\n\r\n		<div class="cons">\r\n		<p>교세라도큐먼트솔루션스 홈페이지 계약</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="year">2011</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">11월</div>\r\n\r\n		<div class="cons">\r\n		<p>대만 현지 그룹웨어 서비스 런칭 계약</p>\r\n\r\n		<p>대만 대기업 인스리아 기업 파트너 계약</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">10월</div>\r\n\r\n		<div class="cons">\r\n		<p>이유앤 메디통 의료기관 포탈 그룹웨어 서비스 런칭계약</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n</ul>\r\n</div>\r\n<!-- 현재~ 2011 -->\r\n\r\n<div id="tab02" style="display:none;">\r\n<ul class="his_tab">\r\n	<li><a href="javascript:tabchk(01)">현재 ~ 2011</a></li>\r\n	<li><a class="on" href="javascript:tabchk(02)">2010 ~ 2006</a></li>\r\n	<li><a href="javascript:tabchk(03)">2005 ~ 2000</a></li>\r\n</ul>\r\n\r\n<ul class="history">\r\n	<li>\r\n	<div class="year">2010</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">01월</div>\r\n\r\n		<div class="cons">\r\n		<p>BizwizSMS Enterprise 버전 출시</p>\r\n\r\n		<p>KBS SMS통합시스템 구축</p>\r\n\r\n		<p>SK Broadband 제휴</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="year">2009</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">02월</div>\r\n\r\n		<div class="cons">\r\n		<p>BizwizSMS Standard 버전 출시</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">01월</div>\r\n\r\n		<div class="cons">\r\n		<p>BizwizARS 솔루션 출시</p>\r\n\r\n		<p>BizwizCallcenter 솔루션 출시</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="year">2008</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">02월</div>\r\n\r\n		<div class="cons">\r\n		<p>그룹웨어 솔루션 Bizwiz 1.0 개발 출시</p>\r\n\r\n		<p>이미지 공유사이트 Openimage 서비스 개편</p>\r\n\r\n		<p>Bizwiz 솔루션 일본내 IT중견 기업인 MKS 납품 및 업무제휴</p>\r\n\r\n		<p>(주)서원인텍 홈페이지 개편</p>\r\n\r\n		<p>그룹웨어 솔루션Bizwiz 2.0 개발 및 ASP서비스 출시</p>\r\n\r\n		<p>라파즈 코리아, 강원대학교, 청강문화산업대학 경영정보시스템 디자인</p>\r\n\r\n		<p>식약청 의약품 특허 인포매틱스 사이트 디자인</p>\r\n\r\n		<p>한국방송광고공사 광고 도서관 사이트 디자인</p>\r\n\r\n		<p>라파즈 Pan Asia ses/spa 시스템 개발</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="year">2007</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">02월</div>\r\n\r\n		<div class="cons">\r\n		<p>법인 전환</p>\r\n\r\n		<p>Sh공사 장기전세 아파트 온라인 청약 사이트- Shift 개발</p>\r\n\r\n		<p>㈜솔트웨어 소프트웨어 포탈 사이트 개발</p>\r\n\r\n		<p>대안학교 성미산 학교 홈페이지 개발</p>\r\n\r\n		<p>라파즈 코리아 업무 관리 프로그램 개발</p>\r\n\r\n		<p>라파즈 코리아 프로젝트 및 Report 관리 솔루션 개발</p>\r\n\r\n		<p>토지 전문 부동산 사이트 솔루션 개발</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="year">2006</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">02월</div>\r\n\r\n		<div class="cons">\r\n		<p>노무사 협회 외 다수 홈페이지 작업</p>\r\n\r\n		<p>노무사 협회 전략적 제휴</p>\r\n\r\n		<p>(주)서원인텍 홈페이지 개편</p>\r\n\r\n		<p>민백 초등학교 홈페이지</p>\r\n\r\n		<p>석수 초등학교 홈페이지</p>\r\n\r\n		<p>학현 초등학교 홈페이지</p>\r\n\r\n		<p>기업전문 여행사 크리오 투어 홈페이지 개발</p>\r\n\r\n		<p>노무법인 B&amp;K 홈페이지 개발</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n</ul>\r\n</div>\r\n<!-- 2010~2006 -->\r\n\r\n<div id="tab03" style="display:none;">\r\n<ul class="his_tab">\r\n	<li><a href="javascript:tabchk(01)">2011 ~ 현재</a></li>\r\n	<li><a href="javascript:tabchk(02)">2010 ~ 2006</a></li>\r\n	<li><a class="on" href="javascript:tabchk(03)">2005 ~ 2000</a></li>\r\n</ul>\r\n\r\n<ul class="history">\r\n	<li>\r\n	<div class="year">2005</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">02월</div>\r\n\r\n		<div class="cons">\r\n		<p>Openimage 자체 서비스 시작</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">01월</div>\r\n\r\n		<div class="cons">\r\n		<p>샵빌더 솔루션 개발, B2B 쇼핑몰</p>\r\n\r\n		<p>중고차 경매 사이트</p>\r\n\r\n		<p>학교 홈페이지 솔루션 개발(초,중,고)</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="year">2004</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<div class="month">12월</div>\r\n\r\n		<div class="cons">\r\n		<p>솔루션(스킨시스템 적용)</p>\r\n\r\n		<p>OpenImage - 자체서비스용 사이트 준비</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">10월</div>\r\n\r\n		<div class="cons">\r\n		<p>중개업소 V1.0 판매 - 부동산 중개업소용 홈페이지</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">09월</div>\r\n\r\n		<div class="cons">\r\n		<p>SoapSoap - 천연 비누 판매 쇼핑몰</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">08월</div>\r\n\r\n		<div class="cons">\r\n		<p>㈜서원인텍 - 회사 홍보 및 제품 홍보(다국어)</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">07월</div>\r\n\r\n		<div class="cons">\r\n		<p>㈜디지탈 퍼스트 - 회사 홍보 홈페이지 개발</p>\r\n\r\n		<p>㈜SKNT - 제품 홍보 및 대리점 관리 사이트 개발</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">06월</div>\r\n\r\n		<div class="cons">\r\n		<p>Bizppt - PT자료 거래 및 판매 사이트 개발</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">05월</div>\r\n\r\n		<div class="cons">\r\n		<p>경희 수 한의원 - 한의원 홍보 및 진료 예약프로그램 개발</p>\r\n\r\n		<p>퍼스트 오가닉 - 수입 유기농 전문 쇼핑몰 개발</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">04월</div>\r\n\r\n		<div class="cons">\r\n		<p>프로그램/홈페이지 개발</p>\r\n\r\n		<p>울산 갤러리존 - 건물 분양 및 공사진행 현황관리</p>\r\n\r\n		<p>㈜이지업 - 회계전문 솔루션 판매 / 고객 관리 사이트 개발</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">03월</div>\r\n\r\n		<div class="cons">\r\n		<p>차량 딜러 전용 솔루션 개발(CS버전)</p>\r\n\r\n		<p>㈜마리산 - 토지전문 부동산 중개업소 홈 개발</p>\r\n\r\n		<p>㈜미소파크 - 부동산 포탈 사이트 개발</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">02월</div>\r\n\r\n		<div class="cons">\r\n		<p>시네마타운 - 야외 극장 홈페이지(상영작 영화 관리)</p>\r\n\r\n		<p>㈜가비아와 전략적 제휴</p>\r\n\r\n		<p>언플러그마인드 - 이미지 판매 쇼핑몰 개발</p>\r\n\r\n		<p>㈜한성 물류 - 배차 시스템 및 물류 시스템 개발</p>\r\n		</div>\r\n		</dd>\r\n		<dd>\r\n		<div class="month">01월</div>\r\n\r\n		<div class="cons">\r\n		<p>㈜시스테크놀로지 - 홈페이지 및 전자 카다로그 개발</p>\r\n\r\n		<p>정우벤처타운 - 입주업체 관리 및 관리비 관리 시스템 개발</p>\r\n		</div>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n</ul>\r\n</div>\r\n<!-- 2005~2000 -->', 'tago', '2018-11-14 18:59:29'),
	(24, NULL, '사업분야', 6, 1, '/pages/company/business.jsp', 0, '<div class="acen"><img src="/images/com_top_txt3.gif" title="타고플러스의 다양한 사업분야를 알려드립니다." /></div>\r\n\r\n<div class="sub_top_ex acen">(주)타고플러스는 TAGOPLUS 웹기반의 각종 솔루션 및 러플리케이션 개발, 인터넷 마케팅, 인터넷 관련<br />\r\n솔루션 개발까지 인터넷상의 여러가지 업무들을 수행하고 있습니다.</div>\r\n\r\n<ul class="busi">\r\n	<li class="busi1">\r\n	<div class="img">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb"><span class="num">01</span><span>솔루션 개발</span></p>\r\n\r\n	<p class="ex">&nbsp;</p>\r\n\r\n	<dl>\r\n		<dd>Bizwiz Groupware 2.0 + Mobile Groupware</dd>\r\n		<dd>Bizwiz SMS</dd>\r\n		<dd>Bizwiz Callcenter</dd>\r\n		<dd>Bizwiz ARS</dd>\r\n		<dd>Bizwiz UMS (통합메시징 시스템)</dd>\r\n		<dd>Bizwiz EMS (대량메일 발송시스템)</dd>\r\n		<dd>부동산 중개업소 솔루션</dd>\r\n		<dd>중고차 포탈 솔루션</dd>\r\n	</dl>\r\n\r\n	<p>&nbsp;</p>\r\n	</div>\r\n	</li>\r\n	<li class="busi2">\r\n	<div class="img">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb"><span class="num">02</span><span>홈페이지 제작</span></p>\r\n\r\n	<p class="ex">&nbsp;</p>\r\n\r\n	<dl>\r\n		<dd>홈페이지 제작 및 사이트 기획</dd>\r\n		<dd>유지보수 서비스 제공</dd>\r\n		<dd>Web Consulting, UID Consulting</dd>\r\n		<dd>400여개 사이트의 홈페이지 제작경험</dd>\r\n		<dd>웹표준 및 웹접근성</dd>\r\n		<dd>Mobile Web 사이트 개발</dd>\r\n	</dl>\r\n\r\n	<p>&nbsp;</p>\r\n	</div>\r\n	</li>\r\n	<li class="busi3">\r\n	<div class="img">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb"><span class="num">03</span><span>자체 온라인 서비스</span></p>\r\n\r\n	<p class="ex"><span style="width:180px;">Bizwiz 그룹웨어 ASP 서비스<br />\r\n	이미지 공유 서비스<br />\r\n	SMS 서비스 사이트 </span> <span> : <a href="http://www.bizwiz.co.kr/ " target="_blank">www.bizwiz.co.kr</a><br />\r\n	: <a href="http://www.openimage.co.kr/" target="_blank">www.openimage.co.kr</a><br />\r\n	: <a href="http://www.smsfax.co.kr/" target="_blank">&quot;&gt;www.smsfax.co.kr</a></span></p>\r\n	</div>\r\n	</li>\r\n	<li class="busi4">\r\n	<div class="img">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb"><span class="num">04</span><span>웹/서버 호스팅</span></p>\r\n\r\n	<p class="ex">웹호스팅 서비스(메일, 호스팅)<br />\r\n	서버호스팅 사업(임대)</p>\r\n	</div>\r\n	</li>\r\n	<li class="busi5">\r\n	<div class="img">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<p class="sb"><span class="num">05</span><span>프로모션</span></p>\r\n\r\n	<p class="ex">검색엔진 등록<br />\r\n	웹프로모션<br />\r\n	마케팅</p>\r\n	</div>\r\n	</li>\r\n</ul>\r\n\r\n<div class="busi_bo">\r\n<p class="top_txt bold black">제작 및 개발 등 문의사항에 대해서는 <span class="blue">대표전화 1644-5805</span>로 전화주십시오. 자세히 상담해 드립니다.</p>\r\n\r\n<p class="mT10">밝고 건강한 대한민국의 꿈의 비젼을 가지고 끊임없이 노력하는 디자이너들과 개발자들이 있습니다.<br />\r\n타고플러스는 밝고 건강한 회사입니다. 믿고 맡기셔도 됩니다. 언제나 두 팔 벌려 여러분을 환영합니다.<br />\r\n밝고 건강한 타고플러스와 함께 하시겠습니까?</p>\r\n</div>\r\n', 'tago', '2018-11-14 19:07:38'),
	(25, NULL, '협력업체', 6, 1, '/pages/company/patner.jsp', 0, '<div class="acen"><img src="/images/com_top_txt4.gif" title="타고플러스와 함께하는 파트너입니다." /></div>\r\n\r\n<div class="sub_top_ex acen">저희 타고플러스는 고객과 함께 성장해 나가고 있습니다.</div>\r\n\r\n<ul class="partner">\r\n	<li>\r\n	<p class="part_logo"><a href="http://www.mks.jp/" target="_blank"><img src="/images/parter1.gif" /></a></p>\r\n\r\n	<p class="part_name"><a href="http://www.mks.jp/" target="_blank">MK 시스템</a></p>\r\n	</li>\r\n	<li>\r\n	<p class="part_logo"><a href="http://www.skbroadband.com/" target="_blank"><img src="/images/parter2.gif" /></a></p>\r\n\r\n	<p class="part_name"><a href="http://www.skbroadband.com/" target="_blank">SK broadband</a></p>\r\n	</li>\r\n	<li>\r\n	<p class="part_logo"><a href="http://www.kbs.co.kr/" target="_blank"><img src="/images/parter3.gif" /></a></p>\r\n\r\n	<p class="part_name"><a href="http://www.kbs.co.kr/">KBS</a></p>\r\n	</li>\r\n	<li>\r\n	<p class="part_logo"><a href="http://www.i-heart.co.kr/" target="_blank"><img src="/images/parter4.gif" /></a></p>\r\n\r\n	<p class="part_name"><a href="http://www.i-heart.co.kr/" target="_blank">아이하트</a></p>\r\n	</li>\r\n	<li>\r\n	<p class="part_logo"><a href="http://www.godo.co.kr/" target="_blank"><img src="/images/parter5.gif" /></a></p>\r\n\r\n	<p class="part_name"><a href="http://www.godo.co.kr/" target="_blank">고도몰</a></p>\r\n	</li>\r\n	<li>\r\n	<p class="part_logo"><a href="http://www.insrea.com.tw/" target="_blank"><img src="/images/parter6.gif" /></a></p>\r\n\r\n	<p class="part_name"><a href="http://www.insrea.com.tw/" target="_blank">인스리아</a></p>\r\n	</li>\r\n</ul>\r\n', 'tago', '2018-11-14 19:09:44'),
	(26, NULL, 'contact us', 0, 1, '/pages/company/contact_us.jsp', 0, '<div class="acen"><img src="/images/com_top_txt1.gif" title="인터넷 비즈니스의 파트너! 한발 앞서가는 타고플러스" /></div>\r\n\r\n<div class="sub_top_ex acen">(주)타고플러스는 웹기반의 각종 솔루션 및 어플리케이션 개발, 인터넷 마케팅, 인터넷 관련 솔루션 개발까지<br />\r\n인터넷상의 여러가지 업무들을 수행하고 있습니다.</div>\r\n\r\n<ul class="contact">\r\n	<li>\r\n	<div class="sb"><span class="num1">홈페이지제작</span></div>\r\n\r\n	<div class="btn">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<p class="part">전&nbsp;&nbsp;&nbsp;화</p>\r\n\r\n		<p class="ex blue bold f16">070-8244-5805</p>\r\n		</dd>\r\n		<dd>\r\n		<p class="part">이메일</p>\r\n\r\n		<p class="ex bold "><a href="mailto:admin@tagoplus.co.kr">admin@tagoplus.co.kr</a></p>\r\n		</dd>\r\n		<dd>\r\n		<p class="part">내&nbsp;&nbsp;&nbsp;용</p>\r\n\r\n		<p class="ex">홈페이지 제작<br />\r\n		모바일 홈페이지 제작<br />\r\n		쇼핑몰 개발 등</p>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="sb"><span class="num2">BIZWIZ 그룹웨어</span></div>\r\n\r\n	<div class="btn">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<p class="part">전&nbsp;&nbsp;&nbsp;화</p>\r\n\r\n		<p class="ex blue bold f16">070-8244-5807</p>\r\n		</dd>\r\n		<dd>\r\n		<p class="part">이메일</p>\r\n\r\n		<p class="ex bold "><a href="mailto:admin@tagoplus.co.kr">admin@tagoplus.co.kr</a></p>\r\n		</dd>\r\n		<dd>\r\n		<p class="part">내&nbsp;&nbsp;&nbsp;용</p>\r\n\r\n		<p class="ex">서비스 문의 및 상담<br />\r\n		독립형 솔루션 구매문의<br />\r\n		<a class="black bold" href="http://www.bizwiz.co.kr" target="_blank">www.biswiz.co.kr</a></p>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="sb"><span class="num3">솔루션</span></div>\r\n\r\n	<div class="btn">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<p class="part">전&nbsp;&nbsp;&nbsp;화</p>\r\n\r\n		<p class="ex blue bold f16">070-8244-5807</p>\r\n		</dd>\r\n		<dd>\r\n		<p class="part">이메일</p>\r\n\r\n		<p class="ex bold "><a href="mailto:admin@tagoplus.co.kr">admin@tagoplus.co.kr</a></p>\r\n		</dd>\r\n		<dd>\r\n		<p class="part">내&nbsp;&nbsp;&nbsp;용</p>\r\n\r\n		<p class="ex">솔루션 구매문의<br />\r\n		솔루션 구매 및 커스트 마이징 문의<br />\r\n		솔루션 개발 문의</p>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n	<li>\r\n	<div class="sb"><span class="num4">제 휴</span></div>\r\n\r\n	<div class="btn">&nbsp;</div>\r\n\r\n	<div class="cons">\r\n	<dl>\r\n		<dd>\r\n		<p class="part">전&nbsp;&nbsp;&nbsp;화</p>\r\n\r\n		<p class="ex blue bold f16">070-8244-5807</p>\r\n		</dd>\r\n		<dd>\r\n		<p class="part">이메일</p>\r\n\r\n		<p class="ex bold "><a href="mailto:admin@tagoplus.co.kr">admin@tagoplus.co.kr</a></p>\r\n		</dd>\r\n		<dd>\r\n		<p class="part">내&nbsp;&nbsp;&nbsp;용</p>\r\n\r\n		<p class="ex">리셀러 업체 등록 문의<br />\r\n		판매 제휴 문의<br />\r\n		개발 제휴 문의</p>\r\n		</dd>\r\n	</dl>\r\n	</div>\r\n	</li>\r\n</ul>\r\n', 'tago', '2018-11-14 19:10:43'),
	(27, NULL, '찾아오시는 길', 0, 1, '/pages/company/location.jsp', 0, '<script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=pVDVorwYQLsaTSDzjbSK"></script>\r\n<div class="acen"><img src="/images/com_top_txt1.gif" title="인터넷 비즈니스의 파트너! 한발 앞서가는 타고플러스" /></div>\r\n\r\n<div class="sub_top_ex acen">(주)타고플러스는 어느 누구에게도 부끄럽지 않게 성실히 묵묵하게 한길만을 걸어왔습니다.<br />\r\n미래를 힘차게 밝히는 기업 (주)타고플러스와 함께 여러분의 미래를 준비하십시오.</div>\r\n\r\n<div id="map" style="width:798px;height:400px;">&nbsp;</div>\r\n\r\n<div class="inner2 acen mT20 f14 bold">서울시 금천구 가산동 327-32번지 대륭테크노타운 12차 703호<span class="mL20">TEL: 1644-5805</span><span class="mL20">FAX: 02-6919-1793</span></div>\r\n\r\n<ul class="map">\r\n	<li class="subway">\r\n	<p class="bold f16 blue">대중교통 이용 시</p>\r\n\r\n	<p class="mT5">독산역 2번 출구에서 라이온스밸리 2차를 따라 우회전 후 400미터 직진하면 삼거리가 있습니다.<br />\r\n	삼거리에서 좌회전하여 횡단보도를 건너고 200미터 정도 이동하면 우측에 있는 대륭테크노타운12차가 있습니다.<br />\r\n	대륭테크노타운12차 703호로 올라오시면 됩니다.</p>\r\n	</li>\r\n</ul>\r\n<script>\r\n\r\nvar oPoint = new nhn.api.map.LatLng(37.4696023, 126.8841122);\r\n    oMap = new nhn.api.map.Map(\'map\', {\r\n        point: oPoint\r\n    });\r\n\r\n</script>', 'tago', '2018-11-14 19:11:37'),
	(29, NULL, '테스트', 0, 1, 'http://www.daum.net', 0, '', 'tago', '2018-11-16 19:55:40');
/*!40000 ALTER TABLE `ts_page` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_popup
DROP TABLE IF EXISTS `ts_popup`;
CREATE TABLE IF NOT EXISTS `ts_popup` (
  `POPUP_SEQ` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '팝업 순번',
  `SUBJECT` varchar(24) DEFAULT NULL COMMENT '제목',
  `BODY` mediumtext DEFAULT NULL COMMENT '내용',
  `LINK_URL` varchar(320) DEFAULT NULL COMMENT '링크 URL',
  `POSITION_X` smallint(6) NOT NULL DEFAULT 0 COMMENT '왼쪽 좌표',
  `POSITION_Y` smallint(6) NOT NULL DEFAULT 0 COMMENT '윗쪽 좌표',
  `HORIZONTAL_SIZE` smallint(6) NOT NULL DEFAULT 0 COMMENT '가로 크기',
  `VERTICAL_SIZE` smallint(6) NOT NULL DEFAULT 0 COMMENT '세로 크기',
  `START_DT` varchar(10) DEFAULT NULL COMMENT '시작일',
  `END_DT` varchar(10) DEFAULT NULL COMMENT '종료일',
  `USE_FLAG` varchar(1) NOT NULL COMMENT '사용 여부',
  `POPUP_TYPE` varchar(1) NOT NULL COMMENT '팝업 형태 [W:윈도우, L:layer]',
  `REG_USER` varchar(24) NOT NULL COMMENT '등록자',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `MOD_USER` varchar(24) DEFAULT NULL COMMENT '수정자',
  `MOD_DATE` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`POPUP_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='팝업 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_popup: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_popup` DISABLE KEYS */;
INSERT INTO `ts_popup` (`POPUP_SEQ`, `SUBJECT`, `BODY`, `LINK_URL`, `POSITION_X`, `POSITION_Y`, `HORIZONTAL_SIZE`, `VERTICAL_SIZE`, `START_DT`, `END_DT`, `USE_FLAG`, `POPUP_TYPE`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(2, 'Main popup', 'THIS IS TEST2222', '', 400, 100, 300, 300, '2018-11-17', '2018-11-21', 'Y', 'W', 'tago', '2018-11-13 16:53:17', 'tago', '2018-11-19 10:48:18');
/*!40000 ALTER TABLE `ts_popup` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_prd
DROP TABLE IF EXISTS `ts_prd`;
CREATE TABLE IF NOT EXISTS `ts_prd` (
  `PRD_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품 순번',
  `CATEGORY1` varchar(24) DEFAULT NULL COMMENT '카테고리 1',
  `PRD_NAME` varchar(120) NOT NULL COMMENT '상품명',
  `RECOMMEND_YN` varchar(1) NOT NULL DEFAULT 'N' COMMENT '추천 상품 여부',
  `MAIN_YN` varchar(1) NOT NULL DEFAULT 'N' COMMENT '메인 노출 상품 여부',
  `ORDERING` int(11) NOT NULL DEFAULT 0 COMMENT '정렬번호',
  `PRODUCT_CODE` varchar(24) DEFAULT NULL COMMENT '제품코드',
  `PRICE` int(11) NOT NULL DEFAULT 0 COMMENT '가격',
  `SUMMARY` varchar(800) DEFAULT NULL COMMENT '상품 요약',
  `BODY` mediumtext DEFAULT NULL COMMENT '상품 본문',
  `CSS_PREFIX` varchar(24) DEFAULT NULL COMMENT '스킨',
  `SIZE_LIST` int(11) NOT NULL DEFAULT 0 COMMENT '이미지 사이즈 - 목록',
  `SIZE_SMALL` int(11) NOT NULL DEFAULT 0 COMMENT '이미지 사이즈 - 축소',
  `SIZE_DETAIL` int(11) NOT NULL DEFAULT 0 COMMENT '이미지 사이즈 - 상세',
  `SIZE_LARGE` int(11) NOT NULL DEFAULT 0 COMMENT '이미지 사이즈 - 확대',
  `USER_URL` varchar(320) DEFAULT NULL COMMENT '사용자 URL',
  `ADMIN_URL` varchar(320) DEFAULT NULL COMMENT '관리자 URL',
  `REG_USER` varchar(24) NOT NULL COMMENT '등록자',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `MOD_USER` varchar(24) DEFAULT NULL COMMENT '수정자',
  `MOD_DATE` datetime DEFAULT NULL COMMENT '수정일',
  `USE_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용 여부',
  PRIMARY KEY (`PRD_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='상품 정보';

-- Dumping data for table ts_0002.ts_prd: ~16 rows (approximately)
/*!40000 ALTER TABLE `ts_prd` DISABLE KEYS */;
INSERT INTO `ts_prd` (`PRD_SEQ`, `CATEGORY1`, `PRD_NAME`, `RECOMMEND_YN`, `MAIN_YN`, `ORDERING`, `PRODUCT_CODE`, `PRICE`, `SUMMARY`, `BODY`, `CSS_PREFIX`, `SIZE_LIST`, `SIZE_SMALL`, `SIZE_DETAIL`, `SIZE_LARGE`, `USER_URL`, `ADMIN_URL`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`, `USE_FLAG`) VALUES
	(1, '010103', 'Bizwiz 그룹웨어', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 15:24:20', 'tago', '2018-11-14 17:35:03', 'Y'),
	(2, '010100', 'SMS ENTERPRISE', '', '', 0, '154', 144, '4444444', '44444444444444444444444444444444444444444444444', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 12:32:46', 'tago', '2018-11-14 17:35:16', 'Y'),
	(3, '010103', '트럭중고차 솔루션(매매단지용)', 'N', 'N', 1, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 16:02:00', 'tago', '2018-11-14 17:35:29', 'Y'),
	(4, '010100', '일반형 부동산 솔루션', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 16:02:17', 'tago', '2018-11-14 17:35:40', 'Y'),
	(5, '010100', '점포매매 부동산 솔루션', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 16:03:01', 'tago', '2018-11-14 17:35:57', 'Y'),
	(6, '010100', '직방형 부동산 솔루션', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 16:03:26', 'tago', '2018-11-14 17:36:08', 'Y'),
	(7, '010103', '중고차솔루션(승용차)', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 16:09:09', 'tago', '2018-11-14 17:36:27', 'Y'),
	(8, '010103', 'SMS 엔터프라이즈 PLUS', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 17:02:45', 'tago', '2018-11-14 17:36:36', 'Y'),
	(9, '010103', 'SMS Enterprise Reseller', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 17:03:27', 'tago', '2018-11-14 17:36:47', 'Y'),
	(10, '010200', '일반형 콜센터 솔루션', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 17:10:15', 'tago', '2018-11-14 17:36:57', 'Y'),
	(11, '010200', 'A/S 접수 관리 콜센터 솔루션', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 17:11:09', 'tago', '2018-11-14 17:37:15', 'Y'),
	(12, '010200', '전문몰 독립형', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 17:13:54', 'tago', '2018-11-14 17:37:28', 'Y'),
	(13, '010200', '대형몰 독립형', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 17:14:05', 'tago', '2018-11-14 17:37:45', 'Y'),
	(14, '010200', '몰인몰 독립형(입점형)', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 17:14:54', 'tago', '2018-11-14 17:37:57', 'Y'),
	(15, '010200', '오픈마켓 독립형', 'N', 'N', 0, '', 0, '', '', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-11-14 17:15:32', 'tago', '2018-11-14 17:38:09', 'Y'),
	(16, '010102', 'reedddddd', '', '', 0, '5556', 5500, 'asdf', 'asdf', NULL, 150, 50, 350, 650, NULL, NULL, 'tago', '2018-12-11 13:38:27', NULL, NULL, 'Y');
/*!40000 ALTER TABLE `ts_prd` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_prd_category
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

-- Dumping data for table ts_0002.ts_prd_category: ~8 rows (approximately)
/*!40000 ALTER TABLE `ts_prd_category` DISABLE KEYS */;
INSERT INTO `ts_prd_category` (`CATE_ID`, `CATE_LEVEL`, `PARENT_ID`, `CATE_NAME`, `CATE_DESCRIPTION`, `PRD_COUNT`, `SORT_NUM`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	('010000', 1, '', 'test1', 'test1', NULL, '1', 'U', 'tago', '2018-12-13 10:22:41', '', '2018-12-13 16:26:34'),
	('010100', 2, '010000', 'test2', 'test2', NULL, '1.1', 'U', 'tago', '2018-12-13 10:22:49', '', '2018-12-14 16:36:29'),
	('010101', 3, '010100', 'test3', 'test3', NULL, '1.1.2', 'U', 'tago', '2018-12-13 10:22:57', '', '2018-12-14 16:36:29'),
	('010102', 3, '010100', '3 dugaar menu', 'turshih', NULL, '1.1.1', 'U', 'tago', '2018-12-13 17:29:55', 'tago', '2018-12-14 16:36:29'),
	('010300', 2, '010000', 'turshilt ', 'kkkkkkkkkkk', NULL, '1.2', 'U', 'tago', '2018-12-13 17:28:12', '', '2018-12-14 16:36:29'),
	('020000', 1, '', 'test4', 'test4', NULL, '3', 'U', 'tago', '2018-12-13 10:23:07', '', '2018-12-13 17:26:54'),
	('030000', 1, '', '1 dugeer garchig uu', 'hmmmmmmm', NULL, '2', 'U', 'tago', '2018-12-13 17:25:57', '', '2018-12-13 17:26:54'),
	('030200', 2, '030000', '2 dugaar garchih', 'coffee coffee', NULL, '2.1', 'U', 'tago', '2018-12-13 17:26:38', '', '2018-12-13 17:26:54'),
	('040000', 1, '', 'test', 'test', NULL, '4', 'U', 'tago', '2018-12-27 19:34:32', '', NULL);
/*!40000 ALTER TABLE `ts_prd_category` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_prd_image
DROP TABLE IF EXISTS `ts_prd_image`;
CREATE TABLE IF NOT EXISTS `ts_prd_image` (
  `PRD_IMAGE_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품 사진 순번',
  `PRD_SEQ` int(11) NOT NULL COMMENT '상품 순번',
  `ORIGINAL_FILENAME` varchar(160) DEFAULT NULL COMMENT '원본 파일명',
  `SAVE_FILENAME` varchar(255) NOT NULL COMMENT '저장 파일명 - 원본',
  `LIST_FILENAME` varchar(255) DEFAULT NULL COMMENT '저장 파일명 - 목록',
  `SMALL_FILENAME` varchar(255) DEFAULT NULL COMMENT '저장 파일명 - 축소',
  `DETAIL_FILENAME` varchar(255) DEFAULT NULL COMMENT '저장 파일명 - 상세',
  `LARGE_FILENAME` varchar(255) DEFAULT NULL COMMENT '저장 파일명 - 확대',
  PRIMARY KEY (`PRD_IMAGE_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=1904 DEFAULT CHARSET=utf8 COMMENT='상품 사진';

-- Dumping data for table ts_0002.ts_prd_image: ~14 rows (approximately)
/*!40000 ALTER TABLE `ts_prd_image` DISABLE KEYS */;
INSERT INTO `ts_prd_image` (`PRD_IMAGE_SEQ`, `PRD_SEQ`, `ORIGINAL_FILENAME`, `SAVE_FILENAME`, `LIST_FILENAME`, `SMALL_FILENAME`, `DETAIL_FILENAME`, `LARGE_FILENAME`) VALUES
	(1890, 1, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1891, 2, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1892, 3, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1893, 4, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1894, 6, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1895, 7, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1896, 8, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1897, 9, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1898, 10, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1899, 11, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1900, 12, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1901, 14, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1902, 15, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg'),
	(1903, 13, '20180525154345735030.jpg', '/image/prd/20181114173503146016.jpg', '/image/prd/20181114173503165017.jpg', '/image/prd/20181114173503224018.jpg', '/image/prd/20181114173503267019.jpg', '/image/prd/20181114173503319020.jpg');
/*!40000 ALTER TABLE `ts_prd_image` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_prd_sub
DROP TABLE IF EXISTS `ts_prd_sub`;
CREATE TABLE IF NOT EXISTS `ts_prd_sub` (
  `PRD_SUB_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품 부가 순번',
  `PRD_SEQ` int(11) NOT NULL COMMENT '상품 순번',
  `HEADER` varchar(96) NOT NULL COMMENT '헤더',
  `CONTENT` varchar(96) DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`PRD_SUB_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='상품 부가 정보';

-- Dumping data for table ts_0002.ts_prd_sub: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_prd_sub` DISABLE KEYS */;
INSERT INTO `ts_prd_sub` (`PRD_SUB_SEQ`, `PRD_SEQ`, `HEADER`, `CONTENT`) VALUES
	(6, 16, '1312', '123');
/*!40000 ALTER TABLE `ts_prd_sub` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_quick_consultation
DROP TABLE IF EXISTS `ts_quick_consultation`;
CREATE TABLE IF NOT EXISTS `ts_quick_consultation` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` text NOT NULL COMMENT '이름',
  `CONTACT` text NOT NULL COMMENT '연락처',
  `EMAIL` text NOT NULL COMMENT '이메일',
  `CONTENT` longtext NOT NULL COMMENT '상담할 내용을 입력해 주세요.',
  `ANSWER` longtext DEFAULT NULL,
  `USE_FLAG` char(50) NOT NULL,
  `REG_USER` text NOT NULL DEFAULT '',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` text DEFAULT NULL,
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='quick consultation';

-- Dumping data for table ts_0002.ts_quick_consultation: ~9 rows (approximately)
/*!40000 ALTER TABLE `ts_quick_consultation` DISABLE KEYS */;
INSERT INTO `ts_quick_consultation` (`IDX`, `USER_NAME`, `CONTACT`, `EMAIL`, `CONTENT`, `ANSWER`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(1, 'wdasd', '2132312', 'bilguun783@gmail.com', 'dfsdfd+fsdfsdfsdfdf', '12123123123dwdweded3efd3ee2d2eded2ed', 'Y', 'wdasd', '2018-11-28 09:20:06', 'tago', '2018-11-29 18:45:31'),
	(2, 'DASDASD', '21212', 'skyline.mn12@gmail.com', 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest', 'sdsadasdasdasdasdfsdfasdfsdf sdfasdfasd fa', 'Y', 'DASDASD', '2018-11-28 00:00:00', 'tago', '2018-11-29 16:22:21'),
	(3, 'sas', '1221', 'testtesttesttesttesttesttest', 'testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++testtesttesttesttestasddddsdtesttesttest++++++', NULL, 'D', 'sas', '2018-11-28 10:18:48', NULL, '2018-11-28 18:54:19'),
	(4, 'qweqwe', '1232', 'dsasdsd', 'sadasd', 'sdadsasdsfasdfsdfafsfdsdfsdfa', 'D', 'qweqwe', '2018-11-28 10:29:01', NULL, '2018-11-28 18:53:29'),
	(5, 'test', '86602215', 'skyline.mn12@gmail.com', 'test lll asdfadsfasdfasdfasdf', NULL, 'Y', 'test', '2018-11-30 13:32:10', NULL, NULL),
	(6, 'aaa', '12313', 'aajiina@gmail.com', 'hello ist me ... bla bla', 'dfshskhdkfhkjlfkjsl', 'Y', 'aaa', '2018-11-30 17:16:35', 'tago', '2018-11-30 17:17:16'),
	(7, 'mongol', '88002233', 'skyline.mn12@gmail.com', 'ttestestsetestes', 'Now GOoO man', 'Y', 'mongol', '2018-12-11 17:02:28', 'tago', '2018-12-11 17:03:26'),
	(8, 'tenger', '1234', 'skyline.mn12@gmail.com', 'test12344', NULL, 'Y', 'tenger', '2018-12-11 17:14:35', NULL, NULL),
	(9, 'tenger', '86602215', 'sky@g.com', 'tenger sainuu!', NULL, 'Y', 'tenger', '2018-12-11 17:18:26', NULL, NULL),
	(10, 'test', '12344343124', 'skyline.mn12@gmail.com', 'mongolia 213123', NULL, 'Y', 'test', '2018-12-27 11:38:06', NULL, NULL);
/*!40000 ALTER TABLE `ts_quick_consultation` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_recent_board
DROP TABLE IF EXISTS `ts_recent_board`;
CREATE TABLE IF NOT EXISTS `ts_recent_board` (
  `RECENT_BOARD_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '메인 최근 게시물 순번',
  `BOARD_CODE` varchar(24) NOT NULL COMMENT '게시판 코드',
  `BC_SEQ` int(11) DEFAULT 0,
  `LINK_URL` varchar(320) DEFAULT NULL COMMENT '링크 URL',
  `ARTICLE_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '노출 게시물 수',
  `SUBJECT_CHAR_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '제목 글자수',
  `BODY_CHAR_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '내용 글자수',
  `CODING_START` mediumtext DEFAULT NULL COMMENT '코딩 - 시작 영역',
  `CODING_LOOP` mediumtext DEFAULT NULL COMMENT '코딩 - 반복 영역',
  `CODING_END` mediumtext DEFAULT NULL COMMENT '코딩 - 종료 영역',
  PRIMARY KEY (`RECENT_BOARD_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='메인 최근 게시물 정보';

-- Dumping data for table ts_0002.ts_recent_board: ~3 rows (approximately)
/*!40000 ALTER TABLE `ts_recent_board` DISABLE KEYS */;
INSERT INTO `ts_recent_board` (`RECENT_BOARD_SEQ`, `BOARD_CODE`, `BC_SEQ`, `LINK_URL`, `ARTICLE_COUNT`, `SUBJECT_CHAR_COUNT`, `BODY_CHAR_COUNT`, `CODING_START`, `CODING_LOOP`, `CODING_END`) VALUES
	(1, 'image', 0, '', 5, 20, 0, '<div class="m_board"><ul>', '<li><p class="sb"><a href="#{LINK}">#{SUBJECT} #{NEW}</a></p><p class="date">#{DATE}</p></li>', '</ul></div>'),
	(2, 'Tagorent', 0, '', 5, 20, 0, '<div class="m_board"><ul>', '<li><p class="sb"><a href="#{LINK}">#{SUBJECT} #{NEW}</a></p><p class="date">#{DATE}</p></li>', '</ul></div>'),
	(3, 'portfolio', 0, '', 5, 20, 0, '<ul class="m_port">', '<li><p class="port_img"><a href="#{LINK}" target="_blank"><img src="#{URL}" alt="이미지" width="181" height="139"></a></p><p class="sb"><a href="#{LINK}" target="_blank">#{SUBJECT} #{NEW}</a></p></li>', '</ul>');
/*!40000 ALTER TABLE `ts_recent_board` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_recent_prd
DROP TABLE IF EXISTS `ts_recent_prd`;
CREATE TABLE IF NOT EXISTS `ts_recent_prd` (
  `RP_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '메인 최근 상품 순번',
  `LIST_TYPE` varchar(1) DEFAULT NULL COMMENT '출력 구분 - A:최근등록, B:추천, C:메인노출',
  `LINK_URL` varchar(320) DEFAULT NULL COMMENT '링크 URL',
  `PRD_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '노출 상품 수',
  `SUBJECT_CHAR_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '제목 글자 수',
  `SUMMARY_CHAR_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '요약 글자 수',
  `LF_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '줄 바꿈 상품 수 - 테이블 태그 사용 시 ',
  `CODING_START` mediumtext DEFAULT NULL COMMENT '코딩 시작',
  `CODING_LOOP` mediumtext DEFAULT NULL COMMENT '코딩 반복',
  `CODING_END` mediumtext DEFAULT NULL COMMENT '코딩 종료',
  PRIMARY KEY (`RP_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='메인 최근 상품 정보';

-- Dumping data for table ts_0002.ts_recent_prd: ~2 rows (approximately)
/*!40000 ALTER TABLE `ts_recent_prd` DISABLE KEYS */;
INSERT INTO `ts_recent_prd` (`RP_SEQ`, `LIST_TYPE`, `LINK_URL`, `PRD_COUNT`, `SUBJECT_CHAR_COUNT`, `SUMMARY_CHAR_COUNT`, `LF_COUNT`, `CODING_START`, `CODING_LOOP`, `CODING_END`) VALUES
	(1, 'C', '', 11, 10, 10, 4, '<ul class="m_solution">', '<li><p class="sb">#{SUBJECT}</p><p class="sol_img text-center"><a href="#{LINK}" class="thumbnail"><img src="#{URL}" style="height: 121px;" alt="상품이미지"></a></p><p class="ex">#{SUMMARY}</p><p class="price">#{PRICE}(VAT 별도)</p></li>', '</ul>'),
	(2, 'B', '', 12, 10, 10, 4, '<ul class="m_solution">', '<li><p class="sb">#{SUBJECT}</p><p class="sol_img text-center"><a href="#{LINK}" class="thumbnail"><img src="#{URL}" style="height: 121px;" alt="상품이미지"></a></p><p class="ex">#{SUMMARY}</p><p class="price">#{PRICE}(VAT 별도)</p></li>', '</ul>');
/*!40000 ALTER TABLE `ts_recent_prd` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_site
DROP TABLE IF EXISTS `ts_site`;
CREATE TABLE IF NOT EXISTS `ts_site` (
  `SITE_SEQ` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '사이트 순번',
  `SITE_NAME` varchar(120) NOT NULL COMMENT '사이트 이름 [브라우저 타이틀]',
  `SITE_DOMAIN` varchar(120) NOT NULL COMMENT '사이트 도메인 [도메인 사용]',
  `EMAIL` varchar(96) DEFAULT NULL COMMENT '관리자 이메일',
  `KEY_NUMBER` varchar(24) DEFAULT NULL COMMENT '회사 대표 전화',
  `ADMIN_PHONE` varchar(24) DEFAULT NULL COMMENT '관리자 전화번호',
  `SITE_CERT_KEY` varchar(256) NOT NULL COMMENT '사이트 인증키',
  `ADMIN_MOBILE` varchar(24) DEFAULT NULL COMMENT '관리자 핸드폰',
  `INSTALL_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '설치일',
  `FTP_ADDR` varchar(100) DEFAULT NULL COMMENT 'FTP 주소',
  `FTP_ID` varchar(24) DEFAULT NULL COMMENT 'FTP 아이디',
  `FTP_PWD` varchar(24) DEFAULT NULL COMMENT 'FTP 비밀번호',
  `ADMIN_TITLE_URL` varchar(320) DEFAULT NULL COMMENT '관리자 타이틀 이미지',
  `ADMIN_COPYRIGHT` varchar(2000) DEFAULT NULL COMMENT '관리자 카피라이트',
  `ADD_BOARD_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '게시판 추가 가능 여부',
  `SSL_YN` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'SSL 사용 여부',
  `SSL_PORT` varchar(5) DEFAULT NULL COMMENT 'SSL 포트',
  `SMS_YN` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'SMS 사용 여부 [미정]',
  `SMS_KIND` varchar(8) DEFAULT NULL COMMENT 'SMS 종류 [미정]',
  `SMS_ID` varchar(24) DEFAULT NULL COMMENT 'SMS 아이디',
  `SMS_PWD` varchar(24) DEFAULT NULL COMMENT 'SMS 비밀번호',
  `REAL_CERT_YN` varchar(1) NOT NULL DEFAULT 'N' COMMENT '실명인증 사용 여부',
  `REAL_CERT_ID` varchar(24) DEFAULT NULL COMMENT '실명인증 아이디',
  `REAL_CERT_PWD` varchar(24) DEFAULT NULL COMMENT '실명인증 비밀번호',
  `POINT_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '포인트 사용 여부 [전역]',
  `POINT_LOGIN` int(11) NOT NULL DEFAULT 0 COMMENT '로그인 포인트',
  `POINT_VIEW` int(11) NOT NULL DEFAULT 0 COMMENT '보기 포인트',
  `POINT_WRITE` int(11) NOT NULL DEFAULT 0 COMMENT '글쓰기 포인트',
  `POINT_COMMENT` int(11) NOT NULL DEFAULT 0 COMMENT '댓글 포인트',
  `POINT_RECOMM` int(11) NOT NULL DEFAULT 0 COMMENT '추천 포인트',
  `POINT_NO_MSG` varchar(120) DEFAULT NULL COMMENT '포인트 없음 메시지',
  `POINT_DOWNLOAD` int(11) NOT NULL DEFAULT 0 COMMENT '다운로드 포인트',
  `POINT_JOIN` int(11) NOT NULL DEFAULT 0 COMMENT '회원 가입 포인트',
  `SU_ID` varchar(24) DEFAULT NULL COMMENT 'superuser 아이디',
  `SU_PWD` varchar(256) DEFAULT NULL COMMENT 'superuser 비밀번호',
  `DS_ID` varchar(24) DEFAULT NULL COMMENT '디자이너 아이디',
  `DS_PWD` varchar(256) DEFAULT NULL COMMENT '디자이너 비밀번호',
  `ADMIN_START_PAGE` varchar(320) DEFAULT NULL COMMENT '관리자 시작 페이지',
  `USE_MENU` varchar(320) DEFAULT NULL COMMENT '사용 가능 메뉴',
  `FOOT_BUSINESS_NUMBER` varchar(24) DEFAULT NULL COMMENT '사업자 등록번호[footer]',
  `FOOT_BUSINESS_NAME` varchar(48) DEFAULT NULL COMMENT '상호[footer]',
  `FOOT_REP_NAME` varchar(24) DEFAULT NULL COMMENT '대표자명[footer]',
  `FOOT_INFO_NAME` varchar(24) DEFAULT NULL COMMENT '정보관리 책임자[footer]',
  `FOOT_ZIPCODE` varchar(7) DEFAULT NULL COMMENT '우편번호[footer]',
  `FOOT_ADDR1` varchar(200) DEFAULT NULL COMMENT '주소1[footer]',
  `FOOT_CONDITION` varchar(48) DEFAULT NULL COMMENT '업태[footer]',
  `FOOT_ITEM` varchar(48) DEFAULT NULL COMMENT '종목[footer]',
  `FOOT_PHONE` varchar(24) DEFAULT NULL COMMENT '전화[footer]',
  `FOOT_FAX` varchar(24) DEFAULT NULL COMMENT '팩스[footer]',
  `FOOT_ADDR2` varchar(200) DEFAULT NULL COMMENT '주소2[footer]',
  `USE_MSG` varchar(1) NOT NULL DEFAULT 'N' COMMENT '쪽지 사용 여부',
  `MOD_DATE` datetime DEFAULT NULL COMMENT '최종 수정일',
  PRIMARY KEY (`SITE_SEQ`),
  UNIQUE KEY `UIN_TS_SITE_SITE_DOMAIN` (`SITE_DOMAIN`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='사이트 정보 - 사이트 하나 당 한 개\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0002.ts_site: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_site` DISABLE KEYS */;
INSERT INTO `ts_site` (`SITE_SEQ`, `SITE_NAME`, `SITE_DOMAIN`, `EMAIL`, `KEY_NUMBER`, `ADMIN_PHONE`, `SITE_CERT_KEY`, `ADMIN_MOBILE`, `INSTALL_DATE`, `FTP_ADDR`, `FTP_ID`, `FTP_PWD`, `ADMIN_TITLE_URL`, `ADMIN_COPYRIGHT`, `ADD_BOARD_YN`, `SSL_YN`, `SSL_PORT`, `SMS_YN`, `SMS_KIND`, `SMS_ID`, `SMS_PWD`, `REAL_CERT_YN`, `REAL_CERT_ID`, `REAL_CERT_PWD`, `POINT_YN`, `POINT_LOGIN`, `POINT_VIEW`, `POINT_WRITE`, `POINT_COMMENT`, `POINT_RECOMM`, `POINT_NO_MSG`, `POINT_DOWNLOAD`, `POINT_JOIN`, `SU_ID`, `SU_PWD`, `DS_ID`, `DS_PWD`, `ADMIN_START_PAGE`, `USE_MENU`, `FOOT_BUSINESS_NUMBER`, `FOOT_BUSINESS_NAME`, `FOOT_REP_NAME`, `FOOT_INFO_NAME`, `FOOT_ZIPCODE`, `FOOT_ADDR1`, `FOOT_CONDITION`, `FOOT_ITEM`, `FOOT_PHONE`, `FOOT_FAX`, `FOOT_ADDR2`, `USE_MSG`, `MOD_DATE`) VALUES
	(1, '[개발서버] 타고솔루션 v0.1', 'localhost', 'bace_n20@yahoo.com', '1644-5805', '', '49960de5880e8c687434170f6476605b8fe4aeb9a28632c7995cf3ba831d9763', NULL, '2017-07-17 14:02:49', '127.0.0.1', 'ftp1', 'ftp2', '타고플러스홈페이지222', 'Copyright &copy; tagoplus. All rights reserved.', 'Y', 'N', NULL, 'N', NULL, NULL, NULL, 'N', NULL, NULL, 'Y', 0, 0, 0, 0, 0, NULL, 0, 0, 'tago', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', 'design', '1111', NULL, '130000,060000,070000,140000,110000,080000,090000,100000,120000', '123-535-5555', '(주)타고플러스', '문양희', NULL, '08592', '서울 금천구 가산디지털2로 14', '업태', '종목', '1644-5805', '02-6919-1793', '703호', 'N', '2018-11-29 10:49:07');
/*!40000 ALTER TABLE `ts_site` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_site_api
DROP TABLE IF EXISTS `ts_site_api`;
CREATE TABLE IF NOT EXISTS `ts_site_api` (
  `SITE_SEQ` tinyint(4) NOT NULL COMMENT '사이트 순번',
  `MAP_TYPE` varchar(10) DEFAULT NULL COMMENT '지도 구분(naver, google, daum)',
  `MAP_KEY` varchar(1000) DEFAULT NULL COMMENT '지도에 키를 사용하면 입력',
  `EDITOR_TYPE` varchar(10) DEFAULT NULL COMMENT 'Editor 구분(CKEditor, naver)',
  `EDITOR_KEY` varchar(1000) DEFAULT NULL COMMENT 'Editor 키(있는 경우에 사용)',
  `UPLOAD_TYPE` varchar(10) DEFAULT NULL COMMENT 'upload 유형',
  `UPLOAD_KEY` varchar(1000) DEFAULT NULL COMMENT 'upload key(있는 경우에 사용)',
  `NAVER_LOG_ID` varchar(100) DEFAULT NULL COMMENT 'naver 로그분석 ID',
  `NAVER_LOG_VALUE` varchar(1000) DEFAULT NULL COMMENT 'naver 로그분석 전환값',
  `GOOGLE_LOG_ID` varchar(1000) DEFAULT NULL COMMENT 'Google Analytics ID',
  `GOOGLE_LOG_VALUE` varchar(1000) DEFAULT NULL COMMENT 'naver 로그분석 전환값(필요한 경우에 사용)',
  `GOOGLE_UA` varchar(100) DEFAULT NULL COMMENT 'Google Analytics Tracker Object',
  `PHONE_CHECK_ID` varchar(20) DEFAULT NULL COMMENT '본인인증코드(ID)',
  `PHONE_CHECK_PW` varchar(20) DEFAULT NULL COMMENT '본인인증 비밀번호',
  `IPIN_ID` varchar(20) DEFAULT NULL COMMENT 'IPIN인증 코드(ID)',
  `IPIN_PW` varchar(20) DEFAULT NULL COMMENT 'IPIN인증 비밀번호',
  `FACEBOOK_FLAG` varchar(20) DEFAULT 'Y',
  `FACEBOOK_KEY` varchar(1000) DEFAULT NULL COMMENT '페이스북 사용키(있는 경우에 사용)',
  `TWITTER_FLAG` varchar(20) DEFAULT 'Y',
  `TWITTER_KEY` varchar(1000) DEFAULT NULL COMMENT '트위터 사용키(있는 경우에 사용)',
  `KAKAO_FLAG` varchar(20) DEFAULT 'Y',
  `KAKAO_KEY` varchar(1000) DEFAULT NULL COMMENT '카카오스토리 사용키(있는 경우에 사용)',
  `NAVER_FLAG` varchar(20) DEFAULT 'Y',
  `NAVER_KEY` varchar(1000) DEFAULT NULL COMMENT '네이버 블로그 사용키(있는 경우에 사용)',
  `GOOGLE_ACCESS_TOKEN` varchar(1000) DEFAULT NULL COMMENT 'GOOGLE OAUTH2 AUTHORIZE',
  `GOOGLE_REFRESH_TOKEN` varchar(1000) DEFAULT NULL COMMENT 'GOOGLE OAUTH2 AUTHORIZE',
  PRIMARY KEY (`SITE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='사이트 테이블';

-- Dumping data for table ts_0002.ts_site_api: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_site_api` DISABLE KEYS */;
INSERT INTO `ts_site_api` (`SITE_SEQ`, `MAP_TYPE`, `MAP_KEY`, `EDITOR_TYPE`, `EDITOR_KEY`, `UPLOAD_TYPE`, `UPLOAD_KEY`, `NAVER_LOG_ID`, `NAVER_LOG_VALUE`, `GOOGLE_LOG_ID`, `GOOGLE_LOG_VALUE`, `GOOGLE_UA`, `PHONE_CHECK_ID`, `PHONE_CHECK_PW`, `IPIN_ID`, `IPIN_PW`, `FACEBOOK_FLAG`, `FACEBOOK_KEY`, `TWITTER_FLAG`, `TWITTER_KEY`, `KAKAO_FLAG`, `KAKAO_KEY`, `NAVER_FLAG`, `NAVER_KEY`, `GOOGLE_ACCESS_TOKEN`, `GOOGLE_REFRESH_TOKEN`) VALUES
	(1, 'naver', 'test', 'CKEditor', 'editor1', 'DextUpload', 'upload1', 'naid1', NULL, '543421548837-qvqn1d39nggpgguqk13h0csf6a4cgrm1.apps.googleusercontent.com', '184226183', 'UA-128386516-1', 'test1', '', 'test1', '', 'N', '357068818393225', 'N', 'asdasd', 'Y', '611a73d0255f4e5455c14160306351fa', 'Y', 'testnaver', 'ya29.GmByBjOe-2qkVr-PYVjyYnnfkk8O59NhJ-l7lRMjxkl0a2BmzJwJoX77ezvts9EqtXO1rsw4AzurceE1Xmve_XZ-NXd15Tj77xziexNEiufgd1rSMz5B5oGHNWDAxlfP1Fs', '1/_S25Jom0L972qLTjH86_CXXwoanoNPdbsHaI1xadi9hdVo26Wh0oOs6LVfckCRh5');
/*!40000 ALTER TABLE `ts_site_api` ENABLE KEYS */;

-- Dumping structure for table ts_0002.ts_site_meta
DROP TABLE IF EXISTS `ts_site_meta`;
CREATE TABLE IF NOT EXISTS `ts_site_meta` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '코드Type',
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='사이트의 메타태그	';

-- Dumping data for table ts_0002.ts_site_meta: ~6 rows (approximately)
/*!40000 ALTER TABLE `ts_site_meta` DISABLE KEYS */;
INSERT INTO `ts_site_meta` (`IDX`, `GROUP_IDX`, `PAGE_NAME`, `PAGE_LINK`, `META_TITLE`, `META_KEYWORDS`, `META_SUBJECT`, `META_DESCRIPTION`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	(1, 1, 'Home Page', '/main', 'Home Solution', 'car, home, rent car, tago plus, ', 'car, home,  rent car, tago plus', 'this is tago man!', 'U', 'tago', '2018-11-21 18:28:14', 'tago', '2018-11-27 19:01:45'),
	(2, 1, 'Login page', '/login', 'LOGIN PAGE', 'login,user,sign in,tago', 'login,user,sign in,tago', 'please login to our page', 'U', 'tago', '2018-11-21 18:30:04', NULL, NULL),
	(3, 1, 'home page', '/main', 'home solution', 'tagoplus, rent car, tago', 'tagoplus, rent car, tago', 'tago page', 'D', 'tago', '2018-11-23 18:04:39', 'tago', '2018-11-23 18:08:01'),
	(4, 1, 'homepage', '/pages/board/board.jsp', 'Board Management', 'board', 'board', 'test zurag oruulah', 'U', 'tago', '2018-11-23 18:41:43', 'tago', '2018-11-23 18:41:55'),
	(5, 1, 'Consulting page', '/pages/consulting.jsp', 'consult', 'consult, page, whatever', 'consult, page, whatever', 'this is consulting page', 'U', 'tago', '2018-11-29 17:31:03', 'tago', '2018-11-29 17:31:14'),
	(6, 1, '1', '/mgr/front', 'test,test,test', 'test,test,test', 'test,test,test', 'test,test,test', 'U', 'tago', '2018-12-17 18:19:47', 'tago', '2018-12-17 18:19:53');
/*!40000 ALTER TABLE `ts_site_meta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
