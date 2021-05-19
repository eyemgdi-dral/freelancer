<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 상세
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>


<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	<div class="container-fluid mt--6">
		<form id="form1" action="./board_proc" method="post">
			<input name="pointWrite" type="hidden" value="0">
			<input name="pointComment" type="hidden" value="0">
			<input name="pointMaxDay" type="hidden" value="0">
			<input name="pointMaxMember" type="hidden" value="0">
			<div class="card">
				<div class="card-header">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-6">
								<a onclick="javascript:$.Nav('go', './board_list', {bcode:''});" class="btn btn-sm btn-light">게시판 목록</a>
							</div>
<c:if test="${!empty vo }">	
							<div class="col-sm-6 text-right">
								<a onclick="javascript:$.Nav('go', '../list/${vo.boardCode}', {bcode:''});" class="btn btn-sm btn-orange">${vo.boardName } 게시물 목록</a>
							</div>
</c:if>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group row" id="tdBoardCode">
									<label class="col-lg-4 col-form-label">게시판 코드<span class="text-danger">*</span></label>
									<div class="col-lg-8">
<c:if test="${empty vo }">
										<div class="input-group">
											<input type="text" name="boardCode" class="form-control" style="ime-mode: inactive;" maxlength="20" />
											<div class="input-group-append">
												<a onclick="javascript:doCheckBoardCode();" class="btn btn-dark">중복검사</a>
											</div>
											<input type="hidden" name="checkedBoardCode" />
										</div>
</c:if>
<c:if test="${!empty vo }">
										<input type="text" name="boardCode" class="form-control" maxlength="20" readonly value="${vo.boardCode }" />	
</c:if>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">게시판 이름<span class="text-danger">*</span></label>
									<div class="col-lg-8">
										<input type="text" name="boardName" class="form-control" value="${vo.boardName }" />
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">게시판 그룹</label>
									<div class="col-lg-8">
										<div class="input-group mb-3"  data-toggle="tooltip" data-placement="top" title="※ 게시판 관리 편의를 위한 그룹 - 왼쪽 메뉴에 게시판이 그룹핑되어 나타납니다.">
											<tt:select name="groupSeq" list="${listGroup }" listKey="groupSeq" listValue="groupName" indexKey="0" indexValue="= 게시판 그룹 =" selected="${vo.groupSeq }"/> 
											<div class="input-group-append">
												<a onclick="javascript:openPop('', 'boardGroup');" class="btn btn-dark">그룹 관리</a> 
											</div>
										</div>
										<div class="form-inline">
											<span class="">그룹 정렬번호 : </span> 
											<select name="priority" class="form-control form-control-sm mx-3">
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
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">카테고리</label>
									<div class="col-lg-8">
<c:if test="${!empty vo}">
									<div class="input-group mb-3">
										<tt:select name="boardCategory" list="${vo.boardCategoryVO }" listKey="bcSeq" listValue="cateName" indexKey="" indexValue="= 카테고리 =" />
										<div class="input-group-append">
											<a onclick="javascript:openPop('?bcode=${vo.boardCode}', 'boardCategory');" class="btn btn-dark">카테고리 관리</a>
										</div>
									</div>
</c:if>
<c:if test="${empty vo}">
							<span class="form-text text-danger" style="float: none;">※ 게시판 추가 후 카테고리를 관리할 수 있습니다.</span>
</c:if>	
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">게시판 관리자</label>
									<div class="col-lg-8">
										<input type="text" name="boardAdmin" class="" value="${vo.boardAdmin }" />
										<script>
											$(function() {
												$('input[name=boardAdmin]').selectize({
													persist: false
													, create: false
													, allowEmptyOption: true
													, valueField: 'userID'
													, labelField: 'userName'
													, searchField: 'userName'
													, options : JSON.parse('${listAdmin }') || JSON.parse('[]')
												});
											});
										</script>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">게시판 형태<span class="text-danger">*</span></label>
									<div class="col-lg-8">
										<tt:select id="boardTypeFixedCode" name="boardTypeFixedCode" class="w50" list="${listBoardType }" listKey="codeCode" listValue="codeName" indexKey="" indexValue="= 선택 =" selected="${vo.boardTypeFixedCode }"/>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">게시판 스킨</label>
									<div class="col-lg-8">
										<input type="text" name="cssPrefix" class="form-control" style="ime-mode: disabled;" value="${vo.cssPrefix }" />
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">권한 (회원등급)</label>
									<div class="col-lg-8">
<c:if test="${!empty listGrade }">
										<a class="btn btn-dark" onclick="openperPopop();">관한 관리</a>
										
										<div class="modal fade" id="perPopop" tabindex="-1" role="dialog" aria-labelledby="createpopupLab" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered" role="document">
												<div class="modal-content">
										     		<div class="modal-header">
										        		<h5 class="modal-title" id="exampleModalLabel">메뉴 등록</h5>
										        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										          			<span aria-hidden="true">&times;</span>
										     			</button>
										      		</div>
													<div class="modal-body">
														<table class="table table-sm table-bordered">
															<tbody>
																<tr>
																	<th>목록보기</th>
																	<td>
																		<tt:select name="authList" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authList }"/>
																	</td>
																</tr>
																<tr>
																	<th>내용보기</th>
																	<td>
																		<tt:select name="authView" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authView }"/>
																	</td>
																</tr>
																<tr>
																	<th>글쓰기</th>
																	<td>
																		<tt:select name="authWrite" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authWrite }"/>
																	</td>
																</tr>
																<tr>
																	<th>답글쓰기</th>
																	<td>
																		<tt:select name="authReply" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authReply }"/>
																	</td>
																</tr>
																<tr>
																	<th>코멘트쓰기</th>
																	<td>
																		<tt:select name="authComment" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authComment }"/>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>	
</c:if>
<c:if test="${empty listGrade }">
										<span class="red">회원등급이 설정되지 않았습니다. [회원관리 &gt; 회원등급 관리] 메뉴에서 회원 등급을 설정해야 합니다.</span>
										<input type="hidden" name="authList" value="0" />
										<input type="hidden" name="authView" value="0" />
										<input type="hidden" name="authWrite" value="0" />
										<input type="hidden" name="authReply" value="0" />
										<input type="hidden" name="authComment" value="0" />
</c:if>				
										<span class="form-text text-red">
										※ [관리자]를 선택하면 일반 사용자는 권한이 부여되지 않습니다. [전체]를 선택하면 비회원도 권한이 부여됩니다.
										</span>
									</div>
								</div>
							</div>
							
							<div class="col-lg-12">
								<div class="form-group row">
									<label class="col-lg-2 col-form-label">권한 없을 경우 처리</label>
									<div class="col-lg-5">
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<div class="input-group-text">
													경고 메시지 : 
												</div>
											</div>
												<input type="text" name="noAuthMsg" class="form-control" value="${empty vo.noAuthMsg ? '권한이 없습니다.' : vo.noAuthMsg}" /><br/>
										</div>
									</div>
									<div class="col-lg-5">
										<div class="input-group ">
											<div class="input-group-prepend">
												<div class="input-group-text">
													경고 후 이동 페이지 : 
												</div>
											</div>
												<input type="text" name="noAuthRedirect" class="form-control" value="${vo.noAuthRedirect }" />
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">자동 비밀글</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="secretYn" name="secretYn" value="Y">
												<label class="custom-control-label" for="secretYn">운영자와 작성자만 열람 가능</label>
												<input type="hidden" name="autoSecretYn" />
											</div>
											<script>
												$(function() {
													checkCheckbox('secretYn', 'autoSecretYn', '${vo.autoSecretYn}', 'N');
												});
											</script>
										</div>
									</div>
								</div>
							</div>
							
							<!-- <div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">이미지 첨부파일 정렬</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="previewImageAlignLeft" name="previewImageAlign" class="custom-control-input" value="left">
												<label class="custom-control-label" for="previewImageAlignLeft">좌측</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="previewImageAlignCenter" name="previewImageAlign" class="custom-control-input" value="center">
												<label class="custom-control-label" for="previewImageAlignCenter">가운데</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="previewImageAlignRight" name="previewImageAlign" class="custom-control-input" value="right">
												<label class="custom-control-label" for="previewImageAlignRight">우측</label>
											</div>
											<script>
												$(function() {
													checkRadio('previewImageAlign', '${vo.previewImageAlign}', 'left');
												});
											</script>
										</div>
									</div>
								</div>
							</div> -->
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">이미지 파일</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="previewImage" name="previewImage" value="Y">
												<label class="custom-control-label" for="previewImage">첨부파일이 이미지인 경우 보기 페이지에서 이미지 보이기</label>
												<input type="hidden" name="previewImageYn" value="${vo.previewImageYn }"/>
											</div>
											<script>
												$(function() {
													checkCheckbox('previewImage', 'previewImageYn', '${vo.previewImageYn}', 'N');
												});
											</script>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">이미지 크기</label>
									<div class="col-6 col-lg-4">
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text">목록 : </div>
											</div>
											<input type="text" name="imageSizeWidth" class="form-control onlyNumber" value="${empty vo.imageSizeHeight ? '0' : vo.imageSizeHeight}" />
										</div>
									</div>
									<div class="col-6 col-lg-4">
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text">보기 : </div>
											</div>
											<input type="text" name="imageSizeHeight" class="form-control onlyNumber" value="${empty vo.imageSizeWidth ? '0' : vo.imageSizeWidth}" />
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">상세 보기 하단<br/> 목록 표시</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="showListYnY" name="showListYn" class="custom-control-input" value="Y">
												<label class="custom-control-label" for="showListYnY">사용</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="showListYnN" name="showListYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="showListYnN">미사용</label>
											</div>
										</div>
										<script>
											$(function() {
												checkRadio('showListYn', '${vo.showListYn}', 'N');
											});
										</script>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">이전글 다음글 표시</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="showPrevNextYnY" name="showPrevNextYn" class="custom-control-input" value="Y">
												<label class="custom-control-label" for="showPrevNextYnY">사용</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="showPrevNextYnN" name="showPrevNextYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="showPrevNextYnN">미사용</label>
											</div>
										</div>
										<script>
											$(function() {
												checkRadio('showPrevNextYn', '${vo.showPrevNextYn}', 'N');
											});
										</script>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">스팸 체크 기능</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="checkSpamYnY" name="checkSpamYn" class="custom-control-input" value="Y">
												<label class="custom-control-label" for="checkSpamYnY">사용</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="checkSpamYnN" name="checkSpamYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="checkSpamYnN">미사용</label>
											</div>
										</div>
										<script>
											$(function() {
												checkRadio('checkSpamYn', '${vo.checkSpamYn}', 'N');
											});
										</script>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">작성자 표시 형식</label>
									<div class="col-lg-8">
										<tt:select list="${writerFormats }" name="writerFormatFixedCode" listKey="codeCode" listValue="codeName" indexKey="" indexValue="= 작성자 형식 =" selected="${vo.writerFormatFixedCode }"/>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">날짜 형식(목록)</label>
									<div class="col-lg-8">
<c:set var="today" value="<%=new Date() %>"></c:set>
										<select name="dateFormatList" class="form-control">
<c:forEach items="${dateFormats }" var="m" varStatus="s">
											<option value="${m }"<c:if test="${m eq vo.dateFormatList }"> selected</c:if>><fmt:formatDate value="${today }" pattern="${m}"/></option>
</c:forEach>
										</select>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">날짜 형식(상세)</label>
									<div class="col-lg-8">
										<select name="dateFormatView" class="form-control">
<c:forEach items="${dateFormats }" var="m" varStatus="s">
											<option value="${m }"<c:if test="${m eq vo.dateFormatView }"> selected</c:if>><fmt:formatDate value="${today }" pattern="${m }"/></option>
</c:forEach>							
										</select>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">웹 에디터 사용</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="editorYnY" name="editorYn" class="custom-control-input" value="Y">
												<label class="custom-control-label" for="editorYnY">사용</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="editorYnN" name="editorYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="editorYnN">미사용</label>
											</div>
										</div>
										<script>
											$(function() {
												checkRadio('editorYn', '${vo.editorYn}', 'Y');
											});
										</script>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">적립금 지급 여부</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="pointYnY" name="pointYn" class="custom-control-input" value="Y">
												<label class="custom-control-label" for="pointYnY">사용</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="pointYnN" name="pointYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="pointYnN">미사용</label>
											</div>
										</div>
										<script>
											$(function() {
												checkRadio('pointYn', '${vo.pointYn}', 'N');
											});
										</script>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">추천 기능</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="recommYnY" name="recommYn" class="custom-control-input" value="Y">
												<label class="custom-control-label" for="recommYnY">사용</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="recommYnN" name="recommYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="recommYnN">미사용</label>
											</div>
										</div>
										<script>
											$(function() {
												checkRadio('recommYn', '${vo.recommYn}', 'N');
											});
										</script>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">코멘트 기능</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="commentYnY" name="commentYn" class="custom-control-input" value="Y">
												<label class="custom-control-label" for="commentYnY">사용</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="commentYnN" name="commentYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="commentYnN">미사용</label>
											</div>
										</div>
										<script>
											$(function() {
												checkRadio('commentYn', '${vo.commentYn}', 'N');
											});
										</script>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">코멘트 기능</label>
									<div class="col-lg-8">
										<select name="fileUploadCount" class="form-control">
											<option value="0">사용안함</option>
<c:forEach var="i" begin="1" end="5" step="1">
											<option value="${i }"<c:if test="${i eq vo.fileUploadCount }"> selected</c:if>>${i }개</option>
</c:forEach>
										</select>
									</div>
								</div>
							</div>
							
<c:if test="${vo.commentYn eq 'Y'}">
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">Comment Level</label>
									<div class="col-lg-8">
										<input type="number" name="commentLevel" class="form-control" value="${vo.commentLevel }">
									</div>
								</div>
							</div>
</c:if>

							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">한 페이지 <br/>게시물 개수</label>
									<div class="col-lg-8">
										<input type="text" name="pagerRowCount" class="form-control onlyNumber" value="${empty vo.pagerRowCount ? 10 : vo.pagerRowCount}" />
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">페이저 개수</label>
									<div class="col-lg-8">
										<input type="text" name="pagerBlockCount" class="form-control onlyNumber" value="${empty vo.pagerBlockCount ? 10 : vo.pagerBlockCount}" />
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">새 게시물 표시 기간</label>
									<div class="col-lg-8">
										<input type="text" name="newPeriod" class="form-control w20 onlyNumber" value="${empty vo.newPeriod ? 2 : vo.newPeriod}" />
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">hot 조회 수</label>
									<div class="col-lg-8">
										<input type="text" name="hotCount" class="form-control onlyNumber" value="${empty vo.hotCount ? 100 : vo.hotCount}" />
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">제목 글자 수</label>
									<div class="col-lg-8">
										<input type="text" name="lfCount" class="form-control onlyNumber" value="${empty vo.lfCount ? 4 : vo.lfCount}" />
										<div class="form-text text-danger" >※ 포토갤러리 형식일 경우</div>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">줄바꿈 게시물 수</label>
									<div class="col-lg-8">
										<input type="text" name="subjectCharCount" class="form-control onlyNumber" value="${empty vo.subjectCharCount ? 100 : vo.subjectCharCount}" />
									</div>
								</div>
							</div>
							
							<div class="col-lg-12">
								<div class="form-group row">
									<label class="col-lg-2 col-form-label">욕설, 비방 필터링</label>
									<div class="col-lg-10">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="filtering" name="filtering" value="Y">
											<label class="custom-control-label" for="filtering">사용 (공백 사용금지, 콤마(,)구분)</label>
											<input type="hidden" name="filteringYn" value="" />
										</div>
										<script>
											$(function() {
												checkCheckbox('filtering', 'filteringYn', '${vo.filteringYn}', 'N');
											});
										</script>
										<br/>
										<textarea name="filter" class="form-control" rows="3" cols="70">${vo.filter }</textarea>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label">게시판 사용 여부</label>
									<div class="col-lg-8">
										<div class="h-100 d-flex align-items-center">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="useYnY" name="useYn" class="custom-control-input" value="Y">
												<label class="custom-control-label" for="useYnY">사용</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="useYnN" name="useYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="useYnN">미사용</label>
											</div>
										</div>
										<script>
											$(function() {
												checkRadio('useYn', '${vo.useYn}', 'Y');
											});
										</script>
									</div>
								</div>
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
								<a onclick="javascript:$.Nav('go', './board_list', {bcode:''});" class="btn btn-dark btn-block btn-lg">취소</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</form>
	</div>
</div>

<script id="groupTmpl" type="text/x-jquery-tmpl">
		<option value="0">= 게시판 그룹 =</option>
{{each group}}
		<option value="\${groupSeq}">\${groupName}</option>
{{/each}}
</script>

<script id="categoryTmpl" type="text/x-jquery-tmpl">
		<option value="">= 카테고리 =</option>
{{each category}}
		<option value="\${bcSeq}">\${cateName}</option>
{{/each}}
</script>

<script type="text/javascript">
	$(function() {
		
	});
	
	function openperPopop(){
		$('#perPopop').modal();
	}
	function doCheckBoardCode() {
		$('input[name=checkedBoardCode]').val('');
		var $bc = $('input[name=boardCode]');
		
		if ($bc.val().trim().length == 0) {
			alert('게시판 코드를 입력한 후 중복검사 버튼을 클릭해 주세요.');
			return;
		}
		
		if (!checkPattern($bc.val(), 'BOARD_CODE')) {
			alert('게시판 코드는 첫 글자 영문, 4자리 이상, 10자리 이하의 영문 또는 숫자의 문자열로 구성해야 합니다.');
			return;
		}
		
		
		oLoader('#tdBoardCode'
			, './ajax/check_board_code'
			, 'post'
			, {
				key: $bc.val().trim()
			}
			, false
			, function(data) {
				if (data.result) {
					alert(data.result + '게시판 코드는 사용할 수 없습니다.');
					$('input[name=checkedBoardCode]').val('N');
					return;
				}
				else {
					alert('사용 가능한 게시판 코드입니다.');
					$('input[name=checkedBoardCode]').val('Y');
				}
			}
		);
	};
	
	//부모 페이지 - 게시판 그룹 셀렉트 박스 업데이트
	function updateGroup() {
		$.ajax({
			url: './ajax/update_group'
			, type: 'post'
			, dataType: 'json'
			, data: { 
			}
			, success: function (data) {
				console.log(data);
				if (data.result != null) {
					var selectedValue = $('select[name=groupSeq]').val();
					//console.log('>>>>>>>> selectedValue : ' + selectedValue)
					$('select[name=groupSeq]').empty();
					$('#groupTmpl').tmpl({group: data.result}).appendTo('select[name=groupSeq]');
					
					$('select[name=groupSeq]').val(selectedValue);
				}
			}
			, error: function (data) {
				alert('Request Exception (' + data.status + ')\n' + data.statusText);
			}
		});
	}
	
	//부모 페이지 - 게시판 카테고리 셀렉트 박스 업데이트
	function updateCategory() {
		$.ajax({
			url: './ajax/update_category'
			, type: 'post'
			, dataType: 'json'
			, data: {
				bcode: '${vo.boardCode }'
			}
			, success: function (data) {
				if (data.result != null) {
					var selectedValue = $('select[name=boardCategory]').val();
					$('select[name=boardCategory]').empty();
					$('#categoryTmpl').tmpl({category: data.result}).appendTo('select[name=boardCategory]');
					
					$('select[name=boardCategory]').val(selectedValue);
				}
			}
			, error: function (data) {
				alert('Request Exception (' + data.status + ')\n' + data.statusText);
			}
		});
	}
	
	function doSubmit() {
		//checkedBoardCode
		var $cbc = $('input[name=checkedBoardCode]');
		if ($cbc.length > 0) {
			if ($('input[name=checkedBoardCode]').val() != 'Y') {
				alert('게시판 코드 중복 검사를 해야 합니다.');
				return;
			}
		}
		
		if ($('input[name=boardName]').val().trim().length == 0) {
			alert('게시판 이름을 입력해야 합니다.');
			return;
		}
		
		if ($('select[name=boardTypeFixedCode]').val() == '') {
			alert('게시판 형태를 선택해야 합니다.');
			return;
		}
		
		//var status = '${search.status}';
		//if (status == 'i') {
		//	
		//}
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>