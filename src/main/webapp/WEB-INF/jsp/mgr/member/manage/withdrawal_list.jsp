<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 탈퇴 회원 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1">
			<input type="hidden" name="mseq"  />
			<input type="hidden" name="status"  value="d" />
			<div class="card">
				<div class="card-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-auto col-form-label">조건검색</label>
									<div class="col-lg-10">
										<div class="form-inline">
											<div class="input-daterange datepicker row align-items-center">
											    <div class="col">
										            <div class="input-group">
										                <div class="input-group-prepend">
										                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
										                </div>
										                <input type="text" name="startDate1" class="input_type2 form-control datepicker" value="${search.startDate1}" />
										            </div>
											    </div>
											    <div class="col">
										            <div class="input-group">
										                <div class="input-group-prepend">
										                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
										                </div>
														<input type="text" name="endDate1" class="input_type2 form-control datepicker" value="${search.endDate1 }" />
										            </div>
											    </div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-auto col-form-label">조건검색</label>
									<div class="col-lg-10">
										<div class="form-inline">
												<tt:select list="${type2s}" className="mb-2" name="type2" listKey="value" listValue="text" selected="${search.type2 }" />
												<input type="text" name="searchWord" class="input_type1 form-control searchWord mb-2" value="${search.searchWord }" /> 
												<a id="btnSearch" onclick="javascript:doSearch();" class="btn btn-primary mb-2">검색</a>
												<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn mb-2 btn-outline-primary">검색 초기화</a><br/>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<colgroup>
								<col width="5%" />
								<col width="15%" />
								<col width="15%" />
								<col width="*" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<thead class="table-info">
								<tr>
									<th>번호</th>
									<th>회원명</th>
									<th>회원아이디</th>
									<th>탈퇴사유</th>
									<th>탈퇴일</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody>
<c:if test="${!empty list}">
	<c:forEach var="m" items="${list }" varStatus="s">			
								<tr>
									<td>${s.index + 1 }</td>
									<td>${m.userName }</td>
									<td>${m.userId }</td>
									<td>${m.withdrawalReason }</td>
									<td>${m.withdrawalDt }</td>
									<td><a href="javascript:doDelete(${m.memberSeq });" class="btn btn-sm btn-danger">삭제</a></td>
								</tr>
	</c:forEach>
</c:if>
<c:if test="${empty list}">
								<tr>
									<td colspan="6"><s:message code="common.noData" /></td>
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

<c:set var="delete"><s:message code="common.delete.msg" /></c:set>		
<script type="text/javascript">
	$(function() {

	});
	function doDelete(mseq) {
		var sMsg = '${delete}';
		/* swal({
			 text: sMsg,
            type: "warning",
            showCancelButton: !0,
            buttonsStyling: !1,
            confirmButtonClass: "btn btn-danger",
            confirmButtonText: "삭제",
            cancelButtonClass: "btn btn-secondary",
            cancelButtonText: "취소"
        }).then(t=>{
            if(t.value){
            	console.log('done')
            }else{
            	console.log('ok')
            }
        }
        ); */
		if (!confirm(sMsg))
			return;
		
		$('input[name=mseq]').val(mseq);	
		var sUrl = './withdrawal_proc.do';		
		$('#form1').attr('action', sUrl);
		$('#form1').attr('method', 'post');
		$('#form1').submit(); 
	}
	
	function doSearch() {
		$('#form1').attr('action', './withdrawal_list.do');
		$('#form1').attr('method', 'get');
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>