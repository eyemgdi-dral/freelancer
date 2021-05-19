<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<nav class="navbar" id="nav">
    <div class="container-big">
    	<div class="row align-items-center flex-nowrap">
    		<div class="col">
	   			<a class="navbar-brand" href="/">
					<img src="/images/main/logo.png" class="logo">       	
					<img src="/images/main/logo_white.png" class="logo_white">       	
	    		</a>
    		</div>
    		<div class="d-none d-lg-block col-auto">
	           	 <ul class="navbar-nav d-none d-xl-flex justify-content-center">
					<c:forEach items="${list}" var="item" varStatus="loop">
						
						<c:set var="hasChild" value=""/>
						<c:if test="${item.hasChild eq true}">
					    	<c:set var="hasChild" value='id="navbar-default_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"'/>
					    </c:if>
					    
					    <c:if test="${item.menuIdx eq '040000' }">
					    	<c:if test="${item.hasChild eq true}">
						    	<c:forEach items="${childList}" var="itemChild" varStatus="loop">
									<c:if test="${itemChild.parentIdx eq '040000'}">
									<li class="nav-item">
										<c:choose>
									    	<c:when test="${itemChild.menuType eq '7001'}">
												<a class="nav-link" href="/board/board?menuid=${itemChild.menuIdx}" >${itemChild.menuName}</a>
									    	</c:when>
									    	<c:when test="${itemChild.menuType eq '7002'}">
												<a class="nav-link" href="/pages/page/${itemChild.menuIdx}" >${itemChild.menuName}</a>
									    	</c:when>
									    	<c:when test="${itemChild.menuType eq '7004'}">
												<a class="nav-link" href="/form/view/${itemChild.menuIdx}" >${itemChild.menuName}</a>
									    	</c:when>
									    	<c:otherwise>
												<a class="nav-link" href="${itemChild.folderPath}" >${itemChild.menuName}</a>
									    	</c:otherwise>
									    </c:choose>
									</li>
									</c:if>
								</c:forEach>
					    	</c:if>
						</c:if>
						<c:if test="${item.menuIdx ne '040000' }">
							
						
					                <li class="nav-item">
					    <c:choose>
					    	<c:when test="${item.menuType eq '7001'}">
					                    <a class="nav-link" href="/board/board?menuid=${item.menuIdx}" ${hasChild } >
					                        ${item.menuName}
					                    </a>
					    	</c:when>
					    	<c:when test="${item.menuType eq '7002'}">
					                    <a class="nav-link" href="/pages/page/${item.menuIdx}" ${hasChild } >
					                        ${item.menuName}
					                    </a>
					    	</c:when>
					    	<c:when test="${item.menuType eq '7004'}">
					                    <a class="nav-link" href="/form/view/${item.menuIdx}" ${hasChild } >
					                        ${item.menuName}
					                    </a>
					    	</c:when>
					    	<c:otherwise>
					                    <a class="nav-link" href="${item.folderPath}" ${hasChild } >
					                        ${item.menuName}
					                    </a>
					    	</c:otherwise>
					    </c:choose>
					    <c:if test="${item.hasChild eq true}">
					    				<div class="sub-menu">
							<c:forEach items="${childList}" var="itemChild" varStatus="loop">
								<c:if test="${itemChild.parentIdx eq item.menuIdx}">
									<c:choose>
								    	<c:when test="${itemChild.menuType eq '7001'}">
											<a class="sub-link" href="/board/board?menuid=${itemChild.menuIdx}" >${itemChild.menuName}</a>
								    	</c:when>
								    	<c:when test="${itemChild.menuType eq '7002'}">
											<a class="sub-link" href="/pages/page/${itemChild.menuIdx}" >${itemChild.menuName}</a>
								    	</c:when>
								    	<c:when test="${itemChild.menuType eq '7004'}">
											<a class="sub-link" href="/form/view/${itemChild.menuIdx}" >${itemChild.menuName}</a>
								    	</c:when>
								    	<c:otherwise>
											<a class="sub-link" href="${itemChild.folderPath}" >${itemChild.menuName}</a>
								    	</c:otherwise>
								    </c:choose>
								</c:if>
							</c:forEach>
					                    </div>
					    </c:if>
					                </li>
					    </c:if>
					</c:forEach>
	
					<c:if test="${empty tagoplusSolution1_session_user }">	
						<li class="nav-item">
					        <a class="nav-link" href="javascript:$.Nav('go', '/member_login.jsp');">
					            로그인
					        </a>
						</li>
						<li class="nav-item">
					        <a class="nav-link" href="member_join.jsp">
					            회원가입
					        </a>
						</li>
					</c:if>	
					
					<c:if test="${!empty tagoplusSolution1_session_user }">	
						<li class="nav-item">
					        <a class="nav-link" href="javascript:$.Nav('go', '/member_info.jsp', {id: '${tagoplusSolution1_session_user.userId}'});">
					           마이 페이지
					        </a>
						</li>
						<li class="nav-item">
					        <a class="nav-link" href="javascript:$.Nav('go', '/logout');">
					            로그아웃
					        </a>
						</li>
					</c:if>	
	
	            </ul>
			</div>
			<div class="col text-right">
				<div class="d-flex justify-content-end">
					<div class="sidenav-toggler sidenav-toggler-dark" data-action="toggle-nav">
						<div class="sidenav-toggler-inner" >
							<i class="sidenav-toggler-line"></i>
							<i class="sidenav-toggler-line"></i>
							<i class="sidenav-toggler-line"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
        
            
	</div>
</nav>
<nav class="" id="sidenav-main">

			<div class="sidenav-head">
				<div class="container-big">
					<div class="row align-items-center">
						<div class="col d-none d-lg-block">
						</div>
						<div class="col-auto text-center">
							<a href="/">
								<img src="/images/main/logo.png" class="logo">
							</a>
						</div>
						<div class="col">
							<div class="sidenav-toggler " data-action="toggle-nav">
								<div class="sidenav-toggler-inner ml-auto" >
									<i class="sidenav-toggler-line"></i>
									<i class="sidenav-toggler-line"></i>
									<i class="sidenav-toggler-line"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="navbar-inner">
					<ul class="navbar-nav">

			
<c:forEach items="${list}" var="item" varStatus="loop">
	<c:set var="hasChild" value=""/>
	<c:if test="${item.hasChild eq true}">
    	<c:set var="hasChild" value='class="nav-link" href="#navbar-${loop.index }" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-${loop.index }"'/>
    </c:if>
                <li class="nav-item">
                
    
	    <c:choose>
	    	<c:when test="${item.menuType eq '7001'}">
	                    <a ${hasChild } class="nav-link font-weight-400" href="/board/board?menuid=${item.menuIdx}"  >
	                        ${item.menuName}
	                    </a>
	    	</c:when>
	    	<c:when test="${item.menuType eq '7002'}">
	                    <a ${hasChild }  class="nav-link font-weight-400" href="/pages/page/${item.menuIdx}" >
	                        ${item.menuName}
	                    </a>
	    	</c:when>
	    	<c:when test="${item.menuType eq '7004'}">
	                    <a ${hasChild } class="nav-link font-weight-400" href="/form/view/${item.menuIdx}"  >
	                        ${item.menuName}
	                    </a>
	    	</c:when>
	    	<c:otherwise>
	                    <a ${hasChild } class="nav-link font-weight-400" href="${item.folderPath}"  >
	                        ${item.menuName}
	                    </a>
	    	</c:otherwise>
	    </c:choose>
	    <c:if test="${item.hasChild eq true}">
	    				<div class="" id="navbar-${loop.index }" style="">
	    					<ul class="child-menu">
			<c:forEach items="${childList}" var="itemChild" varStatus="loop">
				<c:if test="${itemChild.parentIdx eq item.menuIdx}">
								<li class="child-item">
					<c:choose>
				    	<c:when test="${itemChild.menuType eq '7001'}">
								<a class="child-link" href="/board/board?menuid=${itemChild.menuIdx}" >
									<span class="sidenav-normal">${itemChild.menuName}</span>
								</a>
				    	</c:when>
				    	<c:when test="${itemChild.menuType eq '7002'}">
								<a class="child-link" href="/pages/page/${itemChild.menuIdx}" >${itemChild.menuName}</a>
				    	</c:when>
				    	<c:when test="${itemChild.menuType eq '7004'}">
								<a class="child-link" href="/form/view/${itemChild.menuIdx}" >${itemChild.menuName}</a>
				    	</c:when>
				    	<c:otherwise>
								<a class="child-link" href="${itemChild.folderPath}" >${itemChild.menuName}</a>
				    	</c:otherwise>
				    </c:choose>
								</li>
				</c:if>
			</c:forEach>
							</ul>
	                    </div>
	    </c:if>
                </li>
</c:forEach>
		</ul>
		
		<div class="text-center mt-auto d-block d-lg-none">
			<h5 class="font-weight-500 mb-0">
			<img src="">${tagoplusSolution1_session_site.adminPhone }</h5>
			<p>주증 09:00 ~ 18:00  토/일 공휴일 휴무</p>
		</div>
		<div class="row no-gutters d-flex d-lg-none">
			<div class="col-4">
				<a class="btn btn-block btn-primary btn-lg px-0" href="/common/동명TRM(20200810_편집본).pdf" target="_blank">
					<img src="/images/main/pdf.png" width="20px" class="mr-1">
					회사소개서
				</a>
			</div>
			<div class="col-4">
				<a class="btn btn-block btn-kakao btn-lg px-0" href="https://open.kakao.com/o/sw2yGxTc" target="_blank">
					<img src="/images/main/kakao.png" width="20px" class="mr-1">
					카카오톡상담
				</a>
			</div>
			<div class="col-4">
				<a class="btn btn-block btn-kakao btn-lg px-0" href="https://dmtrm.modoo.at/" target="_blank" style="background-color:#23b14d;color:white">
					<img src="/images/main/online.png" width="20px" class="mr-1">
					동명양수기
				</a>
			</div>
		</div>	
		
		
		</div>

</nav>

<script>
$(function() {
	var menuCount = $('.sub-menu').length;
	for (i = 0; i < $('.sub-menu').length; i++) {
		console.log(i)
		if(i > Math.floor((menuCount/2)) - 1 ){
			$('.sub-menu').eq(i).css('right','0')
		}else{
			$('.sub-menu').eq(i).css('left ','0')
			
		}
	}
	
})
$(window).scroll(function() {    
    var scroll = $(window).scrollTop();
    if (scroll >= 200) {
    	$('#nav').addClass("open");
    } else {
    	$('#nav').removeClass("open");
    }
});
hideMenus();
$(window).resize(function(){
	hideMenus();
})

function hideMenus(){
	for(i =0;i<4;i++){
		if($(window).width() < 700) {
			$("#navbar-"+i).addClass("collapse")
		}else{
			$("#navbar-"+i).removeClass("collapse")
			
		}
	}
}
</script>