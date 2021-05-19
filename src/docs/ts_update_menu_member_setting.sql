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

-- Dumping structure for table ts_0001.ts_member_setting
CREATE TABLE IF NOT EXISTS `ts_member_setting` (
  `SITE_SEQ` int(11) NOT NULL COMMENT '	사이트 순번	',
  `NAVER_API` varchar(1) DEFAULT NULL COMMENT '	네이버 API 사용구분	',
  `NAVER_KEY` varchar(1000) DEFAULT NULL COMMENT '	네이버 API 키	',
  `GOOGLE_API` varchar(1) DEFAULT NULL COMMENT '	구글 API 사용구분	',
  `GOOGLE_KEY` varchar(1000) DEFAULT NULL COMMENT '	구글 API 키	',
  `KAKAO_API` varchar(1) DEFAULT NULL COMMENT '	카카오 API 사용구분	',
  `KAKAO_KEY` varchar(1000) DEFAULT NULL COMMENT '	카카오 API 키	',
  `FACEBOOK_API` varchar(1) DEFAULT NULL COMMENT '	페이스북 API 사용구분	',
  `FACEBOOK_KEY` varchar(1000) DEFAULT NULL COMMENT '	페이스북 API 키	',
  `ID_FLAG` varchar(1) DEFAULT NULL COMMENT '	ID사용 구분	',
  `PASSWORD_FLAG` varchar(1) DEFAULT NULL COMMENT '	비밀번호 사용 구분	',
  `NAME_FLAG` varchar(1) DEFAULT NULL COMMENT '	이름 사용 구분	',
  `EMAIL_FLAG` varchar(1) DEFAULT NULL COMMENT '	이메일 구분	',
  `JUMIN_FLAG` varchar(1) DEFAULT NULL COMMENT '	주민등록번호 구분	',
  `ADDR_FLAG` varchar(1) DEFAULT NULL COMMENT '	주소 구분	',
  `PHONE_FLAG` varchar(1) DEFAULT NULL COMMENT '	전화번호 구분	',
  `MOBILETEL_FLAG` varchar(1) DEFAULT NULL COMMENT '	휴대폰 구분	',
  `COMPHONE_FLAG` varchar(1) DEFAULT NULL COMMENT '	회사 연락처 구분	',
  `FAX_FLAG` varchar(1) DEFAULT NULL COMMENT '	팩스 구분	',
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
  `ETC2_NAME` varchar(100) DEFAULT NULL COMMENT '	추가항목 이름	',
  `ETC2_TYPE` varchar(10) DEFAULT NULL COMMENT '	추가항목 Type	',
  `ETC2_SIZE` int(11) DEFAULT NULL COMMENT '	추가항목 Size	',
  `ETC2_COUNT` int(11) DEFAULT NULL COMMENT '	추가항목의 세부항목 개수	',
  `ETC3_NAME` varchar(100) DEFAULT NULL COMMENT '	추가항목 이름	',
  `ETC3_TYPE` varchar(10) DEFAULT NULL COMMENT '	추가항목 Type	',
  `ETC3_SIZE` int(11) DEFAULT NULL COMMENT '	추가항목 Size	',
  `ETC3_COUNT` int(11) DEFAULT NULL COMMENT '	추가항목의 세부항목 개수	',
  `ETC4_NAME` varchar(100) DEFAULT NULL COMMENT '	추가항목 이름	',
  `ETC4_TYPE` varchar(10) DEFAULT NULL COMMENT '	추가항목 Type	',
  `ETC4_SIZE` int(11) DEFAULT NULL COMMENT '	추가항목 Size	',
  `ETC4_COUNT` int(11) DEFAULT NULL COMMENT '	추가항목의 세부항목 개수	',
  `ETC5_NAME` varchar(100) DEFAULT NULL COMMENT '	추가항목 이름	',
  `ETC5_TYPE` varchar(10) DEFAULT NULL COMMENT '	추가항목 Type	',
  `ETC5_SIZE` int(11) DEFAULT NULL COMMENT '	추가항목 Size	',
  `ETC5_COUNT` int(11) DEFAULT NULL COMMENT '	추가항목의 세부항목 개수	',
  PRIMARY KEY (`SITE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	관리자 그룹별 메뉴 권한 적용 테이블	';

-- Dumping data for table ts_0001.ts_member_setting: ~1 rows (approximately)
/*!40000 ALTER TABLE `ts_member_setting` DISABLE KEYS */;
REPLACE INTO `ts_member_setting` (`SITE_SEQ`, `NAVER_API`, `NAVER_KEY`, `GOOGLE_API`, `GOOGLE_KEY`, `KAKAO_API`, `KAKAO_KEY`, `FACEBOOK_API`, `FACEBOOK_KEY`, `ID_FLAG`, `PASSWORD_FLAG`, `NAME_FLAG`, `EMAIL_FLAG`, `JUMIN_FLAG`, `ADDR_FLAG`, `PHONE_FLAG`, `MOBILETEL_FLAG`, `COMPHONE_FLAG`, `FAX_FLAG`, `RECOMMEND_FLAG`, `EMAILRECEIVE_FLAG`, `SMSRECEIVE_FLAG`, `NICKNAME_FLAG`, `ICON_FLAG`, `PHOTO_FLAG`, `HOMEPAGE_FLAG`, `BIRTHDAY_FLAG`, `JOB_FLAG`, `JOB_TYPE`, `INTEREST_FLAG`, `INTEREST_TYPE`, `HOBBY_FLAG`, `EDUCATION_FLAG`, `EDUCATION_TYPE`, `SELFINTRO_FLAG`, `MARRIAGE_FLAG`, `MARRIAGEDATE_FLAG`, `INCOME_FLAG`, `INCOME_TYPE`, `CAR_FLAG`, `ETC1_FLAG`, `ETC2_FLAG`, `ETC3_FLAG`, `ETC4_FLAG`, `ETC5_FLAG`, `ETC1_NAME`, `ETC1_TYPE`, `ETC1_SIZE`, `ETC1_COUNT`, `ETC2_NAME`, `ETC2_TYPE`, `ETC2_SIZE`, `ETC2_COUNT`, `ETC3_NAME`, `ETC3_TYPE`, `ETC3_SIZE`, `ETC3_COUNT`, `ETC4_NAME`, `ETC4_TYPE`, `ETC4_SIZE`, `ETC4_COUNT`, `ETC5_NAME`, `ETC5_TYPE`, `ETC5_SIZE`, `ETC5_COUNT`) VALUES
	(0, '1', 'naver key', '0', 'google key', '1', 'kakao key', '0', 'facebook key', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `ts_member_setting` ENABLE KEYS */;

-- Dumping structure for table ts_0001.ts_menu
CREATE TABLE IF NOT EXISTS `ts_menu` (
  `MENU_ID` varchar(6) NOT NULL COMMENT '	메뉴 ID	',
  `MENU_LEVEL` smallint(6) DEFAULT NULL COMMENT '	메뉴 LEVEL	',
  `PARENT_ID` varchar(6) DEFAULT NULL COMMENT '	부모 메뉴의 ID	',
  `MENU_NAME` varchar(50) DEFAULT NULL COMMENT '	메뉴명	',
  `MENU_TABLE` varchar(1000) DEFAULT NULL COMMENT '	메뉴에서 사용하는 테이블	',
  `FOLDER_PATH` varchar(50) DEFAULT NULL COMMENT '	메뉴의 경로	',
  `SORT_NUM` smallint(6) DEFAULT NULL COMMENT '	순서	',
  `USE_FLAG` char(1) NOT NULL COMMENT '	사용유무(U: 사용, S:미사용, D:삭제)	',
  `REG_USER` varchar(20) NOT NULL COMMENT '	등록자ID	',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '	수정자ID	',
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '	수정일	',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	관리자 페이지 메뉴를 구성. FOLDERPATH, FILENAME 등은 JAVA의 특성에 맞춰서 변경.	';

-- Dumping data for table ts_0001.ts_menu: ~67 rows (approximately)
/*!40000 ALTER TABLE `ts_menu` DISABLE KEYS */;
REPLACE INTO `ts_menu` (`MENU_ID`, `MENU_LEVEL`, `PARENT_ID`, `MENU_NAME`, `MENU_TABLE`, `FOLDER_PATH`, `SORT_NUM`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	('040000', 1, 'null', '환경설정', 'орчны тохиргоо', '', 0, 'U', 'tago', '2018-10-23 10:49:24', 'tago', '2018-10-24 14:37:25'),
	('040100', 2, '040000', '기본설정', ' үндсэн тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:38:43', NULL, NULL),
	('040101', 3, '040100', '기본설정', ' үндсэн тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:02:20', 'tago', '2018-10-25 10:34:21'),
	('040102', 3, '040100', '로그분석', ' log analys', '', 0, 'U', 'tago', '2018-10-24 13:02:52', 'tago', '2018-10-25 11:01:43'),
	('040103', 3, '040100', '팝업관리', ' pop  up  тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:03:25', 'tago', '2018-10-25 09:52:02'),
	('040104', 3, '040100', '폼메일', ' form mail', '', 0, 'U', 'tago', '2018-10-24 13:04:08', NULL, NULL),
	('040105', 3, '040100', 'SMS발송 ', 'sms илгээх', '', 0, 'U', 'tago', '2018-10-24 13:04:40', NULL, NULL),
	('040106', 3, '040100', '배너관리', ' banner тохиргоо ', '', 0, 'U', 'tago', '2018-10-24 13:07:26', NULL, NULL),
	('040107', 3, '040100', '페이지관리', ' хуудас тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:07:54', NULL, NULL),
	('040108', 3, '040100', '페이지접금권한', ' хуудсанд нэвтрэх эрх ', '', 0, 'U', 'tago', '2018-10-24 13:08:23', NULL, NULL),
	('040109', 3, '040100', '게시판 ', 'зарлалын самбар ', '', 0, 'U', 'tago', '2018-10-24 13:09:03', NULL, NULL),
	('040110', 3, '040100', '메인게시물 ', 'гол зар', '', 0, 'U', 'tago', '2018-10-24 13:09:24', NULL, NULL),
	('040200', 2, '040000', '상품관리', ' бүтээгдэхүүн тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:40:39', NULL, NULL),
	('040201', 3, '040200', '상품관리', ' бүтээгдэхүүн тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:10:16', NULL, NULL),
	('040202', 3, '040200', '메인상품 ', 'гол бүтээгдэхүүн', '', 0, 'U', 'tago', '2018-10-24 13:11:15', NULL, NULL),
	('040300', 2, '040000', '포인트관리', 'point тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:41:17', NULL, NULL),
	('040301', 3, '040300', '포인트관리', ' point тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:11:53', NULL, NULL),
	('040400', 2, '040000', '회원관리', ' гишүүнчлэл тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:41:43', NULL, NULL),
	('040401', 3, '040400', '회원관리 ', 'гишүүнчлэл тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:12:36', NULL, NULL),
	('040402', 3, '040400', 'SNS 설정 ', 'SNS тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:13:44', NULL, NULL),
	('040500', 2, '040000', 'API관리', ' API тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:44:06', NULL, NULL),
	('040501', 3, '040500', 'API설정', ' API тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:14:28', NULL, NULL),
	('040600', 2, '040000', '메뉴권한관리', ' menu эрх тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:45:09', NULL, NULL),
	('040601', 3, '040600', '메뉴관리', ' menu тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:15:11', NULL, NULL),
	('040602', 3, '040600', '권한관리 ', 'эрх тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:15:39', NULL, NULL),
	('050000', 1, 'null', '기본설정', 'үндсэн тохиргоо', '', 0, 'U', 'tago', '2018-10-23 10:50:26', 'tago', '2018-10-24 14:37:41'),
	('050100', 2, '050000', '기본설정', ' үндсэн тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:54:51', NULL, NULL),
	('050101', 3, '050100', '사이트정보', ' сайт мэдээлэл', '', 0, 'U', 'tago', '2018-10-24 13:16:21', NULL, NULL),
	('050102', 3, '050100', '관리자설정', 'админ тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:19:11', NULL, NULL),
	('050103', 3, '050100', 'SMS관리', ' SMS тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:19:53', NULL, NULL),
	('050104', 3, '050100', 'SEO관리', ' SEO тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:20:29', NULL, NULL),
	('060000', 1, 'null', '게시판관리', 'зарлалын самбар тохиргоо ', '', 0, 'U', 'tago', '2018-10-23 10:51:03', 'tago', '2018-10-24 14:37:49'),
	('060100', 2, '060000', '게시판관리', ' зарлалын самбар тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:56:24', NULL, NULL),
	('060101', 3, '060100', '게시판관리', 'зарлалын самбар тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:40:55', NULL, NULL),
	('060102', 3, '060100', '게시물통합관리', ' нэгдсэн зарын тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:41:26', NULL, NULL),
	('060103', 3, '060100', '코멘트통합관리', ' коммент тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:42:03', NULL, NULL),
	('060104', 3, '060100', '게시판통계', 'нэгдсэн зарын самбар', '', 0, 'U', 'tago', '2018-10-24 13:42:36', NULL, NULL),
	('060200', 2, '060000', '게시판목록', 'зарлалын самбарын жагсаалт', '', 0, 'U', 'tago', '2018-10-24 12:56:58', NULL, NULL),
	('060201', 3, '060200', '생성한 게시판 목록', 'үүсгэсэн зарын самбарын жагсаа', '', 0, 'U', 'tago', '2018-10-24 13:43:31', NULL, NULL),
	('070000', 1, 'null', '회원관리', ' гишүүнчлэл тохиргоо', '', 0, 'U', 'tago', '2018-10-23 10:51:29', 'tago', '2018-10-24 14:37:55'),
	('070100', 2, '070000', '회원관리', ' гишүүнчлэл тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:57:27', NULL, NULL),
	('070101', 3, '070100', '회원목록', 'гишүүнчлэл жагсаалт', '', 0, 'U', 'tago', '2018-10-24 13:52:12', NULL, NULL),
	('070102', 3, '070100', '회원등급', 'гишүүнчлэл бүртгэл', '', 0, 'U', 'tago', '2018-10-24 13:52:47', NULL, NULL),
	('070103', 3, '070100', '탈퇴회원', 'гишүүнчлэл цуцлах', '', 0, 'U', 'tago', '2018-10-24 13:53:32', NULL, NULL),
	('070104', 3, '070100', '이메일,SMS설정', 'имэйл, Sms тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:54:34', NULL, NULL),
	('070105', 3, '070100', '단체메일발송', 'нэгдсэн мэйл илгээх ', '', 0, 'U', 'tago', '2018-10-24 13:55:38', NULL, NULL),
	('070106', 3, '070100', '회원통계', 'гишүүнчлэл бүртгэл ', '', 0, 'U', 'tago', '2018-10-24 13:56:26', NULL, NULL),
	('070107', 3, '070100', '가입약관 및 개인정보 보호정책', 'гишүүнчлэлд нэгдэх зарчим ба ', '', 0, 'U', 'tago', '2018-10-24 13:57:05', NULL, NULL),
	('080000', 1, 'null', '폼메일관리', 'form mail тохиргоо', '', 0, 'U', 'tago', '2018-10-23 10:52:06', 'tago', '2018-10-24 14:38:15'),
	('080100', 2, '080000', '폼메일관리', 'form mail тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:58:02', NULL, NULL),
	('080101', 3, '080100', '폼메일관리', 'form mail тохиргоо', '', 0, 'U', 'tago', '2018-10-24 13:58:05', NULL, NULL),
	('080200', 2, '080000', '폼메일목록 ', 'form mail жагсаалт', '', 0, 'U', 'tago', '2018-10-24 12:58:32', NULL, NULL),
	('080201', 3, '080200', '생성한 폼메일 그룹 목록 ', 'үүсгэсэн form mail груп жагсаа', '', 0, 'U', 'tago', '2018-10-24 13:58:57', 'tago', '2018-10-24 14:38:21'),
	('090000', 1, 'null', '팝업배너관리', 'Pop up banner тохиргоо', '', 0, 'U', 'tago', '2018-10-23 10:52:32', 'tago', '2018-10-24 14:38:25'),
	('090100', 2, '090000', '팝업관리', ' Pop up тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:59:12', NULL, NULL),
	('090101', 3, '090100', '팝업관리', ' pop  up  тохиргоо', '', 0, 'U', 'tago', '2018-10-24 14:02:37', NULL, NULL),
	('090200', 2, '090000', '배너관리', 'banner тохиргоо', '', 0, 'U', 'tago', '2018-10-24 12:59:40', NULL, NULL),
	('090201', 3, '090200', '배너관리', ' banner тохиргоо ', '', 0, 'U', 'tago', '2018-10-24 14:03:08', NULL, NULL),
	('090300', 2, '090000', '배너목록', ' banner жагсаалт', '', 0, 'U', 'tago', '2018-10-24 13:00:03', NULL, NULL),
	('090301', 3, '090300', '생성한 배너 그룹 목록 ', 'үүсгэсэн баннер групын жагсаал', '', 0, 'U', 'tago', '2018-10-24 14:03:41', NULL, NULL),
	('100000', 1, 'null', '접속통계 ', 'бүртгэлийн холбоос ', '', 0, 'U', 'tago', '2018-10-23 10:52:55', 'tago', '2018-10-24 14:38:34'),
	('100100', 2, '100000', '접속통계', ' бүртгэлийн холбоос', '', 0, 'U', 'tago', '2018-10-24 13:00:31', NULL, NULL),
	('100101', 3, '100100', '접속자분석', ' холбогчийн анализ', '', 0, 'U', 'tago', '2018-10-24 14:04:20', NULL, NULL),
	('100102', 3, '100100', '접속경로분석', ' холбоосын зам анализ', '', 0, 'U', 'tago', '2018-10-24 14:04:51', NULL, NULL),
	('100103', 3, '100100', '건색키워드분석', 'энгийн түлхүүр үгийн анализ', '', 0, 'U', 'tago', '2018-10-24 14:05:14', NULL, NULL),
	('100104', 3, '100100', 'OS/브라우져 ', 'OS /browser', '', 0, 'U', 'tago', '2018-10-24 14:05:53', NULL, NULL);
/*!40000 ALTER TABLE `ts_menu` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
