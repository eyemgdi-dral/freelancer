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

-- Dumping structure for table ts_0001.ts_member_info
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
  `USE_YN` varchar(1) DEFAULT 'Y' COMMENT '사용 여부 - 관리자',
  `WITHDRAWAL_YN` varchar(1) DEFAULT 'N' COMMENT '탈퇴 여부',
  `WITHDRAWAL_REASON` varchar(500) DEFAULT NULL COMMENT '탈퇴 사유',
  `WITHDRAWAL_DT` varchar(10) DEFAULT NULL COMMENT '탈퇴일',
  PRIMARY KEY (`MEMBER_SEQ`),
  UNIQUE KEY `UIN_TS_MEMBER_INFO_USER_ID` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3042 DEFAULT CHARSET=utf8 COMMENT='회원 정보\r\n - 모델, 매퍼 구성';

-- Dumping data for table ts_0001.ts_member_info: ~18 rows (approximately)
/*!40000 ALTER TABLE `ts_member_info` DISABLE KEYS */;
INSERT INTO `ts_member_info` (`MEMBER_SEQ`, `USER_ID`, `GRADE_LEVEL`, `USER_PWD`, `PWD_CHANGE_DATE`, `USER_NAME`, `PHOTO`, `ICON`, `NICKNAME`, `VIRTUAL_NUMBER`, `EMAIL`, `PHONE`, `MOBILE`, `COMP_PHONE`, `HOMEPAGE`, `ZIPCODE`, `ADDR1`, `ADDR2`, `EMAIL_YN`, `SMS_YN`, `BIRTH_DT`, `IS_LUNAR`, `RECOMM_USER_ID`, `LOGIN_COUNT`, `RECENT_LOGIN_DATE`, `MEMO`, `MEMO_ADMIN`, `ADDITIONAL_ITEM1`, `ADDITIONAL_ITEM2`, `ADDITIONAL_ITEM3`, `ADDITIONAL_ITEM4`, `ADDITIONAL_ITEM5`, `JOB`, `EDUCATION`, `MONTH_INCOME`, `HOBBY`, `REG_DATE`, `USE_YN`, `WITHDRAWAL_YN`, `WITHDRAWAL_REASON`, `WITHDRAWAL_DT`) VALUES
	(3015, '169810071', 4, '', '2018-11-16 14:39:38', 'tago plus', NULL, NULL, '', '', 'tago-test-analytics@naver.com', '', '', '', '', '', '', '', 'Y', 'Y', '06-15', NULL, '', 0, NULL, '', '', '/image/member/20181206183227659001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-16 12:46:07', 'Y', 'N', NULL, '2018-12-06'),
	(3018, '115500842080145374681', 4, '', NULL, 'Batceceg Bace', NULL, NULL, NULL, NULL, 'batcecegn20@gmail.com', '', '', NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-16 13:31:15', 'Y', 'N', NULL, NULL),
	(3019, 'bagi', 4, 'jZae727K08KaOmKSgOaGzww_XVqGr_PKEgIMkjrcbJI', '2018-11-27 12:21:41', 'batceceg', NULL, NULL, '', '', 'bace_n20@yahoo.com', '', '010-1515-5415', '', '', '', '', '', 'Y', 'Y', '', NULL, '', 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-16 15:31:43', 'Y', 'N', NULL, '2018-11-27'),
	(3023, '114033678650248871722', NULL, '', NULL, 'billy bill', NULL, NULL, NULL, NULL, 'bilguun783@gmail.com', '', '', NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 11:16:36', 'Y', 'N', NULL, NULL),
	(3025, 'smilepyw', NULL, 'NIHZXyYyW_bnzrXpqr1eRtnfC_bp6rvn1Z6Q9dCuvDQ', NULL, '박영욱', NULL, NULL, NULL, '8888888888888', '@', '', '', '000-0000', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 18:49:55', 'Y', 'Y', ' 테스트', '2018-11-17'),
	(3026, '106846827462129672917', NULL, '', NULL, '박영욱', NULL, NULL, NULL, NULL, 'smilepyw@gmail.com', '', '', NULL, NULL, NULL, 'ko', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 18:54:23', 'Y', 'N', NULL, NULL),
	(3027, 'hinky139', NULL, '7nmXbJOA1eM3_BwJXs6MjyL5HzBs7rFh-lH-zt4sS6E', NULL, '황인규', NULL, NULL, NULL, '8888888888888', 'hink139@hanmail.net', '', '', '000-0000', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 19:29:10', 'Y', 'N', NULL, NULL),
	(3028, '961790161', NULL, '', NULL, 'smilepyw', NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-17 19:36:13', 'Y', 'N', NULL, NULL),
	(3029, '117063501355314487757', NULL, '', NULL, 'tagoplus billy', NULL, NULL, NULL, NULL, 'tagoplus.billy@gmail.com', '', '', NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-20 20:18:07', 'Y', 'N', NULL, NULL),
	(3032, 'aaaa', 4, 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ', '2018-11-29 11:21:00', 'aaa', NULL, NULL, '', '', 'aaaa@gmail.com', '', '', '', '', '', '', '', 'Y', 'Y', '', NULL, '', 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-23 15:45:32', 'Y', 'N', NULL, '2018-11-29'),
	(3033, '108440031531899286571', 4, '0bxwEp8OVW_BF3eIJFLi8QtdN5M_kGyf99ehChj_rdo', '2018-12-06 11:35:04', 'Munkhtenger Gankhuyag', NULL, NULL, NULL, NULL, 'skyline.mn12@gmail.com', '', '', NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 15:16:32', 'Y', 'N', NULL, '2018-12-06'),
	(3034, 'ariun', 4, '73l8gRjwLftklgfdXT-MdiMEjJwGPVMsyVxe16iYpk8', NULL, 'ariun', NULL, NULL, NULL, '', 'aaa@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 15:40:01', 'Y', 'N', NULL, NULL),
	(3035, 'bace20', 4, 't56he3xcqP6czNjNum6PjtCzyUj59wntD0fS_Uf8uoI', NULL, 'batceceg', NULL, NULL, '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', NULL, '', 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 15:50:17', 'Y', 'N', NULL, '2018-11-28'),
	(3036, 'bataa', 4, 'SySaQxrL5EgQHXa_t7oLBmq5ParT37sDyT2Q6BcwDOM', NULL, 'batceceg', NULL, NULL, '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', NULL, '', 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 16:00:20', 'Y', 'N', NULL, NULL),
	(3037, 'ariun1', 4, '73l8gRjwLftklgfdXT-MdiMEjJwGPVMsyVxe16iYpk8', NULL, '아류나', NULL, NULL, NULL, '', 'aajiina@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 17:40:08', 'Y', 'N', NULL, '2018-11-30'),
	(3038, '107532058942820424970', 4, '47DEQpj8HBSa-_TImW-5JCeuQeRkm5NMpJWZG3hSuFU', NULL, 'Test test', NULL, NULL, NULL, NULL, 'tago.test.analytics@gmail.com', '', '', NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 17:04:00', 'Y', 'N', NULL, NULL),
	(3039, 'billy_d', 4, 'PwjY-ttLZ_sFZiNWXtu8LHiAkdeP0ky8Rz_OMEPONHM', NULL, 'billy_d', NULL, NULL, NULL, '', 'bilguun783@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 18:40:15', 'Y', 'N', NULL, NULL),
	(3041, 'teste', 4, '0UcifyAOG849jLZ57uo_AR65XQq3NplKUnRLeneeJPU', NULL, 'tenger', NULL, NULL, NULL, '', 'gg@gmail.com', '', '', '', NULL, '', '', '', NULL, 'Y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-06 10:45:54', 'Y', 'N', NULL, NULL);
/*!40000 ALTER TABLE `ts_member_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
