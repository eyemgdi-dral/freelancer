<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<jsp:useBean id="current" class="java.util.Date" />

<%--
		게시판 - 등록 & 수정
 --%>
 <c:set var="saveText" value="저장하기"/>
 <c:if test="${bm.boardTypeFixedCode eq '001003' }">
		<c:set var="saveText" value="질문하기"/>
</c:if>
<div class="">
	<form id="form1" action="/module/bbs/proc.do" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="bcode" value="${search.bcode }" />
		<input type="hidden" name="bseq" value="${search.bseq }" />
		<input type="hidden" name="menuid" value="" />
		<input type="hidden" name="status" value="${search.status }"/>
		<input type="hidden" name="readCount" value="${vo.readCount }"/>
<c:if test="${bm.boardTypeFixedCode eq '001002' }">
		<div>
			<div class="fl">
			</div>
			<div class="fr mb10">
				<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}?prSeq=${search.bseq }&bseq=0');" class="btn btn_round bg_blue">답글 쓰기</a>
			</div>
		</div>
		<br class="clear mb5" />
</c:if>		

		<table class="table-form table">
			<colgroup>
				<col width="10%" />
				<col width="40%" />
			</colgroup>
			<tbody>
				<tr>
					<th>작성자 </th>
					<td>${tagoplusSolution1_session_user.userName}
						<input type="text" name="regUser" class="form-control" value="${vo.regUser }" />
						<script>
							$(function() {
								var sRegUser = '${vo.regUser}' || '${tagoplusSolution1_session_user.userId}';
								if ($('input[name=regUser]').val().trim().length == 0) {
									$('input[name=regUser]').val(sRegUser);
								}
							});
						</script>						
					</td>
				</tr>
				
				<tr>
					<th>제목 </th>
					<td><input type="text" class="form-control" name="subject" value="${vo.subject }" /></td>
				</tr>
				<c:if test="${fn:length(bm.boardCategoryVO)} > 0">
					<tr>
						<th>카테고리 </th>
						<td>
							<tt:select name="boardCategory" class="w100" list="${bm.boardCategoryVO }" listKey="bcSeq" listValue="cateName" indexKey="0" indexValue="= 카테고리 =" selected="${vo.bcSeq }" />
						</td>
									
					</tr>
				</c:if>
			
<c:if test="${bm.boardTypeFixedCode ne '001005' and bm.boardTypeFixedCode ne '001006' and bm.fileUploadCount gt 0}">
	<c:if test="${empty vo.fileVOList }">
		<c:set var="fileSize" value="0"/>
	</c:if>
	<c:if test="${!empty vo.fileVOList }">
		<c:set var="fileSize" value="${fn:length(vo.fileVOList) }"/>
	</c:if>
	
				<tr>	
					<th>파일</th>
					<td>
	<c:forEach items="${vo.fileVOList }" var="l">
						<p class="mT5">
							<input type="hidden" name="FileSeqList" value="${l.fileSeq }">
							<input type="file" name="fileList">
							<a href="javascript:viewFile('${UPLOAD_ROOT },${l.saveFilename }');">${l.originalFilename }</a>
						</p>
	</c:forEach>
	
	<c:forEach varStatus="s" step="1" begin="1" end="${bm.fileUploadCount - fileSize }">
						<p class="mT5">
							<input type="hidden" name="FileSeqList" value="0">
							<input type="file" name="fileList">
						</p>
	</c:forEach>	
					</td>
				</tr>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001005' or bm.boardTypeFixedCode eq '001006' }">
				<tr>
					<th>이미지 파일</th>
					<td colspan="3">					
						<input type="hidden" name="fileSeqList" value="${empty fileList[0].fileSeq ? 0 : fileList[0].fileSeq }">
						<input type="file" name="fileList">
						<a href="javascript:viewFile('${UPLOAD_ROOT }${fileList[0].saveFilename }');">${fileList[0].originalFilename }</a>
					</td>
				</tr>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001005' }">
				<tr>
					<th>이동 경로</th>
					<td colspan="3">
						<input type="text" name="linkUrl" class="w100" value="${empty vo.linkUrl ? 'http://' : vo.linkUrl}">
					</td>
				</tr>
</c:if>
<c:if test="${bm.boardTypeFixedCode eq '001003' }">
				<tr>
					<th>비밀번호</th>
					<td colspan="3">
						<input type="hidden" name="secretYn" value="Y" />
						<input type="password" name="pwd" class="form-control" value="">
					</td>
				</tr>
</c:if>

<c:if test="${bm.boardTypeFixedCode ne '001005' }">
			<!-- 	<tr>
					<td colspan="4">
						<label><input type="checkbox" name="useHtml" class="" value="Y" /> HTML 사용</label>
						<label><input type="checkbox" name="useSecret" class="ml15" value="Y" /> 비밀글</label>
						<label><input type="checkbox" name="useNotice" class="ml15" value="Y" /> 공지글</label>
						<input type="hidden" name="htmlYn" value="" />
						<input type="hidden" name="secretYn" value="" />
						<input type="hidden" name="noticeYn" value="" />
						<script>
							$(function() {
								checkCheckbox('useHtml', 'htmlYn', '${vo.htmlYn}', 'Y');
								checkCheckbox('useSecret', 'secretYn', '${vo.secretYn}', 'N');
								checkCheckbox('useNotice', 'noticeYn', '${vo.noticeYn}', 'N');
							});
						</script>
					</td>
				</tr> -->
				<tr>
					<th>내용</th>
					<td>					
						<textarea id="body" name="body" rows="15" class="editor form-control">${vo.body }</textarea>
						<c:if test="${bm.editorYn eq 'Y' }">
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
						</c:if>
					</td>
				</tr>
</c:if>

			</tbody>
		</table>

		<div class="card-footer">
			<div class="row justify-content-center">
					<a href="javascript:$.Nav('self', {bseq: '', bcseq: '', mode: ''});" class="btn btn-outline-primary btn-lg">목록가기</a>
					<a href="javascript:doSubmit();" class="btn btn-primary btn-lg">${saveText }</a>
					<a onclick="javascript:doCancel();" class="btn btn-light text-white  btn-lg">취소하기</a>
				</div>
			</div>
			<p class="fleft"></p>
			<p class="fright">
				
			</p>
		</div>
	</form>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	var bTypeCode = '${bm.boardTypeFixedCode }';	

	function doCancel () {		
		var iBseq = '${search.bseq}';
		
		if (iBseq != '0') {
			$.Nav('self', {mode: 'view'});
		} else {
			$.Nav('self', {mode: 'list'});
		}
	}
	
	function doSubmit() {
		if ($('input[name=subject]').val().trim().length == 0) {
			alert('제목을 입력해야 합니다.');
			return;
		}
		
		if (bTypeCode != '001005') {	
			var sBody = CKEDITOR.instances.body.getData();
			if (sBody.length == 0) {
				alert('본문 내용을 입력해야 합니다.');
				return;
			}
			
			$('#body').val(sBody);
		}
		if (bTypeCode == '001003' ) {
			if ($('input[name=pwd]').val().trim().length == 0) {
				alert('비밀번호를 입력해야 합니다.');
				return;
			}
			if ($('input[name=regUser]').val().trim().length == 0) {
				alert('작성자를 입력해야 합니다.');
				return;
			}
		}
		$('input[name=menuid]').val($('input[name=menuIdx]').val())
		
		if (!confirm('저장하시겠습니까?'))
			return;
		
		$('#form1').submit();
	}
</script>