<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<style>
.txt-left{
	display:grid;
    grid-template-columns: auto auto; 
    grid-gap: 1.8em;
    justify-content: start;
    align-items: baseline;
}
.main-parent{
    position: relative;
	border-left: 2px solid #333;
    height: 19px;
}
.main-hide{
	display:none;
}
.main-parent:before {
    content: '';
    border-bottom: 2px solid #333;
    position: absolute;
    width: 1.5em;
    top: 1.3em;
}
.main-child{
    margin-left: 25px;
}
</style>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
<div class="main-content" id="panel">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
	
	<div class="container-fluid mt--6">
		<div class="card">
			<div class="card-header">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-6">
							<h3 class="mb-0">총 메뉴  : <fmt:formatNumber value="${search.count }" pattern="#,###" />개</h3>
						</div>
						<div class="col-sm-6 text-right">
							<a id="createbtnclick" class="btn btn-sm btn-primary">메뉴등록 </a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="card-body">
				<div class="table-responsive">				
					<table class="table table-bordered">
						<colgroup>
							<col width="5%" />
							<col width="20%" />
							<col width="25%" />
							<col width="5%" />
							<col width="5%" />
						</colgroup>
						<thead class="table-info">
							<tr>
								<th>레벨</th>
								<th>메뉴명</th>
								<th>설명</th>
								<th>상태</th>
								<th>순서</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty list}">
								<c:forEach items="${list }" var="m" varStatus="s">
									<tr>
										<td>${m.menuLevel}</td>
										<td>
											<c:set var="parentName" />
											<c:set var="parentMain" />
											<c:set var="parentIdx" />
											<c:forEach items="${parentlist}" var="item">
									       			<c:if test = "${item.menuIdx eq m.parentIdx}">
									       				<c:set var="parentName" >${item.menuName}</c:set>
									       				<c:set var="parentIdx" >${item.parentIdx}</c:set>
							       					</c:if>
							       					<c:if test="${item.menuLevel == 3}">
							       						<c:forEach items="${parentlist}" var="item1">
							       							<c:if test = "${item1.menuIdx eq parentIdx}">
							       								<c:set var="parentMain" >${item1.menuName}</c:set>
							       							</c:if>
							       						</c:forEach>
							       					</c:if>
					       					</c:forEach>
											<div class="txt-left">
												<div class="
													<c:if test = "${m.menuLevel == 1}">main-hide</c:if>
													<c:if test = "${m.menuLevel == 2}">main-parent</c:if>
													<c:if test = "${m.menuLevel == 3}">main-parent main-child</c:if>">
												</div>
												<a onclick="javacript:edit('${m.menuIdx }','${m.menuName }', '${m.folderPath }' ,'${m.menuTable }','${m.useFlag }','${parentName}', '${m.menuLevel}', '${parentMain }', '${m.prefixPath}');">${m.menuName }</a>
											</div>
										</td>
										<td class="left">${m.menuTable }</td>
										<td><c:if test = "${m.useFlag == 'U'}">사용</c:if><c:if test = "${m.useFlag=='S'}">미사용</c:if></td>
										<td>						
											<a onclick="javascript:doOrderingUpdate('${m.menuIdx}', '${m.sortNum }', 'up', '${m.menuLevel }', '${m.parentIdx }');" class="red">▲</a>	
											<a onclick="javascript:doOrderingUpdate('${m.menuIdx}', '${m.sortNum }', 'down', '${m.menuLevel }', '${m.parentIdx }');" class="blue">▼</a>					
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
				<form id="form2" action="./menu_proc" method="post" enctype="multipart/form-data">
					<input type="hidden" name="menuIdx" value="" />
					<input type="hidden" name="parentIdx" value="" />
					<input type="hidden" name="menuLevel" value="1" />
					<div class="form-group row d-none" id="newCase">
						<label class="col-sm-3">상위메뉴</label>
						<div class="col-sm-9">
							<select class="selectMenu form-control form-control-sm mb-2" id="firstLevel">
						       <option value="">선택하세요.</option>
						       <c:forEach items="${mainmenu}" var="item">
						       		<c:if test="${item.menuLevel==1}">
							        	<option value="${item.menuIdx}">${item.menuName}</option>   
							        </c:if> 
					           </c:forEach>							   
						    </select>
						    
						    <select class="selectMenu form-control form-control-sm d-none" id="secondLevel">   
						    </select>
						</div>
					</div>
					<div class="form-group row d-none" id="oldCase">
						<label class="col-sm-3">상위메뉴</label>
						<div class="col-sm-9">
					    	<input class="form-control mb-2 form-control-sm d-none"  name="parentMain" readonly value="" maxlength="50" type="text"/>
					 		<input class="form-control form-control-sm" name="parentPid" readonly value="" maxlength="50" type="text"/>
						</div>
				 	</div>
				 	<div class="form-group row">
						<label class="col-sm-3">사용구분</label>
						<div class="col-sm-9">
							<select name="useFlag" class="form-control form-control-sm">
							       	<option value="U">사용</option> 
						       		<option value="S">미사용 </option> 
						       		<option value="D">삭제</option> 
						    </select>
						</div>
					</div>
				 	<div class="form-group row">
						<label class="col-sm-3">메뉴명</label>
						<div class="col-sm-9">
							<input name='menuName' class="form-control form-control-sm" maxlength="50" type="text">
						</div>
					</div>
				 	<div class="form-group row">
						<label class="col-sm-3">Prefix Path</label>
						<div class="col-sm-9">
							<input name='prefixPath' class="form-control form-control-sm" maxlength="100" type="text">
						</div>
					</div>
				 	<div class="form-group row">
						<label class="col-sm-3">메뉴경로</label>
						<div class="col-sm-9">
							<input name='folderPath' class="form-control form-control-sm" maxlength="50" type="text">
						</div>
					</div>
				 	<div class="form-group row">
						<label class="col-sm-3">설명</label>
						<div class="col-sm-9">
							<textarea name="menuTable" class="form-control form-control-sm" class="w100" style="height:150px" maxlength="30"></textarea>
						</div>
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
		$('#createpopup').modal('show')
		$('#form2')[0].reset();
		newCase.removeClass('d-none');
		oldCase.addClass('d-none');
		$("#secondLevel").addClass('d-none');
		$("input[name='menuIdx']").val('');
	});
});
$(document).on('change', '.selectMenu', function(e){
	const parentIdx = $('input[name="parentIdx"]');
	const menuLevel = $('input[name="menuLevel"]');
	switch(e.target.id){
		case 'firstLevel':
			getAllChild(e.target.value, 'secondLevel');
			parentIdx.val(e.target.value);
			$('#secondLevel').removeClass('d-none')
			menuLevel.val((e.target.value) ? 2 : 1);
	        break;
		case 'secondLevel':
			parentIdx.val((e.target.value) ? e.target.value : $('#firstLevel').find(':selected').val());
			menuLevel.val((e.target.value) ? 3 : 2);
	        break;
	    default:
	    	break;
	}
});
const getAllChild = function(value, level) {
 	$("#"+level+"").find('option').remove().end().append('<option value="">선택하세요.</option>').prop('hidden', (value !== "") ? false : true);
	filterMenu.map(function(a) {
		if(a.parentIdx == value){
			$("#"+level+"").append("<option value="+ a.menuIdx +">"+ a.menuName +"</option>");
		}
	});
}
function createSubmit() {
	if($('input[name=menuName]').val()==""){
		alert("메뉴 이름을 입력하세요 !!!");
	}
	else{
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form2').submit();	
		
	}
	
}
function edit(seq,name, path, detail, use, parent, level, mparent, prefix) {
	
	/* $("#createpopup").dialog({
		title:"메뉴 수정",
		width:900,
		modal:true
	}); */
	$('#createpopup').modal('show')
	oFormObject = document.forms['form2'];
	useFlag = oFormObject.elements["useFlag"];
	menuIdx = oFormObject.elements["menuIdx"];
	menuName = oFormObject.elements["menuName"];
	menuPath = oFormObject.elements["folderPath"];
	menuDetail = oFormObject.elements["menuTable"];
	parentPid = oFormObject.elements["parentPid"];
	parentMain = oFormObject.elements["parentMain"];
	menuLevel = oFormObject.elements["menuLevel"];
	prefixPath = oFormObject.elements["prefixPath"];
	
	menuIdx.value = seq;
	menuName.value=name;
	menuPath.value=path;
	menuDetail.value=detail;
	newCase.addClass('d-none');
	oldCase.removeClass('d-none');
	parentPid.classList.remove('d-none');
	parentMain.classList.add('d-none');
	menuLevel.value = level;
	prefixPath.value = prefix;
	if(level === '1')
		parentPid.classList.add('d-none');
	if(level === '2')
		parentPid.value = parent;
	if(level === '3'){
		parentMain.classList.remove('d-none');
		parentPid.value = parent;
		parentMain.value = mparent;
	}
	var ww=useFlag.querySelectorAll('option');
	 for(var i=0;i<ww.length;i++){
		ww[i].selected=(ww[i].value === use) ? true:false;
	}
	
}
function doOrderingUpdate(menuSeq, sort, type, level, parent) {
	$.Nav('go', './menu_ordering_update.do', {menuIdx: menuSeq, sortNum : sort, type : type, menuLevel: level, parentIdx: parent});	
}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>