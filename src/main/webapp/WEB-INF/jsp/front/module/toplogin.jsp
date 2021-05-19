<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
	Top Login/Join Url, Img
 --%>
<c:if test="${empty tagoplusSolution1_session_user }">
	<div class="ml-lg-auto">
		<a class="btn btn-link" href="${setting1.memRegUrl }">회원가입</a>
		<a class="btn btn-outline-primary" href="javascript:$.Nav('go', '${setting1.memLoginUrl }');">
			로그인
		</a>
	</div>
</c:if>
