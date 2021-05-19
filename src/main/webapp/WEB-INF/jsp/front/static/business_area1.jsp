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
<c:set var="pageTitle" value="특수청소분야"/>

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
			 <!-- <div class="btn-group">
    			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">개요 및 장비현황</button>
   				<div class="dropdown-menu">
      				<a class="dropdown-item" href="javascript:$.Nav('self', {type2: '1'})">개요 및 장비현황</a>
      				<a class="dropdown-item" href="javascript:$.Nav('self', {type2: '2',mode:'list'})">실적갤러리</a>
      				<a class="dropdown-item" href="javascript:$.Nav('self', {type2: '3',mode:'list'})">실적현황</a>
      				<a class="dropdown-item" href="javascript:$.Nav('self', {type2: '4'})" >실적동영상</a>
    			</div>
  			</div>/btn-group -->
			<nav class="nav mb-4 board-tabs" id="page-tab">
				<a href="javascript:$.Nav('self', {type2: '1'})" class="nav-link ${search.type2 eq 1  or empty search.type2 ?'active':'' }">개요 및 장비현황</a>
				<a href="javascript:$.Nav('self', {type2: '2',mode:'list'})" class="nav-link ${search.type2 eq 2?'active':'' }">실적갤러리</a>
				<a href="javascript:$.Nav('self', {type2: '3',mode:'list'})" class="nav-link ${search.type2 eq 3?'active':'' }">실적현황</a>
				<a href="javascript:$.Nav('self', {type2: '4'})" class="nav-link ${search.type2 eq 4?'active':'' }">실적동영상</a>
			</nav>
			<div class="mb-8">
				<div class="tab-content">
		            <div class="tab-pane fade ${search.type2 eq 1 or empty search.type2 ?'show active':'' } " id="tab-1" role="tabpanel">
		            	<h4 class="text-center my-5">
		            	우리 (주)동명은 안전하고 깨끗한 환경을 만들겠다는 신념 아래 <br>
매일 지나치는 <span class="text-primary">지하차도 청소, 터널청소, 방음벽, 가드레일 및 도로 유지보수</span> 등 도로분야 용역의<br>
<span class="text-orange">최고의 서비스 제공을 목표</span>로 맡은바 역활을 성실이 수행하여 왔습니다.  
		            	
		            	</h4>
		            	
	<c:set var="image_list">2.5t 고압살수차,3.5t 고소작업차,3.5t 크레인,8.5t 제설차,노면청소차 1대,노면청소차 2대,미세먼지저감살수차1대,미세먼지저감살수차2대,싸인보드차량,터널세척차 3대,터널세척차 4대,전체장비차량 사진</c:set>
		            
		            	<div class="row">
        			<c:forTokens items="${image_list}" delims="," var="list" varStatus="s">
		            		<div class="col-sm-4 col-lg-3">
		            			<img src="/images/pages/business_area1/img_${s.index+1 }.jpg" class="w-100">
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
	            	<div class="tab-pane fade ${search.type2 eq 3?'show active':'' } " id="tab-3" role="tabpanel">
	            		<jsp:include page="/module/board.do" flush="true">
							<jsp:param name="bcode" value="business" />
							<jsp:param name="type1" value="addCol4" />
							<jsp:param name="searchWord" value="${pageTitle }" />
						</jsp:include>
		            </div>
		            
		            <div class="tab-pane fade ${search.type2 eq 4?'show active':'' } " id="tab-4" role="tabpanel">
		            	<div class="row">
		            		<div class="col-md-6">
					            <iframe width="100%" height="360" src="https://www.youtube.com/embed/fuqRKndaBRM" 
					            frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            		</div>
		            		<div class="col-md-6">
					            <iframe width="100%" height="360" src="https://www.youtube.com/embed/pRf_x-VVa30" 
					            frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            		</div>
		            	</div>
		            </div>
		        </div>
				
				
				
			</div>
			
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>