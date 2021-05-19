<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 회원가입페이지 --%>

<div id="all_wrp">
	<div id="wrapper">
		<%@ include file="/WEB-INF/include/lnb/join.jsp"%>
		<c:if test="${empty vo.memberSeq }">
			<c:set var="location" value="회원가입" />
		</c:if>

		<c:if test="${!empty vo.memberSeq }">
			<c:set var="location" value="회원정보 수정" />
		</c:if>

		<div id="container">
			<div id="title">
				<div class="fleft">
					<h2>
						<strong>회원가입</strong>
					</h2>
					<div class="tit_ex">솔루션의 선두주자! 타고플러스</div>
				</div>
				<div class="fright location">
					<img src="/images/ic_home.png" /> > 마이페이지 > ${location }
				</div>
			</div>
			<!--  end title -->

			<div id="content">
				<c:if test="${!empty search.id }">
					<jsp:include page="/module/member_edit" flush="true" />
				</c:if>
				<c:if test="${empty search.id }">
					<jsp:include page="/module/join" flush="true" />
				</c:if>
			</div>
			<!-- content -->
		</div>
		<!-- container -->
	</div>
	<!-- wrapper -->
</div>
<!-- all_wrp -->

<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>