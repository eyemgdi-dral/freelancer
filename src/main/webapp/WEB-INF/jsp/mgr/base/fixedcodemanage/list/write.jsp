<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	배너관리 - 등록 수정 UI
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<form id="form1" action="./list_proc" method="post" enctype="multipart/form-data">
		<input type="hidden" name="status" value="" />
		<input type="hidden" name="sortNum" value="0" />
		<input type="hidden" name="errorselect" value="${errorselect}" />
		<input type="hidden" name="errorentered" value="${errorentered}" />
		<input type="hidden" name="errornull" value="${errornull}" />
		<div class="container-fluid mt--6">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">code</label>
								<div class="col-lg-8">
									<input name="codeCode" id="cCode" class="form-control" value="${vo.codeCode }"  maxlength="6" type="text" placeholder="(6자 입력)"/> 
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">name</label>
								<div class="col-lg-8">
									<input name="codeName" class="form-control" value="${vo.codeName }" maxlength="100" type="text" placeholder="(100자 이내로 입력하세요)"/> 
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">desc</label>
								<div class="col-lg-8">
									<input name="codeDesc" class="form-control" value="${vo.codeDesc}" maxlength="1000" type="text" placeholder="(1000자 이내로 입력하세요)"/> 
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">desc2 </label>
								<div class="col-lg-8">
									<input name="codeDesc2" class="form-control" value="${vo.codeDesc2}" maxlength="1000" type="text" placeholder="(1000자 이내로 입력하세요)"/> 
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='card-footer'>
					<div class="container-fluid">
						<div class="row justify-content-center">
							<div class="col-4 col-sm-2">
								<a onclick="javascript:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>
							</div>
							<div class="col-4 col-sm-2">
								<c:choose>
												         
									<c:when test = "${search.codeId != 0 }">
									
										<a onclick="javacript:doDelete('${search.codeId }');" class="btn btn-dark btn-block btn-lg">삭제</a>
									</c:when>
									<c:otherwise>
										<a onclick="javascript:$.Nav('go', './list');" class="btn btn-dark btn-block btn-lg">목록</a>
									</c:otherwise>
									
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script type="text/javascript">

	function doSubmit() {
		if ($('input[name=codeCode').val().length == 6) 
		{
			$cc = $('input[name=codeCode]')
			oLoader('#cCode'
					, './ajax/check_cCode'
					, 'post'
					, {
						id: $cc.val()
					}
					, false
					, function(data) {
						console.log(data)
						if (data.result) {
							alert(data.result + '코드는 사용할 수 없습니다.');
							return;
						}else {
							if (!confirm('"' + $('input[name=codeName]').val() + '"'+ ' 코드를 추가 하시겠습니까?'))
								return;
							$('#form1').submit();
						}
					}
				);
			
			
		} else {
			alert("code type or code id length incorrect");
		}

	}
	function doDelete(seq) {
		var sMsg = '';
		sMsg = '"${vo.codeName }" 코드를 삭제 하시겠습니까?';

		if (!confirm(sMsg))
			return;

		$('input[name=status]').val('d');

		$('#form1').submit();
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
	