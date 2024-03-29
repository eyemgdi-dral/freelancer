<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 기본설정 - 페이지 접근권한
--%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	
	<div class="container-fluid  mt--6">
		<div class="card">
			<div class="card-header border-0 d-flex">	 
				<h3 class="mb-0">페이지 접근권한 생성코드</h3>       
				<button type="button" onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn-light btn-sm ml-auto">생성코드복사</button>
			</div>
			<div class="container-fluid">
<pre class="custom"><code id="codeSample" class="html">
&lt;jsp:include page="/module/check_auth" flush="true"&gt;
	&lt;jsp:param name="level" value="[레벨]" /&gt;
	&lt;jsp:param name="msg" value="[권한 부족 시 메시지]" /&gt;
	&lt;jsp:param name="ru" value="[돌아갈 페이지]" /&gt;
&lt;/jsp:include&gt;
</code></pre>
			</div>
		</div>
		
		<div class="tago-callout callout-warning">
			<h4 class="check_tit">체크사항</h4>
			<ul class="ml10">
				<li>권한을 부여하고자 하는 페이지의 상단(&lt;%@ include file="/WEB-INF/jsp/common/tags.jsp"%&gt; 다음 줄)에 코드를 삽입합니다.</li>
				<li>사용자 레벨 별 접근 권한 외에도 로그인 확인 기능으로도 사용할 수 있습니다.</li>
				<li>권한이 필요없을 경우 생성 코드 자체를 제거하기를 권장합니다.</li>
				<li>level : 사용자의 회원 등급입니다. 관리자는 항상 1입니다. (숫자가 작을 수록 권한이 높습니다.) 사용자의 등급이 level보다 크면 권한이 없는 것입니다.</li>
				<li>msg : 권한이 없을 경우 출력할 메시지입니다. (기본값 : "<s:message code="common.noAuth.default" />") </li>
				<li>ru : 권한이 없을 경우 되돌아갈 URL입니다. (기본값 : <s:message code="common.noAuth.redirect" />) </li>
			</ul>
		</div>
		
		
	</div>
	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>	
<script>
hljs.initHighlighting();
</script>
	
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>