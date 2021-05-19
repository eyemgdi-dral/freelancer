<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일 관리 - 폼메일 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" >
		<input type="hidden" name="fseq" value="${search.fseq }" />
		<div class="card">
			<div class="card-body">
				<div class="container-fluid">
					<div class="form-group row">
						<label class="col-auto col-form-label">조건검색</label>
						<div class="col-lg-10">
							<div class="form-inline">
								<tt:select list="${type1s }" className="mr-2" name="type1" listKey="value" listValue="text" indexKey="" indexValue="= 처리상태 =" selected="${search.type1 }"/>
								<tt:select list="${type2s}" className="mr-2" name="type2" listKey="value" listValue="text" indexKey="" indexValue="= 작성내용 ="  selected="${search.type2 }"/>
								<input type="text" name="searchWord" class="form-control searchWord mr-2" value="${search.searchWord }" /> 
								<a id="btnSearch" href="javascript:doSearch();" class="btn btn-primary mr-2">검색</a>
								<a id="btnSearchInit" href="javascript:$.Nav('self', null, null, true);" class="btn btn-outline-primary">검색 초기화</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row mb-4">
			<div class="col-md-6">총 등록 수 : ${search.totalCount }</div>
			<div class="col-md-6 text-right">
				<a onclick="javascript:$.Nav('go', '../form_excel.do', {fseq:${search.fseq}});" class="btn btn-primary">엑셀파일저장</a>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<div class="container-fluid">
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<colgroup>
								<col width="5%" />
								<col width="10%" />
								<col width="*" />
								<col width="10%" />
								<col width="15%" />
								<col width="10%" />
								<col width="20%" />
							</colgroup>
							<thead class="table-info">
								<tr>
									<th>번호</th>
									<th>유형</th>
									<th>제목</th>
									<th>작성일</th>
									<th>처리상태</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody>
	<c:if test="${!empty list}">
		<c:forEach items="${list }" var="m" varStatus="s">
								<tr>
									<td>${s.index + 1 }</td>
									<td>${m.formName }</td>
									<td class="text-left"><a href="javascript:doWrite(${m.formWritingSeq}, ${m.formSeq }, ${search.fseq });">${m.valueVO[0].formInfoValue }</a></td>
									<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT }"/></td>
									<td>${m.processName }</td>
									<td>
										<a onclick="javascript:doWrite(${m.formWritingSeq}, ${m.formSeq }, ${search.fseq });" class="btn btn-sm btn-primary">보기</a>
										<a onclick="javascript:doDelete(${m.formWritingSeq}, ${m.formSeq }, ${search.fseq });" class="btn btn-sm btn-danger">삭제</a>
									</td>
								</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty list }">
								<tr>
									<td colspan="7"><s:message code="common.noData" /></td>
								</tr>
	</c:if>
							</tbody>
						</table>
					</div>
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


<script type="text/javascript">
	$(function() {
		//기준 CSS 너비 +
		$('div.scon').width($('div.scon').width() + 150);
		
		$('#checkAll').click(function(){
			if ($(this).prop('checked'))
				$('input[name=formWritingSeq]').prop('checked', true);
			else
				$('input[name=formWritingSeq]').prop('checked', false);
		});
	});
	
	function doWrite(fwseq, seq, fseq) {
		$.Nav('go', '../write/' + seq + '.do', {fwseq:fwseq, fseq:fseq});
	}
	
	function doSearch() {
		var $fseq = $('input[name=fseq]').val();
		var sUrl = '';
		if ($fseq > 0)
			sUrl += '../list/' + $fseq + '.do';
		else
			sUrl = './list.do';
		
		$('#form1').attr('action', sUrl);
		$('#form1').submit();	
	}
	
	function doDelete(fwseq, seq, fseq) {
		if(!confirm('삭제하시겠습니까?'))
			 return;
		$.Nav('go', '../proc.do', {fwseq:fwseq, formSeq:seq, fseq:fseq, status:'d'});
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>