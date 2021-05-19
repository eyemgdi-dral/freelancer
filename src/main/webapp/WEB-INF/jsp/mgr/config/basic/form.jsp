<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 > 폼메일관리
 --%>	
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>


<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	
	<div class="container-fluid  mt--6">
		<div class="card">
			<div class="card-header border-0 d-flex">	 
				<h3 class="mb-0">폼메일관리 생성코드</h3>       
				<button type="button" onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn-light btn-sm ml-auto">생성코드복사</button>
			</div>
			<div class="container-fluid">
<pre class="custom"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/form" flush="true"&gt;
	&lt;jsp:param name="fseq" value="[폼메일번호]" /&gt;
&lt;/jsp:include&gt;
</code></pre>
			</div>
		</div>
		
		<div class="tago-callout callout-warning">
			<h4 class="check_tit">체크사항</h4>
			<ul>
				<li>폼메일을 형태에 구애없이 자유롭게 생성할 수 있는 편리한 기능을 제공합니다.</li>
				<li>스킨위치 : /</li>
				<li>폼메일관리 <b>[폼메일번호]</b>명은 아래 폼메일 목록의 순번으로 변경합니다.</li>
				<li>작성된 폼메일내용은 관리자 > 폼메일관리 메뉴에서 확인 가능합니다.</li>
			</ul>
		</div>
		
		<div class="card">
			<div class="card-header border-0">	 
				<h3 class="mb-0">총 폼메일 수 : ${search.totalCount }</h3>       
			</div>
			<table class="table table-bordered text-center">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="20%" />
				</colgroup>
				
				<thead class="table-info">
					<tr>
						<th>번호</th>
						<th>폼메일명</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<td>${m.formSeq}</td>
						<td>${m.formName }</td>
						<td>
							<span id="spanCode_${m.formSeq }" class="d-none">
&lt;jsp:include page="/module/form" flush="true"&gt;
	&lt;jsp:param name="fseq" value="${m.formSeq }" /&gt;
&lt;/jsp:include&gt;
							</span>					
							<a href="javascript:copyClipboard('#spanCode_${m.formSeq }');" class="btn btn-light btn-sm">생성코드복사</a>
						</td>
					</tr>
</c:forEach>				
				</tbody>
			</table>
		</div>
	</div>
		<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
	
</div>
<script>
	hljs.initHighlighting();
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>