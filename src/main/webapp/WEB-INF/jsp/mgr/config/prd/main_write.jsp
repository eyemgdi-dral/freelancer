<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 메인게시물 - 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid  mt--6">
		<form id="form1" action="./main_proc.do" method="post">	
			<input type="hidden" name="rpseq" value="${search.rpseq }" />
			<div class="card">
				<div class="card-body">
					<div class=" row">
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">출력 구분<span class="text-danger">*</span> </label>
								<div class="col-lg-8">
									<tt:select name="listType" list="${type1 }" listKey="value" listValue="text" selected="${vo.listType }"/>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">노출 상품 수<span class="text-danger">*</span> </label>
								<div class="col-lg-8">
									<input type="text" name="prdCount" class="onlyNumber form-control" maxlength="2" value="${empty vo.prdCount ? 12 : vo.prdCount }" />
									<input type="hidden" name="lfCount" class="onlyNumber form-control" maxlength="2" value="${empty vo.lfCount ? 4 : vo.lfCount }" />
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">연결 페이지<span class="text-danger">*</span> </label>
								<div class="col-lg-8">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
											http://${pageContext.request.serverName }
											</div>
										</div>
										<input type="text" name="linkUrl" class="form-control" value="${vo.linkUrl }" />
									</div>
									 
									<div class="form-text text-danger">
										※ 연결 페이지를 빈 값으로 설정하면 링크가 적용되지 않습니다.
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">제목 글자 수<span class="text-danger">*</span> </label>
								<div class="col-lg-8">
									<input type="text" name="subjectCharCount" class="onlyNumber form-control" maxlength="2" value="${empty vo.subjectCharCount ? 10 : vo.subjectCharCount }" />
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group row">
								<label class="col-lg-4 col-form-label">간단설명 글자 수<span class="text-danger">*</span> </label>
								<div class="col-lg-8">
									<input type="text" name="summaryCharCount" class="onlyNumber form-control" maxlength="2" value="${empty vo.summaryCharCount ? 10 : vo.summaryCharCount }" />
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">코딩 시작<span class="text-danger">*</span> </label>
								<div class="col-lg-10">
									<textarea name="codingStart"  cols="120" rows="1" class="coding form-control">${vo.codingStart }</textarea>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">코딩 반복<span class="text-danger">*</span> </label>
								<div class="col-lg-10">
									<textarea name="codingLoop" cols="120" rows="10" class="coding form-control">${vo.codingLoop }</textarea>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">코딩 종료<span class="text-danger">*</span> </label>
								<div class="col-lg-10">
									<textarea name="codingEnd" cols="120" rows="1" class="coding form-control">${vo.codingEnd }</textarea>
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
								<a onclick="javascript:$.Nav('go', './main_manage.do', {rpseq: ''});" class="btn btn-dark btn-block btn-lg">취소</a>
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
	//코딩 샘플
	// 포토, 썸네일은 임시 - 수정 필요
	var _codingSamples = {
		'prd': {
			'start': '<ul class="m_solution">'
			, 'loop': '<li><p class="sb">\#{SUBJECT}</p><p class="sol_img text-center"><a href="\#{LINK}" class="thumbnail"><img src="\#{URL}" style="height: 121px;" alt="상품이미지"></a></p><p class="ex">\#{SUMMARY}</p><p class="price">\#{PRICE}(VAT 별도)</p></li>'
			, 'end': '</ul>'
		}
	};

	$(function() {
		var rpseq = $('input[name=rpseq]').val();

		//수정 상태일 경우 저장된 코딩 저장
		if (rpseq > 0) {
			_codingSamples.save = {
				'start': $('textarea[name=codingStart]').val().trim()
				,'loop': $('textarea[name=codingLoop]').val().trim()
				, 'end' : $('textarea[name=codingEnd]').val().trim()
			};
		} else {
			bindCodingSample('prd');
		}
	});
	
	function bindCodingSample(key) {
		$('textarea[name=codingStart]').val(_codingSamples[key].start);
		$('textarea[name=codingLoop]').val(_codingSamples[key].loop);
		$('textarea[name=codingEnd]').val(_codingSamples[key].end);
	}
		
	function doSubmit() {	

		if ($('input[name=subjectCharCount]').val().trim().length == 0) {
			alert('제목 글자 수를 입력해야 합니다.');
			return;
		}
		
		if ($('input[name=summaryCharCount]').val().trim().length == 0) {
			alert('간단설명 글자 수를 입력해야 합니다.');
			return;
		}
				
		if ($('input[name=prdCount]').val().trim().length == 0) {
			alert('노출 상품 수를 입력해야 합니다.');
			return;
		}
		
		if ($('textarea[name=codingStart]').val().trim().length == 0) {
			alert('코딩 시작 내용을 입력해야 합니다.');
			return;
		}
		
		if ($('textarea[name=codingLoop]').val().trim().length == 0) {
			alert('코딩 반복 내용을 입력해야 합니다.');
			return;
		}
		
		if ($('textarea[name=codingEnd]').val().trim().length == 0) {
			alert('코딩 종료 내용을 입력해야 합니다.');
			return;
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>