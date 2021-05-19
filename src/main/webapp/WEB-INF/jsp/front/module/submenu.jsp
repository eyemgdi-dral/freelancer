<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<c:choose>
	<c:when test="${parent.menuIdx eq '010000'}">
		<c:set var="bg" value="url(/images/pages/sub_img3.jpg)"/> 
	</c:when>
	<c:otherwise>
		<c:set var="bg" value="url(/images/pages/sub_img2.jpg)"/> 
	</c:otherwise>
</c:choose>
<div class="header d-flex align-items-center pt-5" style="max-height: 23.563rem;min-height: 200px; background-image:  ${bg }; background-size: cover; background-position: center top;">
		<!-- Mask -->
		<span class="mask"></span>
		<!-- Header container -->
		<div class="container-fluid py-4 py-sm-8">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h1 class="display-2 text-white">${parent.menuName }</h1>
					<p class="text-white my-0 sub-text">
						${parent.menuTable }
					</p>
				</div>
			</div>
		</div>
		
</div>
		
<div class="container mt--4">
		<div class="breadcrumb bg-primary" style="position:relative;z-index:1">
			<a class="breadcrumb-item home">
				<i class="fas fa-home"></i>
			</a>
	<c:if test="${!empty parent}">
			<a class="breadcrumb-item">
			${parent.menuName }
			</a>
	</c:if>
				<a class="breadcrumb-item"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${vo.menuName }</a>
<c:if test="${!empty list}">
			<div class="dropdown-menu">
	<c:forEach items="${list}" var="item" varStatus="loop">
		<c:if test="${item.menuType eq '7001' }">
				<a href="/board/board?menuid=${item.menuIdx}" class="dropdown-item">
				    ${item.menuName}
			  	</a>
		</c:if>
		<c:if test="${item.menuType eq '7002' }">
				<a href="/pages/page/${item.menuIdx}" class="dropdown-item">
				    ${item.menuName}
			  	</a>
		</c:if>
		<c:if test="${item.menuType eq '7004' }">
				<a href="/form/view/${item.menuIdx}" class="dropdown-item">
				    ${item.menuName}
			  	</a>
		</c:if>
	</c:forEach>
			</div>
</c:if>
		</div>
		
		<h1 class="text-center my-5">${vo.menuName }</h1>
	<%-- <div class="row">
		<div class="col-lg-2 d-none d-lg-block">
<c:if test="${!empty list}">
			<div class="list-group">
	<c:forEach items="${list}" var="item" varStatus="loop">
		<c:if test="${item.menuType eq '7001' }">
				<a href="/board/board?menuid=${item.menuIdx}" class="list-group-item list-group-item-action ${vo.menuIdx eq item.menuIdx?'active':'' }">
				    ${item.menuName}
			  	</a>
		</c:if>
		<c:if test="${item.menuType eq '7002' }">
				<a href="/pages/page/${item.menuIdx}" class="list-group-item list-group-item-action ${vo.menuIdx eq item.menuIdx?'active':'' }">
				    ${item.menuName}
			  	</a>
		</c:if>
		<c:if test="${item.menuType eq '7004' }">
				<a href="/form/view/${item.menuIdx}" class="list-group-item list-group-item-action ${vo.menuIdx eq item.menuIdx?'active':'' }">
				    ${item.menuName}
			  	</a>
		</c:if>
	</c:forEach>
			</div>
</c:if> --%>
		
        