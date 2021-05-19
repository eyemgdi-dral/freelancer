<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<style type="text/css">
	div.share-icon{float: left; width:auto; height:42px;}
	div.share-icon img.notuseshare{-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; filter:alpha(Opacity=20); opacity:0.2;pointer-events: none;}
	div.share-icon img{height:42px; width:42px;margin-right:5px;}
</style>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content" id="panel">
		<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
		<div class="container-fluid  mt--6">
			<div class="card">
				<div class="card-header d-flex">	        
					<h3 class="mb-0"> API관리</h3>
					<p class="ml-auto">네이버로그, 구글 애널리틱스, 본인인증, IPIN인증의 정보를 입력하면 자동 실행됩니다.</p>
				</div>
				<div class="card-body">
				<form id="form" action="./api_proc" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">지도</label>
						<div class="col-sm-10">
							<div class="form-inline">
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="mapType" id="navermap" class="custom-control-input" ${set.mapType =='naver' ? 'checked' : ''} value="naver">
							  		<label class="custom-control-label" for="navermap">네이버지도</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="mapType" id="googlemap" class="custom-control-input" ${set.mapType =='google' ? 'checked' : ''} value="google">
							  		<label class="custom-control-label" for="googlemap">구글지도</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="mapType" id="daummap" class="custom-control-input" ${set.mapType =='daum' ? 'checked' : ''} value="daum">
							  		<label class="custom-control-label" for="daummap">다음지도</label>
								</div>
								<input class="form-control form-control-sm" ${(set.mapType eq '0' || set.mapType eq null) ? 'hidden' : ''} type="text" id="mapType" name="mapKey" value="${set.mapKey}">
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">에디터</label>
						<div class="col-sm-10">
							<div class="form-inline">
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="editorType" id="CKEditor" class="custom-control-input" ${set.editorType =='CKEditor' ? 'checked' : ''} value="CKEditor">
							  		<label class="custom-control-label" for="CKEditor">CKEditor</label>
								</div>
								<input class="form-control  form-control-sm" ${(set.editorType eq '0' || set.editorType eq null) ? 'hidden' : ''} type="text" id="editorType" name="editorKey" value="${set.editorKey}">
							</div>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">네이버 로그분석 ID</label>
						<div class="col-lg-4 col-xl-3">
							<input type="text" class="form-control" name="naverlogID" maxlength="20" value="${set.naverlogID}">
						</div>
						<label class="col-lg-1 col-xl-2 col-form-label">전환값</label>
						<div class="col-lg-5 col-xl-3">
							<div class="input-group mb-2">
      							<div class="input-group-prepend">
        							<span class="input-group-text">회원가입</span>
     			 				</div>
      							<input type="text" class="form-control ">
    						</div>
							<div class="input-group mb-2">
      							<div class="input-group-prepend">
        							<span class="input-group-text">장바구니담기</span>
     			 				</div>
      							<input type="text" class="form-control">
    						</div>
							<div class="input-group mb-2">
      							<div class="input-group-prepend">
        							<span class="input-group-text">신청/예약</span>
     			 				</div>
      							<input type="text" class="form-control">
    						</div>
							<div class="input-group">
      							<div class="input-group-prepend">
        							<span class="input-group-text">게시글작성</span>
     			 				</div>
      							<input type="text" class="form-control">
    						</div>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">구글 애널리틱스 ID</label>
						<div class="col-lg-10 col-xl-8">
							<input type="text" class="form-control" name="googlelogId" maxlength="1000" value="${set.googlelogId}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">VIEW ID</label>
						<div class="col-lg-10 col-xl-3">
							<input type="text" class="form-control" name="googlelogValue" maxlength="1000" value="${set.googlelogValue}">
						</div>
						<label class="col-sm-2 col-form-label">UA</label>
						<div class="col-lg-10 col-xl-3">
							<input type="text" class="form-control" name="googleUa" maxlength="1000" value="${set.googleUa}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">본인인증 코드</label>
						<div class="col-lg-10 col-xl-3">
							<input type="text" class="form-control" name="phonecheckID" maxlength="10" value="${set.phonecheckID}">
						</div>
						<label class="col-sm-2 col-form-label"> 패스워드</label>
						<div class="col-lg-10 col-xl-3">
							<input type="text" class="form-control" name="phonecheckPW" maxlength="20" value="${set.phonecheckPW}">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">IPIN인증 코드</label>
						<div class="col-lg-10 col-xl-3">
							<input type="text" class="form-control" name="ipinID" maxlength="10" value="${set.ipinID}">
						</div>
						<label class="col-sm-2 col-form-label"> IPIN인증 패스워드</label>
						<div class="col-lg-10 col-xl-3">
							<input type="text" class="form-control" name="ipinPW" maxlength="20" value="${set.ipinPW}">
						</div>
					</div>
				
					<h2 class="">SNS공유</h2>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">페이스북</label>
						<div class="col-lg-10">
							<div class="form-inline">
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="facebookFlag" id="facebookuse" class="custom-control-input" ${set.facebookFlag =='Y' ? 'checked' : ''} value="Y">
							  		<label class="custom-control-label" for="facebookuse">사용</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="facebookFlag" id="facebooknotuse" class="custom-control-input" ${set.facebookFlag =='N' ? 'checked' : ''}  value="N">
							  		<label class="custom-control-label" for="facebooknotuse">사용안함</label>
								</div>
								<input type="text" class="form-control form-control-sm" id="facebookFlag" name="facebookKey" ${set.facebookFlag =='N' ? 'hidden' : ''} value="${set.facebookKey}">
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">트위터</label>
						<div class="col-lg-10">
							<div class="form-inline">
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="twitterFlag" id="twitteruse" class="custom-control-input" ${set.twitterFlag =='Y' ? 'checked' : ''} value="Y">
							  		<label class="custom-control-label" for="twitteruse">사용</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="twitterFlag" id="twitternotuse" class="custom-control-input" ${set.twitterFlag =='N' ? 'checked' : ''} value="N">
							  		<label class="custom-control-label" for="twitternotuse">사용안함</label>
								</div>
								<input type="text" class="form-control form-control-sm" id="twitterFlag" name="twitterKey" ${set.twitterFlag =='N' ? 'hidden' : ''} value="${set.twitterKey}">
							</div>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">카카오스토리</label>
						<div class="col-lg-10">
							<div class="form-inline">
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="kakaoFlag" id="kakaouse" class="custom-control-input" ${set.kakaoFlag =='Y' ? 'checked' : ''} value="Y">
							  		<label class="custom-control-label" for="kakaouse">사용</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="kakaoFlag" id="kakaonotuse" class="custom-control-input" ${set.kakaoFlag =='N' ? 'checked' : ''} value="N">
							  		<label class="custom-control-label" for="kakaonotuse">사용안함</label>
								</div>
								<input type="text" class="form-control form-control-sm" id="kakaoFlag" name="kakaoKey" ${set.kakaoFlag =='N' ? 'hidden' : ''} value="${set.kakaoKey}">
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">네이버블로그</label>
						<div class="col-lg-10">
							<div class="form-inline">
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="naverFlag" id="naveruse" class="custom-control-input" ${set.naverFlag =='Y' ? 'checked' : ''} value="Y">
							  		<label class="custom-control-label" for="naveruse">사용</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" name="naverFlag" id="navernotuse" class="custom-control-input" ${set.naverFlag =='N' ? 'checked' : ''} value="N">
							  		<label class="custom-control-label" for="navernotuse">사용안함</label>
								</div>
								<input type="text" class="form-control form-control-sm" id="naverFlag" name="naverKey" ${set.naverFlag =='N' ? 'hidden' : ''} value="${set.naverKey}">
							</div>
						</div>
					</div>
					</form>
					
				</div>
				
				<div class="card-footer">
					<div class="container-fluid">
						<div class="row justify-content-center">
							<div class="col-6 col-sm-2">
								<input type="button" onclick="javascript:Submit();" value="저장" class="btn btn-primary btn-block btn-lg"> 
							</div>
							<div class="col-6 col-sm-2">
								<input type="button" onclick="javascript:$.Nav('go', './api');" value="취소" class="btn btn-dark btn-block btn-lg">
							</div>
						</div>
					</div>
				</div>
				<c:set var="delete">
					<s:message code="common.delete.msg" />
				</c:set>
			</div>
		</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>



	

<script type="text/javascript">
	function Submit() {
		if (confirm("저장 하시겠습니까?")) {
			$('#form').submit();
		}

	}
	$('input[type="radio"]').on(
			'change',
			function(e) {
				$(this).siblings().prop('checked', false);
				$('input[name=' + e.target.id + ']').val(
						(e.target.checked) ? e.target.value : 0);
				$('label[id=' + e.target.name + ']').attr(
						"hidden",
						(e.target.id.substring(e.target.id.length - 6,
								e.target.id.length) == 'notuse') ? true
								: false);
				$('input[id=' + e.target.name + ']').attr(
						"hidden",
						(e.target.id.substring(e.target.id.length - 6,
								e.target.id.length) == 'notuse') ? true
								: false);
				$('img[name=' + e.target.name + ']').toggleClass(
						"notuseshare");
				$('input[id=' + e.target.name + ']').focus();
			});
</script>





<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>