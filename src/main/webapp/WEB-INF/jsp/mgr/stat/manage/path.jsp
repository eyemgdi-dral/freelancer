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
					<label class="col-sm-2 col-form-label">분석방법</label>
					<div class="col d-flex align-items-center">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="ga_RadioT" name="ga_Radio" class="custom-control-input" value="ga:fullReferrer">
							<label class="custom-control-label" for="ga_RadioT">접속경로</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="ga_RadioH" name="ga_Radio" class="custom-control-input" value="useTool">
							<label class="custom-control-label" for="ga_RadioH">검색엔진,링크사이트</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">기간</label>
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
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">검색엔진</label>
					<div class="col">
						<div class="form-inline">
							<select id="ga_group-result" class="form-control mr-2">
								<option>::검색엔진 선택::</option>
							</select> 
							<a class="btn btn-primary" onclick="doSearch('ga:users', 'ga:source');">검색</a> 
							<a href="" class="btn btn-outline-primary">접속자분석 초기화</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="card">
			<div class="card-header">
				<h3 class="mb-0">접속경로 분석</h3>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-center mt50 w-100 gAnalytics" data-id="Path" data-dim = "ga:source" data-met="ga:users" >
						<colgroup>
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
						</colgroup>
						<thead class="table-info">
							<tr>
								<th>번호</th>
								<th>방문경로</th>
								<th>접속자수</th>
								<th>비율</th>
							</tr>
						</thead>
						<tbody id="query_result"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<!--wrap_scon S-->
	<div id="wrap_scon">
	
		
		<div class="scon_title">
			<h2>접속경로 분석</h2>
			<p>홈 > 설문관리 > 접속경로 분석</p>
		</div>
		
		<div class="scon">
			<h3 class="scon_tit2"></h3>
			
			
			
			
		</div>
	</div>
	<!--wrap_scon E-->

<!-- Google Analytic Libraries -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bluebird/3.3.5/bluebird.min.js"></script>
<script src="/common/js/google-analytics.js"></script>
<script data-name="analytics" src="https://apis.google.com/js/api.js" onload="this.onload=function(){};googleAnalytics.prepClientLoad();" token="${set.googleAccessToken}" 
view_id="${set.googlelogValue }" client_id="${set.googlelogId}" start_date="<fmt:formatDate value="${tagoplusSolution1_session_site.installDate }" pattern="${DATE_FORMAT}"/>"></script>


<script>

	function doSearch(metric, dimension){
		
				
		var filter = '';
		
		//Validation radio button
		if(!($('input[name=ga_Radio]').is(':checked'))){
			alert("Must be chosen 분석방법");
			
			return;
		};
		
		if($('input[name=ga_Radio]:checked').val() == 'useTool'){
		 	
			filter = $('#ga_group-result').val();
			
		}else {
			
			dimension = $('input[name=ga_Radio]:checked').val();
			
		}
		
		 //Sending data to Query function
		googleAnalytics.searchQuery($('input[name=sDate]').val(), $('input[name=eDate]').val(), metric, dimension, filter);  
		
		
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>