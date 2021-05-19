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

-- Dumping structure for table ts_0002.ts_menu
DROP TABLE IF EXISTS `ts_menu`;
CREATE TABLE IF NOT EXISTS `ts_menu` (
  `MENU_ID` varchar(6) NOT NULL COMMENT '	메뉴 ID	',
  `MENU_LEVEL` smallint(6) DEFAULT NULL COMMENT '	메뉴 LEVEL	',
  `PARENT_ID` varchar(6) DEFAULT NULL COMMENT '	부모 메뉴의 ID	',
  `MENU_NAME` varchar(50) DEFAULT NULL COMMENT '	메뉴명	',
  `MENU_TABLE` varchar(30) DEFAULT NULL COMMENT '	메뉴에서 사용하는 테이블	',
  `FOLDER_PATH` varchar(100) DEFAULT NULL COMMENT '	메뉴의 경로	',
  `PREFIX_PATH` varchar(50) DEFAULT NULL,
  `SORT_NUM` varchar(50) DEFAULT NULL COMMENT '	순서	',
  `USE_FLAG` char(1) NOT NULL COMMENT '	사용유무(U: 사용, S:미사용, D:삭제)	',
  `REG_USER` varchar(20) NOT NULL COMMENT '	등록자ID	',
  `REG_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `MOD_USER` varchar(20) DEFAULT NULL COMMENT '	수정자ID	',
  `MOD_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '	수정일	',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	관리자 페이지 메뉴를 구성. FOLDERPATH, FILENAME 등은 JAVA의 특성에 맞춰서 변경.	';

-- Dumping data for table ts_0002.ts_menu: ~68 rows (approximately)
/*!40000 ALTER TABLE `ts_menu` DISABLE KEYS */;
INSERT INTO `ts_menu` (`MENU_ID`, `MENU_LEVEL`, `PARENT_ID`, `MENU_NAME`, `MENU_TABLE`, `FOLDER_PATH`, `PREFIX_PATH`, `SORT_NUM`, `USE_FLAG`, `REG_USER`, `REG_DATE`, `MOD_USER`, `MOD_DATE`) VALUES
	('060000', 1, '', '게시판관리', 'зарлалын самбар тохиргоо ', '/board/manage/board_list', '/board/manage/board,boardCode', '5', 'U', 'tago', '2018-10-23 10:51:03', 'tago', '2019-01-11 10:19:18'),
	('060100', 2, '060000', '게시판 관리', 'Level 2', '/board/manage/board_list', '/board/manage/board,boardCode', '5.1', 'U', 'tago', '2018-10-24 12:56:24', 'tago', '2019-01-11 10:19:19'),
	('060101', 3, '060100', '게시판 관리', 'Level 3', '/board/manage/board_list', '/board/manage/board,boardCode', '5.1.1', 'U', 'tago', '2018-10-24 13:40:55', 'tago', '2019-01-11 10:19:20'),
	('060102', 3, '060100', '게시물 통합관리', 'Level 3', '/board/manage/article_list', '{boardCode},bseq', '5.1.2', 'U', 'tago', '2018-10-24 13:41:26', 'tago', '2019-01-11 10:19:38'),
	('060103', 3, '060100', '코멘트 통합관리', 'Level 3', '/board/manage/comment_list', '/board/manage/comment,commentSeq', '5.1.5', 'U', 'tago', '2018-10-24 13:42:03', 'tago', '2019-01-11 10:20:37'),
	('060104', 3, '060100', '게시판 통계', 'Level 3', '/board/manage/statistics_boards', '/board/manage/statistics', '5.1.5', 'U', 'tago', '2018-10-24 13:42:36', 'tago', '2019-01-09 17:20:46'),
	('061400', 2, '060000', '간편 상담', '', '/board/quick_list', '/board/quick,idx', '5.2', 'U', 'tago', '2018-11-29 12:29:07', 'tago', '2019-01-11 10:20:50'),
	('061434', 3, '061400', '간편 상담', '', '/board/quick_list', '/board/quick,idx', '5.2.1', 'U', 'tago', '2018-11-29 12:30:39', 'tago', '2019-01-11 10:20:53'),
	('061700', 2, '060000', '게시판 목록', 'board sub', '#', '/board/list/', '5.3', 'U', 'tago', '2019-01-13 14:24:44', NULL, NULL),
	('070000', 1, '', '회원관리', ' гишүүнчлэл тохиргоо', '/member/manage/member_list', '/member/manage/member,mseq', '3', 'U', 'tago', '2018-10-23 10:51:29', 'tago', '2019-01-11 10:21:52'),
	('070100', 2, '070000', '회원 관리', 'Level 2', '/member/manage/member_list', '/member/manage/member,mseq', '3.1', 'U', 'tago', '2018-10-24 12:57:27', 'tago', '2019-01-11 10:21:55'),
	('070101', 3, '070100', '회원 관리', 'Level 3', '/member/manage/member_list', '/member/manage/member,mseq', '3.1.1', 'U', 'tago', '2018-10-24 13:52:12', 'tago', '2019-01-11 10:22:03'),
	('070102', 3, '070100', '회원등급 관리', 'Level 3', '/member/manage/grade_list', '/member/manage/grade,glevel', '3.1.2', 'U', 'tago', '2018-10-24 13:52:47', 'tago', '2019-01-11 10:22:22'),
	('070103', 3, '070100', '탈퇴 회원', 'level 3', '/member/manage/withdrawal_list', '/member/manage/withdrawal', '3.1.3', 'U', 'tago', '2018-10-24 13:53:32', 'tago', '2019-01-09 17:21:08'),
	('070104', 3, '070100', '이메일 설정', 'Level 3', '/member/manage/mail_list', '/member/manage/mail,emseq', '3.1.5', 'U', 'tago', '2018-10-24 13:54:34', 'tago', '2019-01-11 10:23:02'),
	('070107', 3, '070100', '단체 메일 발송', 'Level 3', '/member/manage/mailer_test', '/member/manage/mailer', '3.1.3', 'U', 'tago', '2018-10-24 13:57:05', 'tago', '2019-01-09 17:21:15'),
	('080000', 1, '', '폼메일관리', 'form mail тохиргоо', '/formmail/manage/list', '{formSeq},fwseq', '6', 'U', 'tago', '2018-10-23 10:52:06', 'tago', '2019-01-13 13:47:45'),
	('080100', 2, '080000', '폼메일 관리', 'Level 2', '/formmail/manage/list', '{formSeq},fwseq', '6.1', 'U', 'tago', '2018-10-24 12:58:02', 'tago', '2019-01-13 13:47:43'),
	('080101', 3, '080100', '폼메일관리', 'Level 3', '/formmail/manage/list', '{formSeq},fwseq', '6.1.1', 'U', 'tago', '2018-10-24 13:58:05', 'tago', '2019-01-13 13:47:49'),
	('080113', 3, '080100', '폼메일생성', 'Level 3', '/formmail/manage/formmail_list', '/formmail/manage/form,fseq', '6.1.2', 'U', 'tago', '2018-11-20 11:53:47', NULL, '2019-01-13 13:19:52'),
	('081600', 2, '080000', '폼메일 목록', 'for mail sub', '#', '/formmail/list/', '6.2', 'U', 'tago', '2019-01-13 13:26:01', NULL, NULL),
	('090000', 1, '', '배너관리', 'Pop up banner тохиргоо', '/banner/manage/banner_list', '/banner/manage/banner,bmSeq', '7', 'U', 'tago', '2018-10-23 10:52:32', 'tago', '2019-01-11 11:13:06'),
	('090100', 2, '090000', '배너 관리', 'Level 2', '/banner/manage/banner_list', '/banner/manage/banner,bmSeq', '7.1', 'U', 'tago', '2018-10-24 12:59:12', 'tago', '2019-01-11 11:13:09'),
	('090101', 3, '090100', '배너 관리', 'Level 3', '/banner/manage/banner_list', '/banner/manage/banner,bmSeq', '7.1.1', 'U', 'tago', '2018-10-24 14:02:37', 'tago', '2019-01-11 11:13:12'),
	('091500', 2, '090000', '배너 목록', 'banner level 2', '/banner/list', '{bmSeq},biseq', '7.2', 'U', 'tago', '2019-01-11 15:56:31', 'tago', '2019-01-11 16:24:31'),
	('100000', 1, '', '통계관리', 'Statistics', '/stat/manage/stat_list', '/stat/manage/stat_list', '8', 'U', 'tago', '2018-10-23 10:52:55', 'tago', '2019-01-09 17:21:39'),
	('100100', 2, '100000', '접속통계', 'Level 2', '/stat/manage/stat_user', '/stat/manage/stat_user', '8.1', 'U', 'tago', '2018-10-24 13:00:31', 'tago', '2019-01-09 17:21:41'),
	('100101', 3, '100100', '접속자 분석', 'Level 3', '/stat/manage/stat_user', '/stat/manage/stat_user', '8.1.2', 'U', 'tago', '2018-10-24 14:04:20', 'tago', '2019-01-09 17:21:42'),
	('100102', 3, '100100', '접속경로 분석', 'Level 3', '/stat/manage/stat_path', '/stat/manage/stat_path', '8.1.1', 'U', 'tago', '2018-10-24 14:04:51', 'tago', '2019-01-09 17:21:43'),
	('100103', 3, '100100', '검색 키워드 분석', 'Level 3', '/stat/manage/stat_keyword', '/stat/manage/stat_keyword', '8.1.4', 'U', 'tago', '2018-10-24 14:05:14', 'tago', '2019-01-09 17:21:46'),
	('100104', 3, '100100', 'OS/브라우저', 'Level 3', '/stat/manage/stat_operator', '/stat/manage/stat_operator', '8.1.3', 'U', 'tago', '2018-10-24 14:05:53', 'tago', '2019-01-09 17:21:48'),
	('110000', 1, '', '페이지관리', 'Page Config', '/page/list_pages', '/page,pseq', '4', 'U', 'tago', '2018-11-20 09:38:14', 'tago', '2019-01-11 11:13:49'),
	('110500', 2, '110000', '페이지 관리', 'Level 2', '/page/list_pages', '/page,pseq', '4.1', 'U', 'tago', '2018-11-20 12:16:31', 'tago', '2019-01-11 11:13:52'),
	('110514', 3, '110500', '페이지관리', 'Level 3', '/page/list_pages', '/page,pseq', '4.1.1', 'U', 'tago', '2018-11-20 12:17:08', 'tago', '2019-01-11 11:13:55'),
	('120000', 1, '', '상품관리', 'Product', '/prd/manage/cate_list', '/cate,cateIdx', '9', 'U', 'tago', '2018-11-20 10:18:03', 'tago', '2019-01-11 15:00:07'),
	('120600', 2, '120000', '상품 관리', 'Level 2', '/prd/manage/cate_list', '/cate,cateIdx', '9.1', 'U', 'tago', '2018-11-20 12:19:01', 'tago', '2019-01-11 15:00:05'),
	('120615', 3, '120600', '상품 관리', 'Level 3', '/prd/manage/prd_list', '/prd,prdseq', '9.1.1', 'U', 'tago', '2018-11-20 12:20:10', 'tago', '2019-01-11 14:59:56'),
	('120616', 3, '120600', '카테고리 관리', 'Level 3', '/prd/manage/cate_list', '/cate,cateIdx', '9.1.2', 'U', 'tago', '2018-11-20 12:21:03', 'tago', '2019-01-11 15:00:01'),
	('130000', 1, '', '기본설정', 'basic settings', '/base/basic/site_info', '/base/basic/site_info', '2', 'U', 'tago', '2018-11-20 10:32:16', 'tago', '2019-01-09 17:22:27'),
	('130400', 2, '130000', '기본설정', 'Level 2', '/base/basic/site_info', '/base/basic/site_info', '2.1', 'U', 'tago', '2018-11-20 11:25:59', 'tago', '2019-01-09 17:22:27'),
	('130408', 3, '130400', '사이트 정보', 'Level 3', '/base/basic/site_info', '/base/basic/site_info', '2.1.1', 'U', 'tago', '2018-11-20 11:29:56', NULL, '2019-01-09 17:22:28'),
	('130409', 3, '130400', '관리자 설정', 'Level 3', '/base/basic/admin_list', '/base/basic/admin,aid', '2.1.2', 'U', 'tago', '2018-11-20 11:30:42', NULL, '2019-01-11 11:14:44'),
	('130411', 3, '130400', '팝업 관리', 'Level 3', '/base/basic/popup_list', '/base/basic/popup,popupSeq', '2.1.4', 'U', 'tago', '2018-11-20 11:32:19', NULL, '2019-01-11 11:14:48'),
	('130412', 3, '130400', '가입약관 및 개인정보 보호정책', 'Level 3', '/base/basic/policies/list', '/base/basic/policies,iDx', '2.1.5', 'U', 'tago', '2018-11-20 11:33:02', NULL, '2019-01-11 11:14:58'),
	('140000', 1, '', '환경설정', 'level 1', '/config/basic/sys_configuration', '/config/basic/', '1', 'U', 'tago', '2018-11-26 16:46:10', 'tago', '2019-01-09 17:17:05'),
	('140700', 2, '140000', '기본설정', 'Level 2', '/config/basic/sys_configuration', '/config/basic', '1.1', 'U', 'tago', '2018-11-26 16:48:55', 'tago', '2019-01-09 17:20:00'),
	('140717', 3, '140700', '기본설정', 'level 3', '/config/basic/sys_configuration', '/config/basic', '1.1.1', 'U', 'tago', '2018-11-26 16:49:29', 'tago', '2019-01-09 17:20:07'),
	('140718', 3, '140700', '로그분석', 'level 3', '/config/basic/log', '/config/basic/log', '1.1.2', 'U', 'tago', '2018-11-26 16:51:18', NULL, '2019-01-09 17:22:43'),
	('140719', 3, '140700', '팝업관리', 'level 3', '/config/basic/popup', '/config/basic/popup', '1.1.3', 'U', 'tago', '2018-11-26 16:52:01', NULL, '2019-01-09 17:22:46'),
	('140720', 3, '140700', '폼메일', 'level 3', '/config/basic/form', '/config/basic/form', '1.1.4', 'U', 'tago', '2018-11-26 16:52:30', NULL, '2019-01-09 17:22:48'),
	('140721', 3, '140700', '배너관리', '', '/config/basic/banner', '/config/basic/banner', '1.1.5', 'U', 'tago', '2018-11-26 16:52:56', 'tago', '2019-01-09 17:22:51'),
	('140722', 3, '140700', '페이지관리', '', '/config/basic/page', '/config/basic/page', '1.1.6', 'U', 'tago', '2018-11-26 16:55:19', 'tago', '2019-01-09 17:22:54'),
	('140723', 3, '140700', '페이지 접근권한', '', '/config/basic/auth_page', '/config/basic/auth_page', '1.1.7', 'U', 'tago', '2018-11-26 16:59:17', NULL, '2019-01-09 17:22:57'),
	('140800', 2, '140000', '게시판', '', '/config/board/manage', NULL, '1.2', 'U', 'tago', '2018-11-26 17:03:40', NULL, '2018-11-27 10:57:12'),
	('140824', 3, '140800', '게시판', '', '/config/board/manage', NULL, '1.2.1', 'U', 'tago', '2018-11-26 17:04:40', NULL, '2018-11-27 10:57:12'),
	('140825', 3, '140800', '메인게시물', '', '/config/board/main_manage', NULL, '1.2.2', 'U', 'tago', '2018-11-26 17:05:21', NULL, '2018-11-27 10:57:12'),
	('140900', 2, '140000', '상품 관리', '', '/config/prd/manage', NULL, '1.3', 'U', 'tago', '2018-11-26 17:05:53', NULL, NULL),
	('140926', 3, '140900', '상품 리스트', '', '/config/prd/manage', NULL, '1.3.1', 'U', 'tago', '2018-11-26 17:06:23', NULL, NULL),
	('140927', 3, '140900', '메인 &amp; 추천 상품', '', '/config/prd/main_manage', NULL, '1.3.2', 'U', 'tago', '2018-11-26 17:06:58', NULL, NULL),
	('141000', 2, '140000', '회원관리', '', '/config/member/manage', NULL, '1.4', 'U', 'tago', '2018-11-26 17:08:16', NULL, NULL),
	('141028', 3, '141000', 'SNS설정', '', '/config/member/sns', NULL, '1.4.2', 'U', 'tago', '2018-11-26 17:09:32', NULL, '2018-11-26 17:10:34'),
	('141029', 3, '141000', '회원가입설정', '', '/config/member/manage', NULL, '1.4.1', 'U', 'tago', '2018-11-26 17:10:24', NULL, '2018-11-26 17:10:34'),
	('141100', 2, '140000', 'API관리', '', '/config/siteapi/api', NULL, '1.5', 'U', 'tago', '2018-11-26 17:11:35', NULL, NULL),
	('141130', 3, '141100', 'API관리', '', '/config/siteapi/api', NULL, '1.5.1', 'U', 'tago', '2018-11-26 17:12:00', 'tago', '2018-11-26 17:12:07'),
	('141200', 2, '140000', '포인트관리', '', '/config/point/manage', NULL, '1.6', 'U', 'tago', '2018-11-26 17:12:41', NULL, NULL),
	('141231', 3, '141200', '포인트관리', '', '/config/point/manage', NULL, '1.6.1', 'U', 'tago', '2018-11-26 17:13:09', NULL, NULL),
	('141300', 2, '140000', 'SEO관리', '', '/config/sitemeta/seo_list', NULL, '1.7', 'U', 'tago', '2018-11-26 17:14:09', 'tago', '2019-01-07 12:10:49'),
	('141332', 3, '141300', 'SEO관리', '', '/config/sitemeta/seo_list', NULL, '1.7.1', 'U', 'tago', '2018-11-26 17:14:31', 'tago', '2019-01-07 12:11:00');
/*!40000 ALTER TABLE `ts_menu` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
