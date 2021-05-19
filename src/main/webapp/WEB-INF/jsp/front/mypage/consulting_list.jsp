<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 회원가입페이지 --%>

<div id="all_wrp">
	<div id="wrapper">

		<%@ include file="/WEB-INF/include/lnb/join.jsp"%>

		<div id="container">
			<div id="title">
				<div class="fleft">
					<h2><strong>상담내역</strong></h2>
					<div class="tit_ex">솔루션의 선두주자! 타고플러스</div>
				</div>
				<div class="fright location"><img src="/images/ic_home.png" /> > 마이페이지 > 상담내역</div>
			</div><!--  end title -->
			<div id="content">
			
				<jsp:include page="/module/board.do" flush="true"><jsp:param name="bcode" value="consulting" /></jsp:include>				

			</div><!-- content -->
		</div><!-- container -->
	</div><!-- wrapper -->
</div><!-- all_wrp -->	

<script type="text/javascript">

</script>

	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>