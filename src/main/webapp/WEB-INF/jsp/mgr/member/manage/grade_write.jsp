<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원등급 관리 - 상세
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="./grade_proc.do" method="post">
			<input type="hidden" name="glevel" value="${search.glevel }" />
			<div class="card">
				<div class="card-body">
					<div class="container-fluid">
						<div class="form-group row">
							<label class="col-lg-2 col-form-label"> 등급 이름 <span class="text-danger">*</span></label>
							<div class="col-lg-4" id="tdBoardCode">
								<input type="text" name="gradeName" class="form-control" maxlength="12" value="${vo.gradeName }" /> 
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-2 col-form-label"> 회원등급<span class="text-danger">*</span></label>
							<div class="col-lg-4" id="tdGradeLevel">
								<div class="input-group">
<c:if test="${empty vo }">						
									<select name="gradeLevel" class="form-control">
	<c:forEach var="i" begin="2" end="20" varStatus="s">
										<option value="${i }">${i }</option>
	</c:forEach>							
									</select>
									<a onclick="javascript:doCheckGradeLevel();" class="btn btn-dark">등급 확인</a>
									<input type="hidden" name="checkedGradeLevel" />
</c:if>
								</div>
								<span class="form-text text-danger">※ 회원 등급은 숫자가 낮을수록 높은 등급이 됩니다.</span>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-2 col-form-label">설명</label>
							<div class="col-lg-4">
								<textarea name="gradeMemo" rows="3" cols="70" class="form-control">${vo.gradeMemo }</textarea>
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
								<a onclick="javascript:$.Nav('go', './grade_list.do', {glevel:''});" class="btn btn-dark btn-block btn-lg">취소</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>

<script id="groupTmpl" type="text/x-jquery-tmpl">
		<option value="0">= 게시판 그룹 =</option>
{{each group}}
		<option value="\${groupSeq}">\${groupName}</option>
{{/each}}
</script>

<script type="text/javascript">
	$(function() {
		$('select[name=gradeLevel]').change(function() {
			$('input[name=checkedGradeLevel]').val('');
		});
	});
	
	function doCheckGradeLevel() {
		$('input[name=checkedGradeLevel]').val('');
		var $gl = $('select[name=gradeLevel]');
		
		oLoader('#tdGradeLevel'
			, './ajax/check_grade_level.do'
			, 'post'
			, {
				key: $gl.val()
			}
			, false
			, function(data) {
				if (data.result) {
					alert(data.result + ' 회원등급은 사용할 수 없습니다.');
					$('input[name=checkedGradeLevel]').val('N');
					return;
				}
				else {
					alert('사용 가능한 회원등급 입니다.');
					$('input[name=checkedGradeLevel]').val('Y');
				}
			}
		);
	};
	
	function doSubmit() {
		
		if ($('input[name=gradeName]').val().trim().length == 0) {
			alert('회원등급 이름을 입력해야 합니다.');
			return;
		}
		 
		//등록 상태일 때
		if($('select[name=gradeLevel]').length > 0) {
			if ($('input[name=checkedGradeLevel]').val() != 'Y') {
				alert('회원등급 중복 검사를 해야 합니다.');
				return;
			}	
		}
		
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>