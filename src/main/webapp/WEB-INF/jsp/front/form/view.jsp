<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일 UI
 --%>
 
 <%@ include file="/WEB-INF/include/front_start_html.jsp"%>
	 
	<jsp:include page="/module/menu" flush="true" />
	<style>
	.tago-callout {
		    padding: 1.25rem;
		    margin-bottom: 1.25rem;
		    border: 1px solid #eee;
		    border-left-width: .25rem;
		    border-radius: .25rem;
		    border-left-color: #e92626;
		    background-color: white;
		    position: relative;
		    z-index: 1;
		}
	#termsBody{
	    height: 200px;
    overflow: auto;
	}
	</style>
<div class="">
	<jsp:include page="/module/submenu" flush="true">
		<jsp:param name="menuIdx" value="${menuIdx }" />
	</jsp:include>
	
			<div class="col-lg-12">
<c:if test="${vo.termsYn eq 'Y' }">

				<div class="tago-callout callout-warning">
					<div id="termsBody" class="form-control border-0" rows="6">${vo.termsBody }</div>
					<div class="form-group">
						<div class="custom-control custom-checkbox custom-control-inline">
							<input type="checkbox" class="custom-control-input" id="termsYn" name="termsYn">
							<label class="custom-control-label" for="termsYn">동의합니다</label>
						</div>
					</div>
				</div>
</c:if>
				<form id="form1" action="/form/valueProc" method="post" enctype="multipart/form-data">
					<input type="hidden" name="fseq" value="${vo.formSeq }" />
					<input type="hidden" name="formName" value="${vo.formName }" />
					<input type="hidden" name="menuId" value="${menuIdx }" />
<div id="hidden"></div>
					<table class="table table-bordered bg-white table-form border-top">
						<colgroup>
							<col width="20%" />
							<col width="*" />
						</colgroup>
			<c:forEach var="m" items="${list}" varStatus="s">				
							<tr>
					<c:if test="${fn:contains(m.saveFile, 'image/')}">
								<th style="padding-left:0px"><img src=${UPLOAD_ROOT }${m.saveFile} class="img" style="width:100%;" /></th>
					</c:if>
					<c:if test="${empty m.saveFile}">
					<c:set var="required" />						
					<c:if test="${m.requiredYn == 'Y' }">
						<c:set var="required"><span class="text-red">*</span></c:set>
					</c:if>	
								<th>${m.formInfoName } ${required }</th>
					</c:if>
								<td class="td1">
					<c:choose>
						<c:when test="${m.property == 'select' }">
							<select class="sel${s.index }" name="selectValue">
								<option value="">--</option>
					<c:forEach var="n" items="${m.detailNameArray }">
								<option value="${n }">${n }</option>
					</c:forEach>
							</select>
						</c:when>
						<c:when test="${m.property == 'name' }">
							<input type="text"  name="nameValue" class="name${s.index } form-control" size="${m.size }" />
						</c:when>
						<c:when test="${m.property == 'phone' }">
							<div class="input-group input-group-merge">
								<input type="text" name="phoneValueA${s.index }" class="inputPhone onlyNumber form-control" size="${m.size }"/>
								<div class="input-group-text">-</div>
								<input type="text" name="phoneValueB${s.index }" class="inputPhone onlyNumber form-control" size="${m.size }"/>
								<div class="input-group-text">-</div>
								<input type="text" name="phoneValueC${s.index }" class="inputPhone onlyNumber form-control" size="${m.size }"/>
							</div>
						</c:when>
						<c:when test="${m.property == 'email' }">
							<div class="input-group input-group-merge">
								<input type="text" name="emailValueA${s.index }" class="form-control" size="${m.size }"/>
									<span class="input-group-text">@</span>
								<input type="text" name="emailValueB${s.index }" class="form-control" size="${m.size }"/>
							</div>
						</c:when>
						<c:when test="${m.property == 'address' }">
							<div class="input-group mb-2">
								<input type="text" class="form-control" name="zipCode${s.index }" readonly onclick="javascript:openSearchAddress('zipCode${s.index }', 'addrA${s.index }', 'addrB${s.index }');"/>
								<div class="input-group-append">
									<a onclick="javascript:openSearchAddress('zipCode${s.index }', 'addrA${s.index }', 'addrB${s.index }');" class="btn btn-light">주소찾기</a>
								</div>
							</div>
							<input type="text" class="form-control mb-2" name="addrA${s.index }" readonly onclick="javascript:openSearchAddress('zipCode${s.index }', 'addrA${s.index }', 'addrB${s.index }');" />
							<input type="text" class="form-control" name="addrB${s.index }" />
						</c:when>
					</c:choose>						
					<c:forEach var="n" items="${m.detailNameArray }"  varStatus="ss">
							<c:set var="ml" />
							<c:if test="${!ss.first }">
								<c:set var="ml">ml10</c:set>
							</c:if>
							<c:choose>
								<c:when test="${m.property == 'text' }">
									<div class="input-group">
										<input type="text" class="text${s.index } form-control" name="textValue" size="${m.size }"/>
									<c:if test="${n ne ''}">
										<div class="input-group-append">
											<span class="input-group-text">${n}</span>
										</div>									
									</c:if>
									</div>
								</c:when>
								<c:when test="${m.property == 'radio' }">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="radioValue${s.index }-${ss.index }" name="radioValue${s.index }" class="custom-control-input rdo" value="${n }" size="${m.size }">
										<label class="custom-control-label" for="radioValue${s.index }-${ss.index }"> ${n }</label>
									</div>
								</c:when>
								<c:when test="${m.property == 'checkbox' }">
									<div class="custom-control custom-checkbox custom-control-inline">
										<input type="checkbox" class="custom-control-input chk${s.index }" id="checkValue${s.index }-${ss.index }" name="checkboxValue" size="${m.size }" value="${n }">
										<label class="custom-control-label" for="checkValue${s.index }-${ss.index }">${n }</label>
									</div>
								</c:when>
								<c:when test="${m.property == 'textarea' }">
									<textarea cols="${m.size }" rows="8" class="area${s.index } form-control" name="textareaValue" ></textarea><span>${n }</span><br/>
								</c:when>
								<c:when test="${m.property == 'file' }">
									<input type="file" class="file${s.index } form-control" name="fileValue" />
								</c:when>
								<c:when test="${m.property == 'pdate' }">
									
									<div class="input-daterange datepicker row align-items-center">
									    <div class="col">
								            <div class="input-group">
								                <div class="input-group-prepend">
								                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
								                </div>
								                <input name="dateValue" class="form-control date${s.index }" placeholder="Start date" type="text" size="${m.size }">
								            </div>
									    </div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>						
								</td>
							</tr>
			</c:forEach>
					</table>

				</form>
				<div class="col-12 text-center" style="margin-top:2.5rem ">
					<button type="button" onclick="javascript:doSubmit();" class="btn btn-lg btn-primary">견적 의뢰</button>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

	function doSubmit() {
		var flag = false;

		$('tr th').each(function(idx) {
			if ($(this).text().indexOf('*') > 0) {
				var $txt = $(this).text().replace('*', '');
				//console.log($txt);
				if ($('.sel' + idx).length > 0) {
					if (!$('.sel' + idx + ' > option:selected').val()) {
						alert($txt + '선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.name' + idx).length > 0) {
					if (isNull($('.name' + idx).val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=phoneValueA' + idx + ']').length > 0) {
					if (isNull($('input[name=phoneValueA' + idx + ']').val())) {
						alert('첫번째 ' + $txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=phoneValueB' + idx + ']').length > 0) {
					if (isNull($('input[name=phoneValueB' + idx + ']').val())) {
						alert('두번째 ' + $txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=phoneValueC' + idx + ']').length > 0) {
					if (isNull($('input[name=phoneValueC' + idx + ']').val())) {
						alert('세번째 ' + $txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=emailValueA' + idx + ']').length > 0) {
					if (isNull($('input[name=emailValueA' + idx + ']').val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=emailValueB' + idx + ']').length > 0) {
					if (isNull($('input[name=emailValueB' + idx + ']').val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=zipCode' + idx + ']').length > 0) {
					if (isNull($('input[name=zipCode' + idx + ']').val())) {
						alert('주소찾기를 선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=addrB' + idx + ']').length > 0) {
					if (isNull($('input[name=addrB' + idx + ']').val())) {
						alert('나머지 주소를 입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=radioValue' + idx + ']').length > 0) {
					if (!$('input[name=radioValue' + idx + ']:checked').val()) {
						alert($txt + '선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.chk' + idx).length > 0) {
					if (!$('.chk' + idx + ':checked').val()) {
						alert($txt + '한 개 이상 선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.text' + idx).length > 0) {
					if (isNull($('.text' + idx).val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
					
				}
				if ($('.area' + idx).length > 0) {
					if (isNull($('.area' + idx).val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.date' + idx).length > 0) {
					if (isNull($('.date' + idx).val())) {
						alert('날짜를 선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.file' + idx).length > 0) {
					if (isNull($('.file' + idx).val())) {
						alert('파일을 선택 해주세요.');
						flag = true;
						return false;
					}
				}
			}
		});
		
		
		$('.td1').each(function(idx) {
			var $chk = $('.chk' + idx + ':checked').length;
			if (!flag && $chk != 0) 
				$('#hidden').append('<input type="hidden" name="chkCount" value="' + $chk + '" />');
			if (!flag && !isNull($('input[name=phoneValueA' + idx + ']').val())) {
				var $phoneValue = $('input[name=phoneValueA' + idx + ']').val() + '-' + $('input[name=phoneValueB' + idx + ']').val() + '-' + $('input[name=phoneValueC' + idx + ']').val();
				$('#hidden').append('<input type="hidden" name="phoneValue" value="' + $phoneValue +'" />');
			}
			if (!flag && !isNull($('input[name=emailValueA' + idx + ']').val())) {
				var $emailValue = $('input[name=emailValueA' + idx + ']').val() + '@' + $('input[name=emailValueB' + idx + ']').val();
				$('#hidden').append('<input type="hidden" name="emailValue" value="' + $emailValue +'" />');
			}
			if (!flag && !isNull($('input[name=zipCode' + idx + ']').val())) {
				var $addressValue = $('input[name=zipCode' + idx + ']').val() + ' ' + $('input[name=addrA' + idx + ']').val() + ' ' + $('input[name=addrB' + idx + ']').val();
				$('#hidden').append('<input type="hidden" name="addressValue" value="' + $addressValue +'" />');
			}
		});
		
		$('.rdo').each(function() {
			if ($(this).prop('checked')) {
				if (!flag)
					$('#hidden').append('<input type="hidden" name="radioValue" value="' + $(this).val() + '" />');
			}
			
		});
		
		if($("#termsYn:checked").length == 0){
			alert("이용약관 동의하세요.");
			return false;
		}
		
		if (flag)
			return;
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$("#form1").submit()
	} 
</script>
<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>