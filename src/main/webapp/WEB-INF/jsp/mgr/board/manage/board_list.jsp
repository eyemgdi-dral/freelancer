<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="./board_list">
				<div class='card'>
					<div class="card-body">
						<div class="container-fluid">
								<div class="form-inline">
									<tt:select list="${listGroup }" className="mr-2" name="type1" listKey="groupSeq" listValue="groupName" indexKey="" indexValue="= 그룹선택 =" />
									<input type="text" name="searchWord" class="input_type1 searchWord form-control mr-2" value="${search.searchWord }" /> 
									<a id="btnSearch" onclick="javascript:doSearch();" class="btn btn-primary">검색</a>
									<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn btn-primary">검색 초기화</a>									
								</div>
						</div>
					</div>
				</div>
		</form>
		<form id="form2" action="./board_proc">
			<input type="hidden" name="status" />
			<input type="hidden" name="bcode" />
				<div class='card'>
					<div class="card-header">
						<div class="container-fluid">
							<div class="row">
								<div class="col-sm-6">
									<span class="table_aside">전체 게시판 수 : ${search.totalCount }</span>
								</div>
<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}">				
								<div class="col-sm-6 text-right">
									<a onclick="javascript:$.Nav('go', './board_write', {bcode:''});" class="btn btn-sm btn-primary">게시판 추가</a>
								</div>
</c:if>	
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered text-center">
								<colgroup>
									<col width="5%" />
									<col width="10%" />
									<col width="8%" />
									<col width="*" />
									<col width="9%" />
									<col width="7%" />
									<col width="7%" />
									<col width="7%" />
									<col width="7%" />
									<col width="7%" />
									<col width="8%" />
									<col width="11%" />
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>그룹 이름</th>
										<th>코드</th>
										<th>게시판 이름</th>
										<th>게시판 유형</th>
										<th>스킨</th>
										<th>목록 보기</th>
										<th>내용 보기</th>
										<th>글 쓰기</th>
										<th>답글 쓰기</th>
										<th>코멘트 쓰기</th>
										<th>기능</th>
									</tr>
								</thead>
								<tbody>
				<c:if test="${!empty list}">
					<c:forEach items="${list }" var="m" varStatus="s">
									<tr>
										<td class="first">${search.paging.virtualNumber - s.index }</td>
										<td><a href="javascript:$.Nav('go', './board_write', {bcode:'${m.boardCode }'});">${m.groupName }</a></td>
										<td><a href="javascript:$.Nav('go', './board_write', {bcode:'${m.boardCode }'});">${m.boardCode }</a></td>
										<td><a href="javascript:$.Nav('go', './board_write', {bcode:'${m.boardCode }'});">${m.boardName }</a></td>
										<td>${m.boardTypeFixedCodeName }</td>
										<td>${m.cssPrefix }</td>
										<td>${m.authListName }</td>
										<td>${m.authViewName }</td>
										<td>${m.authWriteName }</td>
										<td>${m.authReplyName }</td>
										<td>${m.authCommentName }</td>
										<td>
											<a onclick="javascript:$.Nav('go', './board_write', {bcode: '${m.boardCode}'});" class="btn btn-sm btn-info">수정</a>
											<a onclick="javacript:doDelete('${m.boardCode}');" class="btn btn-sm btn-danger">삭제</a>
										</td>
									</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
									<tr>
										<td colspan="12"><s:message code="common.noData" /></td>
									</tr>
				</c:if>
								</tbody>
							</table>
						</div>
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
	});
	
	function doSearch() {
		$('#form1').submit();	
	}
	
	function doDelete(bcode) {
		if(!confirm('삭제하시겠습니까?'))
			 return;
		
		$.ajax({
			url: './ajax/check_delete'
			, type: 'post'
			, dataType: 'json'
			, data: { 
				bcode: bcode
			}
			, success: function (data) {
				if(data.total > 0){
					var first = data.result[0].subject;
					
					if(!confirm(first+'외'+data.total+'개 게시물 있습니다.삭제하시겠습니까?'))
						 return;
				}
				$('input[name=bcode]').val(bcode);
				$('input[name=status]').val('d');
				$('#form2').attr('method', 'post');
				$('#form2').submit();
			}
			, error: function (data) {
				alert('Request Exception (' + data.status + ')\n' + data.statusText);
			}
		});
		/* alert('개발스킵 - 게시판 삭제, 숨김 여부 미결');
		return; */
		
	}
	
	function submitDelete(){
		
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>