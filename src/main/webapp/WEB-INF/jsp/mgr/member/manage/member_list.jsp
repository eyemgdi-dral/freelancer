<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원등급 관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
	<form id="form1">
		<div class="card">
			<div class="card-body">
				<div class="container-fluid">
					<div class="form-group row">
						<label class="col-auto col-form-label">조건검색</label>
						<div class="col-lg-10">
							<div class="form-inline">
									<tt:select list="${grade }" className="mr-2" name="glevel" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 등급선택 =" selected="${search.glevel }"/>
									<tt:select list="${type2s}" className="mr-2" name="type2" listKey="value" listValue="text" selected="${search.type2 }" />
									<input type="text" name="searchWord" class="input_type1 searchWord form-control mr-2" value="${search.searchWord }" /> 
									<a id="btnSearch" onclick="javascript:doSearch();" class="btn btn-primary">검색</a>
									<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn btn-primary">검색 초기화</a><br/>
							</div>
							
						</div>
					</div>
					<div class="form-group row">
						<label class="col-auto col-form-label">조건검색</label>
						<div class="col-lg-8">
								<div class="input-daterange datepicker row align-items-center">
								    <div class="col">
							            <div class="input-group">
							                <div class="input-group-prepend">
							                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
							                </div>
							                <input name="startDate" class="form-control" placeholder="Start date" type="text" value="${search.startDate }">
							            </div>
								    </div>
								    <div class="col">
							            <div class="input-group">
							                <div class="input-group-prepend">
							                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
							                </div>
							                <input name="endDate" class="form-control" placeholder="End date" type="text" value="${search.endDate }">
							            </div>
								    </div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="card">
			<div class="card-header">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-6">
							<span class="table_aside">전체 회원 수 : ${count } , 검색 회원 수 : ${search.totalCount } </span>
						</div>
						<div class="col-sm-6 text-right">
							<a onclick="javascript:doDelete();" class="btn btn-sm btn-danger">회원삭제</a>
							<a onclick="javascript:$.Nav('go', './member_excel.do', {glevel:${search.glevel }})" class="btn btn-sm btn-info">엑셀파일저장</a>
							<a onclick="javascript:doWrite(0);" class="btn btn-sm btn-success">회원등록</a>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="5%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="15%" />
							<col width="15%" />
							<col width="10%" />
							<col width="15%" />
							<col width="10%" />
						</colgroup>
						<thead class="table-info">
							<tr>
								<th><input type="checkbox" id="checkAll" /></th>
								<th>번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>휴대폰</th>
								<th>이메일</th>
								<th>방문수</th>
								<th>가입일</th>
								<th>기능</th>
							</tr>
						</thead>
						<tbody>
<c:if test="${!empty list}">
	<c:forEach var="m" items="${list }" varStatus="s">			
							<tr>
								<td><input type="checkbox" name="chkseq" value="${m.memberSeq }" /></td>
								<td>${search.paging.virtualNumber - s.index }</td>
								<td>${m.userName }</td>
								<td>${m.userId }</td>
								<td>${m.mobile }</td>
								<td>${m.email}</td>
								<td>${m.loginCount }</td>
								<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT }"/></td>
								<td><a href="javascript:doWrite(${m.memberSeq })" class="btn btn-sm btn-info">보기</a></td>
							</tr>
	</c:forEach>
</c:if>
<c:if test="${empty list}">
							<tr>
								<td colspan="9"><s:message code="common.noData" /></td>
							</tr>
</c:if>
						</tbody>
					</table>
					
				</div>
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
			</div>
		</div>
	</form>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>		
<script type="text/javascript">
	$(function() {
		$('#checkAll').click(function(){
			if ($(this).prop('checked'))
				$('input[name=chkseq]').prop('checked', true);
			else
				$('input[name=chkseq]').prop('checked', false);
		});
	});
	
	function doSendPopup() {
		var chk = '';
		if (!$('input[name=chkseq]:checked').val()) {
			alert('회원을 선택해주세요.');
			return;
		}
		
		$('input[name=chkseq]').each(function(idx){
			if ($(this).prop('checked')) {
				chk += '&chkseq=' + $(this).val();
			}
		});
		
		openPop('?' + chk, 'memberSendEmail');
	}
	
	function doWrite(seq) {
		
		$.Nav('go', './member_write.do', {mseq:seq});
	}
	
	function doDelete() {
		var sMsg = '${delete}';
		
		if (!$('input[name=chkseq]:checked').val()){
			alert('삭제할 회원을 선택하세요.');
			return;
		}
		
		if (!confirm(sMsg))
			return;
		var sUrl = './member_proc.do';
		var sParam = $.Nav('getSearch', {status:'d'});
		$('#form1').attr('action', sUrl + sParam);
		$('#form1').attr('method', 'post');
		$('#form1').submit();
	}
	
	function doSearch() {
		$('#form1').attr('action', './member_list.do');
		$('#form1').attr('method', 'get');
		$('#form1').submit();
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>