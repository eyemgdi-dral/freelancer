<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>

<%-- 웹사이트 개발 - 견적 안내 --%>

	
	 
	<jsp:include page="/module/menu" flush="true" />
	
<style>
.board-tabs:not(#page-tab){
	display:none
}
</style>
<div class="">
<c:set var="pageTitle" value="일상분야"/>

	<div class="header d-flex align-items-center pt-5" style="max-height: 23.563rem;min-height: 200px; background-image: url(/images/pages/sub_img.jpg); background-size: cover; background-position: center top;">
		<!-- Mask -->
			<span class="mask "></span>
			<!-- Header container -->
			<div class="container-fluid py-4 py-sm-8">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h1 class="display-2 text-white">사업영역</h1>
						<p class="text-white my-0 sub-text">
						고객님의 깨끗하고 행복한 생활환경 주식회사 동명TRM이 전해드립니다.
						</p>
					</div>
				</div>
			</div>
	</div>
	<div class="container mt--4">
		<div class="breadcrumb bg-primary" style="position: relative; z-index: 1">
			<a class="breadcrumb-item home">
				<i class="fas fa-home"></i>
			</a>
			<a class="breadcrumb-item">
			사업영역
			</a>
			<a class="breadcrumb-item" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ${pageTitle }</a>
			<div class="dropdown-menu" style="">
				<a href="/pages/page/040001" class="dropdown-item"> 특수청소분야 </a> <a
					href="/pages/page/040002" class="dropdown-item"> 아파트빌딩관리 </a> <a
					href="/pages/page/040003" class="dropdown-item"> 저수조청소업 </a> <a
					href="/pages/page/040004" class="dropdown-item"> 방역소독업 </a> <a
					href="/pages/page/040005" class="dropdown-item"> 일상분야 </a> <a
					href="/pages/page/040006" class="dropdown-item"> 장비임대사업 </a> <a
					href="/pages/page/040007" class="dropdown-item"> 전기공사업 </a> 
			</div>

		</div>
		<h1 class="text-center my-5">${pageTitle }</h1>
		<div class="div">
		
			<nav class="nav mb-4 board-tabs" id="page-tab">
				<a href="javascript:$.Nav('self', {type2: '1'})" class="nav-link ${search.type2 eq 1  or empty search.type2 ?'active':'' }">개요 및 장비현황</a>
				<a href="javascript:$.Nav('self', {type2: '2',mode:'list'})" class="nav-link ${search.type2 eq 2?'active':'' }">실적갤러리</a>
				<a href="javascript:$.Nav('self', {type2: '4'})" class="nav-link ${search.type2 eq 4?'active':'' }">실적동영상</a>
			</nav>
			<div class="mb-8">
				<div class="tab-content">
		            <div class="tab-pane fade ${search.type2 eq 1 or empty search.type2 ?'show active':'' } " id="tab-1" role="tabpanel">
		            	<h4 class="text-center my-5">
	            			우리 (주)동명은 <span class="text-primary">관공서시설관리, 입주청소, 아파트청소, 학교낙엽청소 배수로 청소</span>까지<br>
							<span class="text-orange">모든분야에 청소</span>를 책임지고 서비스해드립니다.
		            	</h4>
	<c:set var="image_list">각종 사이즈별 호스;고압살수 건;스팀청소기;전기고압세척기;건식,습식진공청소기;각종청소도구;250BAR 고압세척기;350BAR 고압세척기;무전기;엔진 브로워;발전기;보행식 청소기;예초기;탑승식,보행식청소기전체;초고압 세척기</c:set>
		            
		            	<div class="row">
        			<c:forTokens items="${image_list}" delims=";" var="list" varStatus="s">
		            		<div class="col-sm-4 col-lg-3">
		            			<img src="/images/pages/business_area5/img_${s.index+1 }.jpg" class="w-100">
			            		<p class="text-center mt-2 mb-4">${list}</p>
		            		</div>
					</c:forTokens>
		            	</div>
		            
		            </div>
		            <div class="tab-pane fade ${search.type2 eq 2?'show active':'' } " id="tab-2" role="tabpanel">
			            <jsp:include page="/module/board.do" flush="true">
							<jsp:param name="bcode" value="gallery" />
							<jsp:param name="type1" value="addCol4" />
							<jsp:param name="searchWord" value="${pageTitle }" />
						</jsp:include>
		            </div>
		            
		            <div class="tab-pane fade ${search.type2 eq 4?'show active':'' } " id="tab-4" role="tabpanel">
		            </div>
		        </div>
				
								
			</div>
			
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>