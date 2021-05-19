<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<c:if test="${!empty list }">
	<c:forEach items="${list }" var="ls">
		<div class="p-3 comment-body mt-2" data-id="${ls.commentSeq }">
			<div class="d-flex justify-content-between align-items-center">
				<h5 class="mb-0 text-primary">${ls.userName }</h5>
				<small class="text-muted text-xs"><fmt:formatDate value="${ls.regDate }" pattern="${ls.dateFormatList }"/></small>
			</div>
			<div class="text-sm my-2 comment-content">
				${ls.body}
			</div>
			<div class="comment-buttons">
	<c:if test="${(bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel) and ls.hDepth lt bm.commentLevel}">
				<a onclick="doReply(${ls.commentSeq })">답변하기</a>
	</c:if>
	<c:if test="${(bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel) and ls.regUser eq tagoplusSolution1_session_user.userId }">
				<a onclick="doEdit(${ls.commentSeq } )">수정하기</a>
				<a onclick="doDelete(${ls.commentSeq })">삭제하기</a>
	</c:if>	
			</div>
			<jsp:include page="/module/comment/sublist" flush="true">
				<jsp:param name="bseq" value="${ls.commentSeq }" />
				<jsp:param name="maxLevel" value="${search.maxLevel}" />
			</jsp:include>
			
		</div>
</c:forEach>
</c:if>
