<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		배너생성 - 임시	
 --%>
<style >
</style>
<div class="main-banner">
	<c:forEach var="m" items="${list }" varStatus="s">
		<c:if test="${m.bannerType eq'I' }">
			<div>
				<div class="main-slide" style="background-image:url(${UPLOAD_ROOT }${m.file.saveFilename})">
					<div class="container-big">
						${m.body}
					</div>
				</div>
				
			</div>
		</c:if>
		
		<c:if test="${m.bannerType eq'B' }">
			<div>
				${m.body }
			</div>
		</c:if>
		
	</c:forEach>
</div>
<c:if test="${search.paging.totalRecordCount gt 1 }">
	<script>
		$('.main-banner').on('init',function(event, slick){
			var temp = '<div class="slick-count"><span id="slick-current"></span> / <span id="slick-total"></span></div>';
			$(this).append($(temp));
			addSlickNumber1(slick);
		})
		$('.main-banner').slick({
			infinite: true,
			arrows: true,
			dots: false,
			autoplay: true,
			autoplaySpeed: 2000,
		})
		$('.main-banner').on('afterChange',function(event, slick, direction){
			addSlickNumber1(slick)
		})
		function addSlickNumber1(slick){
			var total = slick.$slides.length;
			var current = slick.currentSlide + 1;
			$('#slick-current').text(current)
			$('#slick-total').text(total)
		}
	</script>
</c:if>
<%--  
<c:set var="margin">style="border-collapse: separate; border-spacing: ${bm.margin }px;"</c:set>
<c:if test="${empty bm.margin || bm.margin == 0 }">
	<c:set var="margin" value="" />
</c:if>

 <!-- 가로형 이미지 -->
<c:if test="${bm.direction == 'H' && bm.imgCount > 0}">
<table ${margin }>
	<c:forEach var="n" begin="0" end="${fn:length(list) - 1 }" step="${bm.lfCount }">
	<c:set var="loop" value="true" />
			<tr>
		<c:forEach var="m" items="${list }" varStatus="s" begin="${n }">
			<c:if test="${loop }">
				<c:choose>
					<c:when test="${m.linkTarget == '_blank'}">
						<td><a href="javascript:popUpWin('${m.linkUrl }', '${bm.masterName }', 1000, 1000);"><img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" /></a></td>
					</c:when>
					<c:when test="${m.linkTarget == '_self'}">
						<td><a href="${m.linkUrl }"><img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" /></a></td>
					</c:when>
					<c:otherwise>
						<td><img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" /></td>
					</c:otherwise>
				</c:choose>
				<c:if test="${(s.index+1) % bm.lfCount == 0 }">
					<c:set var="loop" value="false" />
				</c:if>
			</c:if>
		</c:forEach>
			</tr>
	</c:forEach>		
</table>
</c:if>


<!-- 세로형 이미지 -->
<c:if test="${bm.direction == 'V' }"> 
<table ${margin }>
	<c:forEach var="m" items="${list }" varStatus="s">
		<tr>
		<c:choose>
			<c:when test="${m.linkTarget == '_blank'}">
				<td><a href="javascript:popUpWin('${m.linkUrl }', '${bm.masterName }', 1000, 1000);"><img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" /></a></td>
			</c:when>
			<c:when test="${m.linkTarget == '_self'}">
				<td><a href="${m.linkUrl }"><img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" /></a></td>
			</c:when>
			<c:otherwise>
				<td><img src="${UPLOAD_ROOT }${m.file.saveFilename}" class="img" width="100%" /></td>
			</c:otherwise>
		</c:choose>
		</tr>
	</c:forEach>
</table>
</c:if>

<!-- 배너내용(HTML) -->
<c:if test="${bm.imgCount == 0}">
<c:forEach var="m" items="${list }" varStatus="s">
	${m.body }
</c:forEach>
</c:if>
 --%>

