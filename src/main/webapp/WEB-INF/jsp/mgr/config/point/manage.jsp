<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 게시판
--%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	<style type="text/css">
		.input_type2{
		    /* float: left; */
		    border: 1px solid #ddd;
		    height: 18px;
		    /* padding: 3px 5px 5px 5px; */
		    font-size: 12px;
		    color: #444;
		    vertical-align: middle;
    	}
    	.btn-h{
		    height: 36px;
		}
	</style>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	
	<div class="container-fluid mt--6">
		<div class="card">
			<div class="card-header">
				<h3 class="mb-0">적립금을 설정하는 화면입니다.</h3>
			</div>
			<div class="card-body">
				<form id="form1" action="./point_proc.do" method="post">
					<input type="hidden" name="policyType" value="${vo.policyType}" />
					<input type="hidden" name="policyValue" value="${vo.policyValue}" />
					<h2>기본 적립금 지급</h2>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">회원 가입 적립금</label>
						<div class="col-sm-10">
							<div class="input-group input-group-merge">
								<div class="input-group-prepend">
        							<span class="input-group-text">회원 가입 시 적립금</span>
      							</div>
      							<input type="text" class="form-control" name="joinCMomey" value="${vo.joinCMomey }">
      							<div class="input-group-append">
        							<span class="input-group-text">원 지급</span>
      							</div>
    						</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">이용후기</label>
						<div class="col-sm-10">
							<div class="input-group input-group-merge">
								<div class="input-group-prepend">
        							<span class="input-group-text">이용후기 작성 시 적립금</span>
      							</div>
      							<input type="text" class="form-control" name="commentCMomey" value="${vo.commentCMomey }">
      							<div class="input-group-append">
        							<span class="input-group-text">원 지급</span>
      							</div>
    						</div>
						</div>
					</div>
					<h2>구매 적립금 지급</h2>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">구매 적립금 정책</label>
						<div class="col-sm-10">
							<div class="custom-control custom-radio mb-3">
						  		<input type="radio" id="policy.N" name="policy" class="custom-control-input" value="N" ${vo.policyType == 'N' ? 'checked' : ''}>
						  		<label class="custom-control-label" for="policy.N">적립금 지급 안함</label>
							</div>
							<div class="custom-control custom-radio mb-3">
						  		<input type="radio" id="policy.R" name="policy" class="custom-control-input" value="R" ${vo.policyType == 'R' ? 'checked' : ''}>
						  		<label class="custom-control-label" for="policy.R">회원등급에 설정된 적립금 지급</label>
							</div>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
          								<input type="radio" name="policy" value="A" ${vo.policyType == 'A' ? 'checked' : ''}>
        							</div>
        							<span class="input-group-text">결제금의</span>
      							</div>
      							<input class="form-control" ${vo.policyType != 'A' ? 'disabled' : ''} value="${vo.policyType == 'A' ? vo.policyValue : ''}" type="number" name="policyV">
      							<div class="input-group-append">
        							<span class="input-group-text">% 지급</span>
      							</div>
    						</div>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
          								<input type="radio" name="policy" value="P" ${vo.policyType == 'P' ? 'checked' : ''}>
        							</div>
        							<span class="input-group-text">판매가의</span>
      							</div>
      							<input class="form-control" ${vo.policyType != 'P' ? 'disabled' : ''} value="${vo.policyType == 'P' ? vo.policyValue : ''}" type="number" name="policyV">
      							<div class="input-group-append">
        							<span class="input-group-text">% 지급</span>
      							</div>
    						</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<div class="input-group-text">
          								<input type="radio" name="policy" value="E" ${vo.policyType == 'E' ? 'checked' : ''}>
        							</div>
        							<span class="input-group-text">대여 1일당</span>
      							</div>
      							<input class="form-control" ${vo.policyType != 'E' ? 'disabled' : ''} value="${vo.policyType == 'E' ? vo.policyValue : ''}" type="number" name="policyV">
      							<div class="input-group-append">
        							<span class="input-group-text">원 지급</span>
      							</div>
    						</div>
						</div>
					</div>
					
					
					<h2>적립금 사용 설정</h2>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label"> 사용 가능 최소 적립금</label>
						<div class="col-sm-10">
							<div class="input-group input-group-merge">
								<div class="input-group-prepend">
        							<span class="input-group-text">적립금</span>
      							</div>
      							<input type="text" class="form-control" name="useMin" value="${vo.useMin }">
      							<div class="input-group-append">
        							<span class="input-group-text">원 이상 사용</span>
      							</div>
    						</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">사용 가능 최대 적립금</label>
						<div class="col-sm-10">
							<div class="input-group input-group-merge">
								<div class="input-group-prepend">
        							<span class="input-group-text">적립금</span>
      							</div>
      							<input type="text" class="form-control" name="useMax" value="${vo.useMax }">
      							<div class="input-group-append">
        							<span class="input-group-text">원 이하 사용</span>
      							</div>
    						</div>
						</div>
					</div>
				</form>
			
			</div>
			<div class="card-footer">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-6 col-sm-2">
							<input type="button" onclick="javascript:doSubmit();" value="저장" class="btn btn-primary btn-block btn-lg"> 
						</div>
						<div class="col-6 col-sm-2">
							<input type="button" onclick="javascript:$.Nav('self', null, null, true);" value="취소" class="btn btn-dark btn-block btn-lg">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

	<script type="text/javascript">
		$('input[name="policy"]').on('change', function(e){
			$('input[name="policyV"]').prop('disabled', true);
			$('input[name="policyV"]').val('');
			$(this).closest('.input-group').find('input[name="policyV"]').prop('disabled', !e.target.checked);
			const policy = $(this).val();
			if(!isNull(policy))
				$('input[name="policyType"]').val(policy);
		});
		
		$('input[name="policyV"]').on('change', function(e){
			const pv = $(this).val();
			if(!isNull(pv))
				$('input[name="policyValue"]').val(pv);
		});
		function doSubmit() {
			if (!confirm('저장하시겠습니까?'))
				return;

			$('#form1').submit();
		}
	</script>
	
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>