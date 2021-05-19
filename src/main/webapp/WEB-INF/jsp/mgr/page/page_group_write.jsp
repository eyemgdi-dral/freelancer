<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	페이지 관리 - 페이지 그룹 등록/수정 - 팝업
 --%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>

<div class="container">
	
	<form id="form1" action="./page_group_proc.do" method="post">
		<input type="hidden" name="groupSeq" value="${!empty vo ? vo.groupSeq : 0 }" />
		<input type="hidden" name="status" value="${search.status }" />
		
		<div class="card">
			<div class="card-header">
				<h3 class="scon_tit">페이지 그룹관리</h3>
			</div>
			<div class="card-body">
				<div class="container">
					<div class="form-group row">
						<div class="col-3">
						그룹명
						</div>
						<div class="col-9">
						<input type="text" name="groupName" class="form-control form-control-sm" value="${vo.groupName }" />
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer">
				<div class="container">
					<div class="form-group row">
						<div class="col">
							<a onclick="javascript:doSubmit();" class="btn btn-block btn-primary">저장</a>
						</div>
						<div class="col">
							<a onclick="javascript:$.Nav('go', './page_group_popup.do', {gseq:''});" class="btn btn-block btn-dark">목록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</form>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	function doSubmit() {
		if ($('input[name=groupName]').val().trim().length == 0) {
			alert('그룹명을 입력해야 합니다.');
			return;
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
				
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>