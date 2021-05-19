<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%--
		Login Page
 --%>
 <jsp:include page="/module/menu" flush="true" />
<div class="header bg-gradient-primary py-7">
	<div class="container">
		<div class="header-body text-center mb-7">
			<div class="row justify-content-center">
				<div class="col-xl-5 col-lg-6 col-md-8 px-5">
					<h1 class="text-white">로그인</h1>
					<p class="text-lead text-white">솔루션의 선두주자! 타고플러스</p>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container mt--8 pb-5">
	<div class="row justify-content-center">
		<div class="col-lg-5 col-md-7">
			<div class="card bg-secondary border-0 mb-0">
				<div class="card-header bg-transparent pb-5">
					<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus }" />
					<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }" />
					<div class="text-muted text-center mt-2 mb-3">
						<small>소셜 로그인</small>
					</div>
					<div class="d-flex flex-column">
<c:if test="${set.facebookAPI eq '1'}">
						<a onclick="authFbLogin();"  class="btn btn-facebook btn-icon mb-3">
							<span class="btn-inner--icon">
								<img src="/images/share_login_facebook.png" alt="facebook">
							</span>
							<span class="btn-inner--text">Facebook</span>
						</a>
</c:if>
<c:if test="${set.googleAPI eq '1'}">
						<a onclick="javascript:void(0)" id="customBtn" class="btn btn-google-plus btn-icon mb-3">
							<span class="btn-inner--icon">
							<img src="/images/login_google.png" alt="google"></span>
							<span class="btn-inner--text">Google</span>
						</a>
</c:if>
<c:if test="${set.kakaoAPI eq '1'}">
						<a onclick="loginKakaoApi()" class="btn btn-kakao btn-icon mb-3">
							<span class="btn-inner--icon">
								<img src="/images/login_kakao.png" alt="kakao">
							</span>
							<span class="btn-inner--text">Kakao</span>
						</a>
</c:if>
<%-- <img onclick="authorizeNaver()" src="/images/share_naver.png" class="${set.naverAPI eq '1' ? '' : 'notuseshare'}" name="naverKey" alt="naver" > --%>
<%-- <c:if test="${set.naverAPI eq '1'}"><span id="naverIdLogin"></span></c:if> --%>
<c:if test="${set.naverAPI eq '1'}"><span id="naver_id_login"></span></c:if>
						
					</div>
				</div>
				<div class="card-body px-lg-5 py-lg-5">
					<form role="form">
						<div class="form-group mb-3">
							<div class="input-group input-group-merge input-group-alternative">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="ni ni-circle-08"></i></span>
								</div>
								<input type="text" name="userId" class="input_txt form-control" placeholder="아이디" value="">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-merge input-group-alternative">
								<div class="input-group-prepend">
									<span class="input-group-text">
									<i class="ni ni-lock-circle-open"></i></span>
								</div>
								<input type="password" name="userPwd" class="input_txt form-control" placeholder="비밀번호" value="">
							</div>
						</div>
						<div class="custom-control custom-control-alternative custom-checkbox">
							<input type="checkbox" name="id_save" class="custom-control-input" id="customCheckLogin" value="Y">
							<label class="custom-control-label" for=" customCheckLogin">
								<span class="text-muted">아이디 저장</span>
							</label>
						</div>
						<div class="text-center">
							<a href="javascript:doLogin();" class="btn btn-primary my-4">로그인</a>
						</div>
					</form>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-6 ">
					<a href="/member_find.jsp" class="text-light">
						<small>아이디/패스워드 찾기</small>
					</a>
				</div>
				<div class="col-6 text-right">
					<a href="/member_join.jsp" class="text-light"><small>회원가입</small></a>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="/common/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/common/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/common/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/common/js/rsa/rng.js"></script>
<style type="text/css">
	.sns-gl{
		margin-top: 10px;
		text-align:center;
		float: none !important;
	}
</style>

				
				<form id="secureForm" action="/request_secure_login.do" method="post" style="display:none;">
					<input type="hidden" name="secureId" id="secureId" />
				    <input type="hidden" name="securePwd" id="securePwd" />
				</form>
				<script type="text/javascript">
				function doLogin() {
					console.log($('input[name=userId]').val());
					console.log(trim($('input[name=userId]').val()));
					if (trim($('input[name=userId]').val()).length == 0) {
						alert('아이디를 입력해 주세요.');
						return;
					}
					
					if (trim($('input[name=userPwd]').val()).length == 0) {
						alert('비밀번호를 입력해 주세요.');
						return;
					}
					
					try {
						var rsaPublicKeyModulus = $('#rsaPublicKeyModulus').val();
						var rsaPublicKeyExponent = $('#rsaPublicKeyExponent').val();
						var rsa = new RSAKey();
						rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
						var securedUsername = rsa.encrypt($('input[name=userId]').val());
						var securedPassword = rsa.encrypt($('input[name=userPwd]').val());
						$('#secureId').val(securedUsername);
				        $('#securePwd').val(securedPassword);
				    } 
				    catch(err) {
				        alert(err);
				    }
					
					$('#secureForm').submit();	
				}
				</script>
				<c:if test="${set.facebookAPI eq '1'}">
				<!-- FACEBOOK LOGIN API IMPLEMENT START -->
				<script>
				  // This is called with the results from from FB.getLoginStatus().
				  function statusChangeCallback(response) {
				    console.log('statusChangeCallback');
				    console.log(response);
				    // The response object is returned with a status field that lets the
				    // app know the current login status of the person.
				    // Full docs on the response object can be found in the documentation
				    // for FB.getLoginStatus().
				    if (response.status === 'connected') {
				      // Logged into your app and Facebook.
				    	//$.Nav('go', './request_sns_login', {access_token : response.authResponse.accessToken });
				    } else {
				      // The person is not logged into your app or we are unable to tell.
				      /* document.getElementById('status').innerHTML = 'Please log ' +
				        'into this app.'; */
				    }
				  }
				
				  // This function is called when someone finishes with the Login
				  // Button.  See the onlogin handler attached to it in the sample
				  // code below.
				  function checkLoginState() {
				    FB.getLoginStatus(function(response) {
				      statusChangeCallback(response);
				    });
				  }
				
				  window.fbAsyncInit = function() {
				    FB.init({
				      appId      : '${set.facebookKey}',
				      cookie     : true,  // enable cookies to allow the server to access 
				                          // the session
				      xfbml      : true,  // parse social plugins on this page
				      version    : 'v2.8' // use graph api version 2.8
				    });
				
				    // Now that we've initialized the JavaScript SDK, we call 
				    // FB.getLoginStatus().  This function gets the state of the
				    // person visiting this page and can return one of three states to
				    // the callback you provide.  They can be:
				    //
				    // 1. Logged into your app ('connected')
				    // 2. Logged into Facebook, but not your app ('not_authorized')
				    // 3. Not logged into Facebook and can't tell if they are logged into
				    //    your app or not.
				    //
				    // These three cases are handled in the callback function.
				
				    /* FB.getLoginStatus(function(response) {
				      statusChangeCallback(response);
				    }); */
				
				  };
				  
				  function authFbLogin() {
					  FB.login(function(response) {
					  	   if (response.status === 'connected') {
					  		 $.Nav('go', './fb/request_sns_login', {access_token : response.authResponse.accessToken });
						   } else {
						     console.log('User cancelled login or did not fully authorize.');
						   }
					  });
				  }
				
				  // Load the SDK asynchronously
				  (function(d, s, id) {
				    var js, fjs = d.getElementsByTagName(s)[0];
				    if (d.getElementById(id)) return;
				    js = d.createElement(s); js.id = id;
				    js.src = "https://connect.facebook.net/en_US/sdk.js";
				    fjs.parentNode.insertBefore(js, fjs);
				  }(document, 'script', 'facebook-jssdk'));
				</script>
				<!-- FACEBOOK LOGIN API IMPLEMENT END -->
				</c:if>
				<c:if test="${set.googleAPI eq '1'}">
				<!-- GOOGLE LOGIN API IMPLEMENT START -->
				<script src="https://apis.google.com/js/api:client.js"
				></script>
				<script type="text/javascript" >
				const googleUser = {};
				$( document ).ready(function() {
					gapi.load('auth2', function(){
					    // Retrieve the singleton for the GoogleAuth library and set up the client.
					    auth2 = gapi.auth2.init({
					      client_id: '${set.googleKey}',
					      cookiepolicy: 'single_host_origin',
					      // Request scopes in addition to 'profile' and 'email'
					      //scope: 'additional_scope'
					    });
					    attachSignin(document.getElementById('customBtn'));
					  });
				});
				  
				
				function attachSignin(element) {
				  auth2.attachClickHandler(element, {},
				      function(googleUser) {
				        	
					  	const id_token = googleUser.getAuthResponse().id_token;
					  	 $.Nav('go', './google/request_sns_login', {access_token : id_token });
				      }, function(error) {
				        console.log(JSON.stringify(error, undefined, 2));
				      });
				}
				</script>
				<!-- GOOGLE LOGIN API IMPLEMENT END -->
				</c:if>
				<c:if test="${set.kakaoAPI eq '1'}">
				<!-- KAKAO LOGIN API IMPLEMENT START -->
				<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
				<script type='text/javascript'>
				//<![CDATA[
				  // Set JavaScript Key of current app.
				  Kakao.init('${set.kakaoKey}');
				  function loginKakaoApi(){
					  Kakao.Auth.login({
					  	success: function(authObj) {
					      // If login succeeds, call API.
					      $.Nav('go', './kakao/request_sns_login', {access_token : authObj.access_token });
					      /* Kakao.API.request({
					        url: '/v2/user/me',
					        success: function(res) {
					        	 $.Nav('go', './kakao/request_sns_login', {user_id : res.id, user_name : res.properties.nickname });
					        },
					        fail: function(error) {
					       	  console.log(JSON.stringify(error));
					        }
					      }); */
					    },
					    fail: function(err) {
					      	console.log(JSON.stringify(err));
					    }
					  })
				  }
				</script>
				<!-- KAKAO LOGIN API IMPLEMENT END -->
				</c:if>
				<c:if test="${set.naverAPI eq '1'}">
				<!-- NAVER LOGIN API IMPLEMENT START -->
				<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
				<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script> -->
				<script type="text/javascript">
					var naver_id_login = new naver_id_login("${set.naverKey}", document.location.origin + "/login");
					var state = naver_id_login.getUniqState();
					naver_id_login.setButton("green", 1,20);
					naver_id_login.setState(state);
					naver_id_login.init_naver_id_login();
				</script>
				<script type="text/javascript">
				if(naver_id_login.oauthParams.access_token){
				  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
				}
				// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
				function naverSignInCallback() {
				 	$.Nav('go', './naver/request_sns_login', {access_token: naver_id_login.oauthParams.access_token});
				}
				</script>
				<!-- NAVER LOGIN API IMPLEMENT END -->
				</c:if>
			

<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>