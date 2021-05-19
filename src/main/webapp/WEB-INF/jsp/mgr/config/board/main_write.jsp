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
		<div class="card">
			<div class="container-fluid card-body">
				<form id="form1" action="./main_proc.do" method="post">	
					<input type="hidden" name="rbseq" value="${search.rbseq }" />
					<div class="form-group row">
						<label class="col-sm-2 col-form-label"><span class="text-danger">*</span>게시판코드</label>
						<div class="col-sm-4">
							<tt:select name="boardCode" list="${bmList }" listKey="boardCode" listValue="boardName" indexKey="" indexValue="= 게시판 선택 =" selected="${vo.boardCode }"/>
						</div>
						<label class="col-sm-2 col-form-label"><span class="text-danger">*</span>게시판 카테고리 </label>
						<div class="col-sm-4">
							<select name="bcSeq" class='form-control'>
								<option value="0">= 선택안함 =</option>
							</select>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label"><span class="text-danger">*</span>연결 페이지</label>
						<div class="col-sm-10">
							<div class="input-group">
						      	<div class="input-group-prepend">
						        	<span class="input-group-text" id="basic-addon2">http://${pageContext.request.serverName }</span>
						      	</div>
      							<tt:select name="linkUrl" class="w100" list="${menuList }" listKey="menuIdx" listValue="menuName" indexKey="0" indexValue="= 선택 =" selected="${vo.linkUrl }" />
    						</div>
					      	<small class="form-text text-danger">※ 연결 페이지를 빈 값으로 설정하면 링크가 적용되지 않습니다.</small>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label"><span class="text-danger">*</span>제목 글자 수</label>
						<div class="col-sm-4">
							<input type="text" name="subjectCharCount" class="onlyNumber form-control" maxlength="2" value="${vo.subjectCharCount }" />
						</div>
						<label class="col-sm-2 col-form-label"><span class="text-danger">*</span>노출 게시물 수 </label>
						<div class="col-sm-4">
							<input type="text" name="articleCount" class="onlyNumber form-control" maxlength="2" value="${vo.articleCount }" />
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label"><span class="text-danger">*</span>기본 예제 적용</label>
						<div class="col-sm-10">
							<div class="d-flex align-items-center h-100">
								<div class="custom-control custom-radio">
									<input type="radio" id="rdoExample1" name="rdoExample" class="custom-control-input" value="save" >
									<label class="custom-control-label" for="rdoExample1">원래대로</label>
								</div>
								<div class="custom-control custom-radio ml-4">
									<input type="radio" id="rdoExample2" name="rdoExample" class="custom-control-input " value="default">
									<label class="custom-control-label" for="rdoExample2">기본형</label>
								</div>
								<div class="custom-control custom-radio ml-4">
									<input type="radio" id="rdoExample3" name="rdoExample" class="custom-control-input" value="image">
									<label class="custom-control-label" for="rdoExample3">이미지</label>
								</div>
								<div class="custom-control custom-radio ml-4">
									<input type="radio" id="rdoExample4" name="rdoExample" class="custom-control-input" value="thumb">
									<label class="custom-control-label" for="rdoExample4">썸네일</label>
								</div>
							</div>
					
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label"><span class="text-danger ">*</span>코딩 시작</label>
						<div class="col-sm-10">
							<textarea name="codingStart" cols="120" rows="1" class="coding form-control">${vo.codingStart }</textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label"><span class="text-danger ">*</span>코딩 반복</label>
						<div class="col-sm-10">
							<textarea name="codingLoop" cols="120" rows="10" class="coding form-control">${vo.codingLoop }</textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label"><span class="text-danger ">*</span>코딩 종료</label>
						<div class="col-sm-10">
							<textarea name="codingEnd" cols="120" rows="1" class="coding form-control">${vo.codingEnd }</textarea>
						</div>
					</div>
				</form>
			</div>
			
			<div class="card-footer">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-12">
							<div class="tago-callout callout-warning">
								<h4 class="check_tit">체크사항</h4>
								<ul class="ml10">
									<li>- 메인게시물이 반복되는 부분은 [코딩 반복] 영역에 입력합니다.</li>
									<li>- CSS 스타일이 별도로 필요할 경우 [코딩 시작] 부분에 class로 적용합니다.</li>
									<li>- 주의 : 미리보기의 경우 CSS 차이로 스타일이 정상적으로 나오지 않을 수 있습니다.</li>
									<li>- \#{SUBJECT} : 제목, \#{DATE} : 날짜(SNS타입), \#{LINK} : 링크([연결 페이지]에 입력한 URL로 구성), \#{NEW} : 새 글 아이콘</li>
								</ul>
							</div>
						</div>
						<div class="col-6 col-sm-2">
							<a onclick="javascript:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>
						</div>
						<div class="col-6 col-sm-2">
							<a onclick="javascript:$.Nav('go', './main_manage.do', {rbseq: ''});" class="btn btn-dark btn-block btn-lg">취소</a>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<div class="col-lg-3"><div class="card">
		
			<img class="card-img-top" src="" alt="">
			<div class="card-body"><h5 class="card-title"></h5><p class="card-text"></p><div class="text-right text-muted"><small>2 hrs ago</small></div>
			
			</div></div></div>

	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<!--wrap_scon E-->
<script id="categoryTmpl" type="text/x-jquery-tmpl">
		<option value="0">= 선택안함 =</option>
{{each category}}
	{{if bcSeq != cv}}
		<option value="\${bcSeq}">\${cateName}</option>
	{{else}}
		<option value="\${bcSeq}" selected>\${cateName}</option>
	{{/if}}
{{/each}}
</script>

<script type="text/javascript">

	
	//코딩 샘플
	// 포토, 썸네일은 임시 - 수정 필요
	var _codingSamples = {
		'default': {
			'start': '<div><ul class="list-group">'
			, 'loop': '<li class="list-group-item d-flex justify-content-between align-items-center"><p><a href="\#{LINK}">\#{SUBJECT} \#{NEW}</a></p><p class="text-right text-muted">\#{DATE}</p></li>'
			, 'end': '</ul></div>'
		}
		, 'image': {
			'start': '<div class="row">'
			, 'loop': '<div class="col-lg-3"><div class="card">'
			+'<img class="card-img-top" src="\#{URL}" alt="이미지">'
			+'<div class="card-body"><h5 class="card-title"><a href="\#{LINK}">\#{SUBJECT} \#{NEW}</a></h5><div class="text-right text-muted"><small>\#{DATE}</small></div>'
			+'</div></div></div>'
			, 'end': '</div>'
		}
		, 'thumb': {
			'start': '<div class="row">'
			, 'loop': '<div class="col-lg-3"><div class="card bg-dark text-white border-0">'
				+'<img class="card-img" src="\#{URL}" alt="이미지">'
				+'<div class="card-img-overlay  bg-translucent-default  d-flex align-items-center">'
				+'<div><h5 class="h2 card-title text-white mb-2"><a href="\#{LINK}">\#{SUBJECT} \#{NEW}</a></h5><p class="card-text text-sm font-weight-bold">\#{DATE}</p></div>'
				+'</div></div></div>'
			, 'end': '</div>'
		}
	};

	$(function() {
		var rbseq = $('input[name=rbseq]').val();

		//수정 상태일 경우 저장된 코딩 저장
		if (rbseq > 0) {
			_codingSamples.save = {
				'start': $('textarea[name=codingStart]').val().trim()
				,'loop': $('textarea[name=codingLoop]').val().trim()
				, 'end' : $('textarea[name=codingEnd]').val().trim()
			};
			
			$('input[name=rdoExample]:eq(0)').prop('checked', true);
		}
		else {
			$('input[name=rdoExample]:eq(0)').prop('disabled', true);
			$('input[name=rdoExample]:eq(1)').prop('checked', true);
			bindCodingSample('default');
		}

		$('input[name=rdoExample]').change(function() {
			bindCodingSample($(this).val());
		});
		
		updateCategory();
		
		$('select[name=boardCode]').change(function() {
			updateCategory();
		});
		
		if ($('input[name=subjectCharCount]').val().length == 0) {
			$('input[name=subjectCharCount]').val(20);
		}
		
		if ($('input[name=articleCount]').val().length == 0) {
			$('input[name=articleCount]').val(5);
		}
	});
	
	function bindCodingSample(key) {
		$('textarea[name=codingStart]').val(_codingSamples[key].start);
		$('textarea[name=codingLoop]').val(_codingSamples[key].loop);
		$('textarea[name=codingEnd]').val(_codingSamples[key].end);
	}
	
	function updateCategory() {
		oLoader('#tdCategory'
			, '${URL_ADMIN_ROOT}/board/manage/ajax/update_category.do'
			, 'post'
			, {
				bcode: $('select[name=boardCode]').val()
			}
			, false
			, function(data) {
				if (data.result != null) {
					var currVal = '${vo.bcSeq}';
					$('select[name=bcSeq]').empty();
					$('#categoryTmpl').tmpl({category: data.result, cv: currVal}).appendTo('select[name=bcSeq]');
				}				
			}
		);
	}
	
	function doSubmit() {
		if ($('select[name=boardCode]').val() == '') {
			alert('게시판코드를 선택해야 합니다.');
			return;
		}
		
// 		if ($('input[name=linkUrl]').val().trim().length == 0) {
// 			alert('연결 페이지를 입력해야 합니다.');
// 			return;
// 		}

		if ($('input[name=subjectCharCount]').val().trim().length == 0) {
			alert('제목 글자 수를 입력해야 합니다.');
			return;
		}
		
		if ($('input[name=articleCount]').val().trim().length == 0) {
			alert('노출 게시물 수를 입력해야 합니다.');
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