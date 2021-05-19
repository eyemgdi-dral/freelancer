<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	배너그룹관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action='./banner_proc' method="post" >
			<input type="hidden" name="bseq" />
			<input type="hidden" name="status" />
			<div class="card">
				<div class="card-header">
					<div class="row">
						<div class="col-md-6">
							<h3>총 배너그룹수 : ${search.totalCount }</h3>
						</div>
						<div class="col-md-6 text-right">
							<a href="javascript:$.Nav('go', './banner_write', {bseq:0});" class="btn btn-primary">배너그룹생성</a>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<colgroup>
								<col width="10%" />
								<col width="15%" />
								<col width="10%" />
								<col width="10%" />
								<col width="*" />
								<col width="15%" />
								<col width="10%" />
								<col width="25%" />
							</colgroup>
							
							<thead class="table-info">
								<tr>
									<th>번호</th>
									<th>그룹명</th>
									<th>코드</th>
									<th>이미지</th>
									<th>형태</th>
									<th>줄바꿈 배너 수</th>
									<th>사용여부</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody>
			<c:forEach var="m" items="${list }" varStatus="s">
								<tr>
									<td>${m.bmSeq }</td>
									<td><a onclick="javascript:$.Nav('go','./banner_write', {bseq:${m.bmSeq}});">${m.masterName }</a></td>
									<td><a onclick="javascript:$.Nav('go','./banner_write', {bseq:${m.bmSeq}});">${m.masterCode }</a></td>
									<td>${m.imgCount }</td>
									<td>${m.directionName }</td>
									<td>${m.lfCount }</td>
									<td>${m.useYnName }</td>
									<td>
										<a href="javascript:$.Nav('go', '../list/${m.bmSeq }');" class="btn btn-sm btn-outline-primary">배너관리</a> 
										<a href="javascript:$.Nav('go', './banner_write', {bseq:${m.bmSeq }});" class="btn btn-sm btn-primary">수정</a> 
				<c:choose>
					<c:when test="${m.masterCode eq 'mainBanner' }">
										메인배너 삭제 불가
					</c:when>
					<c:otherwise>
										<a href="javascript:doDelete(${m.bmSeq });" class="btn btn-sm btn-danger">삭제</a>	
					</c:otherwise>
				</c:choose>
									</td>
								</tr>
			</c:forEach>				
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer">
					<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
				</div>
			</div>
		</form>
	</div>
	
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	function doDelete(seq) {
		var sMsg = '${delete}';
		
		
		if (!confirm(sMsg))
			return;
		
		$('input[name=bseq]').val(seq);
		$('input[name=status]').val('d');
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
