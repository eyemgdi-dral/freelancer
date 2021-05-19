<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원 관리 - 회원등록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

<div class="main-content">
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
	
	<div class="container-fluid mt--6">
		<form id="form1" action="./member_proc.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="phone" value="" />
			<input type="hidden" name="mobile" value="" />
			<input type="hidden" name="mseq" value="${search.mseq }" />
			<input type="hidden" name="userType" value="${vo.userType }" />
			<div class="card">
				<div class="card-body">
					<div class="container-fluid">
						<div class="row">
						
							<div class="col-lg-12">
								<div class="form-group row" id="idchk">
		<c:if test="${setting.iDFlag > 0 }"> 
			<c:set var="ck" />
			<c:if test="${search.mseq > 0 }"> 
				<c:set var="ck">readonly</c:set>	
			</c:if>	
									<label class="col-lg-2 col-form-label">아이디 <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<div class="input-group">
											<input type="text" name="userId"  value="${vo.userId }" ${ck } class="form-control" maxlength="24" />
											<input type="hidden" name="checkedMem" />
			<c:if test="${search.mseq <= 0 }"> 
											<a onclick="javascript:doCheck('user');" class="btn btn-dark">중복 체크</a>
			</c:if>	
										</div>
									</div>
		</c:if>
		<c:if test="${setting.passwordFlag > 0 }"> 
									<label class="col-lg-2 col-form-label">비밀번호 <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<input type="password" name="userPwd" class="form-control" maxlength="24" />
									</div>
		</c:if>
								</div>
							</div>
<c:if test="${setting.nameFlag > 0 }"> 
							<div class="col-lg-12">
								<div class="form-group row" >
									<label class="col-lg-2 col-form-label">이름 <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<input type="text" name="userName" maxlength="100" class="form-control" value="${vo.userName }" required />
									</div>
									<label class="col-lg-2 col-form-label">회원등급 <span class="text-danger">*</span></label>
									<div class="col-lg-4">
										<tt:select list="${grade }" id="gradeRole" indexKey="0" indexValue="= 선택 =" name="gradeLevel" listKey="gradeLevel" listValue="gradeName"  selected="${vo.gradeLevel }"/>
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.phoneFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">전화번호 ${setting.phoneFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<c:set var="wphone" value="${fn:split(vo.phone, '-')}"/>
										<div class="input-group">
											<input ${setting.phoneFlag == 2 ? 'required' : ''} type="text" name="phoneA"  class="form-control inputPhone onlyNumber" value="${wphone[0]}"/>
											<input ${setting.phoneFlag == 2 ? 'required' : ''} type="text" name="phoneB" class="form-control inputPhone onlyNumber" value="${wphone[1]}" />
											<input ${setting.phoneFlag == 2 ? 'required' : ''} type="text" name="phoneC"  class="form-control inputPhone onlyNumber" value="${wphone[2]}" />
										</div>
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.mobileTelFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">휴대폰 ${setting.mobileTelFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<c:set var="wmobile" value="${fn:split(vo.mobile, '-')}"/>
										<div class="input-group">
											<input ${setting.mobileTelFlag == 2 ? 'required' : ''} type="text" name="mobileA" class="form-control inputPhone onlyNumber" value="${wmobile[0]}"/>
											<input ${setting.mobileTelFlag == 2 ? 'required' : ''} type="text" name="mobileB" class="form-control inputPhone onlyNumber" value="${wmobile[1]}"/>
											<input ${setting.mobileTelFlag == 2 ? 'required' : ''} type="text" name="mobileC" class="form-control inputPhone onlyNumber" value="${wmobile[2]}"/>
										</div>
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.emailFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">이메일 ${setting.emailFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" name="email" class="form-control" maxlength="100" value="${vo.email }" />
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.nickNameFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">닉네임 ${setting.nickNameFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" name="nickname" class="form-control" maxlength="48" value="${vo.nickname }" ${setting.nickNameFlag == 2 ? 'required' : ''} />
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.comPhoneFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">회사전화 ${setting.comPhoneFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" name="compPhone" class="form-control" maxlength="24" value="${vo.compPhone }" ${setting.comPhoneFlag == 2 ? 'required' : ''} />
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.juminFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">주민번호 ${setting.juminFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" name="virtualNumber" maxlength="13" class="form-control" value="${vo.virtualNumber }" ${setting.juminFlag == 2 ? 'required' : ''} />
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.homepageFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">홈페이지 ${setting.homepageFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" name="homepage" maxlength="24" class="form-control" value="${vo.homepage }" ${setting.homepageFlag == 2 ? 'required' : ''} />
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.iconFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">아이콘 ${setting.iconFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<div class="input-group">
											<input type="file" name="iconfile" class="form-control" ${setting.iconFlag == 2  && !fn:contains(vo.icon, 'image/') ? 'required' : ''} />
			<c:if test="${fn:contains(vo.icon, 'image/')}">
											<a href="${UPLOAD_ROOT }${vo.icon}" class="btn btn-dark">파일</a>
			</c:if>
										</div>
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.photoFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">사진 ${setting.photoFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<div class="input-group">
											<input type="file" name="iconfile" class="form-control" ${setting.iconFlag == 2  && !fn:contains(vo.icon, 'image/') ? 'required' : ''} />
											<input type="file" name="photofile" class="form-control" ${setting.photoFlag == 2 && !fn:contains(vo.photo, 'image/') ? 'required' : ''} />
			<c:if test="${fn:contains(vo.photo, 'image/')}">
											<a href="${UPLOAD_ROOT }${vo.photo}" class="btn btn-dark">파일</a>
			</c:if>
										</div>
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.birthdayFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">생년월일 ${setting.birthdayFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<div class="input-group">
							                <div class="input-group-prepend">
							                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
							                </div>
											<input type="text" name="birthDt" class="form-control datepicker" maxlength="24" value="${vo.birthDt }" ${setting.birthdayFlag == 2 ? 'required' : ''}  />
							            </div>
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.recommendFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">추천인 ${setting.recommendFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" name="recommUserId" maxlength="24" class="form-control" value="${vo.recommUserId }" ${setting.recommendFlag == 2 ? 'required' : ''}  />
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.emailReceiveFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">이메일 수신 ${setting.emailReceiveFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="emailYnY" name="emailYn" class="custom-control-input" value="Y">
											<label class="custom-control-label" for="emailYnY">예</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="emailYnN" name="emailYn" class="custom-control-input" value="N">
											<label class="custom-control-label" for="emailYnN">아니오</label>
										</div>
									</div>
								</div>
								<script>
									$(function() {
										checkRadio('emailYn', '${vo.emailYn}', 'Y');
									});
								</script>
							</div>
</c:if>
<c:if test="${setting.sMSReceiveFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">SMS 수신 ${setting.sMSReceiveFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="smsYnY" name="smsYn" class="custom-control-input" value="Y">
											<label class="custom-control-label" for="smsYnY">예</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="smsYnN" name="smsYn" class="custom-control-input" value="N">
											<label class="custom-control-label" for="smsYnN">아니오</label>
										</div>
									</div>
								</div>
								<script>
									$(function() {
										checkRadio('smsYn', '${vo.smsYn}', 'Y');
									});
								</script>
							</div>
</c:if>
<c:if test="${setting.addrFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">주소 ${setting.addrFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<div class="input-group mb-2">
											<input  ${setting.addrFlag == 2 ? 'required' : ''} type="text" class="form-control mb5" name="zipcode" value="${vo.zipcode }" readonly onclick="javascript:openSearchAddress('zipcode', 'addr1', 'addr2');"/>
											<a onclick="javascript:openSearchAddress('zipcode', 'addr1', 'addr2');" class="btn btn-dark">주소찾기</a>								
										</div>
										<input  ${setting.addrFlag == 2 ? 'required' : ''} type="text" class="form-control mb-2" name="addr1" value="${vo.addr1 }" readonly onclick="javascript:openSearchAddress('zipcode', 'addr1', 'addr2');" />
										<input  ${setting.addrFlag == 2 ? 'required' : ''} type="text" class="form-control" maxlength="1000" name="addr2" value="${vo.addr2 }" />
									</div>
								</div>
							</div>
</c:if>
<c:if test="${setting.faxFlag > 0 }"> 
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">메모 ${setting.faxFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<textarea  ${setting.faxFlag == 2 ? 'required' : ''} name="memo" maxlength="2000" class="form-control" rows="5">${vo.memo }</textarea>
									</div>
								</div>
							</div>
</c:if>
<c:forEach begin="1" end="5" varStatus="loop">
	<s:eval var="etcFlag" expression="setting.etc${loop.index}Flag" />
	<s:eval var="etcType" expression="setting.etc${loop.index}Type" />
	<s:eval var="etcName" expression="setting.etc${loop.index}Name" />
	<s:eval var="etcSize" expression="setting.etc${loop.index}Size" />
	<s:eval var="etcCount" expression="setting.etc${loop.index}Count" />
	<s:eval var="etcDesc" expression="setting.etc${loop.index}Desc" />
	<c:choose>
		<c:when test="${vo ne null }">
			<s:eval var="additionalItem" expression="vo.additionalItem${loop.index}" />	
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<c:if test="${etcFlag > 0 }"> 
		<c:set var="required" />						
		<c:if test="${etcFlag == 2}">
			<c:set var="required"><span class="red">*</span></c:set>
		</c:if>	
							<div class="col-lg-6">
								<div class="form-group row" >
									<label class="col-lg-3 col-form-label">${etcName} ${required}</label>
									<div class="col-lg-9">
										<input type="hidden" name="etc1Type" value="${etcType }" />
										<input type="hidden" name="etc1Flag" value="${etcFlag }" />
			<c:choose>
				<c:when test="${etcType eq 'text'}">
											<input  ${etcFlag == 2 ? 'required' : ''} type="text" class="form-control" maxlength="${etcSize }" name="additionalItem${loop.index}" placeholder="${etcName }" value="${additionalItem }" />
				</c:when>
				<c:when test="${etcType eq 'textarea'}">
											<textarea  ${etcFlag == 2 ? 'required' : ''} name="additionalItem${loop.index}" class="form-control" maxlength="${etcSize }" placeholder="${etcName }" class="w100">${additionalItem }</textarea>
				</c:when>
				<c:when test="${etcType eq 'select'}">
											<select ${etcFlag == 2 ? 'required' : ''} name="additionalItem${loop.index}" class="form-control" >
					<c:forTokens items="${etcDesc}" delims="," var="desc" varStatus="s" begin = "0" end = "${etcCount-1}">
												   <option ${fn:trim(desc) eq additionalItem ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
					</c:forTokens>
											</select>
				</c:when>
				<c:when test="${etcType eq 'radio'}">
					<c:forTokens items="${etcDesc}" delims="," var="desc" varStatus="s" begin = "0" end = "${etcCount-1}">
												<div class="custom-control custom-radio custom-control-inline">
													<input type="radio" id="r${s.index }" name="additionalItem${loop.index}" class="custom-control-input" ${desc eq additionalItem ? 'checked' : ''} value="${fn:trim(desc)}">
													<label class="custom-control-label" for="r${s.index }">${desc}</label>
												</div>
					</c:forTokens>
				</c:when>
				<c:when test="${etcType eq 'checkbox'}">
					<c:forTokens items="${etcDesc}" delims="," var="desc" varStatus="s" begin = "0" end = "${etcCount-1}">
						<c:set var="addcheck1" />	
					  	<c:forTokens items="${vo.additionalItem3}" delims="," var="item" varStatus="k">
					   		<c:if test="${item eq desc}">
					   			<c:set var="addcheck1">${item}</c:set>
					   		</c:if>
					   	</c:forTokens>
					   							<div class="custom-control custom-checkbox custom-control-inline">
										   			<input class="custom-control-input" id="etc-${loop.index }-${s.index}" type="checkbox" name="additionalItem${loop.index}" ${fn:trim(desc) eq addcheck1 ? 'checked' : ''} value="${fn:trim(desc)}" />
													<label class="custom-control-label" for="etc-${loop.index }-${s.index}">${desc}</label>
												</div>
					</c:forTokens>
				</c:when>
				<c:when test="${etcType eq 'file'}">
												<div class="input-group">
													<input type="file" ${etcFlag == 2 && !fn:contains(additionalItem, 'image/') ? 'required' : ''} name="etc1File" class="form-control"/>
					<c:if test="${fn:contains(additionalItem, 'image/')}">
													<a href="${UPLOAD_ROOT }${additionalItem}" class="btn btn-dark">파일</a>
					</c:if>
												</div>
				</c:when>
				<c:when test="${etcType eq 'datepicker'}">
												<div class="input-group">
									                <div class="input-group-prepend">
									                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
									                </div>
													<input type="text" ${etcFlag == 2 ? 'required' : ''} class="form-control datepicker" name="additionalItem${loop.index}" value="${additionalItem}" />
									            </div>
				</c:when>
				<c:when test="${etcType eq 'dtimepick'}">
												<div class="input-group">
									                <div class="input-group-prepend">
									                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
									                </div>
													<input type="text" ${etcFlag == 2 ? 'required' : ''} name="additionalItem${loop.index}" class="form-control datetimepicker" value="${additionalItem}" />
									            </div>
				</c:when>
				<c:when test="${etcType eq 'birthdate'}">
												<div class="input-group">
									                <div class="input-group-prepend">
									                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
									                </div>
													<input type="text" ${etcFlag == 2 ? 'required' : ''} name="additionalItem${loop.index}" class="form-control datepicker" value="${additionalItem}" />
									            </div>
				</c:when>
				<c:when test="${etcType eq 'mobileno'}">
											<input type="hidden" name="additionalItem${loop.index}" value="${additionalItem}" />
					<c:set var="mobileno" value="${fn:split(additionalItem, '-')}"/>
											<div class="input-group">
												<input type="text" name="phoneValueA1" class="form-control inputPhone onlyNumber" value="${mobileno[0]}" />
												<input type="text" name="phoneValueB1" class="form-control inputPhone onlyNumber" value="${mobileno[1]}"/>
												<input type="text" name="phoneValueC1" class="form-control inputPhone onlyNumber" value="${mobileno[2]}"/>
											</div>
				</c:when>
				<c:when test="${etcType eq 'address'}">
											<input type="hidden" name="additionalItem${loop.index}" value="${additionalItem}" />
					<c:set var="addressno" value="${fn:split(additionalItem, '~')}"/>
											<div class="input-group mb-2">
												<input type="text" class="form-control" name="zipCode1" readonly onclick="javascript:openSearchAddress('zipCode1', 'addrA1', 'addrB1');" value="${addressno[0] }" />
												<div class="input-group-prepend">
													<a onclick="javascript:openSearchAddress('zipCode1', 'addrA1', 'addrB1');" class="btn btn-dark">주소찾기</a>
												</div>									
											</div>
											<input type="text" class="form-control mb-2" name="addrA1" readonly onclick="javascript:openSearchAddress('zipCode1', 'addrA1', 'addrB1');" value="${addressno[1] }" />
											<input type="text" class="form-control" name="addrB1" value="${addressno[2] }" />
				</c:when>
				<c:when test="${etcType eq 'email' }">
											<input type="hidden" name="additionalItem${loop.index}" value="${additionalItem}" />
					<c:set var="semail" value="${fn:split(additionalItem, '@')}"/>
											<div class="input-group">
												<input type="text" name="emailValueA1" class="form-control" value="${semail[0] }" />
												<span class="input-group-text">@</span>
												<input type="text" name="emailValueB1" class="form-control" value="${semail[1] }" />
											</div>
				</c:when>
			</c:choose>
									</div>
								</div>
							</div>
	</c:if>
</c:forEach>
<c:if test="${setting.jobFlag > 0 }">
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">직업</label>
									<div class="col-lg-9">
										<select ${setting.jobFlag == 2 ? 'required' : ''} name="job" class="form-control">
											<c:forTokens items="${setting.jobType}" delims="," var="desc" varStatus="s" begin = "0">
											   <option ${fn:trim(desc) eq vo.job ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
											</c:forTokens>
										</select>							
									</div>
								</div>	
							</div>
</c:if>
<c:if test="${setting.educationFlag > 0 }">
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">학력</label>
									<div class="col-lg-9">						
										<select ${setting.educationFlag == 2 ? 'required' : ''} name="education" class="form-control">
											<c:forTokens items="${setting.educationType}" delims="," var="desc" varStatus="s" begin = "0">
											   <option ${fn:trim(desc) eq vo.education ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
											</c:forTokens>
										</select>
									</div>
								</div>		
							</div>
</c:if>	
<c:if test="${setting.incomeFlag > 0 }">
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">월평균소득</label>
									<div class="col-lg-9">	
										<select ${setting.incomeFlag == 2 ? 'required' : ''} name="monthIncome" class="form-control">
											<c:forTokens items="${setting.incomeType}" delims="," var="desc" varStatus="s" begin = "0">
											   <option ${fn:trim(desc) eq vo.monthIncome ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
											</c:forTokens>
										</select>
									</div>
								</div>		
							</div>
</c:if>	
<c:if test="${setting.interestFlag > 0 }">
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">관심분야</label>
									<div class="col-lg-9">	
										<select ${setting.interestFlag == 2 ? 'required' : ''} name="hobby" class="form-control">
			<c:forTokens items="${setting.interestType}" delims="," var="desc" varStatus="s" begin = "0">
			   								<option ${fn:trim(desc) eq vo.hobby ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
			</c:forTokens>
										</select>
									</div>
								</div>			
							</div>
</c:if>	
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">관리자메모</label>
									<div class="col-lg-9">	
										<textarea name="memoAdmin" class="form-control" rows="5">${vo.memoAdmin }</textarea>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">개인/회사 ${vo.userType }<span class="text-danger">*</span></label>
									<div class="col-lg-9">	
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="radPCTypeP" name="radPCType" class="custom-control-input" value="P" onclick="doPCTypeCheck(this);" 
											${vo.userType eq "P" ?"checked":''} >
											<label class="custom-control-label" for="radPCTypeP">개인</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline">
											<input type="radio" id="radPCTypeC" name="radPCType" class="custom-control-input" value="C" onclick="doPCTypeCheck(this);"
											${vo.userType eq "C" ?"checked":''}>
											<label class="custom-control-label" for="radPCTypeC">회사</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="card" id="SPCompInfo" style="display: none">
				<div class="card-header">
					<h3 class="mb-0">사업자 정보입력</h3>
				</div>
				<div class="card-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">업점업체명 ${setting.officeNameFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="form-control input"  name="officeName" maxlength="100" value="${voc.officeName }"  ${setting.officeNameFlag == 2 ? 'required' : ''} >
									</div>
								</div>							
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">사업자번호 ${setting.officeNumFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="form-control input"  name="officeNum" maxlength="20" value="${voc.officeNum }"  ${setting.officeNumFlag == 2 ? 'required' : ''}>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">대표자명 ${setting.officeOwnerNameFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="form-control input"  name="ownerName" maxlength="100" value="${voc.ownerName }"  ${setting.officeOwnerNameFlag == 2 ? 'required' : ''}>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">대표자연락처 ${setting.officeOwnerTelFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="form-control input"  name="ownerTel" maxlength="20"  value="${voc.ownerTel }"  ${setting.officeOwnerTelFlag == 2 ? 'required' : ''}>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">담당자 이름 ${setting.officeStaffNameFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="form-control input"  name="staffName" maxlength="100"  value="${voc.staffName }"  ${setting.officeStaffNameFlag == 2 ? 'required' : ''}>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">담당자 연락처 ${setting.officeStaffTelFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="form-control input"  name="staffTel" maxlength="20"  value="${voc.staffTel }"  ${setting.officeStaffTelFlag == 2 ? 'required' : ''}>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">통신판매번호 ${setting.officeObNumFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="input form-control"  name="obNum" maxlength="20"  value="${voc.obNum }"  ${setting.officeObNumFlag == 2 ? 'required' : ''}>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">업태 ${setting.officeBTypeFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="input form-control"   name="bType" maxlength="100"  value="${voc.bType }"  ${setting.officeBTypeFlag == 2 ? 'required' : ''}>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">업종 ${setting.officeBcTypeFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="input form-control"  name="bcType" maxlength="100" value="${voc.bcType }"  ${setting.officeBcTypeFlag == 2 ? 'required' : ''}>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">계산서 이메일 ${setting.officeTaxMailFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<input type="text" class="input form-control"  name="taxEmail" maxlength="100" value="${voc.taxEmail }"  ${setting.officeTaxMailFlag == 2 ? 'required' : ''}>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-row">우편번호 ${setting.officeAddrFlag == 2 ? '<span class=\"text-danger\">*</span>' : ''}</label>
									<div class="col-lg-9">
										<div class="input-group mb-2">
											<input type="text" class="form-control" name="czipCode" value="${voc.czipCode }" readonly onclick="javascript:openSearchAddress('czipCode', 'caddr1', 'caddr2');"/>
											<a onclick="javascript:openSearchAddress('czipCode', 'caddr1', 'caddr2');" class="btn btn-dark">주소찾기</a>
										</div>
										<input type="text" class="form-control mb-2" name="caddr1" value="${voc.caddr1 }" readonly onclick="javascript:openSearchAddress('czipCode', 'caddr1', 'caddr2');" />
										<input type="text" class="form-control" maxlength="200" name="caddr2" value="${voc.caddr2 }"  ${setting.officeAddrFlag == 2 ? 'required' : ''}/>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-header">
					<h3 class="mb-0">적립금 리스트</h3>
				</div>
				<div class='card-body'>
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<colgroup>
								<col width="5%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="10%" />
								<col width="10%" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>적립내용</th>
									<th>금액</th>
									<th>수정자명</th>
									<th>수정사유</th>
									<th>날짜</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty vo.cmomey}">
								<c:forEach var="m" items="${vo.cmomey}" varStatus="s">			
									<tr>
										<td class="first">${s.index+1 }</td>
										<td>${m.summary }</td>
										<td>${m.cMoney }</td>
										<td>${m.editorName }</td>
										<td>${m.reason }</td>
										<td><fmt:formatDate value="${m.regDate }"
												pattern="${DATE_FORMAT}" /></td>
										<td><a href="javascript:doWrite('${m.summary }','${m.iDx}', '${m.cMoney }', '${m.reason }')" class="btn btn-sm btn-info">보기</a>
											<a onclick="javacript:doDelete('${m.iDx}');" class="btn btn-sm btn-danger">삭제</a>
										</td>
									</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty vo.cmomey}">
								<tr>
									<td colspan="9"><s:message code="common.noData" /></td>
								</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="card">
				<div class='card-footer'>
					<div class="container-fluid">
						<div class="row justify-content-center">
							<div class="col-6 col-sm-2">
								<a onclick="javascript:doSubmit();" class="btn btn-primary btn-block btn-lg">저장</a>
							</div>
							<div class="col-6 col-sm-2">
								<a onclick="javascript:$.Nav('go', './member_list.do', {glevel:${search.glevel}});" class="btn btn-dark btn-block btn-lg">목록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
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
				<form id="form2" action="./mempoint_proc.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="iDx" value="" />
					<input type="hidden" name="mseq" value="${search.mseq }" />
					<input type="hidden" name="status" value="" />
					<div class="form-group row">
						<label class="col-sm-3">적립내용</label>
						<div class="col-sm-9">
							<input name="summary" class="form-control" value="" maxlength="100" type="text" /> 
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">금액</label>
						<div class="col-sm-9">
							<input name="cMoney" class="form-control" value="" maxlength="11" type="number" /> 
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">수정사유</label>
						<div class="col-sm-9">
							<textarea name="reason" class="form-control" style="height:150px" maxlength="100"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a onclick="javascript:createSubmit();" class="btn btn-primary">저장</a>
				<a onclick="javascript:$('#createpopup').dialog('close')" class="btn btn-secondary">닫기</a>
      		</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('#form1').validate();
	});
	
	function doCheck(type) {
		checkUserId('#idchk', 'input[name=checkedMem]', type, $('input[name=userId]').val().trim());
	}
	
	
	function doSubmit() {
		
		if (!isNull($('input[name=phoneA]').val())) {
			var $phone = $('input[name=phoneA]').val() + '-' + $('input[name=phoneB]').val() + '-' + $('input[name=phoneC]').val();
			$('input[name=phone]').val($phone);
		}
		if (!isNull($('input[name=mobileA]').val())) {
			var $mobile = $('input[name=mobileA]').val() + '-' + $('input[name=mobileB]').val() + '-' + $('input[name=mobileC]').val();
			$('input[name=mobile]').val($mobile);
		}
		
		if ($('input[name=mseq]').val() <= 0) {
			if ($('input[name=checkedMem]').val() != 'Y') {
				alert('아이디 중복검사를 해야 합니다.');
				return;
			}
			if(!checkPattern($('input[name=userPwd]').val(), 'PASSWORD')){
				alert("오류 : 비밀번호는 대문자 ( !@#$%^&\*)를 하나 이상 포함해야합니다!");
				$('input[name=userPwd]').focus();
				return false;
			}
			if(!isNull($('#gradeRole').val()) && $('#gradeRole').val() === '0'){
				alert('아이디 중복검사를 해야 합니다.');
				$('#gradeRole').focus();
				return;
			}
		}
		
		for(var i = 1; i <= 5; i++){
			var flag = $('input[name="etc'+ i +'Type"]').val();
			var req = $('input[name="etc'+ i +'Flag"]').val();
			if (req > 0 && flag === "mobileno" && !isNull($('input[name=phoneValueA'+ i +']').val())) {
				var $phoneValue = $('input[name=phoneValueA'+ i +']').val() + '-' + $('input[name=phoneValueB'+ i +']').val() + '-' + $('input[name=phoneValueC'+ i +']').val();
				$('input[name="additionalItem'+ i +'"]').val($phoneValue);
			} else if (req > 0 && flag === "email" && !isNull($('input[name=emailValueA'+ i +']').val()) && !isNull($('input[name=emailValueB'+ i +']').val())) {
				var $emailValue = $('input[name=emailValueA'+ i +']').val() + '@' + $('input[name=emailValueB'+ i +']').val();
				$('input[name="additionalItem'+ i +'"]').val($emailValue);
			} else if (req > 0 && flag === "address" && !isNull($('input[name=zipCode'+ i +']').val())) {
				var $addressValue = $('input[name=zipCode'+ i +']').val() + '~' + $('input[name=addrA'+ i +'').val() + '~' + $('input[name=addrB'+ i +']').val();
				$('input[name="additionalItem'+ i +'"]').val($addressValue);
			}
		}
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
	
	//Member Point Popup
	function doWrite(sum, id, money, rsn){
		$('#createpopup').modal('show');
		let oFormObject = document.forms['form2'];
		let summary = oFormObject.elements["summary"];
		let iDx = oFormObject.elements["iDx"];
		let cMoney = oFormObject.elements["cMoney"];
		let reason = oFormObject.elements["reason"];
		$('input[name=status]').val('');
		iDx.value = id;
		cMoney.value = money;
		reason.value = rsn;
		summary.value = sum;
		
	}
	function createSubmit(){
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form2').submit();
	}
	function doDelete(id){
		if(!confirm('삭제하시겠습니까?'))
			 return;
		
		$('input[name=iDx]').val(id);
		$('input[name=status]').val('d');
		$('#form2').attr('method', 'post');
		$('#form2').submit();	
	}
	
	//개인 C or 회사 P 체크 : P 일시 추가 정보 입력
	function doPCTypeCheck(obj) {
		$("input[name=userType]").val($(obj).val());
		if ($(obj).val() == 'C') {
			$('#SPCompInfo').show()
		} else {
			$('#SPCompInfo').hide()
		}
	}

</script>


<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>