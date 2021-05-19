<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<div class="card">
			<div class="card-header">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<h3 class='mb-0'>총 메뉴  : <fmt:formatNumber value="${search.totalCount }" pattern="#,###" /></h3>						
						</div>
						<div class="col-md-6 text-right">
							<a onclick="javascript:$.Nav('go', './write', {xD:''});" class="btn btn-sm btn-dark">그룹등록  </a>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="*" />
							<col width="20%" />
							<col width="10%" />
						</colgroup>
						<thead class="table-info">
							<tr>
								<th>그룹명</th>
								<th>설명</th>
								<th>소속 관리자</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
<c:if test="${!empty list}">
	<c:forEach items="${list }" var="m" varStatus="s">
								<tr>
									<td>${m.authoTitle }</td>
									<td>${m.authoContents }</td>
									<td>
		<c:forEach items="${m.userList }" var="adminId" varStatus="l">
			 <c:if test="${l.index eq 0}">${adminId }</c:if>
			 <c:if test="${l.index ne 0}">, ${adminId }</c:if>
		</c:forEach>
									</td>
									<td>
										<a onclick="javascript:$.Nav('go', './write', {xD: '${m.idX}'});" class="btn btn-sm btn-info">수정</a>
									</td>
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
				</div>
			</div>
		</div>
	</div>
	<c:set var="delete"><s:message code="common.delete.msg" /></c:set>	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script type="text/javascript">
$(function (){
	
})
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>