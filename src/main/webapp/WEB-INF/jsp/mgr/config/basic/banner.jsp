<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 > 배너관리
 --%>	
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>


<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid  mt--6">
		<div class="card">
			<div class="card-header border-0 d-flex">	 
				<h3 class="mb-0">배너관리 생성코드</h3>       
				<button type="button" onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn-light btn-sm ml-auto">생성코드복사</button>
			</div>
			<div class="container-fluid">
<pre class="custom"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/banner" flush="true"&gt;<br/>
	&lt;jsp:param name="bseq" value="[배너번호]" /&gt;<br/>
&lt;/jsp:include&gt;
</code></pre>
			</div>
		</div>
		
		<div class="tago-callout callout-warning">
			<h4 class="check_tit">체크사항</h4>
			<ul>
				<li>홈페이지의 메인 이미지 또는 배너를 관리자에서 관리할 수 있는 기능을 제공합니다.</li>
				<li>사이트의 특정 이미지를 수정/삭제하는 기능이나 이미지 추가를 원할경우 배너관리를 이용합니다</li>
				<li>배너관리 메뉴에서 배너를 추가/수정/삭제가 가능합니다.</li>
				<li>배너관리 <b>[배너번호]</b>명은 아래 배너 목록의 순번으로 변경합니다.</li>
			</ul>
		</div>
		
		<div class="card">
			<div class="card-header border-0">	 
				<h3 class="mb-0">배너 수 : ${search.totalCount }</h3>       
			</div>
			<table class="table table-bordered text-center">
				<caption>배너관리</caption>
				<colgroup>
					<col width="10%" />
					<col width="18%" />
					<col width="*" />
					<col width="10%" />
					<col width="10%" />
					<col width="20%" />
				</colgroup>
				
				<thead class="table-info">
					<tr>
						<th>번호</th>
						<th>마스터코드</th>
						<th>그룹명</th>
						<th>배너형태</th>
						<th>사용여부</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<td>${m.bmSeq }</td>
						<td>${m.masterCode }</td>
						<td>${m.masterName }</td>
						<td>${m.directionName }</td>
						<td>${m.useYnName }</td>
						<td>
							<span id="spanCode_${m.bmSeq }" class="d-none">
&lt;jsp:include page="/module/banner" flush="true"&gt;
	&lt;jsp:param name="bseq" value="${m.bmSeq }" /&gt;
&lt;/jsp:include&gt;
							</span>
	<c:if test="${m.useYn eq 'Y' }">							
							<a href="javascript:copyClipboard('#spanCode_${m.bmSeq }');" class="btn btn-light btn-sm">생성코드복사</a>
	</c:if> 
						</td>
					</tr>
</c:forEach>				
				</tbody>
			</table>
		</div>
		
	</div>
	<script>
		hljs.initHighlighting();
	</script>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>