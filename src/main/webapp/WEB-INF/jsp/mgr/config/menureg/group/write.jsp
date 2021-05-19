<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 메인게시물 - 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<div class="card">
			<div class="card-body">
			
			
				<form id="form1" name="form1" action="./group_proc.do" method="post">	
					<input type="hidden" name="xD" value="${search.xD }" />
					<input type="hidden" name="idX" value="${vo.idX }" />
					<div id="menuAuthList">
						<%-- <c:forEach items="${vo.menuAuthList }" var="v" varStatus="status">
							<input type="hidden" name="menuAuthList[${status.index}].menuAuthoGroupIdx" value="${v.menuId }">
							<input type="hidden" name="menuAuthList[${status.index}].groupId" value="${v.groupId }"> 
							<input type="hidden" name="menuAuthList[${status.index}].menuId" value="${v.menuId }"> 
							<input type="hidden" name="menuAuthList[${status.index}].authoList" value="${v.authoList }"> 
							<input type="hidden" name="menuAuthList[${status.index}].authoView" value="${v.authoView }"> 
							<input type="hidden" name="menuAuthList[${status.index}].authoWrite" value="${v.authoWrite }"> 
							<input type="hidden" name="menuAuthList[${status.index}].authoModify" value="${v.authoModify }"> 
							<input type="hidden" name="menuAuthList[${status.index}].authoDelete" value="${v.authoDelete }"> 
						</c:forEach> --%>
					</div>
					<div class="form-group">
						<label class="form-group-label">권한그룹명</label>
						<input type="text" id="authoTitle" name="authoTitle" class="form-control" maxlength="200" value="${vo.authoTitle }" />
					</div>
					<div class="form-group">
						<label class="form-group-label">설명</label>
						<textarea name="authoContents" rows="3" cols="" class="form-control">${vo.authoContents }</textarea>
					</div>
					
					<table class="table table-responsive table-bordered table-sm">
						<colgroup>
							<col width="5%" />
							<col width="*" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
						</colgroup>
						<thead class="table-info">
							<tr>
								<th>레벨</th>
								<th>메뉴명 </th>
								<th><label><input type="checkbox" id="checkAll" style="background:#E0F3FD" />전체</label></th>
								<th><label><input type="checkbox" id="chekcL" style="background:#E0F3FD"/>조회</label></th>
								<th><label><input type="checkbox" id="checkE" style="background:#E0F3FD" />등록</label></th>
								<th><label><input type="checkbox" id="checkED" style="background:#E0F3FD" />수정/삭제</label></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty menuList}">
								<c:forEach items="${menuList }" var="m" varStatus="s">
									<tr class="menuAuthor" id="${m.menuIdx }" >
										<td>${m.menuLevel}</td>
										<td>
											<div class="txt-left">
												<div class="
													<c:if test = "${m.menuLevel == 1}">main-hide</c:if>
													<c:if test = "${m.menuLevel == 2}">main-parent pl-4</c:if>
													<c:if test = "${m.menuLevel == 3}">main-parent main-child pl-5</c:if>">
													${m.menuName }
												</div>
											</div>
										</td>
										<c:set var="lvrole" />
										<c:set var="wrole" />
										<c:set var="mdrole" />
										<c:set var="aId" />
										<c:forEach items="${vo.menuAuthList }" var="v" varStatus="status">
											<c:if test="${v.menuId == m.menuIdx}">
												<c:set var="aId" >${v.menuAuthoGroupIdx}</c:set>
											</c:if>
											<c:if test="${v.menuId eq m.menuIdx && (v.authoList eq m.authList || v.authoView eq m.authView)}"> 
												<c:set var="lvrole">checked</c:set>	
											</c:if>	
											<c:if test="${v.menuId eq m.menuIdx && v.authoWrite eq m.authWrite}"> 
												<c:set var="wrole">checked</c:set>	
											</c:if>		
											<c:if test="${v.menuId eq m.menuIdx && v.authoModify eq m.authModify && v.authoDelete eq m.authDelete}"> 
												<c:set var="mdrole">checked</c:set>	
											</c:if>			
										</c:forEach>
										<td><input type="checkbox" name="checkAll" id="${aId}" /></td>
										<td><input type="checkbox" name="chekcL" ${lvrole } data-menu-id="${m.menuIdx}" data-parent-id="${m.parentIdx}" data-auth-list="${m.authList }" data-auth-view="${m.authView }" /></td>
										<td><input type="checkbox" name="checkE" ${wrole} data-auth-write="${m.authWrite }" /></td>
										<td><input type="checkbox" name="checkED"${mdrole} data-auth-modify="${m.authModify }" data-auth-delete=${m.authDelete } /></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty menuList}">
								<tr>
									<td colspan="6"><s:message code="common.noData" /></td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<ul class="summmit_btn">
						<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
						<li><a onclick="javascript:$.Nav('go', './list', null, null, true );" class="btn2 bg_darkgray">취소</a></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>


<!--wrap_scon S-->
<div id="wrap_scon">


	<div class="scon_title">
		<h2>권한 그룹별 메뉴권한 설정</h2>
		<p>홈 &gt; 환경설정  &gt; 권한관리 </p>
	</div>

	<div class="scon">

	

	</div>
</div>


<script type="text/javascript">	
	$('input[type="checkbox"]').on('change', function(e){
		switch(e.target.id) {  
			case 'checkAll':
		        $('input[type="checkbox"]').prop('checked', e.target.checked);
		        break;
		    case 'chekcL':
		    	$('input[name="chekcL"]').prop('checked', e.target.checked);
		        break;
		    case 'checkE':
		    	$('input[name="checkE"]').prop('checked', e.target.checked);
		    	$('input[name="checkE"]').parent().prev().children().prop('checked', e.target.checked);
		        break;
		    case 'checkED':
		    	$('input[name="checkED"]').prop('checked', e.target.checked);
		    	$('input[name="checkED"]').parent().prev().prev().children().prop('checked', e.target.checked);
		        break;
		    default:
		    	break;
		}
		
		switch(e.target.name) {  
		case 'checkAll':
			$(this).parent().siblings().find('input[type="checkbox"]').prop('checked', e.target.checked);
	        break;
		case 'checkE':
			$(this).parent().prev().children().prop('checked', e.target.checked);
	        break;
		case 'checkED':
			$(this).parent().prev().prev().children().prop('checked', e.target.checked);
	        break;
		case 'chekcL':
			findParents($(this).data('parent-id'), e.target.checked);
	        break;
	    default:
	    	break;
		}
	});
	function doSubmit() {	
		if(isNull($('#authoTitle').val()) || $('#authoTitle').val() === '0'){
			alert('그룹명을 선택해야 합니다.');
			return;
		}
		if (!confirm('저장하시겠습니까?'))
			return;
		
		const menus = document.querySelectorAll('.menuAuthor');
		const form = document.form1;
		const menuAuthList = form.querySelector('#menuAuthList');
		menuAuthList.innerHTML = '';
		let j = 0;
		$.each(menus, function(i, a){
			debugger
			if(!isNull(a.childNodes[5].firstChild.id) || a.childNodes[7].firstChild.checked || a.childNodes[9].firstChild.checked || a.childNodes[11].firstChild.checked){
				const menuAuthoGroupIdx = document.createElement("input");
				menuAuthoGroupIdx.name = 'menuAuthList['+ j +'].menuAuthoGroupIdx';
				menuAuthoGroupIdx.value = a.childNodes[5].firstChild.id;
				menuAuthoGroupIdx.hidden = true;
				const menuId = document.createElement("input");
				menuId.name = 'menuAuthList['+ j +'].menuId';
				menuId.value = a.id;
				menuId.hidden = true;
				const authoList = document.createElement("input");
				authoList.name = 'menuAuthList['+ j +'].authoList';
				authoList.value = a.childNodes[7].firstChild.checked || a.childNodes[9].firstChild.checked || a.childNodes[11].firstChild.checked ? a.childNodes[7].firstChild.getAttribute('data-auth-list') : '';
				authoList.hidden = true;
				const authoView = document.createElement("input");
				authoView.name = 'menuAuthList['+ j +'].authoView';
				authoView.value = a.childNodes[7].firstChild.checked || a.childNodes[9].firstChild.checked || a.childNodes[11].firstChild.checked ? a.childNodes[7].firstChild.getAttribute('data-auth-view') : '';
				authoView.hidden = true;
				const authoWrite = document.createElement("input");
				authoWrite.name = 'menuAuthList['+ j +'].authoWrite';
				authoWrite.value = a.childNodes[9].firstChild.checked ? a.childNodes[9].firstChild.getAttribute('data-auth-write') : '';
				authoWrite.hidden = true;
				const authoModify = document.createElement("input");
				authoModify.name = 'menuAuthList['+ j +'].authoModify';
				authoModify.value = a.childNodes[11].firstChild.checked ? a.childNodes[11].firstChild.getAttribute('data-auth-modify') : '';
				authoModify.hidden = true;
				const authoDelete = document.createElement("input");
				authoDelete.name = 'menuAuthList['+ j +'].authoDelete';
				authoDelete.value = a.childNodes[11].firstChild.checked ? a.childNodes[11].firstChild.getAttribute('data-auth-delete') : '';
				authoDelete.hidden = true;
				debugger
				form.querySelector('#menuAuthList').appendChild(menuAuthoGroupIdx);
				form.querySelector('#menuAuthList').appendChild(menuId);
				form.querySelector('#menuAuthList').appendChild(authoList);
				form.querySelector('#menuAuthList').appendChild(authoView);
				form.querySelector('#menuAuthList').appendChild(authoWrite);
				form.querySelector('#menuAuthList').appendChild(authoModify);
				form.querySelector('#menuAuthList').appendChild(authoDelete);
				j++;
			}
		});
		form.submit();
	}
	
	function findParents(parentId, check){
		let bigParent = '';
		const midP = $('[data-menu-id='+ parentId +']');
		midP.prop('checked', check);
		bigParent = midP.data('parent-id');
		$('[data-menu-id='+ bigParent +']').prop('checked',  check);
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>