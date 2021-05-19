<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>

	 
	<jsp:include page="/module/menu" flush="true" />
	
<div class="">
	<input type="hidden" name="menuIdx" value="${menuIdx}" />
	<jsp:include page="/module/submenu" flush="true">
		<jsp:param name="menuIdx" value="${menuIdx }" />
	</jsp:include>
	<c:choose>
		<c:when test="${search.mode eq 'view'}">
			<jsp:include page="/module/bbs/view" flush="true" >
				<jsp:param name="bcode" value="${search.bcode }" />
			</jsp:include>
		</c:when>
		<c:when test="${search.mode eq 'write'}">
			<jsp:include page="/module/bbs/write" flush="true">
				<jsp:param name="bcode" value="${search.bcode }" />
			</jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="/module/bbs/list" flush="true">
				<jsp:param name="bcode" value="${search.bcode }" />
			</jsp:include>
		</c:otherwise>
	</c:choose>
		
		</div>
	</div>
</div>
	
<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>