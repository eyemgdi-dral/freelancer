<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 팝업관리 글쓰기
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
		<div class="container-fluid mt--6">
			<div class="tago-callout callout-warning" style="z-index: 1;position: relative;">
				<h4 class="check_tit">체크사항</h4>
				<ul>
					<li>- 팝업형태에서 레이어팝업을 이용하여 창이아닌 레이어로 공지할 수 있습니다.</li>
					<li>- 팝업을 생성하였으나 뜨지않을 경우 세가지를 체크해보세요. 게시기간, 사용여부, 브라우저>도구>인터넷옵션>쿠키삭제</li>
				</ul>
			</div>
			<form id="form1" action="./popup_proc" method="post">
				<input type="hidden" name="popupSeq" value="${vo.popupSeq }" />
				<div class="card">				
					<div class="card-header">
						<h3 class="mb-0">팝업등록</h3>
					</div>
					<div class="card-body">
						<div class="container-fluid">
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">제목 <span class="text-red">*</span></label>
								<div class="col-lg-4">
									<input name="subject" class="form-control" value="${vo.subject }" maxlength="" type="text"/>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">게시기간 <span class="text-red">*</span></label>
								
								<div class="col-lg-4">
								
									<div class="input-daterange datepicker row align-items-center">
									    <div class="col">
								            <div class="input-group">
								                <div class="input-group-prepend">
								                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
								                </div>
								                <input name="startDt" class="form-control" placeholder="Start date" type="text" value="${vo.startDt }">
								            </div>
									    </div>
									    <div class="col">
								            <div class="input-group">
								                <div class="input-group-prepend">
								                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
								                </div>
								                <input name="endDt" class="form-control" placeholder="End date" type="text" value="${vo.endDt }">
								            </div>
									    </div>
									</div>
								</div>
								<label class="col-lg-2 col-form-label">팝업형태</label>
								
								<div class="col-lg-4">
									<div class="h-100 d-flex align-items-center">
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="popupType.W" name="popupType" value="W" class="custom-control-input">
											<label class="custom-control-label" for="popupType.W">일반팝업</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="popupType.L" name="popupType" value="L" class="custom-control-input">
											<label class="custom-control-label" for="popupType.L">레이어팝업</label>
										</div>
									</div>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">사용여부</label>
								<div class="col-lg-4">
									<div class="h-100 d-flex align-items-center">
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="useYnY" name="useYn" value="Y" class="custom-control-input">
											<label class="custom-control-label" for="useYnY">사용함</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="useYnN" name="useYn" value="N" class="custom-control-input">
											<label class="custom-control-label" for="useYnN">사용안함</label>
										</div>
									</div>
								</div>
							</div>
							
							<div class="form-group row" id="normalPopup"
							${vo.popupType eq 'L'?'style="display:none"':''}>
								<label class="col-lg-2 col-form-label">위치</label>
								<div class="col-6 col-lg-2">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">X :</span>
										</div>
										<input name="positionX" class="form-control onlyNumber ml5 w20" value="${!empty vo.positionX ? vo.positionX : 0 }" maxlength="" type="number"/>
									</div>
								</div>
								<div class="col-6 col-lg-2">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">Y :</span>
										</div>
										<input name="positionY" class="form-control onlyNumber ml5 w20" value="${!empty vo.positionY ? vo.positionY : 0 }" maxlength="" type="number" />
									</div>
								</div>
								<label class="col-lg-2 col-form-label">크기</label>
								<div class="col-6 col-lg-2">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">가로 :</span>
										</div>
										<input name="horizontalSize" class="form-control onlyNumber ml5 w20" value="${!empty vo.horizontalSize ? vo.horizontalSize : 0}" maxlength="" type="number" />
									</div>
								</div>
								<div class="col-6 col-lg-2">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">세로 :</span>
										</div>
										<input name="verticalSize" class="form-control onlyNumber ml5 w20" value="${!empty vo.verticalSize ? vo.verticalSize : 0}" maxlength="" type="number" />
									</div>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">링크주소</label>
								<div class="col-lg-4">
									<input name="linkUrl" class="form-control" value="${vo.linkUrl }" maxlength="" type="text" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">팝업내용</label>
								<div class="col-lg-10">
									<textarea name="body" id="body" class="w100" style="height:300px;"  class="editor">${vo.body }</textarea>
									<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
									<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
							
									<script type="text/javascript">
										var test =CKEDITOR.replace('body', {
											width : '100%'
											, height : '270px'
											, startupFocus : false,
											
										});
										test.on( 'instanceReady', function() {
										    console.log( test.filter.allowedContent );
										} );
										CKEDITOR.on('dialogDefinition', function(ev) {
											var dialogName = ev.data.name;
											var dialogDefinition = ev.data.definition;
											switch (dialogName) {
												case 'image': //Image Properties dialog
													//dialogDefinition.removeContents('info');
													dialogDefinition.removeContents('Link');
													dialogDefinition.removeContents('advanced');
													break;
											}
										});
									</script>
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
									<a onclick="javascirpt:history.back();" class="btn btn-dark btn-block btn-lg">목록</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script>
$(function() {
	checkRadio('popupType', '${vo.popupType}', 'L');
	checkRadio('useYn', '${vo.useYn}', 'Y');
});

$('input[name=popupType]').change(function(){
	$("#normalPopup").toggle($(this).val() == "W")
})
</script>

<script type="text/javascript">
	function doSubmit() {
		if ($('input[name=subject]').val() == '') {
			alert('제목을 입력해주세요.');
			$('input[name=subject]').focus();
			return;
		}
		
		if (!checkPattern($('input[name=startDt]').val(), 'DATE')){
			alert('날짜 형식을 확인해주세요.');
			$('input[name=startDt]').focus();
			return;
		}
		if (!checkPattern($('input[name=endDt]').val(), 'DATE')){
			alert('날짜 형식을 확인해주세요.');
			$('input[name=endDt]').focus();
			return;
		}
		
		var sBody = CKEDITOR.instances.body.getData();
		$('textarea[name=body]').val(sBody);
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>