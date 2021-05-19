<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<form id="form1" action="./site_info_proc" method="post" enctype="multipart/form-data">
		<input type="hidden" name="siteSeq" value="${vo.siteSeq }">
		<div class="container-fluid mt--6">
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h3 class="mb-0">사이트 정보</h3>
						</div>
						<div class="card-body">
							<div class="form-group row">
								<div class="col-md-4 col-form-label">사이트 이름</div>
								<div class="col-md-8">
									<input type="text" name="siteName" class="form-control" value="${vo.siteName }" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-4 col-form-label">관리자 이메일</div>
								<div class="col-md-8">
									<input type="text" name="email" class="form-control" value="${vo.email }" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-4 col-form-label">대표전화</div>
								<div class="col-md-8">
									<input type="text" name="keyNumber" class="form-control" value="${vo.keyNumber }" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-4 col-form-label">관리자 전화번호</div>
								<div class="col-md-8">
									<input type="text" name="adminPhone" class="form-control onlyRealNumber" value="${vo.adminPhone }" />
								</div>
							</div>
						</div>
					</div>			
				</div>
				
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h3 class="mb-0">FTP정보</h3>
						</div>
						<div class="card-body">
							<div class="form-group row">
								<div class="col-md-4 col-form-label">접속주소 (ip, 도메인)</div>
								<div class="col-md-8">
									<input type="text" name="ftpAddr" class="form-control" value="${vo.ftpAddr }" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-4 col-form-label">아이디</div>
								<div class="col-md-8">
									<input type="text" name="ftpId" class="form-control" value="${vo.ftpId }" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-4 col-form-label">비밀번호</div>
								<div class="col-md-8">
									<input type="text" name="ftpPwd" class="form-control" value="${vo.ftpPwd }" />
								</div>
							</div>
						</div>
					</div>			
				</div>
				
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3 class="mb-0">푸터관리</h3>
						</div>
						<div class="card-body">
							<div class="form-group row">
								<div class="col-md-2 col-form-label">헤더 로고 파일</div>
								<div class="col-md-10">
									<div class="input-group">
										<input type="file" name="uploadFile" class="form-control">
										<div class="input-group-prepend">
	<c:if test="${!empty vo.logoImageHead}">
									<button type="button" class="btn btn-dark" onclick="javascript:viewFile('${UPLOAD_ROOT}${vo.logoImageHead }');">
										이미지보기
									</button>
	</c:if>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-2 col-form-label">푸터 로고 파일</div>
								<div class="col-md-10">
									<div class="input-group">
										<input type="file" name="uploadFile" class="form-control">
										<div class="input-group-prepend">
	<c:if test="${!empty vo.logoImageFoot}">
									<button type="button" class="btn btn-dark" onclick="javascript:viewFile('${UPLOAD_ROOT}${vo.logoImageFoot }');">
										이미지보기
									</button>
	</c:if>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-2 col-form-label">관리자 헤더 로고</div>
								<div class="col-md-10">
									<div class="input-group">
										<input type="file" name="uploadFile" class="form-control">
										<div class="input-group-prepend">
	<c:if test="${!empty vo.adminTitleUrl}">
									<button type="button" class="btn btn-dark" onclick="javascript:viewFile('${UPLOAD_ROOT}${vo.adminTitleUrl }');">
										이미지보기
									</button>
	</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3 class="mb-0">사업자 정보</h3>
						</div>
						<div class="card-body">
							<div class="form-group row">
								<div class="col-md-2 col-form-label">사업자등록번호</div>
								<div class="col-md-4">
									<input type="text" name="footBusinessNumber" class="form-control" value="${vo.footBusinessNumber }" />
								</div>
								<div class="col-md-2 col-form-label">인감</div>
								<div class="col-md-4">
									<!-- <input type="file" name="filename1" class="w100" /> -->
									<img src="/images/mgr/com_seal.jpg" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-2 col-form-label">상호</div>
								<div class="col-md-4">
									<input type="text" name="footBusinessName" class="form-control" value="${vo.footBusinessName }" />
								</div>
								<div class="col-md-2 col-form-label">대표자명</div>
								<div class="col-md-4">
									<input type="text" name="footRepName" class="form-control" value="${vo.footRepName }" />
								</div>
							</div>
							
							<div class="form-group row">
								<div class="col-md-2 col-form-label">우편번호</div>
								<div class="col-md-4">
									<div class="input-group">
										<input type="text" name="footZipcode" class="form-control daumAddr" value="${vo.footZipcode }" />
										<div class="input-group-prepend">
											<a class="btn btn-primary daumAddr">우편번호</a>										
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-2 col-form-label">주소</div>
								<div class="col-md-4">
									<input type="text" name="footAddr1" class="form-control daumAddr mb-2" value="${vo.footAddr1 }" />
									<input type="text" name="footAddr2" class="form-control daumAddr" value="${vo.footAddr2 }" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-2 col-form-label">업태</div>
								<div class="col-md-4">
									<input type="text" name="footCondition" class="form-control daumAddr" value="${vo.footCondition }" />
								</div>
								<div class="col-md-2 col-form-label">종목</div>
								<div class="col-md-4">
									<input type="text" name="footItem" class="form-control daumAddr" value="${vo.footItem }" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-2 col-form-label">전화</div>
								<div class="col-md-4">
									<input type="text" name="footPhone" class="form-control daumAddr" value="${vo.footPhone }" />
								</div>
								<div class="col-md-2 col-form-label">팩스</div>
								<div class="col-md-4">
									<input type="text" name="footFax" class="form-control daumAddr" value="${vo.footFax }" />
								</div>
							</div>
							
							<div class="tago-callout callout-warning">
								<h4 class="check_tit">체크사항</h4>
								<ul>
									<li>FTP정보, 사업자 정보는 사이트 운영에 영향을 미치지 않습니다. 메모용입니다.</li>
								</ul>
							</div>
							
							
						</div>
						
						<div class="card-footer">
							<div class="container-fluid">
								<div class="row justify-content-center">
									<div class="col-6 col-sm-2">
										<a onclick="javascript:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>
									</div>
							
								</div>
							</div>
						</div>
						
					</div>	
				</div>
			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>
	
<script src="//dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('.daumAddr').click(function() {
			openSearchAddress('footZipcode', 'footAddr1', 'footAddr2');
		});
	});
	
	function doSubmit() {
		
		var iLength = $('#form1 input').length;
		for (var i=0; i<iLength; i++) {
			var $input = $('#form1 input').eq(i);
			if ($input.attr('name') == 'uploadFile') {
				continue;
			}
		
			if ($input.val() == '') {
				alert('필수 사항을 입력해주세요.');
				$input.focus();
				return;
			}
		}
		
		var sEmail = $('input[name=email]').val();
		
		if (sEmail != '') {
			if (!checkPattern(sEmail,'EMAIL')) {
				alert('이메일 형식이 맞지 않습니다.');
				return;
			}
		}
		$('input[name=uploadFile]').on('change', function() {
			var sFileName = $('input[name=uploadFile]').val();
			sFileName = sFilename.slice(sFileName.indexOf('.')+1).toLowerCase();
			if (sFileName != 'jsp' && sFileName != 'gif') {
				return;
			}
			
		});
		
		if (!confirm('${MSG_COMM_SAVE}?'))
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>