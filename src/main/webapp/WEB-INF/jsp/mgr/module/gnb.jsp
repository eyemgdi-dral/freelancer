<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
	GNB : TS_SITE.USE_MENU 필드에 저장된 페이지 값 사용
		- 슈퍼유저도 영향을 받음
 --%>
	<!--header S-->
	
	<nav class="navbar navbar-horizontal navbar-expand-xl bg-white sticky-top">
		<div class="container-fluid">
			<ul class="navbar-nav align-items-center ">
				<li class="nav-item d-xl-none">
					<div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
		            	<div class="sidenav-toggler-inner">
							<i class="sidenav-toggler-line"></i>
							<i class="sidenav-toggler-line"></i>
							<i class="sidenav-toggler-line"></i>
		                </div>
		            </div>
				</li>
			</ul>
			<button class="ml-auto btn btn-sm btn-outline-white d-xl-none" type="button" data-toggle="collapse" data-target="#navbar-primary" aria-controls="navbar-primary" aria-expanded="true" aria-label="Toggle navigation">
				메뉴
			</button>
			<div class="navbar-collapse collapse " id="navbar-primary" style="">
				<div class="navbar-collapse-header">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="javascript:void(0)">
								<img src="/images/mgr/logo.png" class="" alt="...">
            				</a>
          				</div>
          				<div class="col-6 collapse-close">
	            			<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-primary" aria-controls="navbar-primary" aria-expanded="true" aria-label="Toggle navigation">
	              				<span></span>
	              				<span></span>
	            			</button>
          				</div>
        			</div>
      			</div>
      			<ul class="navbar-nav">
        			
<c:forEach var="m" items="${menus}" varStatus="s">
	<c:if test="${!empty tagoplusSolution1_session_admin.adminAuth}">
		<c:forEach var="ms" items="${tagoplusSolution1_session_admin.adminAuth}" varStatus="g">
			<c:if test="${ms.menuId eq m.menuIdx and !empty ms.authoList}">
					<li data-gnbMenuIdx="${m.menuIdx}" class="nav-item">
						<a class="nav-link" href="${URL_ADMIN_ROOT}${m.folderPath }">${m.menuName }</a>
					</li>
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}">
					<li data-gnbMenuIdx="${m.menuIdx}" class="nav-item">
						<a class="nav-link" href="${URL_ADMIN_ROOT}${m.folderPath }">${m.menuName }</a>
					</li>
	</c:if>
</c:forEach>
        			
      			</ul>
      			
      			<ul class="navbar-nav ml-lg-auto">
                	<li class="nav-item">
                    	<a class="nav-link nav-link-icon" href="${URL_FRONT_MAIN }">
                        	<i class="ni ni-shop"></i>
                        	<span class="nav-link-inner--text d-xl-none">내홈페이지바로가기</span>
                       	</a>
                   	</li>
                	<li class="nav-item">
                    	<a class="nav-link nav-link-icon" id="LogoutBtn">
                        	<i class="ni ni-user-run"></i>
                        	<span class="nav-link-inner--text d-xl-none">로그아웃</span>
                       	</a>
                   	</li>
				</ul>
                    
    		</div>
  		</div>
	</nav>
	<c:if test="${reqURI ne '/mgr/index.do'}">
		<div class='header pb-6'>
			<div class="container-fluid">
				<div class="row align-items-center py-4">
		            <div class="col-lg-6 col-7">
	              		<h6 class="h2 d-inline-block mb-0" id="currentText1"></h6>
	              		<nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
			                <ol class="breadcrumb breadcrumb-links">
		                  		<li class="breadcrumb-item"><i class="fas fa-home"></i></li>
			                  	<li class="breadcrumb-item" id="parentMenuText"></li>
			                  	<li class="breadcrumb-item active" aria-current="page" id="currentText"></li>
			                </ol>
		              	</nav>
	            	</div>
	          	</div>
			</div>
		</div>
	</c:if>
	
	
<script type="text/javascript">
	$(function() {
		$('#LogoutBtn').click(function() {
			location.href = '/mgr/login/logout';
		});
	});
</script>