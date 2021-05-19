<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	
	<form id="form1" action="./proc.do" method="post" enctype="multipart/form-data">
	<div class="container-fluid mt--6">
			<input type="hidden" name="useFlag" />
			<input type="hidden" name="regUser" />
			<input type="hidden" name="status" />
			<input type="hidden" name="seoIdx" />
			<div class="row align-items-center">
				<div class="col-auto">
					<div class="input-group overflow-hidden rounded-pill">
						<div class="input-group-prepend">
							<tt:select name="groupIdx" list="${commgrouplist }" listKey="commGroupIdx" listValue="title" indexKey="0" indexValue="전체그룹"  selected="${vo.groupIdx }" />
						</div>
						<input class="form-control" type="text" name='searchWord' value="${search.searchWord }">
						<div class="input-group-prepend">
							<a href="javascript:findbysearch();" class="btn btn-icon btn-white">
								<i class="fa fa-search"></i>
							</a>	
						</div>
					</div>
				
				</div>
				<div class="col text-right">
					<a href="javascript:$.Nav('go', './seo_write', {seoIdx:0});" class="btn btn-neutral">타이틀 등록</a>
				</div>
			</div>
		
		
		<div class="card mt-5">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="5%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="5%" />
							<col width="5%" />
							<col width="10%" />					
						</colgroup>
						<thead class="table-info">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>페이지주소</th>						
								<th>페이지 title</th>
								<th>사용여부</th>
								<th>등록일</th>
								<th>수정/삭제</th>						
							</tr>
						</thead>
						<tbody>
						
<c:if test="${!empty list}">
	<c:forEach items="${list }" var="m" varStatus="s">
									<tr>
										<td>${search.paging.virtualNumber - s.index }</td>
										<td>${m.metaTitle }</td>
										<td>${m.pageLink }</td>
										<td>${m.pageName }</td>
										<td><c:if test="${m.useFlag=='U'}">사용</c:if><c:if test="${m.useFlag=='S'}">사용하지</c:if></td>
										<td><fmt:formatDate pattern = "yyyy-MM-dd a hh:mm"     value = "${m.regDate }" /></td>
										<td>
											<a onclick="javascript:$.Nav('go', './seo_write', {seoIdx: '${m.seoIdx }',useFlag:'${m.useFlag}'} );" class="btn btn-sm btn-primary">수정</a>
											<a href="javascript:doDelete(${m.seoIdx });" class="btn btn-sm btn-danger">삭제</a>
										</td>
									</tr>
	</c:forEach>
</c:if>
<c:if test="${empty list}">
								<tr>
									<td colspan="8"><s:message code="common.noData" /></td>
								</tr>
</c:if>
						</tbody>
					</table>
				</div>
				</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
				<c:set var="delete">
					<s:message code="common.delete.msg" />
				</c:set>
			</div>
		</div>
		
	</div>
	</form>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script type="text/javascript">
	function doDelete(MetaIdx) {
		var sMsg = '${delete}';
		if (!confirm(sMsg))
			return;					

		$('input[name=seoIdx]').val(MetaIdx);				
		$('input[name=useFlag]').val('d');
		$('#form1').submit();
	}
	function findbysearch(){
		
		$.Nav('go', './seo_list', {id: $('select[name=groupIdx]').val(), status:'s',searchWord: $('input[name=searchWord]').val()});
	
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>