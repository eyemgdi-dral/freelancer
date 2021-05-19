<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
	server attribute에 search 객체를 추가해야 함.
	하단 goPage() 메서드 있음 : jquery.locator.js 필요
	test : <div>startPage : ${search.paging.startPage }, endPage : ${search.paging.endPage }, totalCount : ${search.paging.totalCount }</div>
	
	<div class="page_num">
	    <span><a href="" class="page_prev_btn">&lt;&lt;</a></span>
	    <span><a href="" class="page_prev_btn">&lt;</a></span>
	    <span><a href="" class="on">1</a></span>
	    <span><a href="">2</a></span>
	    <span><a href="">3</a></span>
	    <span><a href="">4</a></span>
	    <span><a href="">5</a></span>
	    <span><a href="">6</a></span>
	    <span><a href="">7</a></span>
	    <span><a href="">8</a></span>
	    <span><a href="">9</a></span>
	    <span><a href="">10</a></span>
	    <span><a href="" class="page_next_btn">&gt;</a></span>
	    <span><a href="" class="page_next_btn">&gt;&gt;</a></span>
	</div>
--%>
<c:if test="${search.paging.totalCount > 0}">
<nav>
 	<ul class="justify-content-center pagination my-2 ${empty search.paging.pagerClassName ? '' : search.paging.pagerClassName}">
		
		<c:choose>
			<c:when test="${search.paging.pageIndex gt 1 }">
				<li class="page-item">
					<a class="page-link" href="javascript:goPage(1);" aria-label="Previous">
						<i class="fas fa-angle-double-left"></i>
			      	</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" aria-label="Previous">
						<i class="fas fa-angle-double-left"></i>
			      	</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${search.paging.currentBlockIndex gt 1}">
				<li class="page-item">
					<a class="page-link" href="javascript:goPage(${search.paging.blockCount * (search.paging.currentBlockIndex - 1) });" aria-label="Previous">
				        <i class="fa fa-angle-left"></i>
			      	</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" aria-label="Previous">
				        <i class="fa fa-angle-left"></i>
			      	</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach begin="${search.paging.startPage}" end="${search.paging.endPage}" var="page" varStatus="s">
			<c:choose>
				<c:when test="${page eq search.paging.pageIndex }">
				    <li class="page-item active"><a class="page-link">${page }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a href="javascript:goPage(${page });" class="page-link">${page }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${search.paging.totalPageCount gt search.paging.endPage }">
				<li class="page-item">
		      		<a class="page-link" href="javascript:goPage(${search.paging.endPage + 1});" aria-label="Next">
		        		<i class="fa fa-angle-right"></i>
		      		</a>
		    	</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
		      		<a class="page-link" aria-label="Next">
		        		<i class="fa fa-angle-right"></i>
		      		</a>
		    	</li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${search.paging.pageIndex lt search.paging.totalPageCount }">
				<li class="page-item">
		      		<a class="page-link" href="javascript:goPage(${search.paging.totalPageCount});" aria-label="Next">
		        		<i class="fas fa-angle-double-right"></i>
		      		</a>
		    	</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
		      		<a class="page-link" aria-label="Next">
		        		<i class="fas fa-angle-double-right"></i>
		      		</a>
		    	</li>
			</c:otherwise>
		</c:choose>	
	</ul>
</nav>
	<script type="text/javascript">
		function goPage(index) {
			$.Nav('go', location.pathname, {'cpage': index});
		}
	</script>
</c:if>