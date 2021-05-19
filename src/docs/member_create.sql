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
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `USE_YN` varchar(1) DEFAULT 'Y' COMMENT '사용 여부 - 관리자',
  `WITHDRAWAL_YN` varchar(1) DEFAULT 'N' COMMENT '탈퇴 여부',
  `WITHDRAWAL_REASON` varchar(500) DEFAULT NULL COMMENT '탈퇴 사유',
  `WITHDRAWAL_DT` varchar(10) DEFAULT NULL COMMENT '탈퇴일',
  PRIMARY KEY (`MEMBER_SEQ`),
  UNIQUE KEY `UIN_TS_MEMBER_INFO_USER_ID` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3014 DEFAULT CHARSET=utf8 COMMENT='회원 정보\r\n - 모델, 매퍼 구성';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
