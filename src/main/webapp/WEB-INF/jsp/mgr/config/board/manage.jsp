<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 게시판
--%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	
	<div class="container-fluid  mt--6">
		<div class="card">
			<div class="card-header border-0 d-flex">	 
				<h3 class="mb-0">게시판 생성코드</h3>       
				<button type="button" onclick="javascript:copyClipboard('#codeSample');" class="btn btn-light btn-sm ml-auto">생성코드복사</button>
			</div>
			<div class="container-fluid">
<pre class="custom"><code id="codeSample" class="html">
&lt;jsp:include page="/module/board" flush="true"&gt;
	&lt;jsp:param name="bcode" value="[게시판코드]" /&gt;
&lt;/jsp:include&gt;
</code></pre>
			</div>
		</div>
		
		<div class="tago-callout callout-warning">
			<h4 class="check_tit">체크사항</h4>
			<ul class="ml10">
				<li>게시판을 출력하고자 하는 위치에 예제 코드와 같은 블럭을 추가합니다.</li>
				<li>bcode <b>[게시판코드]</b>는 아래 게시판 목록의 게시판코드로 변경합니다.</li>
			</ul>
		</div>
		
		<div class="card">
			<div class="card-header border-0">	 
				<h3 class="mb-0">게시판 수 : ${search.totalCount }</h3>       
			</div>
			<div class='table-responsive'>
			<table class="table table-bordered text-center">
                <colgroup>
                    <col width="5%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="10%" />
                    
                    <col width="8%" />
                    <col width="8%" />
                    <col width="8%" />
                    <col width="8%" />
                    <col width="9%" />
                    
                    <col width="*" />
                </colgroup>
                <thead class="table-info">
					<tr>
						<th>번호</th>
						<th>게시판코드</th>
						<th>게시판이름</th>
						<th>게시판 유형</th>
						<th>스킨</th>
						
						<th>목록보기</th>
						<th>내용보기</th>
						<th>글쓰기</th>
						<th>답글쓰기</th>
						<th>코멘트쓰기</th>
						
						<th>기능</th>
					</tr>
				</thead>
                <tbody>
<c:forEach var="m" items="${list }" varStatus="s">     
                    <tr>
                        <td>${search.paging.virtualNumber - s.index }</td>
                        <td>${m.boardCode }</td>
                        <td>${m.boardName }</td>
                        <td>${m.boardTypeFixedCodeName }</td>
                        <td>${m.cssPrefix }</td>
                        
                        <td>${m.authListName }</td>
                        <td>${m.authViewName }</td>
                        <td>${m.authWriteName }</td>
                        <td>${m.authReplyName }</td>
                        <td>${m.authCommentName }</td>
                        
                        <td>

							<span id="spanCode_${m.boardCode }" class="d-none">
&lt;jsp:include page="/module/board.do" flush="true"&gt;
	&lt;jsp:param name="bcode" value="${m.boardCode }" /&gt;
&lt;/jsp:include&gt;
							</span>
							<a href="javascript:copyClipboard('#spanCode_${m.boardCode }');" class="btn btn-light btn-sm">생성코드복사</a>                                                
                        </td>
                    </tr>
</c:forEach>
<c:if test="${empty list }">
					<tr>
						<td colspan="11"><s:message code="common.noData" /></td>
					</tr>
</c:if>
				</tbody>
			</table>
			</div>
		</div>
		
	</div>
	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>	

	
<script>
	hljs.initHighlighting();
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>