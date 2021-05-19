<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	기본설정 > 관리자 설정 - 등록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<div class='card'>
			<div class='card-body'>
				<form id="form1" action="./admin_proc" method="post" enctype="multipart/form-data">
					<input type="hidden" name="phone" value="" />
					<input type="hidden" name="mobile" value="" />
					<input type="hidden" name="aid" value="${search.aid }" />
					<div class="container-fluid">
						<div class="form-group row">
							<label class="col-lg-2 col-form-label"><span class="text-red">*</span> 아이디</label>
							<div class="col-lg-4"   id="idchk">
								<div class="input-group">
<c:set var="ck" />
<c:if test="${!empty search.aid}"> 
	<c:set var="ck">readonly</c:set>		
</c:if>			
									<input type="text" name="adminId"  value="${vo.adminId }" ${ck } class="form-control" />
									<input type="hidden" name="checkedAd" />
<c:if test="${empty search.aid}"> 
									<div class="input-prepend">
										<a onclick="javascript:doCheck('user');" class="btn btn-dark">중복 체크</a>
									</div>								
</c:if>	
										
								</div>
							</div>
							<label class="col-lg-2 col-form-label"><span class="text-red">*</span> 비밀번호</label>
							<div class="col-lg-4">
								<input type="password" name="adminPwd" class="form-control" />
							</div>
						</div>		
						
						<div class="form-group row">
							<label class="col-lg-2 col-form-label"><span class="text-red">*</span> 이름</label>
							<div class="col-lg-4">
								<input type="text" name="adminName" class="form-control" value="${vo.adminName }" />
							</div>
							<label class="col-lg-2 col-form-label"><span class="text-red">*</span> 이메일</label>
							<div class="col-lg-4">
								<input type="text" name="email" class="form-control" value="${vo.email }" />
							</div>
						</div>		
							
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">관리자아이콘</label>
							<div class="col-lg-4">
								<div class="input-group">
									<input type="file" name="iconfile" class="form-control"/>
									<c:if test="${fn:contains(vo.icon, 'image/')}">
										<div class="input-group-prepend">
											<a href="${UPLOAD_ROOT }${vo.icon}" class="btn btn-dark">파일</a>
										</div>
									</c:if>
								</div>
							</div>
							<label class="col-lg-2 col-form-label">권한관리(좌)</label>
							<div class="col-lg-4">
								<tt:select list="${grade }" name="authGroupIdx" listKey="idX" listValue="authoTitle" indexKey="0" indexValue="= 메뉴 ="  selected="${vo.authGroupIdx }"/>
							</div>
						</div>		
						
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">전화번호</label>
							<div class="col-lg-10">
								<div class="form-inline">
									<input type="text" name="phoneA"  class="form-control inputPhone onlyNumber" value="${vo.phoneNo.no1 }"/>
									<span class="mx-2">-</span>
									<input type="text" name="phoneB" class="form-control inputPhone onlyNumber" value="${vo.phoneNo.no2 }" />
									<span class="mx-2">-</span>
									<input type="text" name="phoneC"  class="form-control inputPhone onlyNumber" value="${vo.phoneNo.no3 }" />							
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">휴대폰</label>
							<div class="col-lg-10">
								<div class="form-inline">
									<input type="text" name="mobileA"  class="form-control inputPhone onlyNumber" value="${vo.mobileNo.no1 }"/>
									<span class="mx-2">-</span>
									<input type="text" name="mobileB" class="form-control inputPhone onlyNumber" value="${vo.mobileNo.no2 }" />
									<span class="mx-2">-</span>
									<input type="text" name="mobileC"  class="form-control inputPhone onlyNumber" value="${vo.mobileNo.no3 }" />							
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">메모</label>
							<div class="col-lg-10">
								<textarea name="memo" class="form-control" rows="5">${vo.memo }</textarea>								
							</div>
						</div>
								
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-6 col-sm-2">
							<a onclick="javascript:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>							
						</div>
						<div class="col-6 col-sm-2">
							<a onclick="javascript:$.Nav('go', './admin_list');" class="btn btn-dark btn-block btn-lg">목록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script type="text/javascript">
	$(function() {
		
	});
	
	function doCheck(type) {
		checkUserId('#idchk', 'input[name=checkedAd]', type, $('input[name=adminId]').val().trim());
	}
	
	
	function doSubmit() {
		
		if (!isNull($('input[name=phoneA]').val())) {
			var $phone = $('input[name=phoneA]').val() + '-' + $('input[name=phoneB]').val() + '-' + $('input[name=phoneC]').val();
			$('input[name=phone]').val($phone);
		}
		if (!isNull($('input[name=mobileA]').val())) {
			var $mobile = $('input[name=mobileA]').val() + '-' + $('input[name=mobileB]').val() + '-' + $('input[name=mobileC]').val();
			$('input[name=mobile]').val($mobile);
		}
		
		if (isNull($('input[name=aid]').val())) {
			if ($('input[name=checkedAd]').val() != 'Y') {
				alert('아이디 중복검사를 해야 합니다.');
				return;
			}
		}
		
		if (isNull($('input[name=adminId]').val())) {
			alert('아이디를 확인 해주세요.');
			return;
		}
		if (isNull($('input[name=aid]').val()) && isNull($('input[name=adminPwd]').val())) {
			alert('비밀번호를 확인 해주세요.');
			return;
		}
		if (isNull($('input[name=adminName]').val())) {
			alert('이름을 확인 해주세요.');
			return;
		}
		if (isNull($('input[name=email]').val())) {
			alert('이메일을 확인 해주세요.');
			return;
		}
		
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>