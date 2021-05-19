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

-- Dumping structure for table ts_0001.ts_member_setting
DROP TABLE IF EXISTS `ts_member_setting`;
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

-- Dumping data for table ts_0001.ts_member_setting: ~1 rows (approximately)
DELETE FROM `ts_member_setting`;
/*!40000 ALTER TABLE `ts_member_setting` DISABLE KEYS */;
INSERT INTO `ts_member_setting` (`SITE_SEQ`, `NAVER_API`, `NAVER_KEY`, `GOOGLE_API`, `GOOGLE_KEY`, `KAKAO_API`, `KAKAO_KEY`, `FACEBOOK_API`, `FACEBOOK_KEY`, `ID_FLAG`, `PASSWORD_FLAG`, `NAME_FLAG`, `EMAIL_FLAG`, `JUMIN_FLAG`, `ADDR_FLAG`, `PHONE_FLAG`, `MOBILETEL_FLAG`, `COMPHONE_FLAG`, `FAX_FLAG`, `OFFICE_NAME_FLAG`, `OFFICE_NUM_FLAG`, `OFFICE_OB_NUM_FLAG`, `OFFICE_B_TYPE_FLAG`, `OFFICE_BC_TYPE_FLAG`, `OFFICE_TAX_MAIL_FLAG`, `OFFICE_ADDR_FLAG`, `OFFICE_OWNER_NAME_FLAG`, `OFFICE_OWNER_TEL_FLAG`, `OFFICE_STAFF_NAME_FLAG`, `OFFICE_STAFF_TEL_FLAG`, `RECOMMEND_FLAG`, `EMAILRECEIVE_FLAG`, `SMSRECEIVE_FLAG`, `NICKNAME_FLAG`, `ICON_FLAG`, `PHOTO_FLAG`, `HOMEPAGE_FLAG`, `BIRTHDAY_FLAG`, `JOB_FLAG`, `JOB_TYPE`, `INTEREST_FLAG`, `INTEREST_TYPE`, `HOBBY_FLAG`, `EDUCATION_FLAG`, `EDUCATION_TYPE`, `SELFINTRO_FLAG`, `MARRIAGE_FLAG`, `MARRIAGEDATE_FLAG`, `INCOME_FLAG`, `INCOME_TYPE`, `CAR_FLAG`, `ETC1_FLAG`, `ETC2_FLAG`, `ETC3_FLAG`, `ETC4_FLAG`, `ETC5_FLAG`, `ETC1_NAME`, `ETC1_TYPE`, `ETC1_SIZE`, `ETC1_COUNT`, `ETC1_DESC`, `ETC2_NAME`, `ETC2_TYPE`, `ETC2_SIZE`, `ETC2_COUNT`, `ETC2_DESC`, `ETC3_NAME`, `ETC3_TYPE`, `ETC3_SIZE`, `ETC3_COUNT`, `ETC3_DESC`, `ETC4_NAME`, `ETC4_TYPE`, `ETC4_SIZE`, `ETC4_COUNT`, `ETC4_DESC`, `ETC5_NAME`, `ETC5_TYPE`, `ETC5_SIZE`, `ETC5_COUNT`, `ETC5_DESC`, `MEMREG_URL`, `MEMINFO_URL`, `MEMLOGIN_URL`, `MEMFIND_URL`, `MEMLOGOUT_URL`, `MEMLOGIN_IMG`, `MEMLOGOUT_IMG`, `MEMREG_IMG`, `MEMMYPAGE_IMG`, `MEM_MAIL_YN`, `MEM_SKIN`) VALUES
	(1, '1', 'C1u5os6o4bKHECMY78fF', '1', '543421548837-qvqn1d39nggpgguqk13h0csf6a4cgrm1.apps.googleusercontent.com', '1', '611a73d0255f4e5455c14160306351fa', '1', '357068818393225', '1', '1', '1', '1', '1', '1', '2', '1', '1', '1', '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'job', '1', 'interest', '1', '1', 'edu', '1', '1', '1', '1', 'income', '1', '0', '0', '0', '1', '0', 'нас ', 'textarea', 200, 1, 'desc1', 'он сар өдөр ', 'text', 100, 1, 'desc2', 'овог', 'checkbox', 300, 8, 'desc3', '4', 'select', 400, 10, 'desc4', '5', 'radio', 500, 17, 'desc5', '/test', '/test1', '/test2', '/test3', '/test4', '/img1', '/img2', '/img3', '/img4', 'Y', 'memberBasic');
/*!40000 ALTER TABLE `ts_member_setting` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
