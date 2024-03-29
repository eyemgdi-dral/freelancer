<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<div class="card">
			<div class="card-header">
				<div class="d-flex">
					<h3 class="mb-0">운영정책관리</h3>
					<a onclick="javascript:$.Nav('go', './write', {iDx:'0'});" class="ml-auto btn btn-primary btn-sm">운영정책등록</a>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-center">
					<colgroup>
						<col width="5%" />
						<col width="20%" />
						<col width="10%" />
						<col width="20%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>버전</th>
							<th>등록일</th>
							<th>등록자</th>
							
						</tr>
					</thead>
					<tbody>
<c:if test="${!empty list}">
	<c:forEach items="${list }" var="m" varStatus="s">
							<tr>
								<td>${s.index+1}</td>
								<td><a onclick="javascript:$.Nav('go', './write', {iDx: '${m.iDx}'});"> ${m.title}</a></td>
								<td>${m.version }.0</td>
								<td><fmt:formatDate pattern = "yyyy-MM-dd a hh:mm"     value = "${m.regDate }" /></td>
								<td>${m.regUser }</td>
							</tr>
	</c:forEach>
</c:if>
<c:if test="${empty list}">
						<tr>
							<td colspan="6"><s:message code="common.noData" /></td>
						</tr>
					</c:if>
					</tbody>
				</table>
				<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
			<br class="clear mb5" />
			
			<c:set var="delete"><s:message code="common.delete.msg" /></c:set>	
				</div>
			</div>
		</div>
	</div>	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>


<!--wrap_scon S-->
<div id="wrap_scon">

	<!-- -------------------------------------------------------------------------------------------------------------------------------- -->

	<div class="scon_title">
		<h2>운영정책설정</h2>
		<p>홈 &gt;기본설정 &gt; 운영정책설정 &gt; 리스트 </p>
	</div>
	<div class="scon">
	
		
			<div class="scon_search">
				
				<span class="fr"> 
					<a onclick="javascript:$.Nav('go', './write', {iDx:'0'});" class="btn bg_darkgray">운영정책등록  </a>
				</span>
			</div>
			<span class="table_aside">전체  : ${search.totalCount } </span>
			
	</div>
</div>
		<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">

</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>