<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원등급 관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<style>
.dd {
	position: relative;
}
.list-group-item>.list-group
{
	margin-top: 1rem
}
.dd-list {
	display: block;
	position: relative;
	margin: 0;
	padding: 0;
	list-style: none;
}

.list-group .list-group {
	padding-left: 25px;
}

.dd-collapsed .list-group {
	display: none;
}

.dd-item, .dd-empty, .dd-placeholder {
	display: block;
	position: relative;
}


.dd-handle:hover {
	color: #2ea8e5;
	background: #fff;
}
.nestable-button {
	display: block;
	position: relative;
	cursor: pointer;
	float: left;
	width: 25px;
	height: 20px;
	margin: 5px 0;
	padding: 0;
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
	border: 0;
	background: transparent;
	font-size: 12px;
	line-height: 1;
	text-align: center;
	font-weight: bold;
}

button[data-action="expand"]:before {
	content: '+';
	display: block;
	position: absolute;
	width: 100%;
	text-align: center;
	text-indent: 0;
	top: 0;
    bottom: 0;
    line-height: 20px;

}

button[data-action="collapse"]:before {
	content: '-';
	display: block;
	position: absolute;
	width: 100%;
	text-align: center;
	text-indent: 0;
	top: 0;
    bottom: 0;
    line-height: 20px;
}

.dd-placeholder, .dd-empty {
	padding: 0;
	background: #f2fbff;
	border: 1px dashed #b6bcbf;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.dd-empty {
	border: 1px dashed #bbb;
	min-height: 100px;
	background-color: #e5e5e5;
	background-image: -webkit-linear-gradient(45deg, #fff 25%, transparent 25%, transparent
		75%, #fff 75%, #fff),
		-webkit-linear-gradient(45deg, #fff 25%, transparent 25%, transparent
		75%, #fff 75%, #fff);
	background-image: -moz-linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%,
		#fff 75%, #fff),
		-moz-linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%,
		#fff 75%, #fff);
	background-image: linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff
		75%, #fff),
		linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff
		75%, #fff);
	background-size: 60px 60px;
	background-position: 0 0, 30px 30px;
}

.dd-dragel {
	position: absolute;
	pointer-events: none;
	z-index: 9999;
}

.dd-dragel>.dd-item .dd-handle {
	margin-top: 0;
}

.dd-dragel .dd-handle {
	-webkit-box-shadow: 2px 4px 6px 0 rgba(0, 0, 0, .1);
	box-shadow: 2px 4px 6px 0 rgba(0, 0, 0, .1);
}

.nestable-lists {
	display: block;
	clear: both;
	padding: 30px 0;
	width: 100%;
	border: 0;
	border-top: 2px solid #ddd;
	border-bottom: 2px solid #ddd;
}
</style>

<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<div class="col-md-6">
								${search.totalCount }
							</div>
							<div class="col-md-6 text-right">
								<a id="createbtnclick" class="btn btn-primary">배너그룹생성</a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="dd" id="nestable">
							<ul class="list-group  list">
<c:forEach items="${list}" var="item" varStatus="loop">
	<c:if test="${item.menuLevel eq 1 }">
								<li class="list-group-item" data-id="${item.menuIdx }">
									<div class="row align-items-center ">
										<div class="col-auto order-0 ">
											<button type="button" class="btn btn-light dd-handle btn-sm">
												<i class="fas fa-arrows-alt"></i>
											</button>
										</div>
										<div class="col-auto order-0 ">
											<div class="form-check">
												<input class="form-check-input position-static" type="checkbox" ${item.useFlag eq 'U' ? 'checked':''} value="${item.useFlag }" name="useFlag">
											</div>
										</div>
										<div class="col-12 col-sm-auto order-2 order-sm-1">
											<a onclick="doEdit(${item.menuIdx })">${item.menuName }</a>
										</div>
										<div class="col-auto order-1 order-sm-2 ml-auto">
											<a onclick="javacript:edit('${item.menuIdx }','${item.menuName }', '${item.folderPath }' ,'${item.menuTable }','${item.useFlag }','', '${item.menuLevel}', '${parentMain }', '${item.menuType}');" class="btn btn-sm btn-primary">수정</a>
											<a onclick="doDelete(${item.menuIdx })" class="btn btn-sm btn-danger">삭제</a>
										</div>
									</div>
		<c:if test="${item.hasChild }">
									<ul class="list-group  list">
		<c:forEach items="${list}" var="itemChild" varStatus="loop">
			<c:if test="${item.menuIdx eq itemChild.parentIdx }">
										<li class="list-group-item" data-id="${itemChild.menuIdx }">
											<div class="row align-items-center">
												<div class="col-auto order-0 ">
													<button type="button" class="btn btn-light dd-handle btn-sm">
														<i class="fas fa-arrows-alt"></i>
													</button>
												</div>
												<div class="col-auto order-0 ">
													<div class="form-check">
														<input class="form-check-input position-static" type="checkbox" ${itemChild.useFlag eq 'U' ? 'checked':''} value="${itemChild.useFlag }" name="useFlag">
													</div>
												</div>
												<div class="col-12 col-sm-auto order-2 order-sm-1">
													<a onclick="doEdit(${itemChild.menuIdx })">${itemChild.menuName }</a>
												</div>
												<div class="col-auto order-1 order-sm-2 ml-auto">
													<a onclick="javacript:edit('${itemChild.menuIdx }','${itemChild.menuName }', '${itemChild.folderPath }' ,'${itemChild.menuTable }','${itemChild.useFlag }','${item.menuName}', '${itemChild.menuLevel}', '', '${itemChild.menuType}');" class="btn btn-sm btn-primary">수정</a>
													<a onclick="doDelete(${itemChild.menuIdx })" class="btn btn-sm btn-danger">삭제</a>
												</div>
											</div>
				<c:if test="${itemChild.hasChild }">
											<ul class="list-group  list">
					<c:forEach items="${list}" var="itemChild3" varStatus="loop">
						<c:if test="${itemChild.menuIdx eq itemChild3.parentIdx }">
												<li class="list-group-item" data-id="${itemChild3.menuIdx }">
													<div class="row align-items-center">
														<div class="col-auto order-0 ">
															<button type="button" class="btn btn-light dd-handle btn-sm">
																<i class="fas fa-arrows-alt"></i>
															</button>
														</div>
														<div class="col-auto order-0 ">
															<div class="form-check">
																<input class="form-check-input position-static" type="checkbox" ${itemChild3.useFlag eq 'U' ? 'checked':''} value="${itemChild3.useFlag }" name="useFlag">
															</div>
														</div>
														<div class="col-12 col-sm-auto order-2 order-sm-1">
															<a onclick="doEdit(${itemChild3.menuIdx })">${itemChild3.menuName }</a>
														</div>
														<div class="col-auto order-1 order-sm-2 ml-auto">
															<a onclick="javacript:edit('${itemChild3.menuIdx }','${itemChild3.menuName }', '${itemChild3.folderPath }' ,'${itemChild3.menuTable }','${itemChild3.useFlag }','${itemChild.menuName}', '${itemChild3.menuLevel}', '${item.menuName }', '${itemChild3.menuType}');" class="btn btn-sm btn-primary">수정</a>
															<a onclick="doDelete(${itemChild3.menuIdx })" class="btn btn-sm btn-danger">삭제</a>
														</div>
													</div>
												</li>
						</c:if>
					</c:forEach>	
											</ul>
				</c:if>
										</li>
			</c:if>								
		</c:forEach>
									</ul>
		</c:if>
								</li>	
</c:if>
	<c:if test="${item.menuLevel eq 2 }">
	</c:if>
								
	
</c:forEach>
								
								
							</ul>
						</div>
						
						
						
					</div>
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
					<input type="hidden" name="folderPath" value="" />
					
					<div class="form-group row d-none" id="newCase">
						<label class="col-sm-3">상위메뉴</label>
						<div class="col-sm-9">
							<select class="selectMenu form-control form-control-sm mb-2" id="firstLevel">
						       <option value="">선택하세요.123</option>
						       <c:forEach items="${list}" var="item">
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
						<label class="col-sm-3">메뉴명</label>
						<div class="col-sm-9">
							<input name='menuName' class="form-control form-control-sm" maxlength="50" type="text">
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
						<label class="col-sm-3">메뉴창</label>
						<div class="col-sm-9">
							<div class="d-flex h-100 align-items-center">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="blankFlagY" name="blankFlag" class="custom-control-input"  value="Y">
									<label class="custom-control-label" for="blankFlagY">새창</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="blankFlagN" name="blankFlag" class="custom-control-input" checked value="N">
									<label class="custom-control-label" for="blankFlagN">current tab</label>
								</div>
							</div>
						</div>
					</div>
				 	<div class="form-group row">
						<label class="col-sm-3">메뉴 Type</label>
						<div class="col-sm-9">
							<tt:select id="menuType" className="form-control-sm" name="menuType" class="w50" list="${listMenuType }" listKey="codeCode" listValue="codeName" indexKey="" indexValue="= 선택 ="/>
						</div>
					</div>
				 	<div class="form-group row" id="folderPath" style="display:none">
						<label class="col-sm-3">메뉴경로</label>
						<div class="col-sm-9">
							<tt:select id="007001" className="form-control-sm" name="folderPaths" class="w50" list="${boardList }" listKey="boardCode" listValue="boardName" indexKey="" indexValue="= 선택 ="/>
							<tt:select id="007002" className="form-control-sm" name="folderPaths" class="w50" list="${pageList }" listKey="pageCode" listValue="pageName" indexKey="" indexValue="= 선택 ="/>
							<tt:select id="007004" className="form-control-sm" name="folderPaths" class="w50" list="${formList }" listKey="formCode" listValue="formName" indexKey="" indexValue="= 선택 ="/>
							<input type="text" name="folderPaths" class="form-control" id="007003">
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
<script src="/common/js/jquery.nestable.js"></script>
<script>
	$('#nestable').nestable({
		maxDepth : 3,
		listNodeName: 'ul',
		listClass:'list-group',
		itemClass:'list-group-item',
		expandBtnHTML: '<button data-action="expand" class="nestable-button"></button>',
		collapseBtnHTML: '<button data-action="collapse" class="nestable-button"></button>'
	})
	
	$("#createbtnclick").on('click', function(){
		$('#createpopup').modal('show');
		$('#form2')[0].reset();
		$('#folderPath').hide();
	});
	
	$('#menuType').change(function(event){
		var value = $(this).val();
		var el =  document.getElementById(value);
		$('#folderPath').show();
		$('#folderPath :input').hide();
		$(el).show();
		if($('input[name=folderPath]').val() != ''){
			$(el).val($('input[name=folderPath]').val());
		}
	})
	$(':input[name=folderPaths]').change(function(event){
		var value = $(this).val();
		$('input[name=folderPath]').val(value);
	})
	
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
	function edit(seq,name, path, detail, use, parent, level, mparent, mType) {
		
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
		menuType = oFormObject.elements["menuType"];
		menuIdx.value = seq;
		menuName.value=name;
		menuPath.value=path;
		menuDetail.value=detail;
		newCase.addClass('d-none');
		oldCase.removeClass('d-none');
		parentPid.classList.remove('d-none');
		parentMain.classList.add('d-none');
		menuLevel.value = level;
		var opts = menuType.options;
		for (var opt, j = 0; opt = opts[j]; j++) {
			if (parseInt(opt.value) == mType) {
				menuType.selectedIndex = j;
				break;
				}
			}
		$('#menuType').trigger('change')
		
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