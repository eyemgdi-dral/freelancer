<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	배너관리 - 등록 수정 UI
 --%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="../info_proc" method="post" enctype="multipart/form-data">
			<input type="hidden" name="biseq" value="${search.biseq }" />
			<input type="hidden" name="bseq" value="${bm.bmSeq }" />
			<input type="hidden" name="fseq" value="${file.fileSeq }" />
			<div class="tago-callout callout-warning">
				<h4 class="check_tit">체크사항</h4>
				<ul>
					<li>- 디자인방법에 따라 이미지 또는 배너내용을 출력합니다.</li>
					<li>- 배너 그룹에 속한 N개의 배너는 디자인방법을 통일 하지 않으면 출력에 문제가 생길 수 있습니다 </li>
					<li>- 링크 주소는 배너 이미지를 클릭시 이동 되는 링크입니다.</li>
					<li>- 배너내용에 HTML 작성시 에디터의 소스 버튼을 누르고 작업 하셔야 합니다.</li>
					<li>- 작성된 HTML의 화면은 적용되는 화면과 다소 다를 수 있습니다. </li>
				</ul>
			</div>
			<div class="card">
				<div class="card-header">
					<h3 class="mb-0">배너 : ${bm.masterName }</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">디자인방법</label>
								<div class="col-lg-8">
									<select name="bannerType" class="form-control">
										<option value="I" <c:if test="${vo.bannerType == 'I' }">selected</c:if>>이미지</option>
										<option value="B" <c:if test="${vo.bannerType == 'B' }">selected</c:if>>HTML</option>
									</select>
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
								<label class="col-lg-4 col-form-label">배너그룹<span class="text-danger">*</span></label>
								<div class="col-lg-8">
									<tt:select list="${masterList }"  class="w40" name="bmSeq" listKey="bmSeq" listValue="masterName"  selected="${bm.bmSeq }"/>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">우선순위</label>
								<div class="col-lg-8">
									<select name="ordering" class="form-control">
<c:set var="orderingSeleceted" value="" />							
<c:forEach var="i" begin="1" end="10" varStatus="s">
	<c:set var="orderingSeleceted" value="" />
	<c:if test="${vo.ordering eq i }">
		<c:set var="orderingSeleceted" value=" selected" />
	</c:if>
										<option value="${i }"${orderingSeleceted }>${i }</option>
</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">링크주소</label>
								<div class="col-lg-8">
									<div class="input-group">
										<input name="linkUrl" class="form-control" value="${vo.linkUrl }" maxlength="" type="text" /> 
										<div class="input-group-append">
											<div class="custom-control custom-checkbox input-group-text">
												<input type="checkbox" class="custom-control-input" id="link" name="link" value="_blank">
												<label class="custom-control-label" for="link">새창으로</label>
											</div>
										</div>
									</div>
									<input name="linkTarget" type="hidden" value="" />
									<script>
										$(function() {
											checkCheckbox('link', 'linkTarget', '${vo.linkTarget}', '_blank');
										});
									</script>
								</div>
							</div>
						</div>
						<div class="col-lg-6 bannerType" data-type="image" style="display:none">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">배너이미지</label>
								<div class="col-lg-8">
									<div class="input-group">
										<input name="imgFile" type="file" class="form-control"/>
										<div class="input-group-append">
<c:if test="${fn:contains(file.mimeType, 'image/')}">
											<a href="${UPLOAD_ROOT }${file.saveFilename}" class="btn btn-dark" target="_blank">${file.originalFilename } (${file.fileSize})</a>
											<label><input type="checkbox" class="ml20" name="deleteFlag" value="${file.saveFilename }" />이미지삭제</label>
</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 bannerType" data-type="content" style="display:none">
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">배너내용</label>
								<div class="col-lg-10">
									<textarea name="body" id="body" class="w100" style="height:300px;"  class="editor">${vo.body }</textarea>
									<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
									<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
									<script type="text/javascript">
										CKEDITOR.replace('body', {
											width : '100%'
											, height : '270px'
											, startupFocus : false
										});
									</script>
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
								<a onclick="javascirpt:$.Nav('go', '../list/${bm.bmSeq}');" class="btn btn-dark btn-block btn-lg">목록</a>
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
	
	$(function(){
		var value = $(':input[name=bannerType]').val();
		toggleType(value)
	})
	
	$(':input[name=bannerType]').change(function(){
		var value = $(this).val();
		toggleType(value)
	})

	function toggleType(value){
		$('.bannerType').hide()
		if(value == 'I'){
			$('.bannerType[data-type=image]').show()
		}else{
			$('.bannerType[data-type=content]').show()
		}
	}
	
	function doSubmit() {
		
		var sBody = CKEDITOR.instances.body.getData();
		$('textarea[name=body]').val(sBody);
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
	