<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	기본 설정> 관리자 설정 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
	<form id="form1" action="./admin_proc" method="post">
		<input type="hidden" name="status" value="d" />
		<input type="hidden" name="aid"  />
		<div class="card">
			<div class="card-header">
				<div class="d-flex">
					<h3 class="mb-0">관리자 관리</h3>
					<a onclick="javascript:doWrite('');" class="ml-auto btn btn-primary btn-sm">관리자 등록</a>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-botdered text-center">
						<colgroup>
							<col width="10%" />
							<col width="20%" />
							<col width="20%" />
							<col width="25%" />
							<col width="25%" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>성명</th>
								<th>등록일</th>
								<th>기능</th>
							</tr>
						</thead>
						<tbody>
<c:if test="${!empty list}">
	<c:forEach var="m" items="${list }" varStatus="s">			
							<tr>
								<td>${search.paging.virtualNumber - s.index }</td>
								<td>${m.adminId }</td>
								<td>${m.adminName }</td>
								<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT }"/></td>
								<td>
									<a href="javascript:doWrite('${m.adminId }')" class="btn btn-sm btn-info">보기</a>
									<a href="javascript:doDelete('${m.adminId }');" class="btn btn-sm btn-danger">삭제</a>
								</td>
							</tr>
	</c:forEach>
</c:if>
<c:if test="${empty list}">
							<tr>
								<td colspan="5"><s:message code="common.noData" /></td>
							</tr>
</c:if>
						</tbody>
					</table>
				</div>
				<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
			</div>
			<div class="card-footer">
		
			</div>
		</div>
	</form>
		
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>


<!--wrap_scon S-->
<div id="wrap_scon">


	<div class="scon_title">
		<h2>관리자 설정</h2>
		<p>홈 &gt; 기본 설정 &gt; 관리자 설정</p>
	</div>

	<div class="scon">
		<form id="form1" action="./admin_proc" method="post">
		<div class="scon_search">
			<ul class="table_aside02">
				<li></li>
			</ul>
		</div>
		
		</form>
	</div>
</div>
<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>		
<script type="text/javascript">
	$(function() {
	
	});
	
	function doWrite(aid) {
		$.Nav('go', './admin_write', {aid:aid});
	}
	
	function doDelete(aid) {
		var sMsg = '${delete}';
		
		if (!confirm(sMsg))
			return;
		$('input[name=aid]').val(aid);
		
		$('#form1').submit();
	}

</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>