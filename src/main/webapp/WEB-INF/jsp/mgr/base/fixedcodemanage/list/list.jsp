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
		<form id="form1" action="./list" method="post" enctype="multipart/form-data">
			<input type="hidden" name="status" /> 
			<input type="hidden" name="regionSeq" />
			<div class='card'>
				<div class="card-header">
					<div class="row">
						<div class="col-md-6">
							전체 지역 : <fmt:formatNumber value="${search.count }" pattern="#,###" />
						</div>
						<div class="col-md-6 text-right">
							<a href="javascript:$.Nav('go', './writelist', {codeId:0});" class="btn btn-primary">add code</a>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<colgroup>
								<col width="5%" />
								<col width="8%" />
								<col width="10%" />
								<col width="5%" />
								<col width="5%" />
							</colgroup>
							<thead class="table-info">
								<tr>
									<th>code code</th>
									<th>code name</th>
									<th>code desc</th>
									<th>code desc2</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty list}">
									<c:forEach items="${list }" var="m" varStatus="s">
										<tr>
											<td>${m.codeCode}</td>
											<td>${m.codeName}</td>
											<td>${m.codeDesc }</td>
											<td>${m.codeDesc2 }</td>
											<td>
											<a onclick="javascript:$.Nav('go', './writelist', {codeId: '${m.codeCode }'});" class="btn btn-sm btn-info">수정</a> 
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty list}">
									<tr>
										<td colspan="9"><s:message code="common.noData" /></td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer">
					<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
					<c:set var="delete"><s:message code="common.delete.msg" /></c:set>	
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script type="text/javascript">
	
function doDelete(seq) {
	var sMsg = '${delete}';
	
	if (!confirm(sMsg))
		return;
	
	
	$('input[name=codeId]').val(seq);
	
	$('input[name=status]').val('d');
	
	$('#form1').submit();
}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>