<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 고객센터 - 공지사항 --%>

<div id="all_wrp">
	<div id="wrapper">
		<%@ include file="/WEB-INF/include/lnb/customer.jsp"%>
		<div id="container">
			<div id="title">
				<div class="fleft">
					<h2><strong>test</strong></h2>
					<div class="tit_ex">test</div>
				</div>
				<div class="fright location"><img src="/images/ic_home.png" /> > test > test</div>
			</div><!--  end title -->
			
			<div id="content">
			
				<jsp:include page="/module/board" flush="true">
					<jsp:param name="bcode" value="thumbnail" />
				</jsp:include>
				
			</div><!-- content -->
			
		</div><!-- container -->
	</div><!-- wrapper -->
</div><!-- all_wrp -->	

	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>