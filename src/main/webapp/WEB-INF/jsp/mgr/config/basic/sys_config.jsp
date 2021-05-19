<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 기본설정 - 기본설정
--%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content" id="panel">
	
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	
	<div class="container-fluid  mt--6">
		<div class="card">
			<div class="card-header border-0">	        
				<h3 class="mb-0"> 최종 업데이트 일시 :
<c:if test="${empty tagoplusSolution1_session_site.modDate }">
				<fmt:formatDate value="${tagoplusSolution1_session_site.installDate }" pattern="${DATE_TIME_FORMAT }"/>
</c:if>
<c:if test="${!empty tagoplusSolution1_session_site.modDate }">
				<fmt:formatDate value="${tagoplusSolution1_session_site.modDate }" pattern="${DATE_TIME_FORMAT }"/>
</c:if>
				</h3>
			</div>
		
  		
  			<div class="container-fluid">
  				<div class="form-group row">
	    			<label for="inputEmail3" class="col-sm-2 col-form-label">라이선스 키</label>
		    		<div class="col-sm-10">
<c:if test="${!tagoplusSolution1_session_site.certified }">                        
	                	<div class="form-row">
							<div class="col-auto">
					      		<input type="text" class="form-control mb-2" name="certKey" placeholder="라이선스 키" aria-describedby="licenseHelpBlock">
					    	</div>    
					    	<div class="col-auto">
					      		<a onclick="javascript:doCert();" class="btn btn-primary mb-2">라이선스 인증</a>
					    	</div>     			
		      			</div>
		      			<small id="passwordHelpBlock" class="form-text text-muted">
		      				- 라이선스를 등록하지 않을 경우, 14일 이후부터 관리자 기능을 사용할 수 없습니다.<br>
							- 도메인이 변경될 경우 라이선스 키를 다시 발급받아야 합니다.<br>
							- 라이선스 구매 안내 : <s:eval expression="@globals['admin.keynumber']" />
						</small>
</c:if>
<c:if test="${tagoplusSolution1_session_site.certified }">
						<div class="align-items-center d-flex h-100">
								<p class=" mb-0">인증되었습니다.</p>
						</div>
							
</c:if>
		    		</div>
	 		 	</div>
  			</div>
	  		
	  		<form id="form1" action="./sys_config_proc" method="post" class="container-fluid">
	  			<h2 class="">사이트 기본정보</h2>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">관리자 로고</label>
					<div class="col-sm-10">
                       	<input type="file" name="adminTitleUrl" class="form-control" value="${tagoplusSolution1_session_site.adminTitleUrl }" /> 
				    </div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">관리자 푸터</label>
					<div class="col-sm-10">
                   		<input type="text" name="adminCopyright" class="form-control" value="${tagoplusSolution1_session_site.adminCopyright }" />
				    </div>
				</div>
<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser' }">		
				<hr>
				
				<h2 class="">슈퍼유저 계정</h2>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<div class="form-row" id="trSu">
							<div class="col-auto">
								<input type="text" name="suId" oid="${tagoplusSolution1_session_site.suId }" class="form-control" value="${tagoplusSolution1_session_site.suId }"/>
		                       	<input type="hidden" name="checkedSu" />
							</div>
							<div class="col-auto">
								<button type="button" onclick="javascript:doCheck('su');" class="btn btn-dark">중복검사</button>
							</div>
						</div>
				    </div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<div class="form-row">
							<div class="col-auto">
		                   		<input type="password" name="suPwd" class="form-control" />
							</div>
						</div>
				    </div>
				</div>
</c:if>
<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser' || tagoplusSolution1_session_admin.userType eq 'designer'}">					
				<hr>
				<h2 class="">디자이너 계정</h2>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<div class="form-row" id="trDs">
							<div class="col-auto">
								<input type="text" name="dsId" id="${tagoplusSolution1_session_site.dsId }" class="form-control" value="${tagoplusSolution1_session_site.dsId }"/>
		                       	<input type="hidden" name="checkedDs" />
							</div>
							<div class="col-auto">
								<button type="button" onclick="javascript:doCheck('ds');" class="btn btn-dark">중복검사</button>
							</div>
						</div>
				    </div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<div class="form-row">
							<div class="col-auto">
		                   		<input type="password" name="dsPwd" class="form-control" />
							</div>
						</div>
				    </div>
				</div>
</c:if>
				<hr>
				<h2 class="">포인트 사용 여부</h2>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">포인트 사용</label>
					<div class="col-sm-10">
						<div class="d-flex align-items-center h-100">
                   			<tt:radios name="pointYn" list="${pointYns }" class="ml20" listKey="value" listValue="text" checked="${tagoplusSolution1_session_site.pointYn }"/> 
				    	</div>
				    </div>
				</div>
				
	  		</form>
	  		
	  		<div class="card-footer py-4">
				<button type="button" onclick="javascript:doSubmit();" class="btn btn-primary">확인</button>
	  		</div>
  		</div>
	</div>	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>

</div>
	
	<script type="text/javascript">
		$(function() {
		});
		
		function doCert() {
			oLoader('#tblLicense'
				, '${URL_ADMIN_ROOT}/ajax/license/certify'
				, 'post'
				, {
					key: $('input[name=certKey]').val()
				}
				, false
				, function(data) {
					if (data.result) {
						alert('인증되었습니다.');
						var $th = $('<th>라이선스 키</th>');
						var $td = $('<td colspan="2">인증되었습니다.</td>');
						$('#trLicense').empty().append($th).append($td);
					}
					else {
						alert('인증되지 않았습니다.\n올바른 라이선스 키를 입력해 주세요.');
					}
				}
			);
		}
		
		function doCheck(idType) {
			if (idType == 'su')
				checkUserId('#trSu', 'input[name=checkedSu]', idType, $('input[name=suId]').val().trim());
			else if (idType == 'ds')
				checkUserId('#trDs', 'input[name=checkedDs]', idType, $('input[name=dsId]').val().trim());
		}
		
		function doSubmit() {
			var $suId = $('input[name=suId]');
			var $dsId = $('input[name=dsId]');
			
			if ($suId.val() != $suId.attr('oid') && $('input[name=checkedSu]').val() != 'Y') {
			 	alertSw('info','슈퍼유저 아이디 중복검사를 해야 합니다.');
				return;
			}
			
			if ($dsId.val() != $dsId.attr('oid') && $('input[name=checkedDs]').val() != 'Y') {
				alertSw('info','디자이너 아이디 중복검사를 해야 합니다.');
				return;
			}
			
			
			//Removed By Mongolian Team 18-11-28
			/* if ($('input[name=useMenu]:checked').length == 0) {
				alert('사용할 메뉴를 한 개 이상 선택해야 합니다.');
				return;
			} */
			Swal.fire({
	  			title: '저장하시겠습니까?',
	  			cancelButtonText: "취소",
				showCancelButton: true,
				confirmButtonText: "저장",
			}).then(function(result){
				if (result.value == true) {
	  				$('#form1').submit();
			  	}
			})
			
			
		}
	</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>