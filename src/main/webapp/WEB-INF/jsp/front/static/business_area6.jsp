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
<c:set var="pageTitle" value="장비임대사업"/>

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
		<h1 class="text-center my-5">${pageTitle } </h1>
		<div class="div">
		
			<nav class="nav mb-4 board-tabs" id="page-tab">
				<a href="javascript:$.Nav('self', {bcseq: '',mode:'list'})" class="nav-link ${empty param.bcseq ?'active':'' }">개요 및 장비현황</a>
				<a href="javascript:$.Nav('self', {bcseq: '27',mode:'list'})" class="nav-link ${param.bcseq eq 27?'active':'' }">도로특수청소차량</a>
				<a href="javascript:$.Nav('self', {bcseq: '28',mode:'list'})" class="nav-link ${param.bcseq eq 28?'active':'' }">청소관리차량</a>
				<a href="javascript:$.Nav('self', {bcseq: '29',mode:'list'})" class="nav-link ${param.bcseq eq 29?'active':'' }">청소장비</a>
			</nav>
			<div class="mb-8">
				<div class="tab-content">
		            <div class="tab-pane fade ${empty param.bcseq  ?'show active':'' } " id="tab-1" role="tabpanel">
		            	<h4 class="text-center my-5">
	            			우리 (주)동명은 <span class="text-primary">특수청소부터 가정집 일상청소장비</span>까지<br>
							모든 <span class="text-orange">청소장비 일체를 임대</span>해드립니다.
		            	</h4>
	            		<c:set var="table_list">
	            			
	            		</c:set>

		            	<table class="table table-bordered text-center">
		            		<thead>
		            			<tr>
		            				<th>번호</th>
		            				<th>장비명</th>
		            				<th>재원 / 수량</th>
		            				<th>장비분류</th>
		            			</tr>
		            		</thead>
		            		<tbody>
			            		<tr style="background:#f1f7ee">
			            			<td>1</td>
			            			<td>16톤 터널 청소차</td>
			            			<td>4대</td>
			            			<td rowspan="8" style="vertical-align:middle">도로특수청소차량</td>
			            		</tr>
			            		<tr style="background:#f1f7ee">
			            			<td>2</td>
			            			<td>대형 고압 살수차</td>
			            			<td>16 톤 - 9대  / 8.5 톤 - 3대</td>
			            		</tr>
			            		<tr style="background:#f1f7ee">
			            			<td>3</td>
									<td>노면 청소차</td>
									<td>8.5톤 -2대</td>
			            		</tr>
			            		<tr style="background:#f1f7ee">
			            			<td>4</td>
									<td>제설차</td>
									<td>8톤 - 2대</td>
			            		</tr>
			            		<tr style="background:#f1f7ee">
			            			<td>5</td>
									<td>크레인</td>
									<td>3.5톤 - 1대</td>
			            		</tr>
			            		<tr style="background:#f1f7ee">
			            			<td>6</td>
									<td>고소 작업차</td>
									<td>3.5 톤 - 1대
			            		</tr>
			            		<tr style="background:#f1f7ee">
			            			<td>7</td>
									<td>고압 살수차</td>
									<td>3.5 톤 - 1대</td>
			            		</tr>
			            		<tr style="background:#f1f7ee">
			            			<td>8</td>
									<td>싸인보드차량</td>
									<td>2.5 톤 - 4대 / 1 톤 - 4대</td>
			            		</tr>
			            		<tr style="background:#f7f3ee">
			            			<td>9</td>
									<td>탑승식 청소차</td>
									<td>10 - 대</td>
									<td rowspan="2"  style="vertical-align:middle">청소관리차량</td>
			            		</tr>
			            		<tr style="background:#f7f3ee ">
			            			<td>10</td>
									<td>보행식청소차</td>
									<td>17 - 대</td>
			            		</tr>
			            		<tr style="background:#f1eef7">
			            			<td>11</td>
									<td>고압살수기(엔진형)</td>
									<td>350 Bar - 6대</td>
									<td rowspan="8"  style="vertical-align:middle">청소장비</td>
			            		</tr>
			            		<tr style="background:#f1eef7">
			            			<td>12</td>
									<td>마루광택기</td>
									<td>12 - 대</td>
			            		</tr>
			            		<tr style="background:#f1eef7">
			            			<td>13</td>
									<td>습식, 건식진공청소기</td>
									<td>11 - 대</td>
			            		</tr>
			            		<tr style="background:#f1eef7">
			            			<td>14</td>
									<td>엔진 브로워</td>
									<td>11 - 대</td>
			            		</tr>
			            		<tr style="background:#f1eef7">
			            			<td>15</td>
									<td>대형 엔진 양수기</td>
									<td>5 inch - 2대 / 6 inch - 3대</td>
			            		</tr>
								<tr style="background:#f1eef7">
									<td>16</td>
									<td>양수기</td>
									<td>3 inch - 5대</td>
								</tr>		            		
								<tr style="background:#f1eef7">
									<td>17</td>
									<td>수중펌프</td>
									<td>3 inch - 2대 / 2 inch - 2대  / 1 inch - 4대</td>
								</tr>		            		
								<tr style="background:#f1eef7">
									<td>18</td>
									<td>콤프레샤</td>
									<td>15 마력  - 1대 / 4 마력 - 2대 / 1 마력-1대</td>
								</tr>
							</tbody>
		            	</table>
		            
		            </div>
		            <div class="tab-pane fade ${param.bcseq eq 27?'show active':'' } " id="tab-2" role="tabpanel">
			            <jsp:include page="/module/board.do" flush="true">
			            	<jsp:param name="bcode" value="rental" />
			            </jsp:include>
		            </div>
		            
		            <div class="tab-pane fade ${param.bcseq eq 28?'show active':'' } " id="tab-4" role="tabpanel">
		            	<jsp:include page="/module/board.do" flush="true">
			            	<jsp:param name="bcode" value="rental" />
			            </jsp:include>
		            </div>
		            
		            <div class="tab-pane fade ${param.bcseq eq 29?'show active':'' } " id="tab-4" role="tabpanel">
		            	<jsp:include page="/module/board.do" flush="true">
			            	<jsp:param name="bcode" value="rental" />
			            </jsp:include>
		            </div>
		            
		        </div>
				
								
			</div>
			
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>