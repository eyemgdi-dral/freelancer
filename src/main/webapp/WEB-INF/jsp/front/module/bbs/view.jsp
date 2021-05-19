<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
		게시판 - 상세
 --%>
 	<div class="content-detail">
 		<div class="p-3 border-top border-dark font-weight-500" style="background:#f7f7f7">
 			제목 : ${vo.subject }
 		</div>
 		<div class="container border-top border-bottom p-3">
	 		<div class="row justify-content-between">
	 			<div class="col-auto">
	 				등록자 : 
	 				<c:if test="${!vo.regUserIsAdmin}">
	 					${vo.regUser }
	 				</c:if>
	 				<c:if test="${vo.regUserIsAdmin}">
	 					관리자
	 				</c:if>
	 				
					
	 			</div>
	 			<div class="col-auto">
	 				등록일 : <fmt:formatDate value="${vo.regDate }" pattern="${bm.dateFormatView }"/>
	 			</div>
	 			<div class="col-auto">
	 				 조회수 : ${vo.readCount }
	 			</div>
	 		</div>
 		</div>
 		<div class="container border-bottom p-3 border-dark">
 			<c:if test="${bm.boardTypeFixedCode eq '001011'  }">
	 			<div>
		            <iframe width="100%" height="720" src="https://www.youtube.com/embed/${vo.linkUrl }" 
		            frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	 			</div>
 			</c:if>
 			${vo.body }
 			
<c:if test="${!empty vo.fileVOList }">			
	<c:forEach items="${vo.fileVOList }" var="l" >
		<c:if test="${bm.imageSizeHeight gt 0}">
			<c:set var="imageSizeHeight" value="style='width:${bm.imageSizeHeight }px;'" />
		</c:if>
		<c:if test="${bm.previewImageYn ne 'Y'}">
						<div class="text-right">
							<a class="mR10" onclick="javascript:downloadFile('${l.saveFilename }', '${l.originalFilename }');" title="다운로드">
								<i class="ni ni-image"></i>
			<c:if test="${bm.previewImageYn ne 'Y' or !l.isImageFile }">
								${l.originalFilename }
			</c:if>
							</a>
						</div>
		</c:if>
		<c:if test="${bm.previewImageYn eq 'Y' and l.isImageFile }">
						<div class="text-right">
								<img src="${UPLOAD_ROOT }${l.saveFilename}" ${imageSizeHeight } class="w-100">
						</div>
		</c:if>
	</c:forEach>
</c:if>
 		</div>
 	</div>
	
			
			
<c:if test="${bm.boardTypeFixedCode eq '001003'}">
			<div class="card">
	<c:if test="${!empty vo.answer }">	
				<div class="card-header">
					<div class="d-flex w-100 justify-content-between">
						<div>
							<h5 class="d-flex w-100 align-items-center mb-0">
							작성자 : <span class="ml-4">관리자</span>
							</h5>
						</div>
						<small><fmt:formatDate value="${vo.modDate }" pattern="${bm.dateFormatView }"/></small>
					</div>
				</div>
				<div class="card-body">
					<h4 class="">답변</h4>
					<p class="text-sm mb-0">${vo.answer }</p>
				</div>
	</c:if>	
	
			</div>
</c:if>



<div class="row justify-content-center" style="margin:2.5rem 0">

<c:if test="${bm.showPrevNextYn eq 'Y'}">	
	<c:if test="${!empty vo.prevSubject }">
			<a href="javascript:$.Nav('self', {bseq: '${vo.prevBoardSeq }'});" class="btn btn-outline-primary">이전글</a>
	</c:if>
	<c:if test="${!empty vo.nextSubject }">
			<a href="javascript:$.Nav('self', {bseq: '${vo.nextBoardSeq }'});" class="btn btn-outline-primary">다음글</a>
	</c:if>
</c:if>


			<a href="javascript:$.Nav('self', {bseq: '', bcseq: '', mode: ''});" class="btn btn-primary btn-lg">목록으로</a>
	<c:if test="${tagoplusSolution1_session_user.userId eq vo.regUser }">
		<c:if test="${bm.boardTypeFixedCode eq '001003' and empty vo.answer}">			
			<a href="javascript:$.Nav('self', {mode: 'write', status: 'u'});" class="btn btn-primary">수정</a>
		</c:if>				
			<a href="javascript:$.Nav('go', '/module/bbs/proc.do', {status: 'd'});" class="btn btn-danger">삭제</a>
	</c:if>	
</div>	

<c:if test="${bm.showListYn eq 'Y' }">
	<jsp:include page="/module/board.do" flush="true">
		<jsp:param name="mode" value="list"/>
	</jsp:include>
</c:if>

<c:if test="${bm.commentYn eq 'Y' }">
	<c:if test="${bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel }">		
			<div class="card mt-4">
				<form id="formComment" action="/module/comment/proc.do" method="post">
					<div class="card-body">
						<h5>작성자 : ${tagoplusSolution1_session_user.userName }</h5>
						<input type="hidden" name="boardSeq" value="${vo.boardSeq }">
						<input type="hidden" name="boardCode" value="${vo.boardCode }">
						<input type="hidden" name="parentSeq" value="0"/>
						
						<textarea rows="2" class="form-control" name="body" id="commentBody"></textarea>
						<div class="text-right mt-2">
						<c:if test="${!empty tagoplusSolution1_session_user }">
							<a onclick="javascript:doCommentSubmit();" class="btn btn-primary">등록하기</a>						
						</c:if>
						<c:if test="${empty tagoplusSolution1_session_user }">
							<a onclick="javascript:callLoginArea();" class="btn btn-primary">등록하기</a>						
						</c:if>
						</div>
					</div>
				</form>						
			</div>
		</c:if>
		<div class="comment-wrap" id="comment-wrap">
				<c:forEach items="${clist }" var="l">
					<div class="p-3 comment-body mb-2" data-id="${l.commentSeq }">
						<div class="d-flex justify-content-between align-items-center">
							<h5 class="mb-0 text-primary">${l.userName }</h5>
							<small class="text-muted text-xs"><fmt:formatDate value="${l.regDate }" pattern="${bm.dateFormatList }"/></small>
						</div>
						<div class="text-sm my-2 comment-content">
							${l.body}
						</div>
						<div class="comment-buttons">
				<c:if test="${bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel}">
							<a onclick="doReply(${l.commentSeq })">답변하기 </a>
				</c:if>
				<c:if test="${(bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel) and l.regUser eq tagoplusSolution1_session_user.userId }">
					
							<a onclick="doEdit(${l.commentSeq })">수정하기</a>
							<a onclick="doDelete(${l.commentSeq })">삭제하기</a>	
				</c:if>
						</div>
						<jsp:include page="/module/comment/sublist" flush="true" >
							<jsp:param name="bseq" value="${l.commentSeq }" />
						</jsp:include>
					</div>
				</c:forEach>
			
		</div>
	
		
</c:if>


<script id="replyTmpl" type="text/x-jquery-tmpl">
	<div class="reply mt-2">
		<div class="">
{{if commentSeq}}
			<input type="hidden" name="commentSeq" value="\${commentSeq}">
{{/if}}
			<input type="hidden" name="parentSeq" value="\${parentSeq}">
			<h5 class="mb-2 text-dark">\${userName}</h5>
			<textarea class="form-control" name="body" value="">\${body}</textarea>
		</div>
		<div class="text-right my-2">
			<a onclick="cancelReply()" class="btn-link btn-sm">취소</a>
			<a onclick="submitReply()" class="btn btn-primary btn-sm">저장하기</a>
		</div>
	</div>
</script>
<script id="commentTmpl" type="text/x-jquery-tmpl">
					<div class="p-3 comment-body mb-2 animated fadeInDown" data-id="\${commentSeq }">
						<div class="d-flex justify-content-between align-items-center">
							<h5 class="mb-0 text-primary">\${userName }</h5>
							<small class="text-muted text-xs">지금</small>
						</div>
						<div class="text-sm my-2 comment-content">
							\${body}
						</div>
						<div class="comment-buttons">
{{if hDepth < ${bm.commentLevel}}}
							<a onclick="doReply(\${commentSeq })" data-id="$\{commentSeq }">답변하기 </a>
{{/if}}
							<a onclick="doEdit(\${commentSeq })">수정하기</a>
							<a onclick="doDelete(\${commentSeq })">삭제하기</a>	
						</div>
					</div>
</script>
 
<script type="text/javascript" src="/common/js/custom/datetime.js"></script>
<script type="text/javascript">
	var $form = $("#formComment");
	var paramObj = {};
	$.each($form.serializeArray(), function(_, kv) {
		  paramObj[kv.name] = kv.value;
	});
	
	
	function doReply(cSeq){
		event.preventDefault();
		var obj = event.target;
		var parent = $(obj).closest('.comment-body');
		var reply = $('.reply');
			reply.remove()
			$.ajax({
				type : 'post',
				url : './ajax/check_login',
				data : {
					commentSeq : cSeq
				},
				dataType : 'json',
				success : function(data) {
					
					if(data.success){
						$('#commentBody').val("");
						$('#replyTmpl').tmpl({parentSeq : cSeq,userName:'${tagoplusSolution1_session_user.userName }'}).appendTo(parent);
					}else{
						alert(data.message);
						if(data.result == 1){
							callLoginArea();
						}
					}
				}
			});		
	}
	
	function doDelete(seq){
		if (!confirm("삭제하시겠습니까?"))
			return;
		
		$.ajax({
			url : '/module/comment/delete.do'
			, type : 'post'
			, dataType: 'json'
			, data: {commentSeq: seq}
			, success: function (data) {
				alert(data.message);
				console.log(data)
				if (data.success) {
					$('.comment-body[data-id='+data.result+']').addClass('animated fadeOutUp');
					setTimeout(function(){
						$('.comment-body[data-id='+data.result+']').remove();
					},1000);
				}
			}
			, error : function(data) {
				alert("error ajax :\n" + data.message);
			}
		});
	}
	function callLoginArea(){
		
	}
	function doCommentSubmit(){
		paramObj['body'] = $('#commentBody').val();
		sendComment(paramObj,null);
	};
	
	
	function submitReply(){
		event.preventDefault();
		var obj = event.target;
		var parent = $(obj).closest('.reply');
		paramObj['body'] = parent.find(':input[name=body]').val();
		paramObj['parentSeq'] = parent.find(':input[name=parentSeq]').val();
		paramObj['commentSeq'] = parent.find(':input[name=commentSeq]').val();
		sendComment(paramObj,$(obj).closest('.comment-body'));
	};
	
	
	function sendComment(paramObj,parent){
		if(paramObj['body'] == undefined ||paramObj['body'] == ""){
			alert("내용을 입력하세요.")
			return false;
		}
		$.ajax({
			url : '/module/comment/save.do'
			, type : 'post'
			, dataType: 'json'
			, data: JSON.stringify(paramObj)
			, contentType:'application/json'
			, success: function (data) {
				alert(data.message);
				if (data.success){
					if($('.comment-body[data-id='+data.result.commentSeq+']').length > 0){
						$('.comment-body[data-id='+data.result.commentSeq+']').find('.comment-content').text(data.result.body)
					}else if(parent == null){
						$('#commentTmpl').tmpl(data.result).prependTo("#comment-wrap");
					}else{
						$('#commentTmpl').tmpl(data.result).appendTo(parent);
					}
					$('.reply').remove();
				}
			}
			, error : function(data) {
				alert("error ajax :\n" + data.message);
			}
		});
	}
	function doEdit(cSeq){
		event.preventDefault();
		var obj = event.target;
		var parent = $(obj).closest('.comment-body');
		var body = parent.find('.comment-content').text();
		var reply = $('.reply');
		reply.remove()
		$.ajax({
			type : 'post',
			url : './ajax/check_edit',
			data : {
				commentSeq : cSeq,
				boardSeq : ${vo.boardSeq}
			},
			dataType : 'json',
			success : function(data) {
				if(data.success){
					$('#commentBody').val("");
					$('#replyTmpl').tmpl(data.result).appendTo(parent);
				}else{
					alert(data.message);
					if(data.result == 1){
						callLoginArea();
					}
				}
			}
		});	
	}
	function cancelReply(){
		event.preventDefault();
		var obj = event.target;
		var parent = $(obj).closest('.comment-body');
		parent.find('.reply').remove()
	}
</script>
