<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
	프론트용 페이저

	server attribute에 search 객체를 추가해야 함.
	하단 goPage() 메서드 있음 : jquery.locator.js 필요
	test : <div>startPage : ${search.paging.startPage }, endPage : ${search.paging.endPage }, totalCount : ${search.paging.totalCount }</div>
	
	
	<div class="pagenum">	
		<span>
			<a href="" class="btn_prev2"></a>
			<a href="" class="btn_prev1"></a>
		</span>
		<span class="mL3">
			<a href="" class="on">1</a>
			<a href="">2</a>
			...
		</span>
		<span class="mL3">
			<a href="" class="btn_next1"></a>
			<a href="" class="btn_next2"></a>
		</span>
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