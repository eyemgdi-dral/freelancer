<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	페이지관리 - 페이지그룹관리 목록
 --%>

<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>
<div class="container">
	<form id="form1" action="./page_group_proc.do" method="post">
		<input type="hidden" name="gseq" />
		<input type="hidden" name="status" />
		<div class="card">
			<div class="card-header">
				<div class="container">
					<div class="row">
						<div class="col-6">
							<h3 class="scon_tit">페이지 그룹관리</h3>
						</div>
						<div class="col-6 text-right">
							<a class="btn btn-sm btn-info" onclick="javascript:$.Nav('go', './page_group_write.do', {gseq: ''});">분류 등록</a>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<table class="table table-bordered text-center table-sm">
					<colgroup>
						<col width="20%" />
						<col width="30%" />
						<col width="50%" />
					</colgroup>
					
					<thead class="table-info">
					<tr>
						<th>번호</th>
						<th>분류명</th>
						<th>기능</th>
					</tr>
					</thead>
					<tbody>
		<c:forEach var="m" items="${list }" varStatus="s">
						<tr>
							<td>${s.index+1 }</td>
							<td>${m.groupName }</td>
							<td>
								<a onclick="javascript:$.Nav('go', './page_group_write.do', {gseq:${m.groupSeq}})" class="btn btn-sm btn-primary">수정</a> 
								<a onclick="javascript:doDelete(${m.groupSeq})" class="btn btn-sm btn-danger">삭제</a>
							</td>
						</tr>
		</c:forEach>
		<c:if test="${empty list}">
							<tr>
								<td colspan="3"><s:message code="common.noData" /></td>
							</tr>
		</c:if>			
					</tbody>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pop_scon">
	<form id="form1" action="./page_group_proc.do" method="post">
		<input type="hidden" name="gseq" />
		<input type="hidden" name="status" />
		
		<div>
			<div class="fl">
				
			</div>
			<div class="fr mb10">
			</div>
		</div>
		
	</form>
</div>
<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	function doDelete(seq) {
		var sMsg = '${delete}';
		if (!confirm(sMsg))
			return;
		
		$('input[name=gseq]').val(seq);
		$('input[name=status]').val('d');
		
		$('#form1').submit();
	}
	
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
