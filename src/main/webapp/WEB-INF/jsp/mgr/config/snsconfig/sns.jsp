<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid  mt--6">
		<div class="card">
			<div class="card-header border-0 d-flex">	 
				<h3 class="mb-0">SNS설정</h3>       
			</div>
			<div class="card-body">
				<form id="form2" action="./sns_proc" method="post" enctype="multipart/form-data">
					<input type="hidden" name="naverAPI" value="${set.naverAPI }">
					<input type="hidden" name="googleAPI" value="${set.googleAPI }">
					<input type="hidden" name="kakaoAPI" value="${set.kakaoAPI }">
					<input type="hidden" name="facebookAPI" value="${set.facebookAPI }">
					<div class="form-group row">
		    			<label class="col-sm-2 col-form-label">네이버 로그인</label>
			    		<div class="col-sm-1">
			    			<div class="h-100 d-flex align-items-center">
			    				<label class="custom-toggle">	    				
								    <input type="checkbox"  ${set.naverAPI =='1' ? 'checked' : ''}  data-name="naverAPI">
								    <span class="custom-toggle-slider rounded-circle" data-label-off="안사용" data-label-on="사용"></span>
								</label>
			    			</div>
			    		</div>
			    		<div class="col-sm-6">
							<input ${set.naverAPI =='0' ? 'hidden' : ''} type="text" id="naverAPI" name="naverKey" value="${set.naverKey}" class="form-control" >
			    		</div>
		    		</div>
		    		
					<div class="form-group row">
		    			<label class="col-sm-2 col-form-label">구글 로그인</label>
			    		<div class="col-sm-1">
			    			<div class="h-100 d-flex align-items-center">
			    				<label class="custom-toggle">	    				
								    <input type="checkbox"  ${set.googleAPI =='1' ? 'checked' : ''}  data-name="googleAPI">
								    <span class="custom-toggle-slider rounded-circle" data-label-off="안사용" data-label-on="사용"></span>
								</label>
			    			</div>
			    		</div>
			    		<div class="col-sm-6">
							<input ${set.googleAPI =='0' ? 'hidden' : ''}  type="text" id="googleAPI" name="googleKey" value="${set.googleKey}" class="form-control" >
			    		</div>
		    		</div>
		    		
					<div class="form-group row">
		    			<label class="col-sm-2 col-form-label">카카오 로그인</label>
			    		<div class="col-sm-1">
			    			<div class="h-100 d-flex align-items-center">
			    				<label class="custom-toggle">	    				
								    <input type="checkbox"  ${set.kakaoAPI =='1' ? 'checked' : ''}  data-name="kakaoAPI" >
								    <span class="custom-toggle-slider rounded-circle" data-label-off="안사용" data-label-on="사용"></span>
								</label>
			    			</div>
			    		</div>
			    		<div class="col-sm-6">
							<input ${set.kakaoAPI =='0' ? 'hidden' : ''}  type="text" id="kakaoAPI" name="kakaoKey" value="${set.kakaoKey}" class="form-control" >
			    		</div>
		    		</div>
		    		
					<div class="form-group row">
		    			<label class="col-sm-2 col-form-label">페이스북 로그인</label>
			    		<div class="col-sm-1">
			    			<div class="h-100 d-flex align-items-center">
			    				<label class="custom-toggle">	    				
								    <input type="checkbox"  ${set.facebookAPI =='1' ? 'checked' : ''}  data-name="facebookAPI">
								    <span class="custom-toggle-slider rounded-circle" data-label-off="안사용" data-label-on="사용"></span>
								</label>
			    			</div>
			    		</div>
			    		<div class="col-sm-6">
							<input ${set.facebookAPI =='0' ? 'hidden' : ''}  type="text" id="facebookAPI" name="facebookKey" value="${set.facebookKey}" class="form-control" >
			    		</div>
		    		</div>
	    		
				</form>
			</div>
			<div class="card-footer">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-6 col-sm-2">
							<a onclick="javascript:Submit();" class="btn btn-primary btn-block btn-lg">저장</a>
						</div>
						<div class="col-6 col-sm-2">
							<a onclick="javascript:$.Nav('go', './sns');" class="btn btn-dark btn-block btn-lg">취소</a>
						</div>
					</div>
				</div>
			</div>
			<c:set var="delete"><s:message code="common.delete.msg" /></c:set>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script type="text/javascript">
   
function Submit() {
	if (!confirm('저장하시겠습니까?'))
		return;
	$('#form2').submit();
}
$('input[type="checkbox"]').on('change', function(e){ 
	var name = $(this).data('name');
	$('#'+name).attr('hidden',$(this).is(':checked')?false:true);
	$('input[name='+name+']').val($(this).is(':checked')?"1":"0")
});
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>