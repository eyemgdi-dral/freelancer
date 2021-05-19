<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	상품 관리 - 상품 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	
	<div class="container-fluid mt--6">
		<form id="form1" action="./prd_list.do">
			<div class="card">
				<div class="card-body">
					<div class="container-fluid">
						<div class="form-group row">
							<label class="col-auto col-form-label">조건검색</label>
							<div class="col-lg-10">
								<div class="form-inline">
									<input type="text" name="searchWord" class="input_type1 form-control mr-2 searchWord" value="${search.searchWord }" /> 
									<a id="btnSearch" onclick="javascript:doSearch();" class="btn btn-primary mr-2">검색</a>
									<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn btn-outline-primary">검색 초기화</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row align-items-center">
				<div class="col-md-6">
					상품 수 : ${search.totalCount } / ${count } 
				</div>
				<div class="col-md-6 text-right">
					<a onclick="javascript:$.Nav('go', './prd_write.do', {prdseq: ''});" class="btn btn-primary">상품 추가</a>
				</div>
			</div>
			
			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered text-sm">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="*" />
								<col width="9%" />
								<col width="7%" />
								<col width="10%" />
								<col width="18%" />
							</colgroup>
							<thead class="table-info">
								<tr>
									<th><input type="checkbox" id="checkAll"  /></th>
									<th>번호</th>
									<th>카테고리</th>
									<th>상품명</th>
									<th>상품 코드</th>
									<th>스킨</th>
									<th>상품 요약</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list }" var="l" varStatus="s">
								<tr>
									<td>
										<input type="checkbox" name="checkPrd" value="${l.prdSeq } ">
									</td>
									<td>${search.paging.virtualNumber - s.index }</td>
									<td>${l.categoryName }</td>
									<td>${l.prdName }</td>
									<td>${l.productCode }</td>
									<td>${l.cssPrefix }</td>
									<td>${l.summary }	</td> 
									<td>
										<a onclick="javascript:$.Nav('go', './prd_write.do', {prdseq: '${l.prdSeq}'});" class="btn btn-sm btn-primary">수정</a>
										<a onclick="javascript:doDelete('${l.prdSeq }');" class="btn btn-sm btn-danger">삭제</a>
									</td>
								</tr>
						</c:forEach>				
						
						<c:if test="${empty list }">
								<tr>
									<td colspan="8"><s:message code="common.noData" /></td>
								</tr>
					</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer">
					<div class="row">
						<div class="col-sm-3"></div>
						<div class="col-sm-6">
							<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
						</div>
						<div class="col-sm-3 text-right">
							<a onclick="javascript:doDelete('');" class="btn btn-danger">선택삭제</a>
						</div>
					</div>
				</div>
			</div>
			
		</form>
	</div>
	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script type="text/javascript">
	function doSearch() {
		$('#form1').submit();	
	}
	
	$('#checkAll').change(function() {
		$('input[name=checkPrd]').prop('checked', $(this).is(':checked'));
	});
	
	function doOrderingUpdate(prdSeq, ordering, type) {
		$.Nav('go', './prd_ordering_update.do', {prdSeq: prdSeq, ordering : ordering, type : type});	
	}
	
	function doDelete (prdSeq) {
		if (prdSeq == '') {
			if (!$('input[name=checkPrd]').is(':checked')) {
				alert('삭제할 상품을 선택해 주세요');
				return;
			}
			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			var prdseqs = new Array();
			$('input[name=checkPrd]').each(function() {
				if ($(this).prop('checked')) {
					prdseqs.push($(this).val());
				}
			});
			
			$.Nav('go', './prd_proc.do', {status : 'd', prdseqs : prdseqs });		
			
		} else {			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			
			$.Nav('go', './prd_proc.do', {prdseq : prdSeq, status : 'd' });
		}		
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>