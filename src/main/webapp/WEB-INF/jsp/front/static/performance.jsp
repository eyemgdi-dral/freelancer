<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>

<%-- 웹사이트 개발 - 견적 안내 --%>

	
	 
	<jsp:include page="/module/menu" flush="true" />
<style>
.board-tabs:not(#mainTab){
	display:none
}
</style>
<div class="">


	
	<c:set var="tabList">대표분야,특수청소분야,아파트빌딩관리,저수조청소업,방역소독업,일상분야,전기공사업</c:set>
	
	<jsp:include page="/module/submenu" flush="true">
		<jsp:param name="menuIdx" value="${menuIdx }" />
	</jsp:include>
	
			<div class="mb-8">
				<nav class="nav mb-4 board-tabs" id="mainTab">
					<c:forTokens items="${tabList}" delims="," var="tab" varStatus="s">
						<a href="javascript:$.Nav('self', {type1:'addCol4',searchWord: '${tab}',mode:'list'});"  class="nav-link ${search.searchWord eq tab or (s.index == 0 and empty search.searchWord) ? 'active':'' }">${tab}</a>
					</c:forTokens>
				</nav>
				<c:if test="${empty search.searchWord  }">
					<jsp:include page="/module/board.do" flush="false">
						<jsp:param name="bcode" value="gallery" />
						<jsp:param name="type1" value="addCol4" />
						<jsp:param name="searchWord" value="대표분야" />
					</jsp:include>
					<c:if test="${param.mode eq 'list' || empty param.mode}">
						<jsp:include page="/module/board.do" flush="false">
							<jsp:param name="bcode" value="business" />
							<jsp:param name="type1" value="addCol4" />
							<jsp:param name="searchWord" value="대표분야" />
						</jsp:include>
					</c:if>
					
				</c:if>
				<c:if test="${!empty search.searchWord  }">
					<jsp:include page="/module/board.do" flush="false">
						<jsp:param name="bcode" value="gallery" />
					</jsp:include>
					<c:if test="${param.mode eq 'list' || empty param.mode}">
						<jsp:include page="/module/board.do" flush="false">
							<jsp:param name="bcode" value="business" />
						</jsp:include>
					</c:if>
					
				</c:if>
								
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>