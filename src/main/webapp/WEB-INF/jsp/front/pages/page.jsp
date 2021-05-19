<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>

<%-- 웹사이트 개발 - 견적 안내 --%>

	 
	<jsp:include page="/module/menu" flush="true" />
	
<div class="">
	<jsp:include page="/module/submenu" flush="true">
		<jsp:param name="menuIdx" value="${menuIdx }" />
	</jsp:include>
			<div class="col-lg-12">
				${vo.pageBody }
			</div>
		</div>
	</div>
</div>
<div class="container">
	
</div>


<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>