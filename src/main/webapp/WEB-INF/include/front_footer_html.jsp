<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web front 공통 html <footer> 선언부
--%>

<div class="fixed_right">
	<a class="btn-primary btn" href="/common/동명TRM(20200810_편집본).pdf" target="_blank">
		<img src="/images/main/pdf.png">
		회사소개서
	</a>
	<a class="btn-kakao btn" href="https://open.kakao.com/o/sw2yGxTc" target="_blank">
		<img src="/images/main/kakao.png">
		카카오톡상담
	</a>
	<a class="btn" href="https://dmtrm.modoo.at/" target="_blank" style="background-color:#23b14d;color:white">
		<img src="/images/main/online.png">
		동명양수기
	</a>
</div>
<footer class="bg-gray-dark mt-6" id="footer-main">
	<div class="border-bottom" style="border-color:#616161 !important">
		<div class="container">
			<ul class="nav nav-footer py-2">
					<li class="nav-item"><a class="nav-link" href="/">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="/pages/page/010100">회사소개</a></li>
					<li class="nav-item"><a class="nav-link" href="/pages/page/010700">찾아오시는 길</a></li>
				</ul>
		</div>
	</div>
	<div class="py-4">
		<div class="container">
			<div class="row align-items-center justify-content-xl-between">
				<div class="col-xl-8">
					<div class="copyright text-center text-xl-left text-muted">
						${tagoplusSolution1_session_site.siteName} 
						<span class="ml-4">사업자등록번호 : ${tagoplusSolution1_session_site.footBusinessNumber }</span>
						<span class="ml-4">대표 : ${tagoplusSolution1_session_site.footRepName }</span>
						<br />
						
						
						주소 : ${tagoplusSolution1_session_site.footAddr1 } ${tagoplusSolution1_session_site.footAddr2 }
						<span class="ml-4">이메일  :${tagoplusSolution1_session_site.email }</span><br/>
						<span class="">대표번호 :${tagoplusSolution1_session_site.footPhone }</span>
						<span class="ml-4">FAX: ${tagoplusSolution1_session_site.footFax }</span> <br/>
						Copyright © 동명TRM All rights reserved.
					</div>
				</div>
				<div class="col-xl-4">
					<div class="text-center text-xl-right">
						<div class="d-none d-sm-block">
							<img src="${UPLOAD_ROOT}${tagoplusSolution1_session_site.logoImageFoot}">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
