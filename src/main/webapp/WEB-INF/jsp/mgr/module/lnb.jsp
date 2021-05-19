<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<!--lnb S-->
<script type="text/javascript">
	$(function() {
		
		var sUrl = location.pathname;
		var sOnClass = "active";
		var isVisitMenu = 0;
		var parent = '${menuId}';
		var parentText = parent != '' ? $('.navbar-horizontal .nav-item[data-gnbMenuIdx='+parent+']').text():'';			
		var text;
		$('.navbar-inner .nav-item > .nav-link').each(function() {
			$(this).removeClass(sOnClass);
			if (sUrl === $(this).attr('href') && !$(this).hasClass(sOnClass)) {
				$(this).addClass(sOnClass);
				text = $(".nav-link-text", this).text();
				isVisitMenu = 1;
				$(this).closest('.collapse').prev('.nav-link').addClass(sOnClass);
			}else if (sUrl.indexOf($(this).attr('prefix')) > -1 && $('#'+parent+'').length > 0){
				$(this).addClass(sOnClass);
				
			}
		});
		
		if (isVisitMenu == 0){
			var pUr = document.referrer.replace(location.origin,'');
			if(pUr.indexOf('?') > -1)
				pUr = pUr.substring(0, pUr.indexOf('?'));
			$(".navbar-inner .nav-link[href='"+pUr+"']").addClass(sOnClass);
			text = $(".nav-link-text", ".navbar-inner .nav-link[href='"+pUr+"']").text();
			console.log(text)
		}
		$('#currentText,#currentText1').text(text)
		$('#parentMenuText').text(parentText)
		
		
		$('.collapse').each(function(i){
			var count = $(this).find('.nav-link.active').length
			if(count > 0 ){
				$(this).collapse('show')
			}
		})
	});
</script>

<nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-dark" style="background:#2a3042" id="sidenav-main">
    <div class="scrollbar-inner">
		<div class="sidenav-header  d-flex  align-items-center">
			<a class="navbar-brand" href="${URL_ADMIN_MAIN }">
				<img src="/images/mgr/logo.png" class="navbar-brand-img" alt="...">
			</a>
			<div class=" ml-auto ">
				<div class="sidenav-toggler d-none d-xl-block sidenav-toggler-dark"
					data-action="sidenav-unpin" data-target="#sidenav-main">
					<div class="sidenav-toggler-inner">
						<i class="sidenav-toggler-line"></i>
						<i class="sidenav-toggler-line"></i>
						<i class="sidenav-toggler-line"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar-inner">
	    	<div class="collapse navbar-collapse" id="sidenav-collapse-main">
	    	
<c:if test="${!empty listMenus}">
	    		
	          	
	          	
	    		<ul class="navbar-nav">
	<c:forEach var="n" items="${listMenus }" varStatus="s">
	
		<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}">
			<c:set var="prefpath" value="" />
			<c:set var="prefpath" value="${fn:split(n.folderPath, '/')}" />
			<c:set var="length" value="${fn:length(prefpath) }"/>
			
			<c:if test="${n.menuLevel eq 2}">
					
					
					<li class="nav-item">
	              		<a class="nav-link" href="#navbar-${n.menuIdx }" data-toggle="collapse" role="button" aria-expanded="false">
	                		<span class="nav-link-text">${n.menuName }</span>
	              		</a>
	              		<div class="collapse" id="navbar-${n.menuIdx }">
	                		<ul class="nav nav-sm flex-column">
               		<c:forEach var="m" items="${listMenus }" varStatus="s">
	            		<c:if test="${m.menuLevel eq 3 && m.parentIdx eq n.menuIdx}">
							<c:set var="prefixPath2" value="${m.folderPath }"/>				
							<c:if test="${length>3 }">
								<c:set var="prefixPath2" value="${fn:replace(m.folderPath, prefpath[length -1], '') }"/>
							</c:if>			
							<c:if test="${length<4 }">
								<c:set var="splitPage" value="${fn:split(prefpath[length -1], '_')}" />
								<c:if test="${!empty splitPage[1]}">
									<c:set var="prefixPath2" value="${fn:replace(m.folderPath, splitPage[1], '') }"/>
								</c:if>					
							</c:if>
							<c:if test="${not empty pageMenuPath }">
								<c:set var="prefixPath3" value="${pageMenuPath}"/>
							</c:if>
								<li class="nav-item sub-item" data-id="${m.parentIdx }">
				              		<a class="nav-link" href="${URL_ADMIN_ROOT}${m.folderPath }" prefix="${URL_ADMIN_ROOT}${m.folderPath }">
				              			<span class="sidenav-mini-icon"> D </span>
				                		<span class="nav-link-text">${m.menuName }</span>
				              		</a>
				            	</li>
						</c:if>
	            	</c:forEach>
	                		</ul>
	              		</div>
	            	</li>
					
			</c:if>
			
			
			
		</c:if>
		<c:if test="${tagoplusSolution1_session_admin.userType eq 'admin'}">
					
			<c:forEach var="ms" items="${tagoplusSolution1_session_admin.adminAuth}" varStatus="g">
			
				<c:if test="${ms.menuId eq n.menuIdx and !empty ms.authoList}">
					<c:if test="${n.menuLevel eq 2}">
						<c:set var="prefpath" value="" />
						<c:set var="prefpath" value="${fn:split(m.folderPath, '/')}" />
						<c:set var="length" value="${fn:length(prefpath) }"/>
						<c:set var="prefixPath" value="${fn:replace(m.folderPath, prefpath[length -1], '') }"/>
						
						<li class="nav-item">
		              		<a class="nav-link" href="#navbar-${n.menuIdx }" data-toggle="collapse" role="button" aria-expanded="false">
		                		<span class="nav-link-text">${n.menuName }</span>
		              		</a>
		              		<div class="collapse" id="navbar-${n.menuIdx }">
		                		<ul class="nav nav-sm flex-column">
             		<c:forEach var="m" items="${listMenus }" varStatus="s">
             			<c:forEach var="msd" items="${tagoplusSolution1_session_admin.adminAuth}" varStatus="g">
             		
	            		<c:if test="${m.menuLevel eq 3 && m.parentIdx eq n.menuIdx && msd.menuId eq m.menuIdx}">
	            				
							<c:set var="prefixPath2" value="${m.folderPath }"/>				
							<c:if test="${length>3 }">
								<c:set var="prefixPath2" value="${fn:replace(m.folderPath, prefpath[length -1], '') }"/>
							</c:if>			
							<c:if test="${length<4 }">
								<c:set var="splitPage" value="${fn:split(prefpath[length -1], '_')}" />
								<c:if test="${!empty splitPage[1]}">
									<c:set var="prefixPath2" value="${fn:replace(m.folderPath, splitPage[1], '') }"/>
								</c:if>					
							</c:if>
							<c:if test="${not empty pageMenuPath }">
								<c:set var="prefixPath3" value="${pageMenuPath}"/>
							</c:if>
								<li class="nav-item sub-item" data-id="${m.parentIdx }">
				              		<a class="nav-link" href="${URL_ADMIN_ROOT}${m.folderPath }" prefix="${URL_ADMIN_ROOT}${m.folderPath }">
				              			<span class="sidenav-mini-icon"> D </span>
				                		<span class="nav-link-text">${m.menuName }</span>
				              		</a>
				            	</li>
						</c:if>
		            	</c:forEach>
	            	</c:forEach>
		                		</ul>
		                	</div>
	                	</li>
						
						<li class="nav-item" id="${m.menuIdx }">
		              		<a class="nav-link" href="${URL_ADMIN_ROOT}${m.folderPath }" prefix="${URL_ADMIN_ROOT}${prefixPath }">
		                		<span class="nav-link-text">${m.menuName }</span>
		              		</a>
		            	</li>
		            	
					</c:if> 
					<c:if test="${m.menuLevel eq 3}">
						<li class="nav-item sub-item" data-id="${m.parentIdx }">
		              		<a class="nav-link" href="${URL_ADMIN_ROOT}${m.folderPath }" prefix="${URL_ADMIN_ROOT}${m.folderPath }">
		                		<span class="nav-link-text">${m.menuName }</span>
		              		</a>
		            	</li>
					</c:if>
				</c:if>
			</c:forEach>
					
		</c:if>
	</c:forEach>
		</ul>
    <c:choose>
		<%-- 환경설정 --%>
		<c:when test="${fn:contains(reqURI, '/config/') }">
					<hr class="my-3">
			<ul class="navbar-nav">
				<li class="nav-item sub-item">
					<h6 class="navbar-heading p-0 pl-3 text-muted">
		            	<span class="docs-normal">메뉴권한관리</span>
		          	</h6>
	          	</li>
	          	<li class="nav-item sub-item">
              		<a class="nav-link" href="${URL_ADMIN_ROOT}/config/menu/list" prefix="${URL_ADMIN_ROOT}/config/menu/list">
                		<span class="nav-link-text">메뉴관리</span>
              		</a>
            	</li>
				<li class="nav-item sub-item">
              		<a class="nav-link" href="${URL_ADMIN_ROOT}/config/menu/list" prefix="${URL_ADMIN_ROOT}/config/menu/list">
                		<span class="nav-link-text">메뉴관리</span>
              		</a>
            	</li>
				<li class="nav-item sub-item">
              		<a class="nav-link" href="${URL_ADMIN_ROOT}/config/menu/grouprole/list" prefix="${URL_ADMIN_ROOT}/config/menu/grouprole">
                		<span class="nav-link-text">권한관리</span>
              		</a>
            	</li>
            </ul>
		</c:when>
		<c:when test="${fn:contains(reqURI, '/board/manage/') || fn:contains(reqURI, '/board/list/') || fn:contains(reqURI, '/board/write/') || fn:contains(reqURI, '/board/quick')}">
			<c:set var="subPath" value="/board/list/" />
			<c:if test="${fn:contains(reqURI, '/board/write/') }">
				<c:set var="subPath" value="/board/write/" />
			</c:if> 
			<%-- <li class="lnb_depth1"><a href="#" prefix="${URL_ADMIN_ROOT}${subPath}">게시판 목록</a></li> --%>
				<ul class="navbar-nav">
			<c:forEach items="${listGroup }" var="m" varStatus="s">
					<li class="nav-item">
	              		<a class="nav-link" href="#navbar-${m.groupSeq}" data-toggle="collapse" role="button" aria-expanded="false">
	                		<span class="nav-link-text">${m.groupName }</span>
	              		</a>
	              		<div class="collapse" id="navbar-${m.groupSeq}">
	                		<ul class="nav nav-sm flex-column">
            	<c:forEach items="${listBoardMaster }" var="n" varStatus="ss">
					<c:if test="${m.groupSeq eq n.groupSeq }">
								<li class="nav-item sub-item">
				              		<a class="nav-link" href="${URL_ADMIN_ROOT}/board/list/${n.boardCode}" prefix="${subPath}${n.boardCode}">
				                		<span class="sidenav-mini-icon"> D </span>
				                		<span class="nav-link-text">${n.boardName }</span>
				              		</a>
				            	</li>
					</c:if>
				</c:forEach>	
	                		</ul>
                		</div>
               		</li>		
			</c:forEach>
				</ul>
		</c:when>
		<c:when test="${fn:contains(reqURI, '/page/') }">
		          	<ul class="navbar-nav">
			<c:forEach items="${listGroup }" var="m" varStatus="s">
		          		<li class="nav-item">
							<a class="nav-link" href="#page-${m.groupSeq}" data-toggle="collapse" role="button" aria-expanded="false">
		                		<span class="nav-link-text">${m.groupName }</span>
		              		</a>
		              		
	              			<div class="collapse" id="page-${m.groupSeq}">
	                			<ul class="nav nav-sm flex-column">
				<c:forEach items="${listPage }" var="n" varStatus="ss">
					<c:if test="${m.groupSeq eq n.pageGroupSeq }">
									<li class="nav-item">
					              		<a class="nav-link" href="${URL_ADMIN_ROOT}/page/page_write/${n.pageSeq}" prefix="/page/page_write/${n.pageSeq}">
					                		<span class="sidenav-mini-icon"> D </span>
					                		<span class="nav-link-text">${n.pageName }</span>
					              		</a>
					            	</li>
					</c:if>
				</c:forEach>	
								</ul>		
							</div>
						</li>
			</c:forEach> 
					</ul>
		</c:when>
		<c:when test="${fn:contains(reqURI, '/formmail/') }">
			
			<ul class="navbar-nav">
			<c:forEach items="${listForm}" var="m">
				<li class="nav-item">
              		<a class="nav-link" href="${URL_ADMIN_ROOT}/formmail/list/${m.formSeq }" prefix="${subPath}${m.formSeq }">
                		<span class="nav-link-text">${m.formName }</span>
              		</a>
            	</li>
			</c:forEach>
			</ul>
			<hr class="my-3">
		</c:when>
		<c:when test="${fn:contains(reqURI, '/banner/') }">
			<c:set var="subPath" value="/banner/list/" />
			<c:if test="${fn:contains(reqURI, '/banner/write') }">
				<c:set var="subPath" value="/banner/write/" />
			</c:if>
				
				<ul class="navbar-nav">
				<c:forEach items="${listBannerMaster }" var="m" varStatus="s">
					<li class="nav-item">
	              		<a class="nav-link" href="${URL_ADMIN_ROOT}/banner/list/${m.bmSeq}" prefix="${URL_ADMIN_ROOT}${subPath}${m.bmSeq}">
	                		<span class="nav-link-text">${m.masterName }</span>
	              		</a>
	            	</li>
				</c:forEach>		
				</ul>
				<hr class="my-3">
		</c:when>
		
	</c:choose>
	          	
</c:if>
				
			</div>
		</div>
	</div>
</nav>


<!--lnb E-->
