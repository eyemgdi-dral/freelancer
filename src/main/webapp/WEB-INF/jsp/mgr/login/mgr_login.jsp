<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<html>
<head>
	<script type="text/javascript" src="/common/js/rsa/jsbn.js"></script>
	<script type="text/javascript" src="/common/js/rsa/rsa.js"></script>
	<script type="text/javascript" src="/common/js/rsa/prng4.js"></script>
	<script type="text/javascript" src="/common/js/rsa/rng.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body class="login_bg bg-default g-sidenav-show g-sidenav-pinned">
	<div class="main-content">
		<!-- Header -->
		<div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
			<div class="container">
				<div class="header-body text-center mb-7">
					<div class="row justify-content-center">
						<div class="col-xl-5 col-lg-6 col-md-8 px-5">
							<h1 class="text-white">관리자 로그인</h1>
							<p class="text-lead text-white">
								사이트 관리자님 환영합니다.<br> 관리자 이용을 위해서는 아이디와 비밀번호를 입력해주세요.
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="separator separator-bottom separator-skew zindex-100">
				<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          			<polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        		</svg>
			</div>
		</div>
		<!-- Page content -->
		<div class="container mt--8 pb-5">
			<div class="row justify-content-center">
				<div class="col-lg-5 col-md-7">
					<div class="card bg-secondary border-0 mb-0">
						<div class="card-body px-lg-5 py-lg-5">
							<form role="form" name="loginForm" method="post">
							
								<input type="hidden" id="rsaPublicKeyModulus" name="rsaPublicKeyModulus" value="${publicKeyModulus }" />
								<input type="hidden" id="rsaPublicKeyExponent" name="rsaPublicKeyExponent" value="${publicKeyExponent }" />
							
								<div class="form-group mb-3">
									<div
										class="input-group input-group-merge input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text">
												<i class="ni ni-circle-08"></i>
											</span>
										</div>
										<input class="form-control" name="userId" id="userId" placeholder="아이디" type="text" onkeypress="if(event.keyCode==13)javascript:fnIdEnter();">
									</div>
								</div>
								<div class="form-group">
									<div
										class="input-group input-group-merge input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text">
												<i class="ni ni-lock-circle-open"></i>
											</span>
										</div>
										<input class="form-control" id="userPassword" name="userPassword"  placeholder="비밀번호" type="password" onkeypress="if(event.keyCode==13)javascript:loginSubmit();">
									</div>
								</div>

								<div class="text-center">
									<button type="button" onclick="javascript:loginSubmit();" class="btn btn-primary my-4">로그인</button>
								</div>
							</form>
							<form id="secureForm" name="secureForm" action="./request_secure_login.do" method="post" style="display:none;">
								<input type="hidden" name="secureId" id="secureId" />
						        <input type="hidden" name="securePwd" id="securePwd" />
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<script type="text/javascript">

function fnIdEnter(){
	
	if (!document.loginForm.userPassword.value)
		document.loginForm.userPassword.focus();
	else
		loginSubmit();
}


function loginSubmit(){
	if (document.loginForm.userId.value == "" ) {
		alert('아이디를 입력해주세요.');
		document.loginForm.userId.focus();
		return;
	}
	
	if (document.loginForm.userPassword.value == "") {
		alert('비밀번호를 입력해주세요.');
		document.loginForm.userPassword.focus();
		return;
	}
	
	try {
		const rsaPublicKeyModulus = document.loginForm.rsaPublicKeyModulus.value;
		const rsaPublicKeyExponent = document.loginForm.rsaPublicKeyExponent.value;
		const rsa = new RSAKey();
		rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
		const securedUsername = rsa.encrypt(document.loginForm.userId.value);
		const securedPassword = rsa.encrypt(document.loginForm.userPassword.value);
		document.secureForm.secureId.value = securedUsername;
		document.secureForm.securePwd.value = securedPassword;
    } 
    catch(err) {
        alert(err);
    }
	
	document.secureForm.submit();	
}
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>