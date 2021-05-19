<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	배너그룹관리 - 등록 수정 UI
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="./banner_proc" method="post">
			<input type="hidden" name="bmSeq" value="${vo.bmSeq }">
			<div class="tago-callout callout-warning">
				<h4 class="check_tit">체크사항</h4>
				<ul>
					<li>- 코드(영문)는 반드시 영문으로 입력 하고 변경이 불가합니다.</li>
					<li>- <b>배너형태</b>, <b>배너간격</b>, <b>줄바꿈 배너 수</b> 속성은 이미지를 배너로 출력할 때 사용하는 속성 입니다. </li>
					<li>- 배너간격은 배너와 배너 사이의 간격을 조절합니다.</li>
					<li>-  배너형태가 가로형인 경우 줄바꿈 배너 수만큼 가로로 배너가 나오고 줄바꿈이 됩니다. </li>
				</ul>
			</div>
			<div class="card">
				<div class="card-header">
					<h3 class="mb-0">배너그룹관리</h3>
				</div>
				<div class="card-body">
					<div class="row">
<c:set var="read" value="" />
<c:if test="${search.bseq > 0 }">
	<c:set var="read" value="readonly" />
</c:if>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">코드(영문) <span class="text-danger">*</span></label>
								<div class="col-lg-8">
									<input class="input form-control" name="masterCode" value="${vo.masterCode }" maxlength="" type="text" ${read } />
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">그룹이름 <span class="text-danger">*</span></label>
								<div class="col-lg-8">
									<input  class="input form-control" name="masterName" value="${vo.masterName }" maxlength="" type="text" />
								</div>
							</div>
						</div>
						
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">배너형태</label>
								<div class="col-lg-8">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="directionV" name="direction" class="custom-control-input" value="V">
										<label class="custom-control-label" for="directionV">세로형</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="directionH" name="direction" class="custom-control-input" value="H">
										<label class="custom-control-label" for="directionH">가로형</label>
									</div>
									<script>
										$(function() {
											checkRadio('direction', '${vo.direction}', 'V');
										});
									</script>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">배너간격</label>
								<div class="col-lg-8">
									<input  class="input onlyNumber form-control" name="margin" value="${vo.margin }" maxlength="" type="text" />
								</div>
							</div>
						</div>
						
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">사용여부</label>
								<div class="col-lg-8">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="useYnY" name="useYn" class="custom-control-input" value="Y">
										<label class="custom-control-label" for="useYnY">사용함</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="useYnN" name="useYn" class="custom-control-input" value="N">
										<label class="custom-control-label" for="useYnN">사용안함</label>
									</div>
									<script>
										$(function() {
											checkRadio('useYn', '${vo.useYn}', 'Y');
										});
									</script>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">줄바꿈 배너 수</label>
								<div class="col-lg-8">
									<select name="lfCount" class="form-control">
<c:forEach var="m" begin="1" end="9">							
									<option value="${m }"<c:if test="${vo.lfCount == m }">selected</c:if>>${m }</option>
</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<div class="container-fluid">
						<div class="row justify-content-center">
							<div class="col-6 col-sm-2">
								<a onclick="javascript:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>
							</div>
							<div class="col-6 col-sm-2">
								<a onclick="javascirpt:$.Nav('go', './banner_list');" class="btn btn-dark btn-block btn-lg">목록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script type="text/javascript">
	$(function() {
	});
	function doSubmit() {
		var bseq = '${search.bseq}';
		if (!checkPattern($('input[name=masterCode]').val(), 'ENG') && bseq == 0) {
			alert('코드는 영문으로 입력 해주세요.');
			$('input[name=masterCode]').focus();
			return;
		}
		if (isNull($('input[name=masterName]').val())) {
			alert('그룹이름을 입력 해주세요.');
			$('input[name=masterName]').focus();
			return;
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
