<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 회원가입페이지 --%>

<div id="all_wrp">
	<div id="wrapper">
		<%@ include file="/WEB-INF/include/lnb/join.jsp"%>
		<div id="container">
			<div id="title">
				<div>
					<h2><strong>적립금 리스트</strong></h2>
					<!-- <div class="tit_ex">솔루션의 선두주자! 타고플러스</div> -->
				</div>
				<div class="location"><img src="/images/ic_home.png" /> > 마이페이지 > 적립금 리스트</div>
			</div><!--  end title -->
			
			<div id="content">
				<c:if test="${!empty tagoplusSolution1_session_user }">
				<div class="stit mT30">적립금 리스트</div>
					<table class="board_list mT15">
						<colgroup>
							<col width="170px"/>
							<col width="*"/>
						</colgroup>
						<thead>
							<tr>
								<th class="acen" width="100px">번호</th>
								<th class="acen" width="100px">적립내용</th>
								<th class="acen" width="100px">금액</th>
								<th class="acen" width="100px">수정자명</th>
								<th class="acen" width="100px">수정사유</th>
								<th class="acen" width="100px">날짜</th>
							</tr>
						<tbody>
						<c:if test="${!empty tagoplusSolution1_session_user.cmomey}">
							<c:forEach items="${tagoplusSolution1_session_user.cmomey }" var="m" varStatus="s">
							<tr>
								<td class="first">${s.index+1 }</td>
								<td>${m.summary }</td>
								<td>${m.cMoney }</td>
								<td>${m.editorName }</td>
								<td>${m.reason }</td>
								<td><fmt:formatDate value="${m.regDate }"
										pattern="${DATE_FORMAT}" /></td>
							</tr>	
							</c:forEach>
						</c:if>					
						</tbody>
					</table>
			</c:if>
			</div><!-- content -->
		</div><!-- container -->
	</div><!-- wrapper -->
</div><!-- all_wrp -->	
<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>