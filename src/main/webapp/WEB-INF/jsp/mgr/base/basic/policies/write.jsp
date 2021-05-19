<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 메인게시물 - 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	
		<div class="container-fluid mt--6">
		
			<form id="form1" name="form1" action="./policies_proc" method="post">
				<div class="card">
					<div class="card-body">
						<div class="container-fluid">
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">유형</label>
								<div class="col-lg-4">
<c:if test="${empty vo}">
									<tt:select list="${caseList }" name="contentsType" listKey="value" listValue="text" selected="${vo.contentsType }" />
</c:if>
<c:if test="${!empty vo}">
	<c:set var="contentName" />
	<c:forEach items="${caseList}" var="it">
		<c:if test="${it.value eq vo.contentsType}">
			<c:set var="contentName" value="${it.text}" />
		</c:if>
	</c:forEach>
									<input type="text" class="form-control" readonly value="${contentName}" /> 
									<input type="hidden" name="contentsType" value="${vo.contentsType}" /> 
</c:if>
								</div>
							</div>
							
							<div class="form-group row">
<c:if test="${empty vo}">
								<label class="col-lg-2 col-form-label">제목</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="title" id="policytitle"  maxlength="2000" value="${vo.title }" />
								</div>
</c:if>
<c:if test="${!empty vo}">
								<label class="col-lg-2 col-form-label">${vo.title }</label>
								<div class="col-lg-4">
									<input type="hidden" name="title" id="policytitle" value="${vo.title }" />
									<tt:select class="selectversion" list="${sameName }" name="version" listKey="version" listValue="version" selected="${vo.version }" />
								
								</div>
</c:if>
							</div>
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">내용</label>
								<div class="col-lg-10">
									<textarea name="contents"  class="" id="body" style="height:200px" maxlength="10000" >${vo.contents }</textarea>								
									<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
									<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
									<script type="text/javascript">
											CKEDITOR.replace('body', {
												width : '100%'
												, height : '300px'
												, startupFocus : false
											});
									</script>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<style type="text/css">
select.selectversion{float: right; }
</style>


<script type="text/javascript">	
	
	function doSubmit() {	
		if(isNull($('#policytitle').val()) || $('#policytitle').val() === ''){
			alert('그룹명을 선택해야 합니다.');
			return;
		}
		if (!confirm('저장하시겠습니까?'))
			return;
		
		form1.submit();
	}
	$(document).on('change', '.selectversion', function(e){
		$.Nav('go', './write',{version: e.target.value ,contentsType:'${vo.contentsType}',iDx:""});
	});
	
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>