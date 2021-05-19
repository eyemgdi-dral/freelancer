<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원등급 관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="./grade_proc.do" method="post">
			<input type="hidden" name="glevel" />
			<input type="hidden" name="status" />
			<div class="card">
				<div class="card-header">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-6">
								<h3 class="mb-0"></h3>
							</div>
							<div class="col-sm-6 text-right">
								<a onclick="javascript:$.Nav('go', './grade_write.do', {glevel:''});" class="btn btn-sm btn-primary">등급 추가</a>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<colgroup>
								<col width="7%" />
								<col width="10%" />
								<col width="*" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<thead class="table-info">
								<tr>
									<th>번호</th>
									<th>등급 레벨</th>
									<th>등급</th>
									<th>회원 보기</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody>
				<c:forEach var="m" items="${list }" varStatus="s">
								<tr>
									<td>${s.index + 1 }</td>
									<td>${m.gradeLevel }</td>
									<td>${m.gradeName }</td>
									<td>
						<c:if test="${m.gradeLevel ne 1}">						
										<a onclick="javascript:$.Nav('go', './member_list.do', {glevel: '${m.gradeLevel}'});" class="bt_copy btn btn-sm btn-info">회원 보기</a>
						</c:if>
						<c:if test="${m.gradeLevel eq 1}">
										<a onclick="javascript:$.Nav('go', '${URL_ADMIN_ROOT }/base/basic/admin_list.do', null, null, true);" class="bt_copy btn btn-sm btn-info">관리자 보기</a>
						</c:if>
									</td>
									<td>
						<c:if test="${m.gradeLevel ne 1}">					
										<a onclick="javascript:$.Nav('go', './grade_write.do', {glevel: '${m.gradeLevel}'});" class="bt_modify btn btn-sm btn-primary">수정</a>
										<a onclick="javacript:doDelete('${m.gradeLevel}');" class="bt_delete  btn btn-sm btn-danger">삭제</a>
						</c:if>
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
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>


<script type="text/javascript">
	$(function() {
	});
	
	function doDelete(glevel) {
		if(!confirm('삭제하시겠습니까?'))
			 return;

		$('input[name=glevel]').val(glevel);
		$('input[name=status]').val('d');
		$('#form1').submit();	
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>