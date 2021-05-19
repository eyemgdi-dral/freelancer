<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<!-- config >  policy list - write -->

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	
	<div class="container-fluid mt--6">
		<div class="card">
			<div class="card-body">
				<form id="form1" action="./proc.do" method="POST">
					<input type="hidden" name="useFlag" value="u" />
					<c:choose>
						<c:when test="${not empty vo.seoIdx}">
							<input type="hidden" name="seoIdx" value="${vo.seoIdx }" />
						</c:when>
					</c:choose>
					<div class="form-group row">
						<div class="col-md-2 col-form-label">페이지명</div>
						<div class="col-md-4">
							<input type="text" name="pageName" class="form-control " value="${vo.pageName }" maxlength="200" />
						</div>
						<div class="col-md-2 col-form-label">페이지 주소</div>
						<div class="col-md-4">
							<input type="text" name="pageLink" class="form-control " value="${vo.pageLink }" maxlength="200" />
						</div>
					</div>
					
					<div class="form-group row">
						<div class="col-md-2 col-form-label">페이지 Title</div>
						<div class="col-md-4">
							<input type="text" name="metaTitle" class="form-control " value="${vo.metaTitle }" maxlength="1000" />
						</div>
						<div class="col-md-2 col-form-label">페이지 Keywords</div>
						<div class="col-md-4">
							<input type="text" name="metaKeywords" class="form-control " value="${vo.metaKeywords }" maxlength="1000" />
						</div>
					</div>
					
					<div class="form-group row">
						<div class="col-md-2 col-form-label">페이지 Subject</div>
						<div class="col-md-4">
							<input type="text" name="metaSubject" class="form-control " value="${vo.metaSubject }" maxlength="1000" />
						</div>
						<div class="col-md-2 col-form-label">페이지 Description</div>
						<div class="col-md-4">
							<input type="text" name="metaDescription" class="form-control " value="${vo.metaDescription }" maxlength="1000" />
						</div>
					</div>
				</form>
			</div>
			
			<div class="card-footer">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-6 col-sm-2">
							<a onclick="javascript:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>
						</div>
						<div class="col-6 col-sm-2">
							<a onclick="javascript:$.Nav('go', './seo_list');" class="btn btn-dark btn-block btn-lg">취소</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script type="text/javascript">
	
	//checking empty
	function isEmpty(val) {
		if(val.trim() == ''){
			return true;
		}		
		return false;
	}

	
	function doSubmit(){
		
		//do Valitation
		
		if(isEmpty($('input[name=pageName]').val()) && checkNumber($('input[name=pageName]').val())){
			alert("Days field must be filled");
			return;
		}
		if(isEmpty($('input[name=pageLink]').val()) && checkNumber($('input[name=pageLink]').val())){
			alert("Cost 1 field must be filled");
			return;
		}
		$('#form1').submit();		
	}
	
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
