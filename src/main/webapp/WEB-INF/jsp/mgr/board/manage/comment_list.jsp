<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<style>
.board_write th {
	background: #F7F7F7;
}

.board_st1 th {
	background: #6F7784;
	color: #fff;
}

div.search {
	margin-bottom:0px;
}
</style>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">

	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
		
	<div class="container-fluid mt--6">
		<form id="formSearch" name="formSearch" action="./comment_list" enctype="multipart/form-data">
			<div class="card">
				<div class="card-body">
					<div class="container-fluid">
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">게시판별 보기</label>
							<div class="col-lg-10">
								<div class="form-inline">
									<tt:select list="${bmList }" id="bcode" name="bcode" listKey="boardCode" listValue="boardName" indexKey="" indexValue="전체" selected="${search.bcode }" />
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">등록일</label>
							<div class="col-lg-10">
								<div class="form-inline">
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
									<input type="button" class="btn ${search.type2 == 'today' ? 'btn-green' : ''} dateFilter" data-id="today" value="오늘" />
									<input type="button" class="btn ${search.type2 == 'yesterday' ? 'btn-green' : ''} dateFilter" data-id="yesterday" value="어제" />
									<input type="button" class="btn ${search.type2 == 'week' ? 'btn-green' : ''} dateFilter" data-id="week" value="1 주일" />
									<input type="button" class="btn ${search.type2 == 'month' ? 'btn-green' : ''} dateFilter" data-id="month" value="1 개월" />
									<input type="hidden" id="type2" name="type2" value="" />
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">키워드 검색</label>
							<div class="col-lg-10">
								<div class="form-inline">
									<select name="type1" id="type1" class="form-control">
										<option value="">제목 + 코멘트</option>
										<option value="id">Registered User</option>
										<option value="body">Body</option>
										<option value="type">Status</option>
									</select>
									<input ${search.type1 == 'type' ? 'hidden': ''} type="text" name="searchWord" class="form-control searchWord" value="${search.type1 != 'type' ? search.searchWord : ''}" id="searchWord" />
									<select id="Fstatus" class="form-control"
										${search.type1 == 'type' ? '': 'hidden'}>
										<option value="">---</option>
										<option ${search.searchWord == '009000' ? 'selected' : ''}
											value="009000">PUBLISH</option>
										<option ${search.searchWord == '009001' ? 'selected' : ''}
											value="009001">UNPUBLISH</option>
									</select>
									<a id="btnSearch" onclick="javascript:doSearch();" class="btn btn-primary">검색하기</a>
									<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn btn-primary">검색 초기화</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-header">
					전체 게시물 수 : <fmt:formatNumber value="${search.totalCount }" pattern="#,###" />				
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="*" />
								<col width="8%" />
								<col width="10%" />
								<col width="10%" />
								<col width="30%" />
							</colgroup>
							<thead class="table-info">
								<tr>
									<th><input type="checkbox" id="chkDAll" /></th>
									<th>번호</th>
									<th>코멘트위치</th>
									<th>코멘트내용</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>IP</th>
									<th>수정 | 삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty list}">
									<c:forEach items="${list }" var="m" varStatus="s">
										<tr>
											<td class="first"><input type="checkbox" name="chksD"
												value="${m.commentSeq }" /></td>
											<td>${search.paging.virtualNumber - s.index }</td>
			
											<td>${m.boardCode }</td>
											<td>${m.body }</td>
											<td>${m.regUser }</td>
											<td><fmt:formatDate value="${m.regDate }"
													pattern="${m.dateFormatList }" /></td>
											<td><fmt:formatNumber value="${m.ipAddr }" pattern="#,###" /></td>
											<td><a onclick="javascript:$.Nav('go', './comment_stat.do', {commentSeq : '${m.commentSeq}', displayYn : 'Y' });"
												class="publishYn btn btn-sm ${m.displayYn == 'Y' ? 'btn-primary' : 'btn-danger'} ">보이기</a>
												<a onclick="javascript:$.Nav('go', './comment_stat.do', {commentSeq : '${m.commentSeq}', displayYn : 'N' });"
												class="publishYn btn btn-sm ${m.displayYn == 'N' ? 'btn-primary' : 'btn-danger'} ">숨기기</a>
												<a onclick="javacript:doDelete('${m.commentSeq }');"
												class="btn btn-sm btn-danger">삭제</a></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty list}">
									<tr>
										<td colspan="8"><s:message code="common.noData" /></td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer">
					<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
					<br class="clear mb5" />
					<c:set var="delete">
						<s:message code="common.delete.msg" />
					</c:set>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
	
</div>

<script type="text/javascript">
	//Jquery Code
	$(document).ready(
		function() {
			$('#chkDAll').change(
					function() {
						$('input[name=chksD]').prop('checked',
								$(this).is(':checked'));
					});
		});

	$('#type1').on('focusout', function(e) {
		if ($(this).val() === 'type') {
			$('#Fstatus').show();
			$('#searchWord').hide();
		} else {
			$('#Fstatus').hide();
			$('#searchWord').show();
		}
	});

	$('#Fstatus').on('focusout', function(e) {
		$('#searchWord').val($(this).val())
	});

	$('.dateFilter').on(
			'click',
			function(e) {
				$('input[name=startDate]').val('');
				$('input[name=endDate]').val('');
				$(this).toggleClass(
						'bg_green',
						function() {
							$(this).hasClass('bg_green') ? $('#type2')
									.val($(this).data('id')) : $(
									'#type2').val('');
						}).siblings().removeClass('bg_green');
			});

	$('.selectALl').on(
			'click',
			function(e) {
				$('input[name=chksD]').prop(
						'checked',
						(($(this).data('id') == 'nocheck') ? true
								: false));
			})

	//Javascript
	function doDelete(seq) {
		var sMsg = '${delete}';
		if (seq) {
			if (!confirm(sMsg))
				return;
			$.Nav('go', './comment_proc', {
				commentSeq : seq,
				status : 'd'
			});
		} else {
			if (!$('input[name=chksD]').is(':checked')) {
				alert('삭제할 상품을 선택해 주세요');
				return;
			}
			if (!confirm(sMsg))
				return;

			const bseqs = new Array();
			$('input[name=chksD]').each(function() {
				if ($(this).prop('checked')) {
					bseqs.push($(this).val());
				}
			});

			$.Nav('go', './comment_proc', {
				status : 'd',
				bseqs : bseqs
			});
		}

	}
	function doSearch() {
		document.formSearch.submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>