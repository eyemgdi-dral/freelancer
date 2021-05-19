<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web admin 공통 html <head> 선언부
	메시지(message-common_ko_KR.properties) 사용 예 : <s:message code="title.front" /> : 전체 공통 사이트 명. globals.properties 참조
	${pageTitle } : controller에서 부제 추가 항목. globals.properties 참조
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" /> 
	
	<title>${tagoplusSolution1_session_site.siteName } ${!empty pageTitle ? ' - ' : ''} ${pageTitle }</title>
	<!-- <link href="/common/css/admin/master.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/user/default/main.css" rel="stylesheet" type="text/css"> -->
	
<!-- 	<link href="/common/css/admin/master.css" rel="stylesheet" type="text/css" />
 -->	
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
	<link rel="stylesheet" href="/common/assets/vendor/nucleo/css/nucleo.css" type="text/css">
	<link rel="stylesheet" href="/common/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
	<link rel="stylesheet" href="/common/assets/css/argon.css" type="text/css">
	<link rel="stylesheet" href="/common/assets/css/font.css" type="text/css">
  
	<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/redmond/jquery-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/jquery/colorbox_2/colorbox.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/jquery/selectize/selectize.default.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/googleAnalytics.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/jquery/datetimepicker/jquery.datetimepicker.min.css" rel="stylesheet" type="text/css" />
	<link href="/common/js/jquery/waitMe/waitMe.min.css" rel="stylesheet" type="text/css" />
	<link href="/common/js/highlight/styles/github.css" rel="stylesheet" type="text/css" />
	<link href="/common/assets/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet" type="text/css" />
	<link href="/common/assets/vendor/animate.css/animate.min.css" rel="stylesheet" type="text/css" />
	<link href="/common/js/cropper/cropper.min.css" rel="stylesheet" type="text/css" />
	
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js"></script>
	<script src="/common/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script src="/common/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/common/assets/vendor/js-cookie/js.cookie.js"></script>
	<script src="/common/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
	<script src="/common/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
	<script src="/common/assets/vendor/chart.js/dist/Chart.min.js"></script>
	<script src="/common/assets/vendor/chart.js/dist/Chart.extension.js"></script>
	<script src="/common/assets/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="/common/assets/vendor/moment.min.js"></script>
	<script src="/common/assets/vendor/bootstrap-datetimepicker.js"></script>
	<script src="/common/assets/vendor/bootstrap-datepicker/dist/locales/bootstrap-datepicker.ko.min.js"></script>
	<script src="/common/assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
	<script src="/common/assets/vendor/bootstrap-notify/bootstrap-notify.min.js"></script>
	<script src="/common/assets/vendor/dropzone/dist/dropzone.js"></script>

	<script type="text/javascript" src="/common/js/jquery/jquery-migrate-1.4.1.min.js"></script>
	<!-- <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
	<script type="text/javascript" src="/common/js/highlight/highlight.pack.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.locator.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.tmpl.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.tmplPlus.js"></script>
	<script type="text/javascript" src="/common/js/jquery/validation/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/validation/localization/messages_kor.js"></script>
	<script type="text/javascript" src="/common/js/jquery/colorbox/jquery.colorbox-min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.blockUI.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.oLoader.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/selectize/selectize.min.js"></script>
	<!-- <script type="text/javascript" src="/common/js/jquery/jquery.ui.datepicker.custom.js"></script> -->
	<script type="text/javascript" src="/common/js/jquery/fakeLoader.js"></script>
	<script type="text/javascript" src="/common/js/jquery/waitMe/waitMe.min.js"></script>
	<!-- <script type="text/javascript" src="/common/js/swfobject.js"></script> -->
	<script type="text/javascript" src="/common/js/lib.js"></script> 
    <script type="text/javascript" src="/common/js/common.js"></script>
    <script type="text/javascript" src="/common/js/common.jquery.util.js"></script>
    <script type="text/javascript" src="/common/js/cropper/cropper.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
    
</head>
<body>