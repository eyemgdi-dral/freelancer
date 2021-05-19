<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%-- Member privacy and terms --%>
<div class="container mt--8 pb-5">
	<div class="row justify-content-center">
		<div class="col-md-7">
			<div class="card">
				<div class="card-header">
					타고플러스 회원 이용약관
				</div>
				<div class="card-body">
					<textarea id="term" class="form-control" rows='4' readonly >	
					</textarea>
				</div>
				<div class="card-footer">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" id="agree1" class="custom-control-input" id="agree" name="agree" value="Y">
						<label class="custom-control-label" for="agree1">이용약관에 동의합니다.</label>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					개인정보 취급방침
				</div>
				<div class="card-body">
					<textarea id="privacyInfo" class="form-control" rows='4' readonly >	
					</textarea>
				</div>
				<div class="card-footer">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" id="agree2" class="custom-control-input" id="agree" name="agree" value="Y">
						<label class="custom-control-label" for="agree2">이용약관에 동의합니다.</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6"><a href="javascript:doCheckAgree();" class="btn btn-lg btn-block btn-primary">확인</a></div>
				<div class="col-sm-6"><a href="" class="btn btn-lg btn-link btn-block">취소</a></div>
			</div>
			
			
		</div>
	</div>
</div>

<script type="text/javascript">
$(function () {
	$.ajax({
		type : 'post',
		url : '/ajax/term.do',
		dataType : 'json',
		success : function(data) {
			$('#term').val(( data[0].contentsType=='terms')?data[0].contents : data[1].contents );
			$('#privacyInfo').val(( data[0].contentsType=='privacy')?data[0].contents : data[1].contents );
		}
	});
});

function doCheckAgree() {
	var iAgreeLength= $('input[name=agree]').length;
	for(var i = 0; i < iAgreeLength; i++) {
		if (!$('input[name=agree]').eq(i).attr('checked')) {
			alert('이용약관에 동의 하지 않으면 회원가입을 할 수 없습니다.');
			return;
		}
	}

	$.Nav('self', {isAgreed: true}, null, true);
}
</script>