<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	상품관리 - 상품추가 등록 수정 UI
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="formPrd" action="./prd_proc.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="prdseq" value="${empty vo.prdSeq ? 0 : vo.prdSeq  }">
      <input type="hidden" name="parentCat" value="${empty vo.parentCategory ? 99 : vo.parentCategory  }">
      <input type="hidden" name="childCat" value="${empty vo.subCategory ? 99 : vo.subCategory  }">
      <input type="hidden" name="subChildCat" value="${empty vo.category1 ? 99 : vo.category1  }">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-12">
							<div class="form-group row">
							
								<label class="col-form-label col-lg-1">상품분류</label>
								<div class="col-lg-11">
								<c:choose>
									<c:when test="${empty vo}">
										<div class="row" id="wrap">
											<div class="col-md-4">
												<tt:select onchange="javascript:selectChange(this)" list="${prdCateList }" className="category" id="category1" data-id="1" listKey="cateIdx" listValue="cateName" indexKey="" indexValue="= 카테고리1 =" selected="${vo.category1 }"/>																																			
											</div>
										</div>
									</c:when>
									<c:otherwise>
										
										<div class="row" id="wrap">
											<div class="col-md-4">
												<tt:select onchange="javascript:selectChange(this)" list="${prdCateList }" className="category" id="category1" data-id="1" listKey="cateIdx" listValue="cateName" indexKey="" indexValue="= 카테고리1 =" selected="${vo.parentCategory }"/>																																			
											</div>
										</div>
                   <%--  <div class="row" id="wrap">
                      <div class="col-md-4">
                        <tt:select onchange="javascript:selectChange(this)" list="${childList }" className="category" id="category2" data-id="2" listKey="cateIdx" listValue="cateName" indexKey="" indexValue="= 카테고리2 =" selected="${vo.subCategory }"/>                                                                      
                      </div>
                    </div>
                    <div class="row" id="wrap">
                      <div class="col-md-4">
                        <tt:select list="${subChildlist }" className="category" id="category3" data-id="3" listKey="cateIdx" listValue="cateName" indexKey="" indexValue="= 카테고리3 =" selected="${vo.category1 }"/>                                                                      
                      </div>
                    </div> --%>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-form-label col-lg-1">상품코드</label>
								<div class="col-lg-5">
									<input  class="form-control" name="productCode" value="${vo.productCode }" type="text" />
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-form-label col-lg-1">상품명</label>
								<div class="col-lg-5">
									<input  class="form-control" name="prdName" value="${vo.prdName }" type="text" />
								</div>
								<div class="col-lg-5">
									<div class="custom-control custom-checkbox custom-control-inline"">
										<input type="checkbox" class="custom-control-input" id="mainCheck" value="Y">
										<label class="custom-control-label" for="mainCheck">매인 노출 상품</label>
										<input type="hidden" name="mainYn" value="${vo.mainYn }" />
									</div>
									<div class="custom-control custom-checkbox custom-control-inline"">
										<input type="checkbox" class="custom-control-input" id="recommendCheck" value="Y">
										<label class="custom-control-label" for="recommendCheck">추천 상품</label>
										<input type="hidden" name="recommendYn" value="${vo.recommendYn }" />
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-form-label col-lg-1">상품가격</label>
								<div class="col-lg-5">
									<input class="form-control" name="price" value="${vo.price }" type="text"/>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-form-label col-lg-1">상품정보</label>
								<div class="col-lg-5">
									<div id="prdInfo">
<c:forEach items="${vo.prdSubVO }" var="psL" varStatus="i">
										<div class="input-group">
											<input type="hidden" name="prdSubSeqList" value="${psL.prdSubSeq }">
											<input type="text" class="form-control" name="headerList" value="${psL.header }" > 
											<input type="text" class="form-control" name="contentList" value="${psL.content }" >			
											<div class="input-group-append">
	<c:if test="${i.count eq 1 }">										
												<a href="javascript:doAddInfo();" class="btn btn-primary">추가</a>
	</c:if>
	<c:if test="${i.count ne 1 }">										
												<a onclick="javascript:subDelete(this);" class="btn btn-danger">제거</a>
	</c:if>										
											</div>								
										</div>
</c:forEach>

<c:if test="${empty vo.prdSubVO }">
										<div class="input-group">
											<input type="hidden" name="prdSubSeqList" value="0">
											<input class="form-control" name="headerList" value="" type="text"> 
											<input class="form-control" name="contentList" value="" type="text"> 
											<div class="input-group-append">
												<a href="javascript:doAddInfo();" class="btn btn-primary">추가</a>
											</div>
										</div>
</c:if>
									</div>						
									
								</div>
								<div class="col-lg-5">
									<div class="form-text">(ex) 원산지    한국 , 가격  10000	</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-form-label col-lg-1">상품사진</label>
								<div class="col-lg-11">
									<div class="row">
										<div class="col-md-3">
											<div class="input-group">
												<div class="input-group-preped">
													<p class="input-group-text">목록</p>
												</div>
												<input type="text" class="form-control" name="sizeList" value="${empty vo.sizeList ? 150 : vo.sizeList }"/>
											</div>
										</div>
										<div class="col-md-3">
											<div class="input-group">
												<div class="input-group-preped">
													<p class="input-group-text">축소</p>
												</div>
												<input type="text" class="form-control" name="sizeSmall" value="${empty vo.sizeSmall ? 50 : vo.sizeSmall }"/>
											</div>
										</div>
										<div class="col-md-3">
											<div class="input-group">
												<div class="input-group-preped">
													<p class="input-group-text">상세</p>
												</div>
												<input type="text" class="form-control" name="sizeDetail" value="${empty vo.sizeDetail ? 350 : vo.sizeDetail }"/>
											</div>
										</div>
										<div class="col-md-3">
											<div class="input-group">
												<div class="input-group-preped">
													<p class="input-group-text">확대</p>
												</div>
												<input type="text" class="form-control" name="sizeLarge" value="${empty vo.sizeLarge ? 650 : vo.sizeLarge }"/>
											</div>
										</div>
									</div>
									<p class="form-text">
										신규 등록시에만 원본 이미지를 등록하면 나머지 이미지가 자동 생성 됩니다. (지정된 파일 제외) [GIF, JPG, PNG]
									</p>
									<p>	
										<a href="javascript:doImgAdd();" class="btn btn-primary">이미지 추가</a>
	<c:if test="${vo.prdSeq != null and vo.prdSeq > 0 }">
										<a href="javascript:doImgDel();" class="btn btn-danger">이미지 삭제</a>									
	</c:if>
									</p>
									<table id="prdImgAdd" class="table table-bordered">									
<c:forEach items="${vo.prdImageVO }" var="piL" varStatus="s">
									<tr>
										<th>
											<input type="checkbox" class="checkAll" name="checkImg" id="chkAll" value="${piL.prdImageSeq }">
										</th>
										<td>
											<div class="w95 fleft p10">
												<p>
													<label>
														<input type="checkbox" class="prdImageTypeList" value="Y">리사이즈 이미지 자동으로 만들기
													</label>
													(원본 파일 기준으로 생성되며 기존 파일은 삭제 됩니다.)	
													<input type="hidden" name="prdImageTypeList" value="N">
												</p>
												<div class="input-group">
													<input type="hidden" name="prdImageSeqList" value="${piL.prdImageSeq }">									
													<div class="input-group-prepend">
														<span class="input-group-text">원본 이미지</span>
													</div>
													<input type="file" name="originalFileList" class="form-control">
													<div class="input-group-append">
														<a class="btn btn-dark" href="javascript:viewFile('${UPLOAD_ROOT}${piL.saveFilename }');">${piL.originalFilename }</a>
													</div>
												</div>
	<c:if test="${s.count eq 1 }">												
												<div class="input-group mt-3">
													<div class="input-group-prepend">
														<span class="input-group-text">상품 목록</span>
													</div>
													<input type="file" name="listFileList" class="form-control">
		<c:set var="fileName" value="${fn:split(piL.listFilename, '/')}" />
													<div class="input-group-append">
														<a class="btn btn-dark" href="javascript:viewFile('${UPLOAD_ROOT}${piL.listFilename }');">${fileName[fn:length(fileName)-1] }</a>
													</div>
												</div>
	</c:if>												
												<div class="input-group mt-3">
													<div class="input-group-prepend">
														<span class="input-group-text">축소</span>
													</div>									
													<input type="file" name="smallFileList" class="form-control">
	<c:set var="fileName" value="${fn:split(piL.smallFilename, '/')}" />					
													<div class="input-group-append">					
														<a class="btn btn-dark" href="javascript:viewFile('${UPLOAD_ROOT}${piL.smallFilename }');">${fileName[fn:length(fileName)-1] }</a>
													</div>
												</div>
												<div class="input-group mt-3">
													<div class="input-group-prepend">
														<span class="input-group-text">제품 상세</span>
													</div>	
													<input type="file" name="detailFileList" class="form-control">
	<c:set var="fileName" value="${fn:split(piL.detailFilename, '/')}" />										
													<div class="input-group-append">		
														<a class="btn btn-dark" href="javascript:viewFile('${UPLOAD_ROOT}${piL.detailFilename }');">${fileName[fn:length(fileName)-1] }</a>
													</div>
												</div>
												<div class="input-group mt-3">
													<div class="input-group-prepend">
														<span class="input-group-text">확대 보기</span>
													</div>	
													<input type="file" name="largeFileList" class="form-control">
	<c:set var="fileName" value="${fn:split(piL.largeFilename, '/')}" />									
													<div class="input-group-append">
														<a class="btn btn-dark" href="javascript:viewFile('${UPLOAD_ROOT}${piL.largeFilename }');">${fileName[fn:length(fileName)-1] }</a>
													</div>
												</div>								
											</div>
										</td>
									</tr>	
</c:forEach>

<c:if test="${empty vo.prdImageVO }">
									<tr>
										<th>
											<input type="checkbox"  class="checkAll" name="checkImg" id="chkAll" value="0">
										</th>
										<td>										
											<div class="w95 fleft p10">
												<p>
													처음 추가 하는 이미지는 자동 리사이즈 저장 됩니다. (수정시 지정가능)
													<input type="hidden" name="prdImageTypeList" value="Y">
												</p>
												<p class="borderB">
													<input type="hidden" name="prdImageSeqList" value="0">
													<span class="w20">원본 이미지</span>
													<input type="file" name="originalFileList">												
													<input type="file" name="listFileList" style="display:none;">												
													<input type="file" name="smallFileList" style="display:none;">												
													<input type="file" name="detailFileList" style="display:none;">												
													<input type="file" name="largeFileList" style="display:none;">
												</p>
											</div>
										</td>
									</tr>		
</c:if>
								</table>
								</div>
							</div>
						</div>
						
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-form-label col-lg-1">첨부파일</label>
								<div class="col-lg-5">
									<div class="input-group">
										<input type="file" name="fileList" class="form-control" multiple="multiple">
										<p class="input-group-append">
<c:forEach items="${fileList }" var="fL" varStatus="s">
											<a class="btn btn-primary" href="javascript:viewFile('${UPLOAD_ROOT}${fL.saveFilename }');">${fL.originalFilename }</a> 
											<a class="btn btn-danger" href="javascript:doFileDel('${fL.fileSeq }', '${fL.saveFilename }');" class="mR5 red">x</a>					
</c:forEach>
										</p>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-form-label col-lg-1">관련상품</label>
								<div class="col-lg-5">
									<a href="javascript:doRefAdd();" class="btn btn-primary">등록</a>
									<a href="javascript:doRefDel();" class="btn btn-danger">삭제</a>
								</div>
							</div>
						</div>
						
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-form-label col-lg-1">상품간단설명</label>
								<div class="col-lg-5">
									<textarea name="summary" rows="5" class="form-control">${vo.summary }</textarea>
								</div>
							</div>
						</div>
						
						<div class="col-lg-12">
							<div class="form-group row">
								<label class="col-form-label col-lg-1">상품상세정보</label>
								<div class="col-lg-5">
									<textarea name="body" id="body" class="w100" style="height:300px;" class="editor">${vo.body }</textarea>
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
					<div class="row">
						<div class="col-lg-3">
							<a onclick="javascirpt:doPrdSubmit();" class="btn btn-primary btn-lg btn-block">저장</a>						
						</div>
						<div class="col-lg-3">
							<a onclick="javascirpt:$.Nav('go', './prd_list.do');" class="btn btn-dark btn-lg btn-block">목록</a>						
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>


<script id="prdInfoTmpl" type="text/x-jquery-tmpl">
<div class="input-group mt-2" id="infoSpan">
	<input type="hidden" name="prdSubSeqList" value="0">
	<input class="form-control" name="headerList" value="" type="text">
	<input class="form-control" name="contentList" value="" type="text">
	<div class="input-group-append">
		<a onclick="javascript:subDelete(this);" class="btn btn-danger">제거</a>
	</div>
</div>
</script>

<script id="prdImgTmpl" type="text/x-jquery-tmpl">
	<tr>
		<th>
			<input type="checkbox" name="checkImg"  id="checkAll" value="0">
		</th>
		<td>
			<div class="w95 fleft p10">
				<p>
					처음 추가 하는 이미지는 자동 리사이즈 저장 됩니다. (수정시 지정가능)					
					<input type="hidden" name="prdImageTypeList" value="Y">
				</p>	
				<p class="borderB mT5">
					<input type="hidden" name="prdImageSeqList" value="0">
					<span class="w20">원본 이미지</span>
					<input type="file" name="originalFileList" value="">
					<input type="file" name="listFileList" value="" style="display:none;">			 
					<input type="file" name="smallFileList" value="" style="display:none;">				
					<input type="file" name="detailFileList" value="" style="display:none;">				
					<input type="file" name="largeFileList" value="" style="display:none;">
				</p>									
			</div>
		</td>
	</tr>	
</script>
<script id="categoryTmpl" type="text/x-jquery-tmpl">
<div class="col-md-4">
	<select class="form-control category" onchange="javascript:selectChange(this)" id="category\${level}" data-id="\${level}" name="category\${level}">
		<option value="">= 카테고리\${level} =</option>
{{each list}}
		<option value="\${cateIdx}">\${cateName}</option>
{{/each}}
	</select>
</div>
</script>
<script type="text/javascript">
	$(function() {
		
		if ($('input[name=parentCat]').val() != '99') {
			selectChange($('#category1'));
    }
		
		//매인 노출 체크 
		if ($('input[name=mainYn]').val() == 'Y') {
			$('#mainCheck').prop("checked", true);
		}
		$('#mainCheck').change(function() {
			if ($('#mainCheck').is(':checked')) {
				$('input[name=mainYn]').val('Y');
			} else {
				$('input[name=mainYn]').val('N');
			}
		});
		
		//추천 상품 체크
		if ($('input[name=recommendYn]').val() == 'Y') {
			$('#recommendCheck').prop("checked", true);
		}		
		$("#recommendCheck").change(function() {
			if ($("#recommendCheck").is(":checked")) {
				$('input[name=recommendYn]').val('Y');
			} else {
				$('input[name=recommendYn]').val('N');
			}
		});
		
		//리사이즈 선택시
		$('.prdImageTypeList').change(function () {
				$p = $(this).parent().parent();
				if ($(this).is(":checked")) {
					$p.find('input[name=prdImageTypeList]').val('Y');
				} else {
					$p.find('input[name=prdImageTypeList]').val('N');
				}
		});
	
		
	});
	
	function selectChange(obj){
		var seq = $(obj).val();
		var level = $(obj).data('id') +1;
		var cat2 = $('#category2');
		var parent = $(obj).closest('.col-md-4')
		$.ajax({
			type : 'post',
			url : './ajax/get_category',
			data : {
				cateSeq : seq
			},
			dataType : 'json',
			success : function(data) {
				console.log(data)
				if(data.success){
					parent.nextAll('.col-md-4').remove();
					if(data.result.length >= 1)
						$('#categoryTmpl').tmpl({list:data.result,level:level}).appendTo("#wrap");
					if ($('input[name=childCat]').val() != '99' && level == '2'){
						$('#category2').val($('input[name=childCat]').val());
					  $('#category2').trigger("change");
					}
					if ($('input[name=subChildCat]').val() != '99' && level == '3'){
						$('#category3').val($('input[name=subChildCat]').val());
			    }
				}else{
					alert(data.message);
				}
			}
		});
	}
	//제거시 prdSubSeq는 두고 내용만 삭제
	function subDelete(obj) {
		$span = $(obj).closest('.input-group');			
		$span.find('input[name=headerList]').val('');
		$span.find('input[name=contentList]').val('');
		$span.hide();
	}
	
	function doAddInfo() {		
		$('#prdInfoTmpl').tmpl().appendTo($('#prdInfo'));
	}
	
	//이미지 사이즈 조절 팝업창
	function doChangeImgSize() {
		openPop('?prdseq=${vo.prdSeq }', 'prdImgSize');
	}
	
	//이미지 추가
	function doImgAdd() {
		$('#prdImgTmpl').tmpl().appendTo($('#prdImgAdd'));
	}
	
	//이미지 삭제
	function doImgDel() {
		if (!$('input[name=checkImg]').is(':checked')) {
			alert('삭제할 이미지를 선택해 주세요');
			return;
		}
		
		if (!confirm('삭제하시겠습니까?')) {
			return;
		}
		var prdImgSeqs = new Array();
		$('input[name=checkImg]').each(function() {
			if ($(this).prop('checked')) {
				prdImgSeqs.push($(this).val());
			}
		});
		
		$.Nav('go', './prd_img_proc.do', {prdImageSeqList : prdImgSeqs });		
	}
	
	function doFileDel(fileSeq, path) {
		if(!confirm('해당 파일을 삭제 하시겠습니까?')) {
			return;
		}
		
		$.Nav('go', './prd_file_proc.do', {fileSeq : fileSeq, saveFilename : path});
	}
	
	function doPrdSubmit() {		
		if ($('input[name=prdName]').val() == '') {
			alert("상품명을 입력하지 않았습니다.");
			return;
		}
		
		if ($('input[name=sizeList]').val() == '') {
			alert("상품 목록 사이즈를 입력하지 않았습니다.");
			return;
		}
		
		if ($('input[name=sizeSmall]').val() == '') {
			alert("상품 축소 사이즈를 입력하지 않았습니다.");
			return;
		}
		if ($('input[name=sizeDetail]').val() == '') {
			alert("상품 상세 사이즈를 입력하지 않았습니다.");
			return;
		}
		if ($('input[name=sizeLarge]').val() == '') {
			alert("상품 확대 사이즈를 입력하지 않았습니다.");
			return;
		}
		
		if(!confirm('저장하시겠습니까?')){
			return;
		}
		
		$('#formPrd').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
