<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		배너생성 - 임시	
 --%>
 
 
<c:set var="margin">style="margin: ${bm.margin }px;"</c:set>
<c:if test="${empty bm.margin || bm.margin == 0 }">
	<c:set var="margin" value="" />
</c:if>

 <!-- 가로형 이미지 -->
<c:if test="${bm.direction == 'H' && bm.imgCount > 0}">
<div class="mb-4">
	<c:forEach var="n" begin="0" end="${fn:length(list) - 1 }" step="${bm.lfCount }">
	<c:set var="loop" value="true" />
		<c:forEach var="m" items="${list }" varStatus="s" begin="${n }">
			<c:if test="${loop }">
				<c:choose>
					<c:when test="${m.linkTarget == '_blank'}">
						<a href="javascript:popUpWin('${m.linkUrl }', '${bm.masterName }', 1000, 1000);">
						<img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" />
						</a>
					</c:when>
					<c:when test="${m.linkTarget == '_self'}">
						<a href="${m.linkUrl }"><img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" /></a>
					</c:when>
					<c:otherwise>
						<img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" />
					</c:otherwise>
				</c:choose>
				<c:if test="${(s.index+1) % bm.lfCount == 0 }">
					<c:set var="loop" value="false" />
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>		
</div>
</c:if>


<!-- 세로형 이미지 -->
<c:if test="${bm.direction == 'V' }"> 
<div class="my-4">
	<c:forEach var="m" items="${list }" varStatus="s">
		<c:choose>
			<c:when test="${m.linkTarget == '_blank'}">
				<a href="javascript:popUpWin('${m.linkUrl }', '${bm.masterName }', 1000, 1000);">
					<img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" />
				</a>
			</c:when>
			<c:when test="${m.linkTarget == '_self'}">
				<a href="${m.linkUrl }">
					<img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" />
				</a>
			</c:when>
			<c:otherwise>
				<img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" />
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
</c:if>

<!-- 배너내용(HTML) -->
<c:if test="${bm.imgCount == 0}">
<c:forEach var="m" items="${list }" varStatus="s">
	${m.body }
</c:forEach>
</c:if>


