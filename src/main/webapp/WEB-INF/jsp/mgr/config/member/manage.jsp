<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 게시판
--%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<style>
label {
margin-bottom:0 !important;
}
</style>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	
	<div class="container-fluid  mt--6">
		<div class="tago-callout callout-warning" style="z-index: 1;position: relative;">
			<h4 class="check_tit">체크사항 
				<span class="text-danger">(생성코드 삽입만으로 회원관련 모든 페이지를 완성할 수 있습니다. )</span>
			</h4>
			<ul class="ml10">
				<li>스킨위치 : /admin/member/skin.</li>
				<li>회원가입항목은 기본항목선택, 임의추가도 가능합니다.</li>
				<li>아이디/비번찾기 : 아이디, 비밀번호 찾기가 한페이지에 보여집니다.</li>
				<li>아이디찾기 : 아이디찾기만 페이지에 보여집니다. / 비밀번호찾기 : 비밀번호찾기만 페이지에 보여집니다.  </li>
			</ul>
		</div>
		
		<div class="card">
			<div class="card-header border-0">	 
				<div class="d-flex align-items-center">
					<h3 class="mr-2">페이지 </h3>       
					<small>- 페이지URL</small>				
				</div>
			</div>
			<div class="card-body">
				<form id="form1" action="./member_conf_proc" method="post">
					<input type="hidden" name="juminFlag" value="${vo.juminFlag }" />
					<input type="hidden" name="addrFlag" value="${vo.addrFlag }" />
					<input type="hidden" name="phoneFlag"  value="${vo.phoneFlag }" />
					<input type="hidden" name="mobileTelFlag"  value="${vo.mobileTelFlag }" />
					<input type="hidden" name="comPhoneFlag"  value="${vo.comPhoneFlag }" />
					<input type="hidden" name="faxFlag"  value="${vo.faxFlag }" />
					<input type="hidden" name="recommendFlag"  value="${vo.recommendFlag }" />
					<input type="hidden" name="emailReceiveFlag"  value="${vo.emailReceiveFlag }" />
					<input type="hidden" name="sMSReceiveFlag"  value="${vo.sMSReceiveFlag }" />
					<input type="hidden" name="nickNameFlag"  value="${vo.nickNameFlag }" />
					<input type="hidden" name="iconFlag"  value="${vo.iconFlag }" />
					<input type="hidden" name="photoFlag"  value="${vo.photoFlag }" />
					<input type="hidden" name="homepageFlag"  value="${vo.homepageFlag }" />
					<input type="hidden" name="birthdayFlag"  value="${vo.birthdayFlag }" />
					<input type="hidden" name="jobFlag"  value="${vo.jobFlag }" />
					<input type="hidden" name="interestFlag"  value="${vo.interestFlag }" />
					<input type="hidden" name="hobbyFlag"  value="${vo.hobbyFlag }" />
					<input type="hidden" name="educationFlag"  value="${vo.educationFlag }" />
					<input type="hidden" name="selfIntroFlag"  value="${vo.selfIntroFlag }" />
					<input type="hidden" name="marriageFlag"  value="${vo.marriageFlag }" />
					<input type="hidden" name="marriageDateFlag"  value="${vo.marriageDateFlag }" />
					<input type="hidden" name="incomeFlag"  value="${vo.incomeFlag }" />
					<input type="hidden" name="carFlag"  value="${vo.carFlag }" />
					<input type="hidden" name="etc1Flag"  value="${vo.etc1Flag }" />
					<input type="hidden" name="etc2Flag"  value="${vo.etc2Flag }" />
					<input type="hidden" name="etc3Flag"  value="${vo.etc3Flag }" />
					<input type="hidden" name="etc4Flag"  value="${vo.etc4Flag }" />
					<input type="hidden" name="etc5Flag"  value="${vo.etc5Flag }" />
					<input type="hidden" name="officeNameFlag"  value="${vo.officeNameFlag }" />
					<input type="hidden" name="officeNumFlag"  value="${vo.officeNumFlag }" />
					<input type="hidden" name="officeOwnerNameFlag"  value="${vo.officeOwnerNameFlag }" />
					<input type="hidden" name="officeOwnerTelFlag"  value="${vo.officeOwnerTelFlag }" />
					<input type="hidden" name="officeStaffNameFlag"  value="${vo.officeStaffNameFlag }" />
					<input type="hidden" name="officeStaffTelFlag"  value="${vo.officeStaffTelFlag }" />
					<input type="hidden" name="officeObNumFlag"  value="${vo.officeObNumFlag }" />
					<input type="hidden" name="officeBTypeFlag"  value="${vo.officeBTypeFlag }" />
					<input type="hidden" name="officeBcTypeFlag"  value="${vo.officeBcTypeFlag }" />
					<input type="hidden" name="officeTaxMailFlag"  value="${vo.officeTaxMailFlag }" />
					<div class="container-fluid">
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">회원가입</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="joinCode"  class="html">&lt;jsp:include page="/module/join" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#joinCode');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">로그인페이지</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="loginCode" class="html">&lt;jsp:include page="/module/login" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#loginCode');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">아이디/비번 찾기</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="findpwCode"  class="html">&lt;jsp:include page="/module/findidpw" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#findpwCode');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">아이디찾기</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="findidCode"  class="html">&lt;jsp:include page="/module/findid" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#findidCode');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">비밀번호찾기</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="findpassCode"  class="html">&lt;jsp:include page="/module/findpw" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#findpassCode');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">회원정보수정</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="memEditCode"  class="html">&lt;jsp:include page="/module/member_edit" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#memEditCode');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">회원탈퇴</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="withdrawalCode"  class="html">&lt;jsp:include page="/module/withdrawal" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#withdrawalCode');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">로그인박스</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="loginboxCode"  class="html">&lt;jsp:include page="/module/loginbox" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#loginboxCode');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						
						<hr>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">회원가입 페이지</label>
							<div class="col-sm-10">
								<div class="input-group">
							      	<div class="input-group-prepend">
							        	<span class="input-group-text">${HOST}</span>
							      	</div>
							      	<input type="text" class="form-control" name="memRegUrl" value="${vo.memRegUrl }">
	    						</div>
    						</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">회원정보 페이지</label>
							<div class="col-sm-10">
								<div class="input-group">
							      	<div class="input-group-prepend">
							        	<span class="input-group-text">${HOST}</span>
							      	</div>
							      	<input type="text" class="form-control" name="memInfoUrl" value="${vo.memInfoUrl }">
	    						</div>
    						</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">로그인 페이지</label>
							<div class="col-sm-10">
								<div class="input-group">
							      	<div class="input-group-prepend">
							        	<span class="input-group-text">${HOST}</span>
							      	</div>
							      	<input type="text" class="form-control" name="memLoginUrl" value="${vo.memLoginUrl }">
	    						</div>
    						</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">아이디/비번 페이지</label>
							<div class="col-sm-10">
								<div class="input-group">
							      	<div class="input-group-prepend">
							        	<span class="input-group-text">${HOST}</span>
							      	</div>
							      	<input type="text" class="form-control" name="memFindUrl" value="${vo.memFindUrl }">
	    						</div>
    						</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">로그아웃 후 이동페이지</label>
							<div class="col-sm-10">
								<div class="input-group">
							      	<div class="input-group-prepend">
							        	<span class="input-group-text">${HOST}</span>
							      	</div>
							      	<input type="text" class="form-control" name="memLogoutUrl" value="${vo.memLogoutUrl }">
	    						</div>
	    						<small class="form-text text-danger">인트로페이지를 사용하는 경우 로그아웃하면 다시 인트로로 가는것을 막기위해 이동페이지 주소를 설정합니다.</small>
    						</div>
						</div>
						
						<hr>
						<div class="d-flex align-items-center">
							<h3 class="mr-2">탑메뉴 </h3>       
							<small>- 이미지설정 (이미지를 설정하지 않으면 텍스트로 보여집니다.)</small>				
						</div>
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">로그인/로그아웃</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="toplogin" class="html">&lt;jsp:include page="/module/toplogin" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#toplogin');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						<div class="form-group row align-items-center">
							<label class="col-sm-2 col-form-label">회원가입/마이페이지</label>
							<div class="col-sm-8">
<pre class="mb-0"><code id="topjoin" class="html">&lt;jsp:include page="/module/topjoin" flush="true" /&gt;
</code></pre>
							</div>
							<div class="col-sm-2">
	                        	<a onclick="javascript:copyClipboard('#topjoin');" class="btn btn-sm btn-light">생성코드복사</a>						
							</div>
						</div>
						
						<hr>
						
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">로그인 이미지</label>
							<div class="col-sm-10">
								<div class="input-group">
							      	<div class="input-group-prepend">
							        	<span class="input-group-text">${HOST}</span>
							      	</div>
							      	<input type="text" class="form-control" name="memLoginImg" value="${vo.memLoginImg }">
	    						</div>
    						</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">로그아웃 이미지</label>
							<div class="col-sm-10">
								<div class="input-group">
							      	<div class="input-group-prepend">
							        	<span class="input-group-text">${HOST}</span>
							      	</div>
							      	<input type="text" class="form-control" name="memLogoutImg" value="${vo.memLogoutImg }">
	    						</div>
    						</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">회원가입 이미지</label>
							<div class="col-sm-10">
								<div class="input-group">
							      	<div class="input-group-prepend">
							        	<span class="input-group-text">${HOST}</span>
							      	</div>
							      	<input type="text" class="form-control" name="memRegImg" value="${vo.memRegImg }">
	    						</div>
    						</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">마이페이지 이미지</label>
							<div class="col-sm-10">
								<div class="input-group">
							      	<div class="input-group-prepend">
							        	<span class="input-group-text">${HOST}</span>
							      	</div>
							      	<input type="text" class="form-control" name="memMyPageImg" value="${vo.memMyPageImg }">
	    						</div>
    						</div>
						</div>
						
						<hr>
						<div class="d-flex align-items-center">
							<h3 class="mr-2">아이디/패스워드 찾기 </h3>       
							<small>- 입력정보 선택</small>				
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">확인방법</label>
							<div class="col-sm-10">
								<div class="h-100 d-flex align-items-center">
								<label class="custom-toggle">
								    <input type="checkbox" ${vo.memMailYn eq 'Y' ? 'checked' : ''} name="memMailYn" value="${vo.memMailYn}">
								    <span class="custom-toggle-slider rounded-circle" data-label-off="안사용" data-label-on="사용"></span>
								</label>
								</div>
								<script>
								$('input[name="memMailYn"]').on('change', function(a){(a.target.checked)? a.target.value = 'Y' : a.target.value = 'N'});
								</script>
    						</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">스킨</label>
							<div class="col-sm-10">
								<select name="memSkin" class="form-control form">
									<option value="memberBasic">memberBasic</option>
								</select>
								<small class="form-text"> 스킨위치 : /admin/member/skin </small>
    						</div>
						</div>
						<hr>
						<div class="table-responsive" id="checkWrap">
						<table class="table table-bordered text-center table-sm">
					
							<tbody>
								<tr>
									<th class="text-center table-info">아이디</th>
									<td class="text-left"><input type="hidden" name="iDFlag" value="1">사용함</td>
									<th class="text-center table-info">비밀번호</th>
									<td class="text-left"><input type="hidden" name="passwordFlag" value="1">사용함</td>
								</tr>
								<tr>
									<th class="text-center table-info">이름</th>
									<td class="text-left"><input type="hidden" name="nameFlag" value="1">사용함</td>
									<th class="text-center table-info">이메일</th>
									<td class="text-left"><input type="hidden" name="emailFlag" value="1">사용함</td>
								</tr>
								<tr>
									<th class="text-center table-info">주민번호</th>
									<td class="text-left">
										<label><input type="checkbox" id="juminFlag" value="1" class="input_type_check">사용함 &nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="juminFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">주소</th>
									<td class="text-left">
										<label><input type="checkbox" id="addrFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="addrFlag" value="2"> 필수항목</label>
									</td>
								</tr>
								<tr>
									<th class="text-center table-info">전화번호</th>
									<td class="text-left">
										<label><input type="checkbox" id="phoneFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="phoneFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">휴대폰</th>
									<td class="text-left">
										<label><input type="checkbox" id="mobileTelFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="mobileTelFlag" value="2"> 필수항목</label>
									</td>
								</tr>
			
								<tr>
									<th class="text-center table-info">회사전화</th>
									<td class="text-left">
										<label><input type="checkbox" class="input_type_check" id="comPhoneFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="comPhoneFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">추천인</th>
									<td class="text-left">
										<label><input type="checkbox" id="recommendFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="recommendFlag" value="2"> 필수항목</label>
									</td>
								</tr>
								<tr>
									<th class="text-center table-info">메일수신여부</th>
									<td class="text-left">
										<label><input type="checkbox" id="emailReceiveFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="emailReceiveFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">SMS 수신여부</th>
									<td class="text-left">
										<label><input type="checkbox" id="sMSReceiveFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="sMSReceiveFlag" value="2"> 필수항목</label>
									</td>
								</tr>
			
								<tr>
									<th class="text-center table-info">닉네임</th>
									<td class="text-left">
										<label><input type="checkbox" class="input_type_check" id="nickNameFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="nickNameFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">회원아이콘</th>
									<td class="text-left">
										<label><input type="checkbox" id="iconFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="iconFlag" value="2"> 필수항목</label>
									</td>
								</tr>
								<tr>
									<th class="text-center table-info">스팸글체크</th>
									<td class="text-left">
										<label><input type="checkbox" id="faxFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="faxFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">회원사진</th>
									<td class="text-left">
										<label><input type="checkbox" id="photoFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="photoFlag" value="2"> 필수항목</label>
									</td>
								</tr>
			
								<tr>
									<th class="text-center table-info">홈페이지</th>
									<td class="text-left">
										<label><input type="checkbox" id="homepageFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="homepageFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">생년월일</th>
									<td class="text-left">
										<label><input type="checkbox" id="birthdayFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="birthdayFlag" value="2"> 필수항목</label>
									</td>
								</tr>
								<tr>
									<th class="text-center table-info">직업</th>
									<td class="text-left">
										<label><input type="checkbox" id="jobFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="jobFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">관심분야</th>
									<td class="text-left">
										<label><input type="checkbox" id="interestFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="interestFlag" value="2"> 필수항목</label>
									</td>
								</tr>
			
								<tr>
									<th class="text-center table-info">취미</th>
									<td class="text-left">
										<label><input type="checkbox" id="hobbyFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="hobbyFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">학력</th>
									<td class="text-left">
										<label><input type="checkbox" id="educationFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="educationFlag" value="2"> 필수항목</label>
									</td>
								</tr>
								<tr>
									<th class="text-center table-info">자기소개</th>
									<td class="text-left">
										<label><input type="checkbox" id="selfIntroFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="selfIntroFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">결혼여부</th>
									<td class="text-left">
										<label><input type="checkbox" id="marriageFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="marriageFlag" value="2"> 필수항목</label>
									</td>
								</tr>
			
								<tr>
									<th class="text-center table-info">결혼기념일</th>
									<td class="text-left">
										<label><input type="checkbox" id="marriageDateFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="marriageDateFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">월평균소득</th>
									<td class="text-left">
										<label><input type="checkbox" id="incomeFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="incomeFlag" value="2"> 필수항목</label>
									</td>
								</tr>
								<tr>
									<th class="text-center table-info">자동차소유</th>
									<td class="text-left">
										<label><input type="checkbox" id="carFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="carFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">추가항목01</th>
									<td class="text-left">
										<label><input type="checkbox" id="etc1Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="etc1Flag" value="2"> 필수항목</label>
									</td>
								</tr>
			
								<tr>
									<th class="text-center table-info">추가항목02</th>
									<td class="text-left">
										<label><input type="checkbox" id="etc2Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="etc2Flag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">추가항목03</th>
									<td class="text-left">
										<label><input type="checkbox" id="etc3Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="etc3Flag" value="2"> 필수항목</label>
									</td>
								</tr>
			
								<tr>
									<th class="text-center table-info">추가항목04</th>
									<td class="text-left">
										<label><input type="checkbox" id="etc4Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="etc4Flag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">추가항목05</th>
									<td class="text-left">
										<label><input type="checkbox" id="etc5Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="etc5Flag" value="2"> 필수항목</label>
									</td>
		<!-- -------------------------------------------------------------------- -->	
								<tr>
									<th class="text-center table-info">업점업체명</th>
									<td class="text-left">
										<label><input type="checkbox" id="officeNameFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeNameFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">사업자번호 </th>
									<td class="text-left">
										<label><input type="checkbox" id="officeNumFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeNumFlag" value="2"> 필수항목</label>
									</td>
														
								</tr>
								<tr>
									<th class="text-center table-info">대표자명</th>
									<td class="text-left">
										<label><input type="checkbox" id="officeOwnerNameFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeOwnerNameFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">대표자연락처</th>
									<td class="text-left">
										<label><input type="checkbox" id="officeOwnerTelFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeOwnerTelFlag" value="2"> 필수항목</label>
									</td>
														
								</tr>
								<tr>
									<th class="text-center table-info">담당자 이름</th>
									<td class="text-left">
										<label><input type="checkbox" id="officeStaffNameFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeStaffNameFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">담당자 연락처</th>
									<td class="text-left">
										<label><input type="checkbox" id="officeStaffTelFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeStaffTelFlag" value="2"> 필수항목</label>
									</td>
														
								</tr>
								<tr>
									<th class="text-center table-info">통신판매번호</th>
									<td class="text-left">
										<label><input type="checkbox" id="officeObNumFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeObNumFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">업태</th>
									<td class="text-left">
										<label><input type="checkbox" id="officeBTypeFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeBTypeFlag" value="2"> 필수항목</label>
									</td>
														
								</tr>
								<tr>
									<th class="text-center table-info">업종</th>
									<td class="text-left">
										<label><input type="checkbox" id="officeBcTypeFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeBcTypeFlag" value="2"> 필수항목</label>
									</td>
									<th class="text-center table-info">계산서 이메일 </th>
									<td class="text-left">
										<label><input type="checkbox" id="officeTaxMailFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<label><input type="checkbox" id="officeTaxMailFlag" value="2"> 필수항목</label>
									</td>
														
								</tr>
							</tbody>
						</table>
						</div>
						
						<hr>
						<input name="etc1Desc" value="${vo.etc1Desc}" type="hidden">
						<input name="etc2Desc" value="${vo.etc2Desc}" type="hidden">
						<input name="etc3Desc" value="${vo.etc3Desc}" type="hidden">
						<input name="etc4Desc" value="${vo.etc4Desc}" type="hidden">
						<input name="etc5Desc" value="${vo.etc5Desc}" type="hidden">
						<div class="d-flex align-items-center">
							<small>- 추가항목명</small>				
						</div>
						<div class="table-responsive scrollbar-inner">
							<table class="table table-bordered">
								<colgroup>
									<col width="10%">
									<col width="12%">
									<col width="15%">
									<col width="15%">
									<col width="15">
									<col width="*">
								</colgroup>
								<thead class="table-info">
								<tr>
									<th>&nbsp;</th>
									<th>항목명</th>
									<th>항목속성</th>
									<th>항목사이즈</th>
									<th>세부항목개수</th>
									<th>세부항목</th>
								</tr>
								</thead>
								<tbody>
				
									<tr>
										<td class="first first_back">추가항목01</td>
										<td><input name="etc1Name" class="form-control form-control-sm" value="${vo.etc1Name }" maxlength="" type="text" style="width:200px;" /></td>
										<td>
											<select name="etc1Type" class="etcType form-control form-control-sm">
											<c:forEach var="type" items="${addItems}" varStatus="s">
											   <option value="${type.key}" ${type.key eq vo.etc1Type ? 'selected' : ''}>${type.value}</option>
											</c:forEach>
											</select>
										</td>
										<td><input name="etc1Size" class="form-control form-control-sm"  ${(vo.etc1Type eq 'text' or vo.etc1Type eq 'textarea') ? '' : 'disabled'} value="${vo.etc1Size }" type="number" style="width:200px;" /></td>
										<td>
											<select name="etc1Count" class="etcCount form-control form-control-sm mr10 " ${(vo.etc1Type eq 'checkbox' or vo.etc1Type eq 'radio' or vo.etc1Type eq 'select') ? '' : 'disabled'}>
												<c:forEach var="i" begin="1" end="20" varStatus="s">
													<option value="${i }" ${vo.etc1Count == i ? 'selected' : ''}>${i }</option>
												</c:forEach>							
											</select>
										</td>
										
										<td id="etcDesc1">
											<c:forTokens items="${vo.etc1Desc }" delims="," var="desc" varStatus="s" begin = "0">
										   		<input type="text" class="w20 form-control form-control-sm" value="${fn:trim(desc)}" />
											</c:forTokens>
										</td>
									</tr>
									<tr>
										<td class="first first_back">추가항목02</td>
										<td><input name="etc2Name" class="form-control form-control-sm" value="${vo.etc2Name }" maxlength="" type="text" style="width:200px;"></td>
										<td>
											<select name="etc2Type" class="etcType form-control form-control-sm">
												<c:forEach var="type" items="${addItems}">
												   <option value="${type.key}" ${type.key eq vo.etc2Type ? 'selected' : ''}>${type.value}</option>
												</c:forEach>
											</select>
										</td>
										<td><input name="etc2Size" class="form-control form-control-sm" ${(vo.etc2Type eq 'text' or vo.etc2Type eq 'textarea') ? '' : 'disabled'} value="${vo.etc2Size }" maxlength="" type="number" style="width:200px;" /></td>
										<td>
											<select name="etc2Count" class="etcCount form-control form-control-sm mr10" ${(vo.etc2Type eq 'checkbox' or vo.etc2Type eq 'radio' or vo.etc2Type eq 'select') ? '' : 'disabled'}>
												<c:forEach var="i" begin="1" end="20" varStatus="s">
													<option value="${i }" ${vo.etc2Count == i ? 'selected' : ''}>${i }</option>
												</c:forEach>							
											</select>
										</td>
										<td id="etcDesc2">
											<c:forTokens items="${vo.etc2Desc }" delims="," var="desc" varStatus="s" begin = "0">
										   		<input type="text" class="w20 form-control form-control-sm" value="${fn:trim(desc)}" />
											</c:forTokens>
										</td>
									</tr>
									<tr>
										<td class="first first_back">추가항목03</td>
										<td><input name="etc3Name" class="form-control form-control-sm" value="${vo.etc3Name }" maxlength="" type="text" style="width:200px;"></td>
										<td>
											<select name="etc3Type" class="etcType form-control form-control-sm">
												<c:forEach var="type" items="${addItems}">
												   <option value="${type.key}" ${type.key eq vo.etc3Type ? 'selected' : ''}>${type.value}</option>
												</c:forEach>
											</select>
										</td>
										<td><input name="etc3Size" class="form-control form-control-sm" ${(vo.etc3Type eq 'text' or vo.etc3Type eq 'textarea') ? '' : 'disabled'} value="${vo.etc3Size }" maxlength="" type="number" style="width:200px;"></td>
										<td>
											<select name="etc3Count" class="etcCount form-control form-control-sm mr10" ${(vo.etc3Type eq 'checkbox' or vo.etc3Type eq 'radio' or vo.etc3Type eq 'select') ? '' : 'disabled'}>
												<c:forEach var="i" begin="1" end="20" varStatus="s">
													<option value="${i }" ${vo.etc3Count == i ? 'selected' : ''}>${i }</option>
												</c:forEach>							
											</select>
										</td>
										<td id="etcDesc3">
											<c:forTokens items="${vo.etc3Desc }" delims="," var="desc" varStatus="s" begin = "0">
										   		<input type="text" class="w20 form-control form-control-sm" value="${fn:trim(desc)}" />
											</c:forTokens>
										</td>
									</tr>
									<tr>
										<td class="first first_back">추가항목04</td>
										<td><input name="etc4Name" class="form-control form-control-sm" value="${vo.etc4Name }" maxlength="" type="text" style="width:200px;"></td>
										<td>
											<select name="etc4Type" class="etcType form-control form-control-sm">
												<c:forEach var="type" items="${addItems}">
												   <option value="${type.key}" ${type.key eq vo.etc4Type ? 'selected' : ''}>${type.value}</option>
												</c:forEach>
											</select>
										</td>
										<td><input name="etc4Size" class="form-control form-control-sm" ${(vo.etc4Type eq 'text' or vo.etc4Type eq 'textarea') ? '' : 'disabled'} value="${vo.etc4Size }" maxlength="" type="number" style="width:200px;"></td>
										<td>
											<select name="etc4Count" class="etcCount form-control form-control-sm mr10" ${(vo.etc4Type eq 'checkbox' or vo.etc4Type eq 'radio' or vo.etc4Type eq 'select') ? '' : 'disabled'}>
												<c:forEach var="i" begin="1" end="20" varStatus="s">
												<option value="${i }" ${vo.etc4Count == i ? 'selected' : ''}>${i }</option>
												</c:forEach>							
											</select>
										</td>
										<td id="etcDesc4">
											<c:forTokens items="${vo.etc4Desc }" delims="," var="desc" varStatus="s" begin = "0">
										   		<input type="text" class="w20 form-control form-control-sm" value="${fn:trim(desc)}" />
											</c:forTokens>
										</td>
									</tr>
									<tr>
										<td class="first first_back">추가항목05</td>
										<td><input name="etc5Name" class="form-control form-control-sm" value="${vo.etc5Name }" maxlength="" type="text" style="width:200px;"></td>
										<td>
											<select name="etc5Type" class="etcType form-control form-control-sm">
												<c:forEach var="type" items="${addItems}">
												   <option value="${type.key}" ${type.key eq vo.etc5Type ? 'selected' : ''}>${type.value}</option>
												</c:forEach>
											</select>
										</td>
										<td><input name="etc5Size" class="form-control form-control-sm"  ${(vo.etc5Type eq 'text' or vo.etc5Type eq 'textarea') ? '' : 'disabled'} value="${vo.etc5Size }" maxlength="" type="number" style="width:200px;"></td>
										<td>
											<select name="etc5Count" class="etcCount form-control form-control-sm mr10"  ${(vo.etc5Type eq 'checkbox' or vo.etc5Type eq 'radio' or vo.etc5Type eq 'select') ? '' : 'disabled'}>
												<c:forEach var="i" begin="1" end="20" varStatus="s">
													<option value="${i }" ${vo.etc5Count == i ? 'selected' : ''}>${i }</option>
												</c:forEach>							
											</select>
										</td>
										<td id="etcDesc5">
											<c:forTokens items="${vo.etc5Desc }" delims="," var="desc" varStatus="s" begin = "0">
										   		<input type="text" class="w20 form-control form-control-sm" value="${fn:trim(desc)}" />
											</c:forTokens>
										</td>
									</tr>
						
								</tbody>
							</table>
							
							
						</div>
						
						<hr>
						<div class="d-flex align-items-center">
							<small>- 기타</small>				
						</div>
						<div class="table-responsive">
							<table class="table table-bordered">
								<colgroup>
									<col width="20%">
									<col width="">
								</colgroup>
								<tbody>
									<tr>
										<th class="text-center table-info">직업</th>
										<td class="text-left"><textarea class="form-control" name="jobType">${vo.jobType }</textarea></td>
									</tr>
									<tr>
										<th class="text-center table-info">학력</th>
										<td class="text-left"><textarea  class="form-control" name="educationType">${vo.educationType }</textarea></td>
									</tr>
									<tr>
										<th class="text-center table-info">월평균소득</th>
										<td class="text-left"><textarea rows="5" cols="" class="form-control" name="incomeType">${vo.incomeType }</textarea></td>
									</tr>
									<tr>
										<th class="text-center table-info">관심분야</th>
										<td class="text-left"><textarea rows="" cols="" class="form-control" name="interestType">${vo.interestType }</textarea></td>
										</tr>
								</tbody>
							</table>
						</div>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-6 col-sm-2">
							<input type="button" onclick="javascript:doSubmit();" value="확인" class="btn btn-primary btn-block btn-lg"> 
						</div>
						<div class="col-6 col-sm-2">
							<input type="button" onclick="javascript:$.Nav('self', null, null, true);" value="취소" class="btn btn-dark btn-block btn-lg">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		hljs.initHighlighting();
	</script>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

	
	<script type="text/javascript">
		function doSubmit() {
			if (!confirm('저장하시겠습니까?'))
				return;
			
			var desc = '';
			for(let i =1; i<= 5;i++){
				desc = '';
				$('#etcDesc'+ i +'').children().each(function(){
					desc += $(this).val() + ",";
				});
				if(desc.lastIndexOf(',') > -1)
					desc = desc.substring(0, desc.length-1);
				$('input[name=etc'+i+'Desc]').val(desc);
			}
			
			$('#form1').submit();
		}
		$(document).ready(function(){
			$('#checkWrap input[type="checkbox"]').each(function(){
				$(this).prop('checked', ($("input[name="+$(this).prop('id')+"]").val() === $(this).val()) ? true : false);
				if($("input[name="+$(this).prop('id')+"]").val() === '2')
					$(this).prop('checked', true);
			});
		});
		$('input[type="checkbox"]').on('change', function(e){ 
			//$(this).siblings().prop('checked', false);
			$('input[name='+ e.target.id +']').val((e.target.checked) ? e.target.value : 0);
			if($(this).parent().siblings().children(':checked').length == 1 && e.target.checked){
				$('input[name='+ e.target.id +']').val(2);
			}else if($(this).parent().siblings().children(':checked').length == 1 && !e.target.checked){
				$('input[name='+ e.target.id +']').val($(this).parent().siblings().children(':checked').val());
			}
		});
		
		$('.etcType').on('change', function(e){ 
			if($(this).val().indexOf('text') == -1 && $(this).val().indexOf('textarea') == -1)
				$(this).parent().next().children().val(0);
			
			$(this).parent().next().children().attr('disabled', (($(this).val().indexOf('text') > -1  || $(this).val().indexOf('textarea') > -1 ? false : true)));
			if($(this).val().indexOf('checkbox') == -1 && $(this).val().indexOf('select') == -1  && $(this).val().indexOf('radio') == -1){
				$(this).parent().next().next().children().val(1);
			}
				
			
			$(this).parent().next().next().children().attr('disabled', (($(this).val().indexOf('checkbox') > -1  || $(this).val().indexOf('select') > -1  || $(this).val().indexOf('radio') > -1) ? false : true));
			$(this).parent().next().next().next().children().attr('disabled', (($(this).val().indexOf('checkbox') > -1  || $(this).val().indexOf('select') > -1  || $(this).val().indexOf('radio') > -1) ? false : true));
		});
		
		$('.etcCount').on('change', function(){
			let count = $(this).val();
			$(this).parent().next().html('');
			for(let i = 0; i < count; i++){
				$('<input/>').attr({ type: 'text', id: 'desc', name: 'test', class: 'etcDesc form-control form-control-sm w20'}).appendTo($(this).parent().next());
			}
		})
	</script>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>