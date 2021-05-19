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
<c:set var="pageTitle" value="오시는길"/>

	<div class="header d-flex align-items-center pt-5" style="max-height: 23.563rem;min-height: 200px; background-image: url(/images/pages/sub_img.jpg); background-size: cover; background-position: center top;">
		<!-- Mask -->
			<span class="mask "></span>
			<!-- Header container -->
			<div class="container-fluid py-4 py-sm-8">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h1 class="display-2 text-white">회사소개</h1>
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
			회사소개
			</a>
			<a class="breadcrumb-item" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ${pageTitle }</a>
			
			<div class="dropdown-menu" style="">
				<a href="/pages/page/010100" class="dropdown-item"> 인사말 </a>
				<a href="/pages/page/010200" class="dropdown-item"> 개요 </a>
				<a href="/pages/page/010300" class="dropdown-item"> 일반현황 </a>
				<a href="/pages/page/010400" class="dropdown-item"> 연혁 </a>
				<a href="/pages/page/010500" class="dropdown-item"> 조직도 </a>
				<a href="/board/board?menuid=010800" class="dropdown-item"> 인증현황 </a>
				<a href="/pages/page/010900" class="dropdown-item"> 실적현황 </a>
				<a href="/pages/page/010600" class="dropdown-item"> 고객사 </a>
				<a href="/pages/page/010700" class="dropdown-item"> 오시는길 </a>
			</div>

		</div>
		<h1 class="text-center my-5">${pageTitle }</h1>
		<div class="div">
		
			<nav class="nav mb-4 board-tabs" id="page-tab">
				<a data-toggle="tab" href="#tab-1" role="tab"  class="nav-link active" data-search="경기도 수원시 덕영대로 1699">본사</a>
				<a data-toggle="tab" href="#tab-2" role="tab"  class="nav-link" data-search="경기도 성남시 분당구 성남대로 345">성남지사</a>
				<a data-toggle="tab" href="#tab-3" role="tab"  class="nav-link" data-search="경기도 오산시 원동">오산지사</a>
				<a data-toggle="tab" href="#tab-4" role="tab"  class="nav-link" data-search="경기도 고양시 일산동구 정발산로">고양지사</a>
				<a data-toggle="tab" href="#tab-5" role="tab"  class="nav-link" data-search="경기도 화성시 배양길 53-8 ">화성지사</a>
				<a data-toggle="tab" href="#tab-6" role="tab"  class="nav-link" data-search="경기도 용인시 기흥구 죽전로 10">용인지사</a>
			</nav>
			<div class="mb-8">
            	<div id="map" style="height:580px"></div>
				<div class="tab-content mt-4">
		            <div class="tab-pane fade show active " id="tab-1" role="tabpanel">
		            	<div class="row justify-content-center">
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/location.png" class="mr-3 mb-3">
		            				<p class="mb-0"><span class="font-weight-500">주소</span> : 경기도 수원시 덕영대로 1699, 702호 (영통동, 영통빌딩)</p>
		            			</div>
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/email.png" class="mr-3">
		            				<p class="mb-0"><span class="font-weight-500">이메일</span> : dmco17@naver.com</p>
		            			</div>
		            		</div>
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/phone.png" class="mr-3">
		            				<p class="mb-0"><span class="font-weight-500">대표전화</span> : Tel. 1566 - 2033   Fax. 031 - 215 - 3788</p>
		            			</div>
		            		</div>
		            	</div>
		            </div>
		            <div class="tab-pane fade" id="tab-2" role="tabpanel">
		            	<div class="row justify-content-center">
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/location.png" class="mr-3 mb-3">
		            				<p class="mb-0"><span class="font-weight-500">주소</span> : 경기도 성남시 분당구 성남대로 345</p>
		            			</div>
		            		</div>
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/phone.png" class="mr-3">
		            				<p class="mb-0"><span class="font-weight-500">대표전화</span> : Tel. 1566 - 2033   Fax. 031 - 215 - 3788</p>
		            			</div>
		            		</div>
		            	</div>
		            </div>
		            <div class="tab-pane fade" id="tab-3" role="tabpanel">
		            	<div class="row justify-content-center">
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/location.png" class="mr-3 mb-3">
		            				<p class="mb-0"><span class="font-weight-500">주소</span> : 경기도 오산시 원동 622-7</p>
		            			</div>
		            		</div>
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/phone.png" class="mr-3">
		            				<p class="mb-0"><span class="font-weight-500">대표전화</span> : Tel. 1566 - 2033   Fax. 031 - 215 - 3788</p>
		            			</div>
		            		</div>
		            	</div>
		            </div>
		            <div class="tab-pane fade" id="tab-4" role="tabpanel">
		            	<div class="row justify-content-center">
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/location.png" class="mr-3 mb-3">
		            				<p class="mb-0"><span class="font-weight-500">주소</span> : 경기도 고양시 일산동구 정발산로 센트럴타워 301호</p>
		            			</div>
		            		</div>
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/phone.png" class="mr-3">
		            				<p class="mb-0"><span class="font-weight-500">대표전화</span> : Tel. 1566 - 2033   Fax. 031 - 215 - 3788</p>
		            			</div>
		            		</div>
		            	</div>
		            </div>
		            <div class="tab-pane fade" id="tab-5" role="tabpanel">
		            	<div class="row justify-content-center">
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/location.png" class="mr-3 mb-3">
		            				<p class="mb-0"><span class="font-weight-500">주소</span> : 경기도 화성시 배양길 53-8 (배양동)</p>
		            			</div>
		            		</div>
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/phone.png" class="mr-3">
		            				<p class="mb-0"><span class="font-weight-500">대표전화</span> : Tel. 1566 - 2033   Fax. 031 - 215 - 3788</p>
		            			</div>
		            		</div>
		            	</div>
		            </div>
		            <div class="tab-pane fade" id="tab-6" role="tabpanel">
		            	<div class="row justify-content-center">
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/location.png" class="mr-3 mb-3">
		            				<p class="mb-0"><span class="font-weight-500">주소</span> : 경기도 용인시 기흥구 죽전로 10, 6층 601-53호 </p>
		            			</div>
		            		</div>
		            		<div class="col-auto">
		            			<div class="d-flex align-items-center">
		            				<img src="/images/pages/phone.png" class="mr-3">
		            				<p class="mb-0"><span class="font-weight-500">대표전화</span> : Tel. 1566 - 2033   Fax. 031 - 215 - 3788</p>
		            			</div>
		            		</div>
		            	</div>
		            </div>
		        </div>
			</div>
			
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${tagoplusSolution1_session_site.siteApiVO.mapKey }&libraries=services"></script>
<script>
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('경기도 수원시 덕영대로 1699', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

         displayMarker(data[0]);    
         bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}

$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	  var trgt = e.target;
	  var searchWord = $(trgt).data("search");
	  searchMap(searchWord);
})
function searchMap(searchWord){
	ps.keywordSearch(searchWord, placesSearchCB); 

}
</script>

<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>