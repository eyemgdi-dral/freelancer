<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시물 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<div class="card">
			<div class="card-body">
				<form id="form1" action="../proc.do" method="post" enctype="multipart/form-data">	
					<input type="hidden" name="bcode" value="${search.bcode }" />
					<input type="hidden" name="bseq" value="${search.bseq }" />
					<input type="hidden" name="prSeq" value="${search.prSeq }" />
					<input type="hidden" name="status" value="${search.status }" />
					<input type="hidden" name="allowCommYn" value="N" />
					<input type="hidden" name="addCol4" value="" />
					<div class="container-fluid">
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">제목</label>
							<div class="col-lg-4">
								<input type="text" class="form-control" name="subject" value="${vo.subject }" />
							</div>
							<label class="col-lg-2 col-form-label">카테고리</label>
							<div class="col-lg-4">
								<tt:select name="bcSeq" class="w100" list="${bm.boardCategoryVO }" listKey="bcSeq" listValue="cateName" indexKey="0" indexValue="= 카테고리 =" selected="${vo.bcSeq }" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">작성자</label>
							<div class="col-lg-4">
								<input type="text" name="userName" class="form-control" value="${vo.userName }" />
								<input type="hidden" name="regUser" value="${vo.regUser }" />
								<script>
									$(function() {
										var sRegUserName = '${vo.regUserName}' || '${tagoplusSolution1_session_admin.adminName}';
										if ($('input[name=userName]').val().trim().length == 0) {
											$('input[name=userName]').val(sRegUserName);
										}
									});
								</script>
							</div>
							<label class="col-lg-2 col-form-label">조회 수</label>
							<div class="col-lg-4">
								<input type="text" name="readCount" class="form-control onlyNumber" value="${vo.readCount }" />
								<script>
									$(function() {
										if ($('input[name=readCount]').val().trim().length == 0)
											$('input[name=readCount]').val(0);
									});
								</script>
							</div>
						</div>
						
<c:if test="${bm.boardTypeFixedCode ne '001005' and bm.boardTypeFixedCode ne '001006' and bm.fileUploadCount gt 0}">
	<c:if test="${empty vo.fileVOList }">
		<c:set var="fileSize" value="0"/>
	</c:if>
	<c:if test="${!empty vo.fileVOList }">
		<c:set var="fileSize" value="${fn:length(vo.fileVOList) }"/>
	</c:if>
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">파일</label>
							<div class="col-lg-10">
								
	<c:forEach items="${vo.fileVOList }" var="l">
								<div class="input-group">
									<input type="hidden" name="FileSeqList" value="${l.fileSeq }">
									<input type="file" name="fileList" class="form-control">
									<div class="input-group-append">
										<a href="javascript:viewFile('${UPLOAD_ROOT },${l.saveFilename }');">${l.originalFilename }</a>
									</div>
								</div>
	</c:forEach>
	
	<c:forEach varStatus="s" step="1" begin="1" end="${bm.fileUploadCount - fileSize }">
								<input type="hidden" name="FileSeqList" value="0">
								<input type="file" name="fileList" class="form-control">
	</c:forEach>	
							</div>
						</div>
</c:if>

<c:set var="imageList" >001005,001006,001008,001009,001011,001012</c:set>
<c:forTokens items="${imageList}" delims="," var="image">
    <c:if test="${bm.boardTypeFixedCode eq image}">
				<div class="form-group row">
					<label class="col-lg-2 col-form-label">이미지 파일</label>
					<div class="col-lg-10">
						<div class="form-group">
							<input type="hidden" name="fileSeqList" value="${empty vo.fileVOList[0].fileSeq ? 0 : vo.fileVOList[0].fileSeq }">
							<input type="file" name="fileList" class="form-control">
							<div class="input-group-append">
								<a href="javascript:viewFile('${UPLOAD_ROOT }${vo.fileVOList[0].saveFilename }', '${vo.fileVOList[0].originalFilename }');">${vo.fileVOList[0].originalFilename }</a>
							</div>
						</div>
					</div>
				</div>
    </c:if>
</c:forTokens>
<c:if test="${bm.boardTypeFixedCode eq '001011'}">
				<div class="form-group row">
					<label class="col-lg-2 col-form-label">고유값</label>
					<div class="col-lg-10">
						<div class="form-group">
							<input type="text" class="form-control" name="linkUrl" value="${empty vo.linkUrl ? '' : vo.linkUrl }">
							
						</div>
					</div>
				</div>
    </c:if>
<c:if test="${bm.boardTypeFixedCode eq '001006' || bm.boardTypeFixedCode eq '001010' }">
				<div class="form-group row">
					<label class="col-lg-2 col-form-label">발주처</label>
					<div class="col-lg-4">
						<input type="text" name="addCol3" class="form-control" value="${empty vo.addCol3 ? '' : vo.addCol3}">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-2 col-form-label">발주기간</label>
					<div class="col-lg-3">
						<div class="input-group">
			                <div class="input-group-prepend">
			                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
			                </div>
							<input type="text" class="form-control datepicker" name="addCol1" value="${empty vo.addCol1 ? '' : vo.addCol1}" />
			            </div>
					</div>
					<div class="col-lg-3">
						<div class="input-group">
			                <div class="input-group-prepend">
			                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
			                </div>
							<input type="text" class="form-control datepicker" name="addCol2" value="${empty vo.addCol2 ? '' : vo.addCol2}" />
			            </div>
					</div>
				</div>
</c:if>
<c:if test="${bm.boardTypeFixedCode eq '001010' }">
				
</c:if>
<c:if test="${bm.boardTypeFixedCode ne '001005' and bm.boardTypeFixedCode ne '001010' }">
				<div class="form-group row">
					<label class="col-lg-2 col-form-label">내용</label>
					<div class="col-lg-10">
						<div class="d-flex align-items-center h-100">
							<input type="hidden" name="htmlYn" value="" />
							<!-- <input type="hidden" name="secretYn" value="" /> -->
							<input type="hidden" name="noticeYn" value="" />
							<div class="custom-control custom-checkbox mr-2">
								<input type="checkbox" class="custom-control-input" id="useHtml" name="useHtml" value="Y">
								<label class="custom-control-label" for="useHtml">HTML 사용</label>
							</div>
							<!-- <div class="custom-control custom-checkbox mr-2">
								<input type="checkbox" class="custom-control-input" id="useSecret" name="useSecret" value="Y">
								<label class="custom-control-label" for="useSecret">비밀글</label>
							</div> -->
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="useNotice" name="useNotice" value="Y">
								<label class="custom-control-label" for="useNotice">공지글</label>
							</div>
							<script>
								$(function() {
									checkCheckbox('useHtml', 'htmlYn', '${vo.htmlYn}', 'Y');
									//checkCheckbox('useSecret', 'secretYn', '${vo.secretYn}', 'N');
									checkCheckbox('useNotice', 'noticeYn', '${vo.noticeYn}', 'N');
								});
							</script>
						</div>
					</div>
					<div class="col-12">
						<textarea id="body" name="body" style="width:95%; height:538px;" class="editor">${vo.body }</textarea>
						<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
						<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
						<script type="text/javascript">
							$(function() {
								CKEDITOR.replace('body', {
									width : '100%'
									, height : '300px'
									, startupFocus : false
								});
							});
						</script>
					</div>
				</div>
</c:if>
<c:if test="${bm.boardTypeFixedCode eq '001003' }">
				<div class="form-group row">
					<label class="col-lg-2 col-form-label">작성자</label>
					<div class="col-lg-10">
						<input type="text" name="modUser" class="form-control" value="${empty vo.modUser ? tagoplusSolution1_session_admin.adminId : vo.modUser }" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-2 col-form-label">답변</label>
					<div class="col-lg-10">
						<textarea rows="7" name="answer" class="form-control">${vo.answer }</textarea>
						<script type="text/javascript">
							$(function() {
								CKEDITOR.replace('answer', {
									width : '100%'
									, height : '300px'
									, startupFocus : false
								});
							});
						</script>
					</div>
				</div>
</c:if>
					</div>
				</form>
<c:if test="${bm.commentYn eq 'Y' }">
				<form id="formReply" action="../manage/comment_proc.do" method="post">	
					<div class="container-fluid">
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">작성자</label>
							<div class="col-lg-4">
								<input type="text" class="form-control" name="userName" value="${vo.userName }" />
								<input type="hidden" name="commentSeq" value="">
								<input type="hidden" name="boardSeq" value="${vo.boardSeq }">
								<input type="hidden" name="boardCode" value="${vo.boardCode }">
								<input type="hidden" name="parentSeq" value="0">
							</div>
							<label class="col-lg-2 col-form-label">Verify Comment :</label>
							<div class="col-lg-4">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="useAllowCommYn" name="useAllowCommYn" value="Y">
									<label class="custom-control-label" for="useAllowCommYn">Allow</label>
								</div>
								<script>
									$(function() {
										checkCheckbox('useAllowCommYn', 'allowCommYn', '${vo.allowCommYn}', 'N');
									});
								</script>
							</div>
							<div class="col-12 mt-2">
								<textarea rows="7" class="form-control" name="body" id="commBody"></textarea>						
								<a onclick="javascript:doCommentSubmit();" class="btn btn-primary">저장</a>	
							</div>
						</div>
					</div>
				</form>	
</c:if>
			</div>
			<div class="card-footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-6">
<c:if test="${bm.showPrevNextYn eq 'Y' and !empty vo.boardSeq }">
	<c:if test="${!empty vo.prevSubject }">
						<a href="javascript:$javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${vo.prevBoardSeq }'});" class="btn btn-outline-primary">이전글</a>
	</c:if>
	<c:if test="${empty vo.prevSubject }">
						<a class="btn btn-outline-light disabled">이전글이 없습니다.</a>
	</c:if>
	<c:if test="${!empty vo.nextSubject }">
						<a href="javascript:$javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${vo.nextBoardSeq }'});" class="btn btn-outline-primary">다음글</a>
	</c:if>
	<c:if test="${empty vo.nextSubject }">					
						<a class="btn btn-outline-light disabled">다음글이 없습니다.</a>
	</c:if>
</c:if>							
						</div>
						<div class="col-lg-6 text-right">
							<a onclick="javascript:doSubmit();" class="btn btn-primary">저장</a>
							<a onclick="javascript:$.Nav('go', '../list/${bm.boardCode}', {bseq: ''});" class="btn btn-dark">취소</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>


<script type="text/javascript">
	var bTypeCode = '${bm.boardTypeFixedCode }';	

	function doSubmit() {
		if ($('input[name=subject]').val().trim().length == 0) {
			alert('제목을 입력해야 합니다.');
			return;
		}
		
		if (bTypeCode != '001005' && bTypeCode != '001006' && bTypeCode != '001010') {	
			var sBody = CKEDITOR.instances.body.getData();
			if (sBody.length == 0) {
				alert('본문 내용을 입력해야 합니다.');
				return;
			}
			
			$('#body').val(sBody);
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
		
		$('input[name=addCol4]').val($( "[name=bcSeq] option:selected" ).text())
		$('#form1').submit();
	}
	
	
	function doCommentSubmit() {
		if ($('#commBody').val().trim().length == 0) {
			alert('제목을 입력해야 합니다.');
			return;
		}
		$('#formReply').submit();
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>