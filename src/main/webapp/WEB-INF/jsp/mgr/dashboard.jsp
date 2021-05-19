<%@ page language="java" contentType="text/html;charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>


<div class="header bg-primary pb-6">
	<div class="container-fluid">
		<div class="row align-items-center py-4">
			<div class="col-lg-6 col-7">
				<h6 class="h2 text-white d-inline-block mb-0">게시판관리</h6>
			</div>
			<div class="col-lg-6 col-7">
				<h6 class="h2 text-white d-inline-block mb-0">접속통계</h6>
			</div>
		</div>
		<div class="row">
        	<div class="col-xl-3 col-md-6">
           		<div class="card card-stats">
                <!-- Card body -->
		            <div class="card-body">
			            <div class="row">
				            <div class="col">
			              		<h5 class="card-title text-uppercase text-muted mb-0">총 게시물</h5>
			              		<span class="h2 font-weight-bold mb-0">${hboardInfoTotalCount } 개</span>
				            </div>
							<div class="col-auto">
								<div class="icon icon-shape bg-gradient-blue text-white rounded-circle shadow">
									<i class="ni ni-align-center"></i>
								</div>
							</div>
			            </div>
						<p class="mt-3 mb-0 text-sm">
							<span class="text-success mr-2"><i class="fa fa-list"></i> ${hselectBulletinBoardsTotal } 개</span>
							<span class="text-nowrap">게시판</span>
						</p>
		            </div>
              	</div>
			</div>
        	<div class="col-xl-3 col-md-6">
           		<div class="card card-stats">
                <!-- Card body -->
		            <div class="card-body">
			            <div class="row">
				            <div class="col">
			              		<h5 class="card-title text-uppercase text-muted mb-0">오늘 게시물</h5>
			              		<span class="h2 font-weight-bold mb-0">${hselectPosttoday } 개</span>
				            </div>
							<div class="col-auto">
								<div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
									<i class="ni ni-chat-round"></i>
								</div>
							</div>
			            </div>
						<p class="mt-3 mb-0 text-sm">
							<span class="text-success mr-2">${hboardCommentTotalCount } 개</span>
							<span class="text-nowrap">댓글</span>
						</p>
		            </div>
              	</div>
			</div>
			
			
        	<div class="col-xl-3 col-md-6">
           		<div class="card card-stats">
                <!-- Card body -->
		            <div class="card-body">
			            <div class="row">
				            <div class="col">
			              		<h5 class="card-title text-uppercase text-muted mb-0">오늘 가입회원</h5>
			              		<span class="h2 font-weight-bold mb-0">${hjointoday } 개</span>
				            </div>
							<div class="col-auto">
								<div class="icon icon-shape bg-gradient-green text-white rounded-circle shadow">
									<i class="ni ni-circle-08"></i>
								</div>
							</div>
			            </div>
						<p class="mt-3 mb-0 text-sm">
							<span class="text-success mr-2">${hjoinTotal } 개</span>
							<span class="text-nowrap">전체 회원수</span>
						</p>
		            </div>
              	</div>
			</div>
        	<div class="col-xl-3 col-md-6">
           		<div class="card card-stats">
                <!-- Card body -->
		            <div class="card-body">
			            <div class="row">
				            <div class="col">
			              		<h5 class="card-title text-uppercase text-muted mb-0">오늘 탈퇴회원</h5>
			              		<span class="h2 font-weight-bold mb-0">${hLeavetoday } 개</span>
				            </div>
							<div class="col-auto">
								<div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">
									<i class="ni ni-user-run"></i>
								</div>
							</div>
			            </div>
						<p class="mt-3 mb-0 text-sm">
							<span class="text-success mr-2">${hLeaveTotal } 개</span>
							<span class="text-nowrap">전체 탈퇴회원</span>
						</p>
		            </div>
              	</div>
			</div>
		</div>
	</div>
</div>


<div class="container-fluid mt--6">
	<div class="row">
		<div class="col-sm-6">
			<div class="card">
            	<div class="card-header bg-transparent">
            		<div class="row align-items-center">
               			<div class="col">
            				<h6 class="text-uppercase text-muted ls-1 mb-1">게시판관리</h6>
	                  		<h5 class="h3 mb-0">최근 게시판 접속 통계</h5>
                		</div>
	              	</div>
            	</div>
	            <div class="card-body">
	              <!-- Chart -->
					<div class="chart">
	                	<canvas id="chart-bars" class="chart-canvas"></canvas>
              		</div>
         		</div>
          	</div>
		</div>
		
		<div class='col-sm-6'>
			<div class="card bg-default">
				<div class="card-header bg-transparent">
					<div class="row align-items-center">
						<div class="col">
							<h6 class="text-light text-uppercase ls-1 mb-1">접속통계</h6>
							<h5 class="h3 text-white mb-0">최근 접속 통계</h5>
						</div>
					</div>
				</div>
				<div class="card-body">
					<!-- Chart -->
					<div class="chart">
						<!-- Chart wrapper -->
						<canvas id="chart-sales-dark" class="chart-canvas"></canvas>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-sm-6">
			<div class="card">
	            <div class="card-header border-0">
              		<div class="row align-items-center">
                		<div class="col">
                  			<h3 class="mb-0">최근게시물</h3>
               			</div>
             		</div>
            	</div>
            	<div class="table-responsive" style="max-height:300px">
              		<table class="table align-items-center table-flush">
                		<thead class="thead-light">
                  			<tr>
                    			<th scope="col">내용</th>
                    			<th scope="col">날짜</th>
                  			</tr>
                		</thead>
                		<tbody>
              		<c:if test="${!empty hBoardInfoPost}">
						<c:forEach items="${hBoardInfoPost}" var="mb" varStatus="sb">
							<tr>
									<td>
										<a href="${URL_ADMIN_ROOT}/board/write/${mb.bmVO.boardCode}?bseq=${mb.boardSeq}">${mb.subject}</a>
								 	</td>
								 	<td>
								 	<span><fmt:formatDate pattern="${DATE_FORMAT}" value="${mb.regDate}" /></span>
								 	</td>
	
							</tr>
						</c:forEach>
					</c:if>
                		</tbody>
               		</table>
            	</div>
           	</div>
		</div>
		
		<div class="col-sm-6">
			<div class="card">
	            <div class="card-header border-0">
              		<div class="row align-items-center">
                		<div class="col">
                  			<h3 class="mb-0">접속통계</h3>
               			</div>
                		<div class="col text-right">
                  			<a href="${URL_ADMIN_ROOT}/member/manage/member_list" class="btn btn-sm btn-primary">See all</a>
               			</div>
             		</div>
            	</div>
            	<div class="table-responsive" style="max-height:300px">
              		<table class="table align-items-center table-flush">
                		<tbody>
              		<c:if test="${!empty hMemberInfo}">
						<c:forEach items="${hMemberInfo}" var="mm" varStatus="sm">
									<tr>
										<td class="first_td">${mm.memberSeq}</td>
										<td>${mm.userId}</td>
										<td>${mm.userName}</td>
										<td><fmt:formatDate
											pattern="yyyy-MM-dd" value="${mm.regDate}" /></td>
									</tr>
						</c:forEach>
					</c:if>
                		</tbody>
               		</table>
            	</div>
           	</div>
		</div>
		
	</div>
</div>

<!-- Resources -->
<script src="/common/js/moment.js"></script>
<!-- <script src="http://changeit.kr/views/admin/chart/amcharts.js"></script> -->

<!-- Chart code -->
<script>

	function getLastMonth(){ 
		$.ajax({
	        url : './ajax/getLastMonth.do'
	        , type : 'post'
	        , dataType: 'json'
	        , data: {}
  			, success: function (json) {
				if (json.success) {
			  		var data = json.data;
				}
				else {
			  		alert('FAILED');
				}
    		}
		    , error : function(data) {
		      alert("error ajax :\n" + data.responseText);
		    }
		});
	}
	
	
	var jpar = ${hostData};
	var testData = {
			'date':[],
			'value':[]
	};
	var jBoard = ${hBoard};
	var testData2 = {
			date:[],
			value:[]
	}
	for ( var data2 in jBoard) {
		value2 = 0;
		let date1 = new Date(jBoard[data2].subject);
		value2 = jBoard[data2].boardSeq;
		testData2['date'].push(moment(date1).format('MMM D'))
		testData2['value'].push(value2)
	}
	var value = 0;

	for ( var data1 in jpar) {
		value = 0;
		let date = new Date("");
		date.setYear(jpar[data1].hitDate.substr(0, 4));
		date.setMonth(jpar[data1].hitDate.substr(4, 2) - 1);
		date.setDate(jpar[data1].hitDate.substr(6, 2));
		date.setHours(jpar[data1].hitTime);
		value = jpar[data1].hitCnt;
		testData['date'].push(moment(date).format('MMM D'));
		testData['value'].push(value);
		
	}
	
	var SalesChart = (function() {

		var $chart = $('#chart-sales-dark');

		function init($chart) {

			var salesChart = new Chart(
					$chart,
					{
						type : 'line',
						options : {
							scales : {
								yAxes : [ {
									gridLines : {
										lineWidth : 1,
										color : Charts.colors.gray[900],
										zeroLineColor : Charts.colors.gray[900]
									},
									ticks : {
										callback : function(value) {
											if (!(value % 500)) {
												return addComma(value);
											}
										}
									}
								} ]
							},
							tooltips : {
								callbacks : {
									label : function(item, data) {
										var label = data.datasets[item.datasetIndex].label
												|| '';
										var yLabel = item.yLabel;
										var content = '';

										if (data.datasets.length > 1) {
											content += '<span class="popover-body-label mr-auto">'
													+ label + '</span>';
										}

										content += '<span class="popover-body-value">$'
												+ yLabel + 'k</span>';
										return content;
									}
								}
							}
						},
						data : {
							labels : testData.date,
							datasets : [ {
								label : 'Performance',
								data : testData.value
							} ]
						}
					});

			$chart.data('chart', salesChart);

		}
		;

		if ($chart.length) {
			init($chart);
		}

	})();
	
	var BarsChart = (function() {

		var $chart = $('#chart-bars');

		function initChart($chart) {

			var ordersChart = new Chart($chart, {
				type : 'bar',
				data : {
					labels : testData2.date,
					datasets : [ {
						label : 'Sales',
						data : testData2.value
					} ]
				}
			});

			$chart.data('chart', ordersChart);
		}

		if ($chart.length) {
			initChart($chart);
		}

	})();
	
	
</script>