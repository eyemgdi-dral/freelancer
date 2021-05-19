<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	상품 관리 - 카테고리 관리
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<link rel="stylesheet" href="/common/js/jquery/jstree/dist/themes/default/style.css" type="text/css" />
<script type="text/javascript" src="/common/js/jquery/jstree/dist/jstree.min.js"></script>

<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	
	<div class="container-fluid mt--6">
		<div class="card">
			<div class="card-header">
				<div class="row">
					<div class="col-md-6">
						총 메뉴  : <fmt:formatNumber value="${search.count }" pattern="#,###" />개
					</div>
					<div class="col-md-6 text-right">
						<a id="createbtnclick" class="btn btn-primary">카테고리 등록 </a>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="5%" />
							<col width="20%" />
							<col width="5%" />
							<col width="25%" />
							<col width="5%" />
							<col width="5%" />
						</colgroup>
						<thead class="text-center">
							<tr>
								<th>레벨</th>
								<th>카테고리명</th>
								<th>등록된 상품</th>
								<th>설명</th>
								<th>상태</th>
								<th>순서</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty list}">
								<c:forEach items="${list }" var="m" varStatus="s">
									<tr>
										<td>${m.cateLevel}</td>
										<td>
											<c:set var="parentName" />
											<c:forEach items="${parentlist}" var="item">
									       			<c:if test = "${item.cateIdx eq m.parentIdx}">
									       				<c:set var="parentName" >${item.cateName}</c:set>
							       					</c:if>
					       					</c:forEach>
											<div class="text-left">
												<div class="
													<c:if test = "${m.cateLevel == 1}">main-hide</c:if>
													<c:if test = "${m.cateLevel == 2}">main-parent pl-4</c:if>
													<c:if test = "${m.cateLevel == 3}">main-parent main-child pl-5</c:if>">
													<span>
														<c:if test = "${m.cateLevel == 2}">&#9495;</c:if>
														<c:if test = "${m.cateLevel == 3}">&#9495;</c:if>
													</span>
													<a onclick="javacript:edit('${m.cateIdx }','${m.cateName }', '${m.prdCount }' ,'${m.cateDescription }','${m.useFlag }','${parentName}');">${m.cateName }</a>
												</div>
											</div>
										</td>
										<td>0개</td>
										<td class="left">${m.cateDescription }</td>
										<td><c:if test = "${m.useFlag == 'U'}">사용</c:if><c:if test = "${m.useFlag=='S'}">미사용</c:if></td>
										<td>						
											<a onclick="javascript:doOrderingUpdate('${m.cateIdx}', '${m.sortNum }', 'up', '${m.cateLevel }', '${m.parentIdx }');" class="red">▲</a>	
											<a onclick="javascript:doOrderingUpdate('${m.cateIdx}', '${m.sortNum }', 'down', '${m.cateLevel }', '${m.parentIdx }');" class="blue">▼</a>					
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty list}">
								<tr>
									<td colspan="6"><s:message code="common.noData" /></td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>
<div class="modal fade" id="createpopup" tabindex="-1" role="dialog" aria-labelledby="createpopupLab" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
     		<div class="modal-header">
        		<h5 class="modal-title" id="exampleModalLabel">메뉴 등록</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
     			</button>
      		</div>
			<div class="modal-body">
				<form id="form2" action="./cate_proc" method="post" enctype="multipart/form-data">
					<input type="hidden" name="cateIdx" value="" />
					<input type="hidden" name="parentIdx" value="" />
					<input type="hidden" name="cateLevel" value="1" />
					<div class="form-group">
						<label class="form-control-label">상위카테고리</label>
						<div id="newCase" hidden>
							<select class="selectMenu form-control" id="firstLevel" >
						       <option value="">선택하세요.</option>
						       <c:forEach items="${maincate}" var="item">
						       		<c:if test="${item.cateLevel==1}">
							        	<option value="${item.cateIdx}">${item.cateName}</option>   
							        </c:if> 
					           </c:forEach>							   
						    </select>
						    <select class="selectMenu form-control" id="secondLevel" hidden>   
						    </select>
					    </div>
					    <div id="oldCase" hidden>
					 		<input  name="parentPid" class="form-control" readonly value="" maxlength="50" type="text" />
					 	</div>
					</div>
					<div class="form-group">
						<label class="form-control-label">사용구분</label>
						<select name="useFlag" class="form-control">
						       	<option value="U"/> 사용 </option> 
					       		<option value="S"/> 미사용 </option> 
					       		<option value="D"/> 삭제</option> 
					    </select>
					</div>
					<div class="form-group">
						<label class="form-control-label">카테고리명</label>
						<input name="cateName" class="form-control" value="" maxlength="50" type="text" /> 
					</div>
					
					<div class="form-group">
						<label class="form-control-label">설명</label>
						<textarea name="cateDescription" class="form-control" style="height:150px"  maxlength="1000"></textarea>
					</div>
				</form>
			</div>
			<c:set var="delete"><s:message code="common.delete.msg" /></c:set>	
      		<div class="modal-footer">
        		<button type="button"class="btn btn-secondary" data-dismiss="modal">닫기</button>
        		<button type="button"  onclick="javascript:createSubmit();"  class="btn btn-primary">저장</button>        		
      		</div>
    	</div>
  	</div>
</div>



<script type="text/javascript">
const newCase = $('#newCase'); 
const oldCase = $('#oldCase');
const filterMenu =${childList};
$(function (){
	$("#createbtnclick").on('click', function(){
		$("#createpopup").modal('show');
		$('#form2')[0].reset();
		newCase.prop('hidden', false);
		oldCase.prop('hidden', true);
		$("#secondLevel").prop('hidden', true);
		$("input[name='cateIdx']").val('');
	});
});
$(document).on('change', '.selectMenu', function(e){
	const parentIdx = $('input[name="parentIdx"]');
	const cateLevel = $('input[name="cateLevel"]');
	switch(e.target.id){
		case 'firstLevel':
			getAllChild(e.target.value, 'secondLevel');
			parentIdx.val(e.target.value);
			cateLevel.val((e.target.value) ? 2 : 1);
	        break;
		case 'secondLevel':
			parentIdx.val((e.target.value) ? e.target.value : $('#firstLevel').find(':selected').val());
			cateLevel.val((e.target.value) ? 3 : 2);
	        break;
	    default:
	    	break;
	}
});
const getAllChild = function(value, level) {
 	$("#"+level+"").find('option').remove().end().append('<option value="">선택하세요.</option>').prop('hidden', (value !== "") ? false : true);
	filterMenu.map(function(a) {
		if(a.parentIdx == value){
			$("#"+level+"").append("<option value="+ a.cateIdx +">"+ a.cateName +"</option>");
		}
	});
}
function createSubmit() {
	if($('input[name=cateName]').val()==""){
		alert("메뉴 이름을 입력하세요 !!!");
	}
	else{
		if (!confirm('저장하시겠습니까?'))
		return;
		$('#form2').submit();	
		
	}
	
}
function edit(seq,name, path, detail, use, parent) {
	$("#createpopup").modal('show')
	
	oFormObject = document.forms['form2'];
	useFlag = oFormObject.elements["useFlag"];
	cateIdx = oFormObject.elements["cateIdx"];
	cateName = oFormObject.elements["cateName"];
	/* menuPath = oFormObject.elements["prdCount"]; */
	menuDetail = oFormObject.elements["cateDescription"];
	parentPid = oFormObject.elements["parentPid"];
	
	cateIdx.value = seq;
	cateName.value=name;
	/* menuPath.value=path; */
	menuDetail.value=detail;
	newCase.prop('hidden', true);
	oldCase.prop('hidden', false);
	parentPid.value = parent;
	ww=useFlag.querySelectorAll('option');
	ww.forEach(function(a){
		if(a.value == use) a.selected = true;
	});
	
}
function doOrderingUpdate(menuSeq, sort, type, level, parent) {
	$.Nav('go', './cate_ordering_update.do', {cateIdx: menuSeq, sortNum : sort, type : type, cateLevel: level, parentIdx: parent});	
}
</script>



<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>