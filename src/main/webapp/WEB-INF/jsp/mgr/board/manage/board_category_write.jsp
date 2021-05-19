<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 카테고리 등록/수정 - 팝업
 --%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>

<div class="container-fluid">
	
	<form id="form1" action="./board_category_proc" method="post">
		<input type="hidden" name="bcSeq" value="${!empty vo ? vo.bcSeq : 0 }" />
		<input type="hidden" name="boardCode" value="${search.bcode }" />
		<input type="hidden" name="status" value="${search.status }" />
		<div class="d-flex my-4 align-items-center justify-content-between">
			<h3 class="scon_tit">${bm.boardCode }(${bm.boardName }) 게시판 카테고리</h3>
		</div>
		<br class="clear mb5" />
		<div class="form-group row">
			<label class="col-3 col-form-label">카테고리 이름</label>
			<div class="col-9">
			<input type="text" name="cateName" class="form-control" value="${vo.cateName }" />
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-6"><a onclick="javascript:doSubmit();" class="btn btn-block btn-primary">저장</a></div>
			<div class="col-6"><a onclick="javascript:$.Nav('go', './board_category_popup', {bcseq:''});" class="btn btn-block btn-dark">목록</a></div>
		</div>
	</form>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	function doSubmit() {
		if ($('input[name=cateName]').val().trim().length == 0) {
			alert('카테고리 이름을 입력해야 합니다.');
			return;
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>