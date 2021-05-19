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
					<h2><strong>회원가입</strong></h2>
					<div class="tit_ex">솔루션의 선두주자! 타고플러스</div>
				</div>
				<div class="fright location"><img src="/images/ic_home.png" /> > 마이페이지 > 비밀번호 수정</div>
			</div><!--  end title -->
			<div id="content">
				<div class="pwd_top">
					<p class="mT7"><img src="/images/member_top_txt1.png" title="비밀번호를 변경해 주세요"></p>
					<p class="sub_top_ex">타고플러스는 회원님의 개인정보를 신중하게 보호하려 노력하고 있으며 회원님의 동의 없이는<br>
						기재하신 회원정보가 누출되지 않습니다.</p>
				</div>
				
				<form id="formPwd" method="post" action="/mypage/pwd_change_proc.do">
					<input type="hidden" name="mseq" value="${tagoplusSolution1_session_user.memberSeq}">
					<input type="hidden" name="id" value="${search.id }">
					<div class="stit mT30">비밀번호 수정</div>
					<table class="board_write">
						<colgroup>
							<col width="170px"><col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>기존 비밀번호 <span class="red bold">*</span></th>
								<td>
									<input type="password" class="input" style="width:200px;ime-mode:active;" name="beforePwd" maxlength="20">
								</td>
							</tr>
							<tr>
								<th>신규 비밀번호  <span class="red bold">*</span></th>
								<td>
									<input type="password" class="input" style="width:200px;" name="userPwd" maxlength="20">
									<span class="mL10" id="userPwdCheck"> 비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능힙니다.</span>
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인 <span class="red bold">*</span></th>
								<td>
									<input type="password" class="input" style="width:200px;" name="userPwd2" maxlength="20">
									<span class="mL10" id="userPwdCheck2"> 비밀번호를 다시 입력하세요.</span>
								</td>
							</tr>		
						</tbody>
					</table>
				</form>
				<div class="btn_area">
					<a href="javascript:doSubmit();" class="btn_m_nor">확인</a>
					<a href="" class="btn_m_gy mL5">취소</a>
				</div>
			</div><!-- content -->
		</div><!-- container -->
	</div><!-- wrapper -->
</div><!-- all_wrp -->	

<script type="text/javascript">

//비밀번호 체크
$('input[name=userPwd], input[name=userPwd2]').change(function () {
	//공백 제거
	var sUserPwd = trim($('input[name=userPwd]').val()); 
	$('input[name=userPwd]').val(trim($('input[name=userPwd]').val()));
	var sUserPwd2 = trim($('input[name=userPwd2]').val());
	$('input[name=userPwd2]').val(trim($('input[name=userPwd2]').val()));
	
	if (sUserPwd.length < 8) {
		$('#userPwdCheck').prop('class', 'mL10 red bold');
		$('#userPwdCheck').text('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능합니다.');

	} else {
		$('#userPwdCheck').prop('class', 'mL10 blue bold');
		$('#userPwdCheck').text('비밀번호가 입력되었습니다.');
	}

	if (sUserPwd != '' && sUserPwd2 != '') {
		if (sUserPwd != sUserPwd2) {
			$('#userPwdCheck2').prop('class', 'mL10 red bold');
			$('#userPwdCheck2').text('비밀번호가 다릅니다.');
		
		} else {
			$('#userPwdCheck2').prop('class', 'mL10 blue bold');
			$('#userPwdCheck2').text('비밀번호가 일치 합니다.');
		}
	}
});


function doSubmit () {
	if ($('#userPwdCheck').prop('class').indexOf('blue') < 0 || $('#userPwdCheck2').prop('class').indexOf('blue') < 0) {
		alert('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능힙니다.');
		return;
	}	

	if (!confirm('수정 하시겠습니까?')) {
		return;
	}
	
	$('#formPwd').submit();
}
</script>

	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>