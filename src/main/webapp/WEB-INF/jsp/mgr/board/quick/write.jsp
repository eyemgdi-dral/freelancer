<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시물 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<style>
		th.th{
		text-align: center;
		}
		td.content{
		    max-width: 400px;
		    overflow-wrap: break-word;
		}

</style>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="./quick_proc.do" method="post" enctype="multipart/form-data">	
			<input type="hidden" name="idx" value="${search.idx }" />
			<input type="hidden" name="status" value="${search.status }" />
			<input type="hidden" name="email" value="${vo.email }" />
			<input type="hidden" name="content" value="${vo.content }" />
			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered">
							<colgroup>
								<col width="15%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th class="th">이름 </th>
									<td >${vo.userName}</td>
								</tr>
								<tr>
									<th class="th">연락처 </th>
									<td >${vo.contact}</td>
								</tr>
								<tr>
									<th class="th">이메일 </th>
									<td >${vo.email}</td>
								</tr>
								<tr>
									<th class="th">내용 </th>
									<td class="content">${vo.content}</td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<div class="container-fluid mt-2">
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">메모</label>
							<div class="col-lg-10">
								<textarea name="answer" id="answer" class="w100" style="height:300px;" class="editor">${vo.answer }</textarea>
								<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
								<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
								<script type="text/javascript">
									CKEDITOR.replace('answer', {
										width : '100%'
										, height : '270px'
										, startupFocus : false
									});
								</script>
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<div class="container-fluid">
						<div class="row justify-content-center">
							<div class="col-4 col-sm-2">
								<a onclick="javascript:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>
							</div>
							<div class="col-4 col-sm-2">
								<a onclick="javascript:doDelete();" class="btn btn-danger btn-block btn-lg">삭제</a>
							</div>
							<div class="col-4 col-sm-2">
								<a onclick="javascript:$.Nav('go', './quick_list');" class="btn btn-dark btn-block btn-lg">취소</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>	
</div>



<!--wrap_scon S-->
<div id="wrap_scon">


	<div class="scon">

<form id="form1" action="./quick_proc.do" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="idx" value="${search.idx }" />
		<input type="hidden" name="status" value="${search.status }" />
		<input type="hidden" name="email" value="${vo.email }" />
		<input type="hidden" name="content" value="${vo.content }" />
		
		

		<br class="clear mb5" />
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:doDelete();" class="btn2 bg_navy">삭제</a></li>
			<li><a onclick="javascript:$.Nav('go', './quick_list');" class="btn2 bg_darkgray">취소</a></li>
		</ul>
	
	</div>
</div>
<!--wrap_scon E-->
<script type="text/javascript">
function doSubmit() {		
		
	if(!confirm('저장하시겠습니까?')){
		return;
	}
	
	$('#form1').submit();
}
function doDelete() {		
	
	if(!confirm('저장하시겠습니까?')){
		return;
	}
	$('input[name="status"]').val("d");
	
	$('#form1').submit();
}
</script>


<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>