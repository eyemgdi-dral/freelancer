<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
  PC web front 공통 html <head> 선언부
	메시지(message-common_ko_KR.properties) 사용 예 : <s:message code="title.front" /> : 전체 공통 사이트 명. globals.properties 참조
  ${pageTitle } : controller에서 부제 추가 항목. globals.properties 참조
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<jsp:include page="/module/siteMeta" flush="true"/>
	
	<title>${tagoplusSolution1_session_site.siteName }${!empty pageTitle ? ' - ' : ''}${pageTitle }</title>
	
	<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/redmond/jquery-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="/common/js/jquery/bxslider/jquery.bxslider.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/jquery/fakeLoader/fakeLoader.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/jquery/colorbox_2/colorbox.css" rel="stylesheet" type="text/css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="/common/assets/vendor/animate.css/animate.min.css" rel="stylesheet" type="text/css" />
<!-- 	<link href="/common/css/optional/style.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/user/default/common.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/user/default/layout.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/user/default/main.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/user/default/sub.css" rel="stylesheet" type="text/css" /> -->
	
	<link rel="stylesheet" href="/common/assets/vendor/nucleo/css/nucleo.css" type="text/css">
	<link rel="stylesheet" href="/common/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
	<link rel="stylesheet" href="/common/assets/scss/css/argon.css" type="text/css">
	<link rel="stylesheet" href="/common/js/slick/slick.css" type="text/css">
	<link rel="stylesheet" href="/common/js/slick/slick-theme.css" type="text/css">
	<link href="/common/css/user/dongmyong/style.css" rel="stylesheet" type="text/css" />
	
	<script src="/common/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script src="/common/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/common/assets/vendor/js-cookie/js.cookie.js"></script>
	<script src="/common/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
	<script src="/common/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
	<script src="/common/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="/common/assets/vendor/moment.min.js"></script>
	<script src="/common/assets/vendor/bootstrap-datetimepicker.js"></script>
	<script src="/common/assets/vendor/bootstrap-datepicker/dist/locales/bootstrap-datepicker.ko.min.js"></script>
	<script src="/common/assets/vendor/feather/feather.min.js"></script>
	
	<script type="text/javascript" src="/common/js/jquery/jquery-migrate-1.4.1.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.locator.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.tmpl.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.tmplPlus.js"></script>
	<script type="text/javascript" src="/common/js/jquery/colorbox/jquery.colorbox-min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.blockUI.js"></script>
	<script type="text/javascript" src="/common/js/jquery/bxslider/jquery.bxslider.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.oLoader.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.ui.datepicker.custom.js"></script>
	<script type="text/javascript" src="/common/js/jquery/fakeLoader.js"></script>
	<script type="text/javascript" src="/common/js/lib.js"></script> 
    <script type="text/javascript" src="/common/js/common.jquery.util.js"></script>
    <script type="text/javascript" src="/common/js/common.js"></script>
    <script type="text/javascript" src="/common/js/slick/slick.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <jsp:include page="/module/connect" flush="true" />

</head>
<body>
