<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	페이지관리 - 글쓰기
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="../page_proc.do" method="post">
			<input type="hidden" name="pseq" value="${search.pseq}" />
			<div class="card">
				<div class="card-header">
					<h3 class="scon_tit2">페이지등록</h3>
				</div>
				<div class="card-body">
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">메뉴 <span class="text-danger">*</span></label>
						<div class="col-lg-10">
							<div class="input-group mb-3">
								<tt:select list="${listGroup }" name="pageGroupSeq" listKey="groupSeq" listValue="groupName" indexKey="0" indexValue="= 페이지 그룹 =" selected="${vo.pageGroupSeq }" />
								<a onclick="javascript:openPop('', 'pageGroup');" class="btn btn-primary">그룹관리</a>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">우선순위</span>
								</div>
								<select name="priority" class="form-control">
<c:set var="prioritySeleceted" value="" />							
<c:forEach var="i" begin="1" end="10" varStatus="s">
	<c:set var="prioritySeleceted" value="" />
	<c:if test="${vo.priority eq i }">
		<c:set var="prioritySeleceted" value=" selected" />
	</c:if>
									<option value="${i }"${prioritySeleceted }>${i }</option>
</c:forEach>
								</select>
							</div>
							<span class="form-text text-danger">※페이지 관리 편의를 위한 그룹 (그룹내에서 페이지 우선 순위, 작을수록 순위가 높음)</span>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">페이지명 <span class="text-danger">*</span></label>
						<div class="col-lg-10">
							<input name="pageName" class="form-control" value="${vo.pageName }" maxlength="" type="text"/>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">jsp 연결</label>
						<div class="col-lg-10">
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customYnY" name="customYn" class="custom-control-input" ${vo.customYn == 'Y'?'checked':'' } value="Y">
								<label class="custom-control-label" for="customYnY">사용</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customYnN" name="customYn" class="custom-control-input" ${vo.customYn == 'N'?'checked':'' } value="N">
								<label class="custom-control-label" for="customYnN">안사용</label>
							</div>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">페이지URL</label>
						<div class="col-lg-10">
<c:set var="port" />						
<c:if test="${pageContext.request.serverPort != 80 && pageContext.request.serverPort != 443 }">
	<c:set var="port" value=":${pageContext.request.serverPort }"/>
</c:if>	
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">http://${pageContext.request.serverName }${port }</span>
								</div>
								<input name="pageUrl" class="input form-control" value="${vo.pageUrl }" type="text"/>
							</div>
							<div class="form-text text-danger">※페이지URL은 <b>/URL주소</b> 형식대로 입력해 주세요.</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">페이지 CODE</label>
						<div class="col-lg-10">
							<input name="pageCode" class="input form-control" value="${vo.pageCode }" type="text"/>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-lg-2 col-form-label">페이지 내용</label>
						<div class="col-lg-10">
							<textarea name="pageBody" id="pageBody" class="w100" style="height:450px;"  class="editor">${vo.pageBody }</textarea>
							<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
							<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
							<script type="text/javascript">
								CKEDITOR.replace('pageBody', {
									width : '100%'
									, height : '420px'
									, startupFocus : false
								});
							</script>
						</div>
					</div>
					
				</div>
				<div class="card-footer">
					<div class="container-fluid">
						<div class="row justify-content-center">
							<div class="col-6 col-sm-2">
								<a onclick="javascirpt:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>
							</div>
							<div class="col-6 col-sm-2">
								<a onclick="javascirpt:$.Nav('go', '../list_pages.do');" class="btn btn-dark btn-block btn-lg">목록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<div class="modal fade" id="modal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
     		<div class="modal-header">
        		<h5 class="modal-title" id="modalLabel"></h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
     			</button>
      		</div>
			<div class="modal-body">
				<iframe src="/mgr/page/page_group_popup" id="test"></iframe>
			</div>
		</div>
	</div>
</div>
<script id="groupTmpl" type="text/x-jquery-tmpl">
		<option value="0">= 페이지 그룹 =</option>
{{each group}}
		<option value="\${groupSeq}">\${groupName}</option>
{{/each}}
</script>

<script type="text/javascript">
	
	function updateGroup() {
		$.ajax({
			url: '../ajax/update_group.do'
			, type: 'post'
			, dataType: 'json'
			, data: { 
			}
			, success: function (data) {
				//console.log(data);
				if (data.result != null) {
					var selectedValue = $('select[name=pageGroupSeq]').val();
					//console.log('>>>>>>>> selectedValue : ' + selectedValue)
					$('select[name=pageGroupSeq]').empty();
					$('#groupTmpl').tmpl({group: data.result}).appendTo('select[name=pageGroupSeq]');
					
					$('select[name=pageGroupSeq]').val(selectedValue);
				}
			}
			, error: function (data) {
				alert('Request Exception (' + data.status + ')\n' + data.statusText);
			}
		});
	}
	
	function doSubmit() {
		if (isNull($('input[name=pageName]').val())) {
			alert('페이지명을 입력 해주세요.');
			$('input[name=pageName]').focus();
			return;
		}
		if (isNull($('input[name=pageCode]').val())) {
			alert('페이지명을 입력 해주세요.');
			$('input[name=pageCode]').focus();
			return;
		}
		
		var sBody = CKEDITOR.instances.pageBody.getData();
		$('textarea[name=pageBody]').val(sBody);
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>