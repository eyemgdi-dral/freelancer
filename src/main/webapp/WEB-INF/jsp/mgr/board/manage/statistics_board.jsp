<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판별 게시물 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<c:set var="pageMenuPath" value="/board/manage/statistics_boards" />
			<div class="card">
				<form id="form1" action="./statistics_boards">
					<div class="card-body">
						<div class="container-fluid">
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">게시판</label>
								<div class="col-lg-10">
									<div class="form-inline">
										<tt:select list="${bmList }" id="type1" name="type1" listKey="boardCode" listValue="boardName" indexKey="" indexValue="전체" selected="${search.type1 }"/>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">기간</label>
								<div class="col-lg-10">
									<div class="form-inline">
										<tt:select list="${type2s }" id="type2" className="mr-2" name="type2" listKey="value" listValue="text" indexKey="" indexValue="전체" selected="${search.type2 }"/>
										<select id="type3" name="type3" class="form-control mr-2">
											<option value="">전체</option>
				<c:forEach varStatus="s" begin="1" end="12" step="1">
											<option value="${s.count }">${s.count }</option>
				</c:forEach>
										</select>
										<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn btn-primary">검색 초기화</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered">
							<colgroup>
								<col width="15%" />
								<col width="35" />
								<col width="15%" />
								<col width="35" />
							</colgroup>			
							<tr>
								<th>총 게시글 수</th>
								<td>${countMap.BOARD_COUNT }</td>
								<th>총 코멘트 수</th>
								<td>${countMap.COMMENT_COUNT }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
	</div>
</div>


<script type="text/javascript">
	$(function () {
		$('#type3 option:eq(${search.type3})').prop('selected', true);
	});

	$('#type1, #type2, #type3').change(function () {
		$('#form1').submit();
	});
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>