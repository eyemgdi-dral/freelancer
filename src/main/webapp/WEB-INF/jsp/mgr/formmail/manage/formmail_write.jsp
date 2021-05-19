<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일관리 - 폼메일생성 등록 수정 UI
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="./form_proc.do" method="post">
			<input type="hidden" name="fseq" value="${search.fseq }" />
			<div class="card">
				<div class="card-header">
					<h3 class="mb-0">폼메일생성</h3>
				</div>
				<div class="card-body">
					<div class="tago-callout callout-warning">
						<h4 class="check_tit">체크사항</h4>
						<ul>
							<li>- 이메일은 ${tagoplusSolution1_session_site.siteName } > 기본설정 > 사이트정보 > "사이트명"과 "관리자 이메일"에 입력된 값으로 발송됩니다.</li>
							<li>- 이메일은 여러명이 동시에 수신할 수 있습니다. 수신할 이메일을 콤마(,)로 구분하여 입력합니다.</li>
							<li>예) test@test.com,tago@tago.com / 010-1234-5678,010-2512-5232</li>
						</ul>
					</div>
					<div class="container-fluid">
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">폼메일명 <span class="text-danger">*</span></label>
							<div class="col-lg-4">
								<input  class="form-control" name="formName" value="${vo.formName }" type="text" />
							</div>
							<label class="col-lg-2 col-form-label">폼메일코드 <span class="text-danger">*</span></label>
							<div class="col-lg-4">
								<input  class="form-control" name="formCode" value="${vo.formCode }" type="text" />
							</div>
						</div>
						<!-- <div class="form-group row">
							<label class="col-lg-2 col-form-label">스킨 <span class="text-danger">*</span></label>
							<div class="col-lg-10">
								<select name="cssPrefix" class="form-control">
									<option value="1">1</option>
									<option value="2">2</option>
								</select>
							</div>
						</div> -->
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">약관설정</label>
							<div class="col-lg-10">
								<div class="custom-control custom-checkbox mb-3">
									<input type="checkbox" class="custom-control-input" id="terms" name="terms" value="Y">
									<label class="custom-control-label" for="terms">사용함</label>
								</div>
								<input name="termsYn" type="hidden" value="" />
								<script>
									$(function() {
										checkCheckbox('terms', 'termsYn', '${vo.termsYn}', 'N');
									});
								</script>
								<textarea id="terms" name="termsBody" rows="10" class="form-control">${vo.termsBody }</textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">수신설정</label>
							<div class="col-lg-10">
								<div class="custom-control custom-checkbox mb-3" >
									<input type="checkbox" class="custom-control-input" id="boardReceive" name="boardReceive" checked disabled  value="Y">
									<label class="custom-control-label" for="boardReceive" data-toggle="tooltip" data-placement="top" title="게시판 수신은 필수입니다.">게시판수신</label>
								</div>
								<div class="custom-control custom-checkbox mb-3">
									<input type="checkbox" class="custom-control-input" id="emailRe" name="emailRe" value="Y">
									<label class="custom-control-label" for="emailRe">email 수신</label>
								</div>
								<input type="text" class="form-control" name="emailReceive" value="${vo.emailReceive }" />
								<input name="boardReceiveYn" type="hidden" value="" />
								<input name="emailReceiveYn" type="hidden" value="" />	
								
								<script>
									$(function() {
										checkCheckbox('boardReceive', 'boardReceiveYn', '${vo.boardReceiveYn}', 'Y');
										checkCheckbox('emailRe', 'emailReceiveYn', '${vo.emailReceiveYn}', 'N');
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
								<a onclick="javascirpt:$.Nav('go', './formmail_list.do');" class="btn btn-dark btn-block btn-lg">목록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		
		<div class="card">
			<div class="card-header">
				<a href="javascript:doAddDetail(${search.fseq}, 0);" class="btn btn-primary">항목추가</a>
				<a href="javascript:updateFormInfo();" class="btn btn-outline-primary">새로고침</a>
			</div>
			<div class="card-body">
				<ul class="list-group list-group-flush list" id="info">
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>



	<!--wrap_scon S-->
<div id="wrap_scon">

	
		<div class="scon_title">
			<h2>폼메일 관리</h2>
			<p>홈 &gt; 폼메일 관리 &gt; 폼메일 생성</p>
		</div>
		<div class="scon">
			
			<span class="fr mb10">
					
			</span>
			<table class="board_st1">
				<colgroup>
						<col width="20%" />
						<col width="*" />
						<col width="10%" />
						<col width="10%" />
						<col width="20%" />
					</colgroup>
					<thead>
					<tr>
						<th>항목명</th>
						<th>미리보기</th>
						<th>필수여부</th>
						<th>순서</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody >
				</tbody>
			</table>
		</div>
	</div>
	<!--wrap_scon E-->


<script id="infoTmpl" type="text/x-jquery-tmpl">
{{each info}}
	<li class="list-group-item px-0">
		<div class="row align-items-center">
			<div class="col-sm-2 col order-0">
				<input type="hidden" class="order" value="\${formInfoSeq}" />
				<a class="btn btn-icon btn-sm btn-outline-primary" href="javascript:changeState(\${$index}, 'up');">
					<span class="btn-inner--icon"><i class="ni ni-bold-up"></i></span>
            	</a>
				<a class="btn btn-icon btn-sm btn-outline-primary" href="javascript:changeState(\${$index}, 'up');">
					<span class="btn-inner--icon"><i class="ni ni-bold-down"></i></span>
            	</a>
			</div>
			<div class="col-sm-2 order-3 order-sm-1 my-2 my-sm-0">
{{if saveFile != null}}
				<a href="#" class="avatar rounded-circle">
                	<img alt="Image placeholder" src=${UPLOAD_ROOT }\${saveFile}>
                </a>
{{else}}
				\${formInfoName }
	{{if requiredYn == "Y"}}
				<span class="text-danger">*</span>
	{{/if}}
{{/if}}
			</div>


			<div class="col order-4 order-sm-2 ">
	{{if property == "select" }}
				<select class="form-control form-control-sm">
					<option>--</option>
		{{each detailNameArray}}
					<option>\${$value}</option>
		{{/each}}
				</select>
	{{else property == "name" }}
				<input type="text" size="\${size }"/ class="form-control form-control-sm">
	{{else property == "phone" }}
				<div class="input-group">
					<input type="text" size="\${size }" class="form-control form-control-sm"/>
					<input type="text" size="\${size }" class="form-control form-control-sm"/>
					<input type="text" size="\${size }" class="form-control form-control-sm"/>
				</div>
	{{else property == "email" }}
				<div class="input-group input-group-sm">
					<input type="text" size="\${size }" class="form-control form-control-sm"/>
					<div class="input-group-append">
						<div class="input-group-text">@</div>
					</div>
					<input type="text" size="\${size }" class="form-control form-control-sm"/>
				</div>
				  
	{{else property == "address" }}
				<div class="input-group">
					<input type="text" class="form-control form-control-sm" name="zipCode" readonly onclick="javascript:openSearchAddress('zipCode', 'addr1', 'addr2');"/>
					<div class="input-group-append">
						<a onclick="javascript:openSearchAddress('zipCode', 'addr1', 'addr2');" class="btn btn-sm btn-dark">주소찾기</a>
					</div>
				</div>
				<input type="text" class="form-control form-control-sm" name="addr1" readonly onclick="javascript:openSearchAddress('zipCode', 'addr1', 'addr2');" />
				<input type="text" class="form-control form-control-sm" name="addr2" />
	{{/if}}
	{{each detailNameArray}}
		{{if property == "text"}}
				<div class="input-group input-group-sm">
					<input type="text" size="\${size }" class="form-control form-control-sm"/>
					<div class="input-group-append">
						<span class="input-group-text">\${$value}</span>
					</div>
				</div>
				
		{{else property == "radio"}}
				<input type="radio" name="radio" size="\${size }"/><span>\${$value}</span>
		{{else property == "checkbox"}}
				<input type="checkbox" size="\${size }"/><span>\${$value}</span>
		{{else property == "textarea"}}
				<textarea cols="\${size }" class="form-control form-control-sm"></textarea><span>\${$value}</span>
		{{else property == "file"}}
				<input type="file" class="form-control form-control-sm"/>
		{{else property == "pdate"}}
				<input type="text" class="form-control form-control-sm datepicker" size="\${size}" /><span>\${$value}</span>
		{{/if}}
	{{/each}}
			</div>


	{{if requiredYn == "Y"}}
			<div class="col-sm-1 col-2 order-1 order-sm-3">
				<span class="badge badge-primary badge-pill">필수</span>
			</div>
	{{/if}}
			<div class="col-auto order-2 order-sm-4">
				<a onclick="javascript:doAddDetail(\${formSeq}, \${formInfoSeq });" class="btn btn-sm btn-primary">수정</a> 
				<a onclick="javascript:changeState('', '', \${formInfoSeq }, 'd')" class="btn btn-sm btn-danger">삭제</a>
			</div>
{{/each}}
</script>

<script id="emptyTmpl" type="text/x-jquery-tmpl">
	<li class="list-group-item px-0">
		<s:message code="common.noData" />
	</li>
</script>

<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	$(function() {
		updateFormInfo();
		$('#terms').val($('#terms').val().replace(/<br>/gi, '\n'));
		
	});
	
	function doAddDetail(fseq, fiseq) {
		if (fseq <= 0) {
			alert('폼메일생성을 먼저 해주세요.');
			return;
		}
		openPop('?fseq=' + fseq + '&fiseq=' +fiseq , 'formmailInfo');
	}
	
	function updateFormInfo() {
		$fseq = $('input[name=fseq]').val();
		
		oLoader(
			$('#info'),
			'./getFormInfo.do',
			 'post',
			{fseq:$fseq},
			 false,
			 function(data) {
				$('#info').empty();
				if (data.info.length == 0) {
					$('#emptyTmpl').tmpl({info:data.info}).appendTo($('#info'));
				} else {
					
					$('#infoTmpl').tmpl({info:data.info}).appendTo($('#info'));
					$('.datepicker').datepicker();
			}
		});
		
	}
	
	function changeState(index, type, seq, status) {
		var preSeq = 0;
		var nextSeq = 0;
		
		if (status == 'd') {
			var sMsg = '${delete}';
			if (!confirm(sMsg))
				return;
		} else {
			$('.order').each(function(idx, el){
				if (index == idx)
					preSeq = $(this).val();
				
				if (type == 'up') {
					if ((index - 1) == idx)
						nextSeq = $(this).val();
				} else if (type == 'down') {
					if ((index + 1) == idx) 
						nextSeq = $(this).val(); 
				}
			});
		}
		$.ajax({
			url: './changeState.do',
			//async: false,
			type: 'post',
			dataType: 'json',
			data: {
				preSeq:preSeq,
				nextSeq:nextSeq,
				fiseq:seq,
				status:status
			}, 
			success: function (data) {
				//console.log(data);
				alert(data.result + '되었습니다.');
				updateFormInfo();
			}, 
			error: function (data) {
				alert("error ajax :\n" + data.responseText);
			}
		});
	}
	
	function doSubmit() {
		if (isNull($('input[name=formName]').val())) {
			alert('폼메일명을 입력 해주세요.');
			$('input[name=formName]').focus();
			return;
		} 
	
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
	
	
/* 	
	function updateOrdering(index, type) {
		//console.log(type);
		var preSeq = 0;
		var nextSeq = 0;
		
		$('.order').each(function(idx, el){
			if (index == idx)
				preSeq = $(this).val();
			
			if (type == 'up') {
				if ((index - 1) == idx)
					nextSeq = $(this).val();
			} else if (type == 'down') {
				if ((index + 1) == idx) 
					nextSeq = $(this).val(); 
			}
		});
		//console.log('1 : ' + preSeq);
		//console.log('2 : ' + nextSeq);
		$.ajax({
			url: './UpdateOrdering',
			//async: false,
			type: 'post',
			dataType: 'json',
			data: {
				preSeq:preSeq,
				nextSeq:nextSeq
			}, 
			success: function (data) {
				//console.log(data);
				updateFormInfo();
			}, 
			error: function (data) {
				alert("error ajax :\n" + data.responseText);
			}
		});
	}
	
	function doDelete(seq) {
		var sMsg = '${delete}';
		if (!confirm(sMsg))
			return;
		
		$.ajax({
			url: './deleteFormInfo',
			//async: false,
			type: 'post',
			dataType: 'json',
			data: {
				fiseq:seq
			}, 
			success: function (data) {
				//console.log(data);
				updateFormInfo();
			}, 
			error: function (data) {
				alert("error ajax :\n" + data.responseText);
			}
		});
	} */
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
