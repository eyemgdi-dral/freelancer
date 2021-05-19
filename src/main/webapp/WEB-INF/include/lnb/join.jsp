<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web front LNB
		- 회원
--%>
 <div class="header d-flex align-items-center" style="max-height: 23.563rem;min-height: 200px; background-image: url(/common/assets/img/theme/profile-cover.jpg); background-size: cover; background-position: center top;">
		<span class="mask bg-gradient-default opacity-8"></span>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 text-center">
<c:if test="${empty search.id }">
					<h1 class="display-2 text-white">
					MEMBER
					</h1>
					<p class="text-white mt-0 mb-5">
					타고멤버
					</p>
</c:if>
<c:if test="${!empty search.id }">
					<h1 class="display-2 text-white">
					${vo.userName }
					</h1>
					<p class="text-white mt-0 mb-5">
						사용자 정보
					</p>
</c:if>
					<ol class="breadcrumb breadcrumb-links breadcrumb-dark justify-content-center">
						<li class="breadcrumb-item"><i class="fas fa-home"></i></li>
						<li class="breadcrumb-item">마이페이지</li>
					</ol>
				</div>
			</div>
		</div>
</div>
<div class="container py-4">
	<div class="row">
		<div class="col-lg-2 d-none d-lg-block">
			<div class="list-group" id="side-menu">
<c:if test="${empty search.id }">
				<a href="/member_login.jsp" class="list-group-item list-group-item-action" suffix="/member_login">
			  		로그인
			  	</a>
				<a href="/member_join.jsp" class="list-group-item list-group-item-action" suffix="/agree,/member_join">
			  		회원가입
			  	</a>
				<a href="/member_find.jsp" class="list-group-item list-group-item-action" suffix="/member_find">
			  		아이디/패스워드 찾기
			  	</a>
				<a href="/join/term.jsp" class="list-group-item list-group-item-action" suffix="/term">
			  		이용약관
			  	</a>
				<a href="/join/privacy_info.jsp" class="list-group-item list-group-item-action" suffix="/privacy_info">
			  		회원 정보 수정
			  	</a>
</c:if>
<c:if test="${!empty search.id }">
				<a href="/member_info.jsp" class="list-group-item list-group-item-action" suffix="/member_info">
			  		회원정보
			  	</a>
				<a href="/mypage/solution_buy_list.do" class="list-group-item list-group-item-action" suffix="/solution_buy_list">
			  		솔루션 구매 내역
			  	</a>
				<a href="/mypage/consulting_list.do" class="list-group-item list-group-item-action" suffix="/consulting_list">
			  		1:1상담 내역
			  	</a>
				<a href="/mypage/pwd_change.do" class="list-group-item list-group-item-action" suffix="/pwd_change">
			  		비밀번호 수정
			  	</a>
				<a href="/mypage/withdrawal.do" class="list-group-item list-group-item-action" suffix="/withdrawal">
			  		회원 탈퇴
			  	</a>
				<a href="/mypage/mem_point.do" class="list-group-item list-group-item-action" suffix="/mem_point">
			  		적립금 리스트
			  	</a>
</c:if>
			</div>
		</div>
	
<script type="text/javascript">
var sURL = '${pageContext.request.requestURL}';
$('#side-menu a').each(function () {
	var suffix = $(this).attr('suffix').split(',');
	for(var i in suffix) {
		if (sURL.indexOf(suffix[i]) > -1){
			$(this).addClass('active');
		}
	}
});
</script>		
	