<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원관리 > 이메일 설정 - 등록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="./mail_proc.do" method="post">
			<input type="hidden" name="emseq" value="${search.emseq }" />
			<div class="card">
				<div class="card-body">
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">분류명<span class="text-danger">*</span></label>
						<div class="col-lg-4">
							<input type="text" name="mailName"  value="${vo.mailName}"  class="form-control" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">메일발송</label>
						<div class="col-lg-4">
							<div class="custom-control custom-checkbox custom-control-inline">
								<input type="checkbox" name="adminSend" class="custom-control-input" id="adminSend" value="Y">
								<label class="custom-control-label" for="adminSend">관리자</label>
							</div>
							<div class="custom-control custom-checkbox custom-control-inline">
								<input type="checkbox" name="userSend" class="custom-control-input" id="userSend" value="Y">
								<label class="custom-control-label" for="userSend">회원</label>
							</div>
							<input name="adminSendYn" type="hidden" value="" />
							<input name="userSendYn" type="hidden" value="" />
							<script>
								$(function() {
									checkCheckbox('adminSend', 'adminSendYn', '${vo.adminSendYn}', 'N');
									checkCheckbox('userSend', 'userSendYn', '${vo.userSendYn}', 'N');
								});
							</script>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">메일 제목</label>
						<div class="col-lg-4">
							<input type="text" name="subject" value="${vo.subject }" class="form-control" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">메일 내용</label>
						<div class="col-lg-10">
							<textarea name="body" id="body" class="form-control" style="height:300px;"  class="editor">${vo.body }</textarea>
						</div>
						<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
						<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
				
						<script type="text/javascript">
							CKEDITOR.replace('body', {
								width : '100%'
								, height : '270px'
								, startupFocus : false
							});
						</script>
					</div>
					<table class="table table-bordered" style="border-top: 1px solid #cacaca">
						<colgroup>
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr>
								<td><strong>#|date|</strong> 오늘날짜</td>
								<td><strong>#|mem_id|</strong> 회원아이디</td>
								<td><strong>#|mem_pw|</strong> 회원비밀번호</td>
							</tr>
							<tr>
								<td><strong>#|mem_name|</strong> 회원이름</td>
								<td><strong>#|site_name|</strong> 사이트명</td>
								<td><strong>#|site_email|</strong> 사이트 이메일</td>
							</tr>
							<tr>
								<td><strong>#|site_tel|</strong> 사이트 전화번호</td>
								<td colspan="2"><strong>#|site_url|</strong> 사이트 주소로 변경되어 발송됩니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-footer">
					<div class="container-fluid">
						<div class="row justify-content-center">
							<div class="col-6 col-sm-2">
								<a onclick="javascript:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>
							</div>
							<div class="col-6 col-sm-2">
								<a onclick="javascript:$.Nav('go', './mail_list.do');" class="btn btn-dark btn-block btn-lg">목록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>


<!--wrap_scon S-->
<div id="wrap_scon">


	<div class="scon_title">
		<h2>이메일 설정</h2>
		<p>홈 &gt; 회원관리 &gt; 이메일 설정</p>
	</div>

	<div class="scon">

		<ul class="summmit_btn">
			<li></li>
			<li></li>
		</ul>

	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(function() {
		
	});
	
	
	function doSubmit() {
		
		if (isNull($('input[name=mailName]').val())) {
			alert('분류명을 확인 해주세요.');
			return;
		}
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>