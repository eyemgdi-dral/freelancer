<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	접속통계 - 접속자 분석
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include> 

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<div class="card">
			<div class="card-body">
				<div class="form-group row">
					<label class="col-auto col-form-label">분석방법</label>
					<div class="col d-flex align-items-center">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="ga_RadioT" name="ga_Radio" class="custom-control-input" value="today">
							<label class="custom-control-label" for="ga_RadioT">오늘</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="ga_RadioH" name="ga_Radio" class="custom-control-input" value="ga:hour">
							<label class="custom-control-label" for="ga_RadioH">시간대별</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="ga_RadioD" name="ga_Radio" class="custom-control-input" value="ga:date">
							<label class="custom-control-label" for="ga_RadioD">일별</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="ga_RadioYm" name="ga_Radio" class="custom-control-input" value="ga:yearMonth">
							<label class="custom-control-label" for="ga_RadioYm">월별</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="ga_RadioY" name="ga_Radio" class="custom-control-input" value="ga:year">
							<label class="custom-control-label" for="ga_RadioY">년별</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-auto col-form-label">기간</label>
					<div class="col">
						<div class="form-inline">
							<div class="input-daterange datepicker row align-items-center">
							    <div class="col">
						            <div class="input-group">
						                <div class="input-group-prepend">
						                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
						                </div>
						                <input name="sDate" class="form-control" placeholder="Start date" type="text" value="${search.startDate }">
						            </div>
							    </div>
							    <div class="col">
						            <div class="input-group">
						                <div class="input-group-prepend">
						                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
						                </div>
						                <input name="eDate" class="form-control" placeholder="End date" type="text" value="${search.endDate }">
						            </div>
							    </div>
							</div>
						    <a class="btn btn-primary" onclick="doSearch('ga:users');">검색</a> 
							<a href="" class="btn btn-outline-primary">접속자분석 초기화</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header">
				<h3 class="mb-0">접속자 분포도</h3>
			</div>
			<div class="card-body">
				<div class="table-responsive mb-3">
					<table class="table table-bordered text-center mb20 gAnalytics"  data-met="ga:users" data-id="User">
						<colgroup>
							<col width="20%" />
							<col width="" />
							<col width="20%" />
							<col width="" />
						</colgroup>
						<tbody>
							<tr>
								<th class="">총 접속자 수</th>
								<td class="text-left"  id="totalVisitors"></td>
								<th class="">평균 접속자 수</th>
								<td class="text-left" id="avgVisitors"></td>
							</tr>
							<tr>
								<th class=""> 오늘 접속자 수  </th>
								<td class="text-left" id="tdayVisitors"></td>
								<th class=""> 어제 접속자 수  </th>
								<td class="text-left" id="ydayVisitors"></td>
							</tr>
							<tr>
								<th class=""> 이번달 접속자 수  </th>
								<td class="text-left" id="mVisitors"></td>
								<th class=""> 이번달 평균 접속자 수  </th>
								<td class="text-left" id="avgMVisitors"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<table class="table table-bordered mt50 w-100 hide" id="ga_result_table"  >
					<colgroup>
						<col width="10%" />
						<col width="" />
						<col width="" />
					</colgroup>
					<thead class="table-info">
						<tr>
							<th>번호</th>
							<th>날짜/시간</th>
							<th>접속자 수</th>
						</tr>
					</thead>
					<tbody id="query_result"></tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>		


		
<!-- ============= JavaScript ============== -->
<!-- Google Analytic Libararies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bluebird/3.3.5/bluebird.min.js"></script>
<script src="/common/js/google-analytics.js"></script>
<script data-name="analytics" async defer src="https://apis.google.com/js/api.js" 
      onload="this.onload=function(){};googleAnalytics.prepClientLoad()" 
      token="${set.googleAccessToken}" view_id="${set.googlelogValue }" client_id="${set.googlelogId}" 
      start_date="<fmt:formatDate value="${tagoplusSolution1_session_site.installDate }" pattern="${DATE_FORMAT}"/>">
</script>


<script>
	function doSearch(metric){
		
		//Validation radio button
		if(!($('input[name=ga_Radio]').is(':checked'))){
			alert("Must be chosen 분석방법");
			return;
		};
		
		//Sending data to Query function
		googleAnalytics.searchQuery($('input[name=sDate]').val(), $('input[name=eDate]').val(), metric, $('input[name=ga_Radio]:checked').val());
	
	}	
</script>



<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>