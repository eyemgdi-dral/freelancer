<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일관리 - 보기
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="../proc.do" method="post">
			<input type="hidden" name="fseq" value="${search.fseq}" />
			<input type="hidden" name="fwseq" value="${vo.formWritingSeq }" />
			<input type="hidden" name="mailseq" value="1" />
			<div class="card">
				<div class="card-header">
					<h3 class="scon_tit2">폼메일관리</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<%-- <div class="col-md-6">
							<div class="form-group">
								<label class="form-control-label">제목</label>
								<input class="form-control" name="subject" value="${vo.subject }"  type="text"  />
							</div>	
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="form-control-label">첨부파일</label>
<!-- 다운로드 , 파일보기 필요(수정중) -->
<c:if test="${!empty fileList }">
	<c:forEach var="f" items="${fileList }">
		<c:choose>
			<c:when test="${fn:contains(f.mimeType, 'image/')}">
								<a href="${UPLOAD_ROOT}${f.saveFilename }" class="btn btn-dark">${f.originalFilename }</a>
			</c:when>
			<c:otherwise>
								<div>${f.originalFilename }</div>
			</c:otherwise>
		</c:choose>			
	</c:forEach>
</c:if>
<c:if test="${empty fileList }">
								<div>첨부파일 없음</div>
</c:if>	
							</div>	
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label class="form-control-label">이름</label>
								<input class="form-control" name="name" type="text" value="${vo.name }" />
							</div>	
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label class="form-control-label">연락처</label>
								<input class="form-control" name="phone" type="text" value="${vo.phone }" />
							</div>	
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label class="form-control-label">이메일</label>
								<input class="form-control" name="email" type="text" value="${vo.email }" />
							</div>	
						</div> --%>
						
						<div class="col-md-6">
							<div class="form-group">
								<label class="form-control-label">처리상태</label>
								<tt:select list="${type1s }" name="process" listKey="value" listValue="text" indexKey="" indexValue="= 처리상태 =" selected="${vo.process }"/>
							</div>	
						</div>
						
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-bordered">
									<colgroup>
										<col width="15%" />
										<col width="*" />
									</colgroup>
									<tbody>
<c:forEach var="m" items="${vo.valueVO }">
										<tr>
											<th><strong>${m.formInfoName }</strong></th>
											<td>
	<c:forEach var="n" items="${m.formInfoValueArr }">
		<c:if test="${m.property == 'email' }">
			<input type="hidden" name="userEmail" value="${n }" />
		</c:if>
		<c:choose>
			<c:when test="${m.property == 'textarea' }">
				<textarea class="form-control" rows="5" disabled>${n}</textarea>
			</c:when>
			<c:otherwise>
				<span class="ml5">${n}</span> 
			</c:otherwise>
		</c:choose>
		
												
											
	</c:forEach>										
											</td>
										</tr>
</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<textarea name="body" id="body" class="w100" style="height:300px;"  class="editor">${vo.body }</textarea>
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
						</div>
						<div class="col-md-12 d-none">
							<div class="form-group">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="answer" name='answer' value="Y">
									<label class="custom-control-label" for="answer">답변 메일로 보내기 (체크시 작성자 이메일로 답변을 보냅니다.)</label>
									<input name="answerYn" type="hidden" value="" />
								</div>
							</div>
						</div>
						
						<script>
							$(function() {
								checkCheckbox('answer', 'answerYn', '', 'N');
							});
						</script>
						
					</div>
					
					<div class="row justify-content-center">
						<div class="col-6 col-sm-3">
							<a onclick="javascirpt:doSubmit();" class="btn btn-lg btn-block btn-primary">확인</a>							
						</div>
						<div class="col-6 col-sm-3">
							<a onclick="javascirpt:$.Nav('go', '../list/${vo.formSeq}.do')" class="btn btn-lg btn-block btn-dark">취소</a>
						</div>
					</div>
					
					
				</div>
			</div>
		</form>
	</div>	
</div>


<script type="text/javascript">
	$(function() {
		//$('input[name=writebody]').val($('#writebody').html());
		//console.log($('#body').val());
		//console.log($('input[name=writebody]').val());
		//$('#body').text($('#writebody').html() + $('#body').val());
	});
	function doSubmit() {
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
