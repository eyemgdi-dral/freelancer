-- --------------------------------------------------------
-- Host:                         tagoplus3.cafe24.com
-- Server version:               10.3.9-MariaDB-1:10.3.9+maria~xenial - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ts_0000
DROP DATABASE IF EXISTS `ts_0000`;
CREATE DATABASE IF NOT EXISTS `ts_0000` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ts_0000`;

-- Dumping structure for function ts_0000.GET_CODE_NAME
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

-- Dumping structure for function ts_0000.GET_USER_NAME
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

-- Dumping structure for table ts_0000.hibernate_sequence
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table ts_0000.hibernate_sequence: 2 rows
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(1),
	(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_admin
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
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  PRIMARY KEY (`ADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0000.ts_admin: ~4 rows (approximately)
/*!40000 ALTER TABLE `ts_admin` DISABLE KEYS */;
INSERT INTO `ts_admin` (`ADMIN_ID`, `ADMIN_PWD`, `ADMIN_NAME`, `NICKNAME`, `ICON`, `EMAIL`, `PHONE`, `MOBILE`, `MEMO`, `AUTHS`, `REG_DATE`, `MOD_DATE`, `USE_YN`) VALUES
	('admin', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', '관리자1', NULL, NULL, 'asda@sdfgs.com', '', '', '', NULL, '2017-07-18 15:46:00', '2018-07-05 10:25:41', 'Y'),
	('bronze', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', 'baaal', NULL, '/image/admin/20180921154009683001.jpg', 'bal@g.com', '', '', '', NULL, '2018-09-21 15:38:57', '2018-09-21 15:40:09', 'Y'),
	('executer', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', 'Bayraa1111', NULL, '/image/admin/20180921145204687001.png', 'bayar@g.com', '010-9999-9999', '010-8888-8888', 'This is test admin', NULL, '2018-09-21 14:48:58', '2018-09-21 16:41:07', 'Y'),
	('god', 'pmWkWSBCL51Bfkhn79xPuKBKHz__H6B-mY6G9_eieuM', 'god', NULL, NULL, 'god@g.com', '', '', '', NULL, '2018-09-21 17:01:41', NULL, 'Y');
/*!40000 ALTER TABLE `ts_admin` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_banner_info
DROP TABLE IF EXISTS `ts_banner_info`;
CREATE TABLE IF NOT EXISTS `ts_banner_info` (
  `BANNER_SEQ` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '배너 순번',
  `BM_SEQ` smallint(6) DEFAULT NULL COMMENT '배너 마스터 순번',
  `ORDERING` smallint(6) NOT NULL DEFAULT 0 COMMENT '우선순위',
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `LINK_URL` varchar(320) DEFAULT NULL COMMENT '링크 주소',
  `LINK_TARGET` varchar(10) NOT NULL COMMENT '링크 타겟 [_self:자신, _blank:새창]',
  `BANNER_TYPE` varchar(1) NOT NULL COMMENT '이미지/HTML 구분 [I:이미지, B:HTML]',
  `BODY` mediumtext DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`BANNER_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='배너 정보\r\n';

-- Dumping data for table ts_0000.ts_banner_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_banner_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_banner_info` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_banner_master
DROP TABLE IF EXISTS `ts_banner_master`;
CREATE TABLE IF NOT EXISTS `ts_banner_master` (
  `BM_SEQ` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '배너 마스터 순번',
  `MASTER_CODE` varchar(24) NOT NULL COMMENT '배너 마스터 코드',
  `MASTER_NAME` varchar(24) NOT NULL COMMENT '배너 마스터 이름',
  `DIRECTION` varchar(1) NOT NULL COMMENT '배너 형태 [H:가로, V:세로]',
  `LF_COUNT` smallint(6) NOT NULL DEFAULT 0 COMMENT '배너 갯수 [가로일 경우 해당 갯수 이후 줄 바꿈]',
  `MARGIN` varchar(4) NOT NULL COMMENT '배너 간격',
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용 여부',
  PRIMARY KEY (`BM_SEQ`),
  UNIQUE KEY `UIN_TS_BM_MASTER_CODE` (`MASTER_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='배너 마스터 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0000.ts_banner_master: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_banner_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_banner_master` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_board_category
DROP TABLE IF EXISTS `ts_board_category`;
CREATE TABLE IF NOT EXISTS `ts_board_category` (
  `BC_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시판 카테고리 순번',
  `BOARD_CODE` varchar(24) NOT NULL COMMENT '게시판 코드',
  `CATE_NAME` varchar(120) NOT NULL COMMENT '카테고리 이름',
  `MOUSEOVER_IMAGE` varchar(320) DEFAULT NULL COMMENT '카테고리 mouseover 이미지',
  `MOUSEOUT_IMAGE` varchar(320) DEFAULT NULL COMMENT '카테고리 mouseout 이미지',
  `ORDERING` smallint(6) NOT NULL DEFAULT 0 COMMENT '순서',
  PRIMARY KEY (`BC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판 카테고리[탭] 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0000.ts_board_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_board_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_board_category` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_board_info
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
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`BOARD_SEQ`),
  KEY `XIN_TS_BOARD_INFO_BOARD_CODE` (`BOARD_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='게시물 정보';

-- Dumping data for table ts_0000.ts_board_info: ~8 rows (approximately)
/*!40000 ALTER TABLE `ts_board_info` DISABLE KEYS */;
INSERT INTO `ts_board_info` (`BOARD_SEQ`, `BOARD_CODE`, `BC_SEQ`, `PRODUCT_CODE`, `H_GROUP`, `H_ORDER`, `H_DEPTH`, `STAR`, `NOTICE_YN`, `USER_NAME`, `NICKNAME`, `EMAIL`, `PHONE`, `MOBILE`, `ZIPCODE`, `ADDR1`, `ADDR2`, `SUBJECT`, `BODY`, `ANSWER`, `HTML_YN`, `SECRET_YN`, `PWD`, `READ_COUNT`, `RECOMM_COUNT`, `NOT_RECOMM_COUNT`, `COMMENT_COUNT`, `ALOW_COM_YN`, `IP_ADDR`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`, `FAQ_FIXED_CODE`, `LINK_URL`, `STATUS_FIXED_CODE`, `ADD_COL1`, `ADD_COL2`, `ADD_COL3`, `ADD_COL4`, `USE_YN`) VALUES
	(1, 'test', 0, NULL, 1, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'nice', 'Hello GOOd one', NULL, 'Y', 'N', NULL, 1, 0, 0, 0, 'N', NULL, 'tago', '2018-09-14 16:18:40', 'tago', '2018-09-19 17:59:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(8, 'image', 0, NULL, 8, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'Test', '2313123123123test', NULL, 'Y', 'N', NULL, 19, 0, 0, 0, 'N', NULL, 'tago', '2018-09-18 19:27:42', 'tago', '2018-09-19 17:19:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(9, 'Tagorent', 0, NULL, 9, 1, 1, 0, 'N', 'hyundai', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'Suzuki, hyundai', 'hyundaihyundaihyundaihyundaihyundai<strong>hyundaihyundaihyundaihyundaihyundaihyundai<s>hyundaihyundaihyundai</s></strong>hyundaihyundaihyundai', NULL, 'Y', 'N', NULL, 1, 0, 0, 0, 'N', NULL, 'tago', '2018-09-19 15:14:37', 'tago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(10, 'image', 0, NULL, 10, 1, 1, 0, 'N', 'Tenger', NULL, NULL, '', '', NULL, NULL, NULL, 'Test', 'testsetetseets123123123123', NULL, 'Y', 'N', NULL, 2, 0, 0, 0, 'N', NULL, 'skyline', '2018-09-24 12:05:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(11, 'image', 0, NULL, 11, 1, 1, 0, 'N', 'admin', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'React', 'this bitch, asss , what ever ma good fuck', NULL, 'Y', 'N', NULL, 167, 0, 0, 0, 'Y', NULL, 'skyline', '2018-09-24 15:01:51', 'tago', '2018-09-27 15:19:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(12, 'image', 0, NULL, 12, 1, 1, 0, 'N', 'tago', '슈퍼유저', NULL, '', '', NULL, NULL, NULL, 'REACT RENT CAR', 'React now to god adad', NULL, 'Y', 'N', NULL, 4, 0, 0, 0, 'N', NULL, 'tago', '2018-09-27 18:31:23', 'tago', '2018-09-28 15:43:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(13, 'image', 0, NULL, 13, 1, 1, 0, 'N', 'Tenger', NULL, NULL, '', '', NULL, NULL, NULL, 'allow react now', 'ewrwerwerwerwerwer', NULL, 'Y', 'N', NULL, 40, 0, 0, 0, NULL, NULL, 'skyline', '2018-09-27 18:37:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(14, 'image', 0, NULL, 14, 1, 1, 0, 'N', 'batceceg', NULL, NULL, '', '', NULL, NULL, NULL, '코메트 쓰기', 'ㄺㅎㅇㄶㄴ휼율유', NULL, 'Y', 'N', NULL, 3, 0, 0, 0, NULL, NULL, 'bagi', '2018-10-08 16:33:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N');
/*!40000 ALTER TABLE `ts_board_info` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_board_master
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
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '게시판 사용 여부',
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

-- Dumping data for table ts_0000.ts_board_master: ~3 rows (approximately)
/*!40000 ALTER TABLE `ts_board_master` DISABLE KEYS */;
INSERT INTO `ts_board_master` (`BOARD_CODE`, `BOARD_TYPE_FIXED_CODE`, `BOARD_NAME`, `GROUP_SEQ`, `PRIORITY`, `BOARD_ADMIN`, `AUTH_LIST`, `AUTH_VIEW`, `AUTH_WRITE`, `AUTH_REPLY`, `AUTH_COMMENT`, `DATE_FORMAT_LIST`, `DATE_FORMAT_VIEW`, `CSS_PREFIX`, `CSS_PREFIX_MOBILE`, `NO_AUTH_MSG`, `NO_AUTH_REDIRECT`, `EDITOR_YN`, `USE_YN`, `AUTO_SECRET_YN`, `COMMENT_YN`, `COMMENT_LEVEL`, `SHOW_LIST_YN`, `SHOW_PREV_NEXT_YN`, `PREVIEW_IMAGE_YN`, `PREVIEW_IMAGE_ALIGN`, `RECOMM_YN`, `CHECK_SPAM_YN`, `WRITE_BUTTON_YN`, `FILTERING_YN`, `FILTER`, `SMS_YN`, `FILE_UPLOAD_COUNT`, `MOVIE_UPLOAD_COUNT`, `IMAGE_SIZE_LIST`, `IMAGE_SIZE_VIEW`, `PAGER_ROW_COUNT`, `PAGER_BLOCK_COUNT`, `NEW_PERIOD`, `HOT_COUNT`, `LF_COUNT`, `SUBJECT_CHAR_COUNT`, `POINT_VIEW`, `POINT_WRITE`, `POINT_REPLY`, `POINT_RECOMM`, `POINT_DOWNLOAD`, `POINT_COMMENT`, `POINT_NO_MSG`, `WRITER_FORMAT_FIXED_CODE`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	('image', '001006', 'board-image', 1, 1, 'admin', 4, 4, 3, 3, 3, 'yyyy-MM-dd HH:mm', 'yyyy-MM-dd', 'red', NULL, 'Sorry for my inpatience', '', 'Y', 'Y', 'N', 'Y', 4, 'N', 'N', 'N', 'left', 'Y', 'Y', NULL, 'Y', 'fuck,bitch,ass', NULL, 1, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-09-18 09:30:07', 'tago', '2018-10-03 16:54:30'),
	('Tagorent', '001006', 'Tago Cheju Rent Car', 2, 1, 'admin', 0, 0, 0, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd', 'blue', NULL, '권한이 없습니다.', '', 'Y', 'Y', 'N', 'Y', NULL, 'N', 'N', 'N', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-09-19 15:10:33', 'tago', '2018-09-19 15:13:05'),
	('test', '001001', 'Portfolio', 1, 1, 'admin', 0, 0, 0, 0, 0, 'yyyy-MM-dd', 'yyyy-MM-dd', 'blue', NULL, '권한이 없습니다.', 'Warning', 'Y', 'Y', 'Y', 'Y', NULL, 'N', 'N', '', 'left', 'N', 'N', NULL, 'N', '', NULL, 0, 0, 0, 0, 10, 10, 2, 100, 4, 50, 0, 0, 0, 0, 0, 0, NULL, '', 'tago', '2018-09-14 16:18:07', NULL, NULL);
/*!40000 ALTER TABLE `ts_board_master` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_board_status
DROP TABLE IF EXISTS `ts_board_status`;
CREATE TABLE IF NOT EXISTS `ts_board_status` (
  `BOARD_CODE` varchar(24) NOT NULL COMMENT '게시판 코드',
  `STATUS_FIXED_CODE` varchar(6) NOT NULL COMMENT '처리 상태 고정 코드[003000]',
  PRIMARY KEY (`STATUS_FIXED_CODE`,`BOARD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판 - 처리 상태';

-- Dumping data for table ts_0000.ts_board_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_board_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_board_status` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_comment
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
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`COMMENT_SEQ`),
  KEY `BOARD_CODE` (`BOARD_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='댓글 정보';

-- Dumping data for table ts_0000.ts_comment: ~31 rows (approximately)
/*!40000 ALTER TABLE `ts_comment` DISABLE KEYS */;
INSERT INTO `ts_comment` (`COMMENT_SEQ`, `PARENT_SEQ`, `BOARD_SEQ`, `BOARD_CODE`, `PRODUCT_CODE`, `H_GROUP`, `H_ORDER`, `H_DEPTH`, `STAR`, `USER_NAME`, `USER_NICKNAME`, `BODY`, `PWD`, `REG_USER`, `REG_DATE`, `IP_ADDR`, `DISPLAY_YN`, `USE_YN`) VALUES
	(6, 0, 11, 'image', '', 11, NULL, NULL, NULL, 'Tenger', NULL, 'alright lest do it', NULL, 'skyline', '2018-10-03 20:20:22', NULL, 'Y', 'Y'),
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
	(21, 0, 13, 'image', '', 13, NULL, NULL, NULL, 'batceceg', NULL, 'ADDADASC', NULL, 'bagi', '2018-10-04 13:17:29', NULL, 'N', 'Y'),
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
	(36, 0, 13, 'image', '', 13, NULL, NULL, NULL, 'Tenger', NULL, 'test t213', NULL, 'skyline', '2018-10-16 13:08:14', NULL, 'Y', 'Y');
/*!40000 ALTER TABLE `ts_comment` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_file
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='첨부 파일 - 가상디렉토리 이후 경로까지 저장';

-- Dumping data for table ts_0000.ts_file: ~7 rows (approximately)
/*!40000 ALTER TABLE `ts_file` DISABLE KEYS */;
INSERT INTO `ts_file` (`FILE_SEQ`, `TABLE_NAME`, `ORIGINAL_FILENAME`, `SAVE_FILENAME`, `MIME_TYPE`, `REF_SEQ`, `ORDERING`, `UPLOAD_TYPE_FIXED_CODE`, `MASTER_SEQ`, `REF_USER_ID`, `FILE_SIZE`) VALUES
	(6, 'TS_BOARD_INFO', '20180122190922_beat.png', '/board/image/20180918170625492002.png', 'image/png', 7, 1, NULL, 0, 'tago', '2.15KB'),
	(7, 'TS_BOARD_INFO', 'anniversary-art-birthday-269887.jpg', '/board/image/20180927103420775002.jpg', 'image/jpeg', 8, 1, NULL, 0, 'tago', '1.84MB'),
	(8, 'TS_BOARD_INFO', 'E-gmat.png', '/board/Tagorent/20180919151438000001.png', 'image/png', 9, 1, NULL, 0, 'tago', '6.65KB'),
	(9, 'TS_BOARD_INFO', 'smartmockup.png', '/board/image/20180927103325267001.png', 'image/png', 11, 1, NULL, 0, 'skyline', '1.3MB'),
	(10, 'TS_BOARD_INFO', 'apple.jpg', '/board/image/20180926194031108001.jpg', 'image/jpeg', 13, 1, NULL, 0, 'skyline', '1.44MB'),
	(11, 'TS_BOARD_INFO', 'manhattan.png', '/board/image/20180927101335658001.png', 'image/png', 14, 1, NULL, 0, 'skyline', '7.59KB'),
	(12, 'TS_BOARD_INFO', 'Asset 3.png', '/board/image/20180928154350751002.png', 'image/png', 12, 1, NULL, 0, 'tago', '1.2KB');
/*!40000 ALTER TABLE `ts_file` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_fixed_code
DROP TABLE IF EXISTS `ts_fixed_code`;
CREATE TABLE IF NOT EXISTS `ts_fixed_code` (
  `CODE_CODE` varchar(6) NOT NULL COMMENT '코드 코드',
  `CODE_NAME` varchar(96) NOT NULL COMMENT '코드 이름',
  `CODE_DESC` varchar(120) DEFAULT NULL COMMENT '코드 설명',
  `CODE_DESC2` varchar(120) DEFAULT NULL COMMENT '코드 설명2',
  PRIMARY KEY (`CODE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='고정 코드\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0000.ts_fixed_code: ~42 rows (approximately)
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

-- Dumping structure for table ts_0000.ts_form
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='폼메일 정보';

-- Dumping data for table ts_0000.ts_form: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_form` DISABLE KEYS */;
INSERT INTO `ts_form` (`FORM_SEQ`, `FORM_CODE`, `FORM_NAME`, `TERMS_YN`, `TERMS_BODY`, `CSS_PREFIX`, `BOARD_RECEIVE_YN`, `EMAIL_RECEIVE_YN`, `SMS_RECEIVE_YN`, `EMAIL_RECEIVE`, `SMS_RECEIVE`, `REG_USER`, `REG_DATE`) VALUES
	(1, NULL, 'sdfdfsfdsfds', 'Y', 'fdsfdsffdsfds', '1', 'Y', 'N', 'Y', '', '', 'tago', '2018-10-10 16:06:37');
/*!40000 ALTER TABLE `ts_form` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_form_info
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='폼메일 항목';

-- Dumping data for table ts_0000.ts_form_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_form_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_form_info` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_form_value
DROP TABLE IF EXISTS `ts_form_value`;
CREATE TABLE IF NOT EXISTS `ts_form_value` (
  `FORM_VALUE_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '항목 내용 순번',
  `FORM_WRITING_SEQ` int(11) NOT NULL COMMENT '작성폼메일 순번',
  `FORM_INFO_NAME` varchar(24) DEFAULT NULL COMMENT '항목명',
  `FORM_INFO_VALUE` mediumtext DEFAULT NULL COMMENT '항목내용',
  `PROPERTY` varchar(24) DEFAULT NULL COMMENT '항목속성',
  PRIMARY KEY (`FORM_VALUE_SEQ`),
  UNIQUE KEY `XPK_TS_FORM_VALUE` (`FORM_VALUE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='폼메일 항목내용';

-- Dumping data for table ts_0000.ts_form_value: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_form_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_form_value` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_form_writing
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='폼메일 작성';

-- Dumping data for table ts_0000.ts_form_writing: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_form_writing` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_form_writing` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_group
DROP TABLE IF EXISTS `ts_group`;
CREATE TABLE IF NOT EXISTS `ts_group` (
  `GROUP_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '그룹 순번',
  `GROUP_TYPE` varchar(1) NOT NULL COMMENT '그룹 종류 [B:게시판, P:페이지]',
  `GROUP_NAME` varchar(96) NOT NULL COMMENT '그룹 이름',
  PRIMARY KEY (`GROUP_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='그룹 정보 - 게시판, 페이지\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0000.ts_group: ~2 rows (approximately)
/*!40000 ALTER TABLE `ts_group` DISABLE KEYS */;
INSERT INTO `ts_group` (`GROUP_SEQ`, `GROUP_TYPE`, `GROUP_NAME`) VALUES
	(1, 'B', 'Portfolio'),
	(2, 'B', 'Car Rent');
/*!40000 ALTER TABLE `ts_group` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_mail_tmpl
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 메일 설정';

-- Dumping data for table ts_0000.ts_mail_tmpl: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_mail_tmpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_mail_tmpl` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_member_grade
DROP TABLE IF EXISTS `ts_member_grade`;
CREATE TABLE IF NOT EXISTS `ts_member_grade` (
  `GRADE_LEVEL` smallint(6) NOT NULL COMMENT '레벨',
  `ICON` varchar(320) DEFAULT NULL COMMENT '아이콘',
  `GRADE_NAME` varchar(24) NOT NULL COMMENT '등급 이름',
  `GRADE_MEMO` varchar(400) DEFAULT NULL COMMENT '설명',
  PRIMARY KEY (`GRADE_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 등급 - 높은 등급 - 낮은 숫자 지정\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0000.ts_member_grade: ~3 rows (approximately)
/*!40000 ALTER TABLE `ts_member_grade` DISABLE KEYS */;
INSERT INTO `ts_member_grade` (`GRADE_LEVEL`, `ICON`, `GRADE_NAME`, `GRADE_MEMO`) VALUES
	(1, NULL, '관리자', '관리자 등급 자동 등록'),
	(3, NULL, 'golden', 'Golden'),
	(4, NULL, 'silver', '123');
/*!40000 ALTER TABLE `ts_member_grade` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_member_info
DROP TABLE IF EXISTS `ts_member_info`;
CREATE TABLE IF NOT EXISTS `ts_member_info` (
  `MEMBER_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원 순번',
  `USER_ID` varchar(24) NOT NULL COMMENT '회원 아이디',
  `GRADE_LEVEL` smallint(6) DEFAULT NULL COMMENT '레벨',
  `USER_PWD` varchar(256) NOT NULL COMMENT '비밀번호',
  `PWD_CHANGE_DATE` datetime DEFAULT NULL COMMENT '비밀번호 변경일',
  `USER_NAME` varchar(24) DEFAULT NULL COMMENT '이름',
  `PHOTO` varchar(320) DEFAULT NULL COMMENT '사진',
  `ICON` varchar(320) DEFAULT NULL COMMENT '아이콘',
  `NICKNAME` varchar(48) DEFAULT NULL COMMENT '닉네임',
  `VIRTUAL_NUMBER` varchar(13) DEFAULT NULL COMMENT '주민번호[가상주민번호 : 아이핀]',
  `EMAIL` varchar(24) DEFAULT NULL COMMENT '이메일',
  `PHONE` varchar(24) DEFAULT NULL COMMENT '전화',
  `MOBILE` varchar(24) DEFAULT NULL COMMENT '핸드폰',
  `COMP_PHONE` varchar(24) DEFAULT NULL COMMENT '회사전화',
  `HOMEPAGE` varchar(24) DEFAULT NULL COMMENT '홈페이지',
  `ZIPCODE` varchar(24) DEFAULT NULL COMMENT '우편번호',
  `ADDR1` varchar(24) DEFAULT NULL COMMENT '주소1',
  `ADDR2` varchar(24) DEFAULT NULL COMMENT '주소2',
  `EMAIL_YN` varchar(1) DEFAULT NULL COMMENT '메일 수신 여부',
  `SMS_YN` varchar(1) DEFAULT NULL COMMENT 'SMS 수신 여부',
  `BIRTH_DT` varchar(24) DEFAULT NULL COMMENT '생년월일 [아이핀]',
  `IS_LUNAR` varchar(24) DEFAULT NULL COMMENT '양력/음력 [아이핀]',
  `RECOMM_USER_ID` varchar(24) DEFAULT NULL COMMENT '추천인',
  `LOGIN_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT '로그인수',
  `RECENT_LOGIN_DATE` datetime DEFAULT NULL COMMENT '최근 로그인',
  `MEMO` varchar(2000) DEFAULT NULL COMMENT '메모',
  `MEMO_ADMIN` varchar(2000) DEFAULT NULL COMMENT '메모-관리자용',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `USE_YN` varchar(1) DEFAULT 'Y' COMMENT '사용 여부 - 관리자',
  `WITHDRAWAL_YN` varchar(1) DEFAULT 'N' COMMENT '탈퇴 여부',
  `WITHDRAWAL_REASON` varchar(500) DEFAULT NULL COMMENT '탈퇴 사유',
  `WITHDRAWAL_DT` varchar(10) DEFAULT NULL COMMENT '탈퇴일',
  PRIMARY KEY (`MEMBER_SEQ`),
  UNIQUE KEY `UIN_TS_MEMBER_INFO_USER_ID` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3006 DEFAULT CHARSET=utf8 COMMENT='회원 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0000.ts_member_info: ~4 rows (approximately)
/*!40000 ALTER TABLE `ts_member_info` DISABLE KEYS */;
INSERT INTO `ts_member_info` (`MEMBER_SEQ`, `USER_ID`, `GRADE_LEVEL`, `USER_PWD`, `PWD_CHANGE_DATE`, `USER_NAME`, `PHOTO`, `ICON`, `NICKNAME`, `VIRTUAL_NUMBER`, `EMAIL`, `PHONE`, `MOBILE`, `COMP_PHONE`, `HOMEPAGE`, `ZIPCODE`, `ADDR1`, `ADDR2`, `EMAIL_YN`, `SMS_YN`, `BIRTH_DT`, `IS_LUNAR`, `RECOMM_USER_ID`, `LOGIN_COUNT`, `RECENT_LOGIN_DATE`, `MEMO`, `MEMO_ADMIN`, `REG_DATE`, `USE_YN`, `WITHDRAWAL_YN`, `WITHDRAWAL_REASON`, `WITHDRAWAL_DT`) VALUES
	(3001, 'skyline', 3, 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', '2018-09-21 16:08:18', 'Tenger', NULL, NULL, NULL, NULL, 'skyline.mn12@gmail.com', '', '', NULL, NULL, '46702', '부산 강서구 대저로235번길 9 (대저1동)', '', 'Y', 'Y', NULL, NULL, NULL, 0, NULL, NULL, '', '2018-09-20 15:39:03', 'Y', 'N', NULL, '2018-09-21'),
	(3002, 'bat', 4, 'pmWkWSBCL51Bfkhn79xPuKBKHz__H6B-mY6G9_eieuM', '2018-09-21 17:29:17', 'bat', NULL, NULL, NULL, NULL, 'bat@g.com', '010-9999-9999', '010-8888-8888', NULL, NULL, '', '', '', 'Y', 'Y', NULL, NULL, NULL, 0, NULL, NULL, '', '2018-09-21 17:16:51', 'Y', 'N', NULL, '2018-09-21'),
	(3003, 'moon', 3, 'pmWkWSBCL51Bfkhn79xPuKBKHz__H6B-mY6G9_eieuM', NULL, 'moon_ts', NULL, NULL, NULL, NULL, 'moon@g.com', '010-9999-9999', '010-8888-8888', NULL, NULL, '', '', '', 'Y', 'Y', NULL, NULL, NULL, 0, NULL, NULL, '', '2018-10-04 12:42:01', 'Y', 'N', NULL, NULL),
	(3004, 'bagi', 3, 'jZae727K08KaOmKSgOaGzww_XVqGr_PKEgIMkjrcbJI', '2018-10-09 10:54:06', 'batceceg', NULL, NULL, NULL, NULL, 'bace_n20@yahoo.com', '015-0005-0002', '001-1515-5415', NULL, NULL, '08785', '서울 관악구 청룡길 6 (봉천동)', '', 'Y', 'Y', NULL, NULL, NULL, 0, NULL, NULL, '', '2018-10-04 12:47:17', 'Y', 'N', NULL, '2018-10-09');
/*!40000 ALTER TABLE `ts_member_info` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_page
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='페이지 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0000.ts_page: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_page` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_popup
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
  `USE_YN` varchar(1) NOT NULL COMMENT '사용 여부',
  `POPUP_TYPE` varchar(1) NOT NULL COMMENT '팝업 형태 [W:윈도우, L:layer]',
  `REG_USER` varchar(24) NOT NULL COMMENT '등록자',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `MOD_USER` varchar(24) DEFAULT NULL COMMENT '수정자',
  `MOD_DATE` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`POPUP_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='팝업 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0000.ts_popup: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_popup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_popup` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_prd
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
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용 여부',
  PRIMARY KEY (`PRD_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='상품 정보';

-- Dumping data for table ts_0000.ts_prd: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_prd` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_prd` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_prd_category
DROP TABLE IF EXISTS `ts_prd_category`;
CREATE TABLE IF NOT EXISTS `ts_prd_category` (
  `CATE_CODE` int(11) NOT NULL COMMENT '카테고리 코드',
  `CATE_NAME` varchar(96) NOT NULL COMMENT '카테고리 이름',
  `ORDERING` int(11) NOT NULL COMMENT '정렬번호 - 기본값 CATE_CODE',
  `P_CATE_CODE` int(11) NOT NULL DEFAULT 0 COMMENT '부모 카테고리 코드',
  PRIMARY KEY (`CATE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 카테고리 - 주의 : 트리거 있음';

-- Dumping data for table ts_0000.ts_prd_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_prd_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_prd_category` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_prd_image
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 사진';

-- Dumping data for table ts_0000.ts_prd_image: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_prd_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_prd_image` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_prd_sub
DROP TABLE IF EXISTS `ts_prd_sub`;
CREATE TABLE IF NOT EXISTS `ts_prd_sub` (
  `PRD_SUB_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품 부가 순번',
  `PRD_SEQ` int(11) NOT NULL COMMENT '상품 순번',
  `HEADER` varchar(96) NOT NULL COMMENT '헤더',
  `CONTENT` varchar(96) DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`PRD_SUB_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 부가 정보';

-- Dumping data for table ts_0000.ts_prd_sub: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_prd_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_prd_sub` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_recent_board
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메인 최근 게시물 정보';

-- Dumping data for table ts_0000.ts_recent_board: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_recent_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_recent_board` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_recent_prd
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메인 최근 상품 정보';

-- Dumping data for table ts_0000.ts_recent_prd: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_recent_prd` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_recent_prd` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_site
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

-- Dumping data for table ts_0000.ts_site: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_site` DISABLE KEYS */;
INSERT INTO `ts_site` (`SITE_SEQ`, `SITE_NAME`, `SITE_DOMAIN`, `EMAIL`, `KEY_NUMBER`, `ADMIN_PHONE`, `SITE_CERT_KEY`, `ADMIN_MOBILE`, `INSTALL_DATE`, `FTP_ADDR`, `FTP_ID`, `FTP_PWD`, `ADMIN_TITLE_URL`, `ADMIN_COPYRIGHT`, `ADD_BOARD_YN`, `SSL_YN`, `SSL_PORT`, `SMS_YN`, `SMS_KIND`, `SMS_ID`, `SMS_PWD`, `REAL_CERT_YN`, `REAL_CERT_ID`, `REAL_CERT_PWD`, `POINT_YN`, `POINT_LOGIN`, `POINT_VIEW`, `POINT_WRITE`, `POINT_COMMENT`, `POINT_RECOMM`, `POINT_NO_MSG`, `POINT_DOWNLOAD`, `POINT_JOIN`, `SU_ID`, `SU_PWD`, `DS_ID`, `DS_PWD`, `ADMIN_START_PAGE`, `USE_MENU`, `FOOT_BUSINESS_NUMBER`, `FOOT_BUSINESS_NAME`, `FOOT_REP_NAME`, `FOOT_INFO_NAME`, `FOOT_ZIPCODE`, `FOOT_ADDR1`, `FOOT_CONDITION`, `FOOT_ITEM`, `FOOT_PHONE`, `FOOT_FAX`, `FOOT_ADDR2`, `USE_MSG`, `MOD_DATE`) VALUES
	(1, '[개발서버] 타고솔루션 v0.1', 'localhost', '', '1644-5805', '', '49960de5880e8c687434170f6476605b8fe4aeb9a28632c7995cf3ba831d9763', NULL, '2017-07-17 14:02:49', '127.0.0.1', 'ftp1', 'ftp2', '타고플러스 솔루션 관리자', 'Copyright &copy; tagoplus. All rights reserved.', 'Y', 'N', NULL, 'N', NULL, NULL, NULL, 'N', NULL, NULL, 'Y', 0, 0, 0, 0, 0, NULL, 0, 0, 'tago', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', 'design', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', NULL, '005001,005002,005003,005004,005010,005020,005030,005040', '123-535-5555', '(주)타고플러스', '문양희', NULL, '08592', '서울 금천구 가산디지털2로 14', '업태', '종목', '1644-5805', '02-6919-1793', '703호', 'N', '2018-07-04 11:46:54');
/*!40000 ALTER TABLE `ts_site` ENABLE KEYS */;

-- Dumping structure for table ts_0000.ts_terms
DROP TABLE IF EXISTS `ts_terms`;
CREATE TABLE IF NOT EXISTS `ts_terms` (
  `SITE_SEQ` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '사이트 순번',
  `TERM` mediumtext DEFAULT NULL COMMENT '가입 약관',
  `PRIVACY_INFO` mediumtext DEFAULT NULL COMMENT '개인정보 보호정책',
  PRIMARY KEY (`SITE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='약관 정보';

-- Dumping data for table ts_0000.ts_terms: ~0 rows (approximately)
/*!40000 ALTER TABLE `ts_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_terms` ENABLE KEYS */;

-- Dumping structure for view ts_0000.vw_cate
DROP VIEW IF EXISTS `vw_cate`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_cate` (
	`CATE_CODE` INT(11) NULL,
	`CATE_NAME` VARCHAR(96) NULL COLLATE 'utf8_general_ci',
	`P_CATE_CODE` INT(11) NULL,
	`ORDERING` INT(11) NULL,
	`DEPTH` INT(1) NULL,
	`TITLE` VARCHAR(96) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for trigger ts_0000.TR_TS_PRD_CATEGORY_AFTER_DELETE
DROP TRIGGER IF EXISTS `TR_TS_PRD_CATEGORY_AFTER_DELETE`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_TS_PRD_CATEGORY_AFTER_DELETE` AFTER DELETE ON `ts_prd_category` FOR EACH ROW BEGIN

	UPDATE TS_PRD
	SET CATEGORY1 = ''
	WHERE CATEGORY1 = OLD.CATE_CODE;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view ts_0000.vw_cate
DROP VIEW IF EXISTS `vw_cate`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_cate`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cate` AS with recursive CATE as (select `ts_prd_category`.`CATE_CODE` AS `CATE_CODE`,`ts_prd_category`.`CATE_NAME` AS `CATE_NAME`,`ts_prd_category`.`P_CATE_CODE` AS `P_CATE_CODE`,`ts_prd_category`.`ORDERING` AS `ORDERING`,0 AS `DEPTH`,`ts_prd_category`.`CATE_NAME` AS `TITLE` from `ts_prd_category` where `ts_prd_category`.`P_CATE_CODE` = 0 union all select `a`.`CATE_CODE` AS `CATE_CODE`,`a`.`CATE_NAME` AS `CATE_NAME`,`a`.`P_CATE_CODE` AS `P_CATE_CODE`,`a`.`ORDERING` AS `ORDERING`,`c`.`DEPTH` + 1 AS `C.DEPTH + 1`,concat(`c`.`TITLE`,' > ',`a`.`CATE_NAME`) AS `concat(C.TITLE, ' > ', A.CATE_NAME)` from (`ts_prd_category` `a` join `cate` `c` on(`a`.`P_CATE_CODE` = `c`.`CATE_CODE`)))select `cate`.`CATE_CODE` AS `CATE_CODE`,`cate`.`CATE_NAME` AS `CATE_NAME`,`cate`.`P_CATE_CODE` AS `P_CATE_CODE`,`cate`.`ORDERING` AS `ORDERING`,`cate`.`DEPTH` AS `DEPTH`,`cate`.`TITLE` AS `TITLE` from `cate` order by `cate`.`ORDERING`,`cate`.`DEPTH`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
