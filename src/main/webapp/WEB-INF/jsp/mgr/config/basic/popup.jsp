<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 > 팝업관리
 --%>	
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	
	<div class="container-fluid  mt--6">
		<div class="card">
			<div class="card-header border-0 d-flex">	 
				<h3 class="mb-0">팝업관리 생성코드</h3>       
				<button type="button" onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn-light btn-sm ml-auto">생성코드복사</button>
			</div>
			<div class="container-fluid">
<pre class="custom mb10"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/popup" flush="true" /&gt;
</code></pre>
			
			</div>
		</div>
		<div class="card">
			<div class="card-header border-0">	 
				<h3 class="mb-0">적용예제</h3>       
			</div>
			<div class="container-fluid">
<pre class="custom mb10"><code class="html">
&lt;body&gt;
&lt;jsp:include page="/module/popup" flush="true" /&gt;
&lt;/body&gt;
</code></pre>
				<div class="tago-callout callout-warning">
					<h4 class="check_tit">체크사항</h4>
					<ul>
						<li>홈페이지의 팝업을 관리할 수 있는 기능입니다.</li>
						<li>위의 팝업생성 코드를 웹사이트 첫페이지(main.jsp)에 삽입합니다.</li>
						<li>팝업 내용은 기본설정 > 팝업관리에서 작성할 수 있습니다.</li>
					</ul>
				</div>
			</div>
		</div>
		
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>
	<script>
		hljs.initHighlighting();
	</script>
	
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>