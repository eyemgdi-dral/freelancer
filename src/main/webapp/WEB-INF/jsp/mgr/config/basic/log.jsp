<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	
	<div class="container-fluid  mt--6">
		<div class="card">
			<div class="card-header border-0 d-flex">	 
				<h3 class="mb-0">로그분석</h3>       
				<button type="button" onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn-light btn-sm ml-auto">생성코드복사</button>
				
			</div>
			<div class="container-fluid">
<pre class="custom mb10"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/connect" flush="true" /&gt;
</code></pre>
			<script>
				hljs.initHighlighting();
			</script>
			</div>
		</div>
		<div class="card">
			<div class="card-header border-0">	 
				<h3 class="mb-0">적용예제</h3>       
			</div>
			<div class="container-fluid">
				<div class="tago-callout">
					<p>코드가 &lt;head/&gt; tag 윗 부분 근처에 그리고 다른 script들이나 CSS tag 앞에 추가되어야 한다</p>
				</div>
				<div class="tago-callout callout-warning">
					<h4 class="check_tit">체크사항</h4>
					<ul>
						<li>홈페이지의 접속자를 분석할 수 있는 기능입니다.</li>
						<li>분실하기 쉬운 정보를 작성하여 추후 사이트 관리에 이용하는 부분입니다.</li>
						<li>위의 로그분석 코드를 웹사이트 첫페이지(index.htm, index.html, index.jsp)
							첫줄에 삽입합니다.</li>
						<li>분석내용은 접속통계 > 접속자분석,접속경로분석 에서 확인 가능합니다.</li>
						<li>프레임으로 나눈 사이트의 경우 프레임 페이지 상단에 삽입합니다.</li>
					</ul>
				</div>
			</div>
		</div>
		
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>