<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 팝업관리 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
		<div class="container-fluid mt--6">
			<div class="card">
				<div class="card-header">
					<div class="d-flex">
						<h3 class="mb-0">팝업관리</h3>
						<a onclick="javascript:$.Nav('go', './popup_write', {pseq:''});" class="ml-auto btn btn-primary btn-sm">팝업등록</a>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="35%" />
								<col width="15%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>공지기간</th>
									<th>등록일</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
								<tr>
									<td>${search.paging.virtualNumber - s.index }</td>
									<td>${m.subject }</td>
									<td>${m.startDt }~${m.endDt }</td>
									<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT }" /></td>
									<td>
										<a onclick="javascript:$.Nav('go', './popup_write', {pseq:${m.popupSeq}});" class="btn btn-sm btn-info">수정</a> 
										<a onclick="javascript:doDelete(${m.popupSeq});" class="btn btn-sm btn-danger">삭제</a>
									</td>
								</tr>
</c:forEach>
<c:if test="${empty list}">
								<tr>
									<td colspan="5"><s:message code="common.noData" /></td>
								</tr>
</c:if>				
							</tbody>
						</table>
						<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
						
					</div>
				</div>
			</div>
		</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	function doDelete(seq) {
		var sMsg = '${delete}';
		if (!confirm(sMsg))
			return;
		$.Nav('go', './popup_proc',{pseq:seq, status:'d'});
	}
	
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
