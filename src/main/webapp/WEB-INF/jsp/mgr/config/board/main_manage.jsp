<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 메인 게시물
--%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="main-content" id="panel">
		<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
		
		<div class="container-fluid  mt--6">
			<div class="card">
				<div class="card-header border-0 d-flex">	 
					<h3 class="mb-0">메인 게시물 생성코드</h3>       
					<button type="button" onclick="javascript:copyClipboard('#codeSample');" class="btn btn-light btn-sm ml-auto">생성코드복사</button>
				</div>
				<div class="container-fluid">
<pre class="custom"><code id="codeSample" class="html">
&lt;jsp:include page="/module/rb" flush="true"&gt;
	&lt;jsp:param name="rbseq" value="[메인게시물번호]" /&gt;
&lt;/jsp:include&gt;
</code></pre>
				</div>
			</div>
			
			<div class="tago-callout callout-warning">
				<h4 class="check_tit">체크사항</h4>
				<ul class="ml10">
					<li>최근 게시물을 가져올 수 있습니다.</li>
					<li>출력하고자 하는 위치에 예제 코드와 같은 블럭을 추가합니다.</li>
					<li>rbseq <b>[메인게시물번호]</b>는 아래 메인게시물 목록의 순번으로 변경합니다.</li>
					<!-- <li>- bcseq <b>[카테고리번호]</b>를 추가하면 해당 카테고리의 게시물만 가져옵니다. 카테고리를 구분하지 않으려면 value를 빈 값으로 넣거나, 파라미터 라인을 삭제하면 됩니다.</li> -->
				</ul>
			</div>
			
			<div class="card">
				<div class="card-header border-0">
					<div class="d-flex">
						<h3 class="mb-0">메인게시물 수 : ${search.totalCount }</h3>   
						<a href="./main_write.do" class="btn btn-sm btn-primary ml-auto">메인게시물 생성</a>    
					</div>	 
				</div>
				
				<form id="form1" action="./main_proc.do" method="post">	
					<input type="hidden" name="rbseq" value="${search.rbseq }" />
					<input type="hidden" name="status" value="${search.status }" />	
					<div class="table-responsive">	
						<table class="table table-bordered text-center">
							<colgroup>
								<col width="6%" />
								<col width="11%" />
								<col width="13%" />
								<col width="9%" />
								<col width="9%" />
								
								<col width="17%" />
								<col width="*" />
							</colgroup>
							
							<thead class="table-info">
								<tr>
									<th>순번</th>
									<th>게시판코드</th>
									<th>게시판이름</th>
									<th>게시물 수</th>
									<th>제목 글자 수</th>
									
									<th>카테고리</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
								<tr>
									<%-- <td>${search.paging.virtualNumber - s.index }</td> --%>
									<td>${s.index+1}</td>
									<td>${m.boardCode }</td>
									<td>${m.boardMasterVO.boardName }</td>
									<td>${m.articleCount }</td>
									<td>${m.subjectCharCount }</td>
									<td>${empty m.cateName ? '선택안함' : m.cateName}</td>
									<td>
										<span id="spanCode_${m.recentBoardSeq }" class="d-none">
&lt;jsp:include page="/module/rb.do" flush="true"&gt;
	&lt;jsp:param name="rbseq" value="${m.recentBoardSeq }" /&gt;
&lt;/jsp:include&gt;
										</span>
										<a href="javascript:copyClipboard('#spanCode_${m.recentBoardSeq }');" class="btn btn-sm btn-light">생성코드복사</a>
										<a href="javascript:openPop('?rbseq=${m.recentBoardSeq }', 'previewRecentBoard');" class="btn btn-sm btn-primary">미리보기</a>
										<a href="javascript:$.Nav('go', './main_write.do', {rbseq: '${m.recentBoardSeq }'});" class="btn btn-sm btn-primary">수정</a>
										<a href="javascript:deleteSubmit(${m.recentBoardSeq });" class="btn btn-sm btn-danger">삭제</a>
									</td>
								</tr>
			</c:forEach>
			<c:if test="${empty list }">
								<tr>
									<td colspan="7"><s:message code="common.noData" /></td>
								</tr>
			</c:if>
							</tbody>
						</table>
						</div>
					</form>
			</div>
			
		</div>
		
		
		<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
	</div>

	
	
	<script type="text/javascript">
		hljs.initHighlighting();
		function deleteSubmit(seq ) {
			$('input[name="rbseq"]').val(seq);
			$('input[name="status"]').val("d");
			$('#form1').submit();
		}
	</script>

	
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>