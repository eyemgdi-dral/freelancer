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
						<h3 class="mb-0">상품 리스트 생성 코드</h3>       
						<button type="button" onclick="javascript:copyClipboard('#codeSample');" class="btn btn-light btn-sm ml-auto">생성코드복사</button>
					</div>
					<div class="card-body">
<pre class="custom"><code id="codeSample" class="html">
&lt;jsp:include page="/module/prd" flush="true"&gt;&lt;/jsp:include&gt;
</code></pre>
					</div>
				</div>
				<div class="tago-callout callout-warning">
					<h4 class="check_tit">체크사항</h4>
					<ul class="ml10">
						<li>- 게시판을 출력하고자 하는 위치에 예제 코드와 같은 블럭을 추가합니다.</li>							</ul>
				</div>
			</div>
		<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
	</div>

<script>
hljs.initHighlighting();
</script>
	

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>