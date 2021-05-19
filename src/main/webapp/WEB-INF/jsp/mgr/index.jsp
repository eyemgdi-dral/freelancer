<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
    <div class="scrollbar-inner">
		<div class="sidenav-header  align-items-center">
			<a class="navbar-brand" href="${URL_ADMIN_MAIN }">
		  		<img src="/images/mgr/logo.png" class="navbar-brand-img" alt="...">
			</a>
		</div>
		<div class="navbar-inner">
	    	<div class="collapse navbar-collapse" id="sidenav-collapse-main">
	        	<ul class="navbar-nav">
	        		<li class="nav-item">
	              		<a class="nav-link active" href="examples/dashboard.html">
	                		<i class="ni ni-tv-2 text-primary"></i>
	                		<span class="nav-link-text">요약</span>
	              		</a>
	              		
	            	</li>
	          	</ul>
	          	<!-- <ul class="navbar-nav mb-md-3">
	          		<li class="nav-item">
	              		<a class="nav-link active active-pro" href="examples/upgrade.html">
	                		<i class="ni ni-send text-dark"></i>
	                		<span class="nav-link-text">Upgrade to PRO</span>
	              		</a>
	            	</li>
	          	</ul> -->
			</div>
		</div>
	</div>
</nav>
	
<div class="main-content" id="panel">
	
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do"></jsp:include>
	
	<jsp:include page="${URL_ADMIN_ROOT }/dashboard/stat_user_list"></jsp:include> 	
	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>

</div>
	
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
	
	

       

