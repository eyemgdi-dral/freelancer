<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일관리 - 항목추가 - 팝업
 --%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>

<div class="pop_scon">
	<form id="form2" action="./formmail_popup_proc.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="fiseq" value="${search.fiseq }" />
	<input type="hidden" name="fseq" value="${search.fseq }" />
	<input type="hidden" name="fileSeq" value="${file.fileSeq }" />
<c:if test="${!empty vo }">
		<input type="hidden" name="ordering" value="${vo.ordering}" />
</c:if>
<c:if test="${empty vo }">
		<input type="hidden" name="ordering" value="${max+1 }" />
</c:if>
	<div class="card">
		<div class="card-body">
			<table class="table table-bordered">
				<colgroup>
					<col width="30%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th><strong>항목명</strong></th>
						<td>
							<div class="input-group">
								<input type="text" class="form-control" name="formInfoName" value="${vo.formInfoName }" />
								<div class="input-group-append">
									<div class="input-group-text">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="requiredCheck" name="required" value="Y">
											<label class="custom-control-label" for="requiredCheck">필수</label>
										</div>
									</div>
								</div>
								<input name="requiredYn" type="hidden" value="" />						
							</div>
							<script>
								$(function() {
									checkCheckbox('required', 'requiredYn', '${vo.requiredYn}', 'N');
								});
							</script>
						</td>
					</tr>
					<tr>
						<th><strong>항목이미지</strong></th>
						<td>
							<input type="file" name="formImg" class="form-control"/>
						<c:if test="${fn:contains(file.mimeType, 'image/')}"><br/>
							<span class="fileimg">
								<a href="${UPLOAD_ROOT }${file.saveFilename}" class="mr10" target="_blank">${file.originalFilename } (${file.fileSize})</a>
								<label><input type="checkbox" class="ml5" name="deleteFlag" value="${file.saveFilename }" />이미지삭제</label>
							</span>
						</c:if>
						</td>
					</tr>
					<tr>
						<th><strong>항목속성</strong></th>
						<td>
							<tt:select list="${type1s }" class="ml5" name="property" listKey="value" listValue="text" selected="${vo.property}" />
						</td>
					</tr>
					<tr>
						<th><strong>항목사이즈</strong></th>
						<td>
							<input type="text" class="form-control onlyNumber w20" name="size" value="${vo.size }" /> 
						</td>
					</tr>
					<tr>
						<th><strong>세부항목개수</strong></th>
						<td>
							<select name="detailCount" id="detail" class="form-control">
	<c:set var="detailSeleceted" value="" />							
	<c:forEach var="i" begin="1" end="20" varStatus="s">
		<c:set var="detailSeleceted" value="" />
		<c:if test="${vo.detailCount eq i }">
			<c:set var="detailSeleceted" value=" selected" />
		</c:if>
									<option value="${i }"${detailSeleceted }>${i }</option>
	</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th><strong>세부항목</strong></th>
						<td>
							<div id="multi">
	<c:if test="${!empty list}">
		<c:forEach var="m" items="${list }" varStatus="s">		
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">${s.index+1 }</span>
									</div>
									<input type="text" class="form-control" name="detailNameArray" value="${m }"/>
								</div>				
		</c:forEach>
	</c:if>
	<c:if test="${empty list }">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">1</span>
									</div>
									<input type="text" class="form-control" name="detailNameArray" value=""/>
								</div>
	</c:if>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		
		</div>
		
		<div class="card-footer">
			<div class="row">
				
			</div>
		</div>
	</div>
	
		<label><input type="checkbox" id="continue" onclick="javascript:chkWrite();"  />계속 등록하기</label>
		<div class="row">
			<div class="col-6"><a onclick="javascirpt:doSubmit();" class="btn btn-block text-white btn-lg bg-primary">저장</a></div>
			<div class="col-6"><a onclick="javascript:self.close();" class="btn btn-block text-white btn-lg bg-dark">닫기</a></div>
		</div>
		<div class="tago-callout callout-warning">
			<h4 class="check_tit">체크사항</h4>
			<ul>
				<li>- 수정일때 계속 등록하기 체크시 항목이 새로 추가 됩니다. (기존 항목 수정 X)</li>
				<li>- 항목이미지 : 항목명(텍스트)대신 업로드한 이미지가 항목명 에 노출됩니다.</li>
				<li>- 항목사이즈 : 항목의 크기를 정합니다. 예) &lt;input size="항목사이즈"&gt; </li>
				<li>- 항목속성 : 이름을 입력받을때 text가 아닌 "이름"을 선택하시면 "관리자 > 폼메일" 목록에 보여집니다. 이메일, 연락처도 목록에 보여집니다.</li>
			</ul>
			<br/>
			
		</div>
	</form>
</div>
<!--wrap_scon E-->
<script id="detailTmpl" type="text/x-jquery-tmpl">
{{each detail}}
	\${$index+1}<input type="text" class="ml5" name="detailNameArray" value="\${$value}" /><br/>
{{/each}}
</script>
<script type="text/javascript">
	$(function(){
		
		$('#detail').change(function(){
			var $num = $(this).val();
			var $fiseq = $('input[name=fiseq]').val();
			
			$.ajax({
				url: './getFormmailDetail.do',
				//async: false,
				type: 'post',
				dataType: 'json',
				data: { 
					fiseq: $fiseq,
					num: $num
				}, 
				success: function (data) {
					//console.log(data.detail);
					$('#multi').empty();
					$('#detailTmpl').tmpl({detail:data.detail}).appendTo($('#multi'));
				}, 
				error: function (data) {
					alert("error ajax :\n" + data.responseText);
				}
			});
			
		});
	});
	
	function chkWrite() {
		if ($('#continue').prop('checked')) {
			$('input[name=fiseq]').val('0');
			$('input[name=ordering]').val('${max+1 }');
			$('.fileimg').hide();
		} else {
			$('input[name=fiseq]').val('${search.fiseq }');
			$('input[name=ordering]').val('${vo.ordering}');
			$('.fileimg').show();
		}
	}
	
	function doSubmit() {
		if (isNull($('input[name=size]').val())) {
			alert('항목사이즈를 입력해주세요.');
			$('input[name=size]').focus();
			return;
		} 
		
		if (!confirm('저장하시겠습니까?'))
			return;		
		$('#form2').submit();	
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>