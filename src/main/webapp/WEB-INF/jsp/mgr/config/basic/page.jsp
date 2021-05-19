<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 > 페이지관리
 --%>	
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	
	<div class="container-fluid  mt--6">
	
		<div class="card">
			<div class="card-header border-0 d-flex">	 
				<h3 class="mb-0">페이지관리 생성코드</h3>       
				<button type="button" onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn-light btn-sm ml-auto">생성코드복사</button>
			</div>
			<div class="container-fluid">
<pre class="custom mb10"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/page" flush="true" &gt;<br/>
	&lt;jsp:param name="pseq" value="[페이지번호]" /&gt;<br/>
&lt;/jsp:include&gt;
</code></pre>
			</div>
			<script>
				hljs.initHighlighting();
			</script>
		</div>
		
		<div class="tago-callout callout-warning">
			<h4 class="check_tit">체크사항</h4>
			<ul>
				<li>홈페이지 내용을 관리자에서 수정할 수 있는 기능을 제공합니다.</li>
				<li>제작 완료 후에 관리자에서 직접 페이지 수정을 원할경우 페이지관리 기능을 이용합니다.</li>
				<li>페이지관리 메뉴에서 페이지를 추가/수정/삭제가 가능합니다.</li>
				<li>페이지관리 <b>[페이지번호]</b>명은 아래 페이지 목록의 순번으로 변경합니다.</li>
			</ul>
		</div>
		
		<div class="card">
			<div class="card-header border-0">	 
				<h3 class="mb-0">총 페이지수 : ${search.totalCount }</h3>       
			</div>
			<table class="table table-bordered text-center">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="25%" />
					<col width="20%" />
				</colgroup>
				
				<thead class="table-info">
					<tr>
						<th>번호</th>
						<th>페이지</th>
						<th>페이지URL</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<td>${m.pageSeq }</td>
						<td><c:if test="${empty m.groupName }">그룹없음</c:if>${m.groupName} > ${m.pageName }</td>
						<td>${m.pageUrl }</td>
						<td>
							<span id="spanCode_${m.pageSeq }" class="d-none">
&lt;jsp:include page="/module/page" flush="true"&gt;
	&lt;jsp:param name="pseq" value="${m.pageSeq }" /&gt;
&lt;/jsp:include&gt;
							</span>
						<a href="javascript:copyClipboard('#spanCode_${m.pageSeq }');" class="btn btn-light btn-sm">생성코드복사</a> 

					</tr>
</c:forEach>				
				</tbody>
			</table>
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		</div>
		
	</div>
	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>