<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
	Top MyPage/Logout Url, Img
 --%>
<c:if test="${!empty tagoplusSolution1_session_user }">

	<ul class="navbar-nav ml-lg-auto">
		<li class="nav-item">
			<a class="nav-link nav-link-icon" href="javascript:$.Nav('go', '${setting1.memInfoUrl }', null);">
				<i class="ni ni-circle-08"></i>
				<span class="nav-link-inner--text d-lg-none">마이페이지</span>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link nav-link-icon" href="javascript:doLogout();">
				<i class="ni ni-button-power"></i>
				<span class="nav-link-inner--text d-lg-none">로그아웃</span>
			</a>
		</li>
	</ul>
	<script>
		function doLogout() {
			$.Nav('go', '/logout', null, null, true);	
		}
	</script>
</c:if>