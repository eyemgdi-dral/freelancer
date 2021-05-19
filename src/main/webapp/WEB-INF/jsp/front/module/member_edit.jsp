<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
 <script type="text/javascript" src="/common/js/jquery.inputmask.min.js"></script><%-- 회원가입페이지 --%>
 <jsp:include page="/module/menu" flush="true" />
 <%@ include file="/WEB-INF/include/lnb/join.jsp"%>
 

<%-- 회원가입페이지 --%>

		<div class="col-lg-10">
			<form id="formJoin" action="/mypage/member_proc.do" method="post" enctype="multipart/form-data">
				<div class="card">
					<div class="card-header">
						<div class="row align-items-center">
							<div class="col-8">
								<h3 class="mb-0">회원 정보</h3>
							</div>
							<div class="col-4 text-right">
								<a href="#!" class="btn btn-sm btn-primary">수정하기</a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<input type="hidden" name="mseq" value="${empty vo.memberSeq ? 0 : vo.memberSeq }">
						
						<h6 class="heading-small text-muted mb-4">사용자 정보</h6>
						
						<div class="pl-4">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
				<c:if test="${empty  vo.memberSeq}">
										<label class="form-control-label">아이디</label>
										<input type="text" class="form-control" autocomplete="username" required placeholder="사용할 아이디를 입력하세요." name="userId" maxlength="20" id="userId" onkeyup="this.value=this.value.replace(/[^0-9|a-zA-z]/g,'')">
										<span class="form-text" id="userIdCheck"></span>
				</c:if>
				<c:if test="${!empty vo.memberSeq }">
										${vo.userId }
				</c:if>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">이름</label>
										<input type="text" class="form-control"  name="userName" maxlength="100" value="${vo.userName }" required placeholder="이름">
									</div>
								</div>
				<c:if test="${empty  vo.memberSeq}">
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">비밀번호</label>
										<div class="input-group input-group-merge input-group-alternative">
											<div class="input-group-prepend">
												<span class="input-group-text">
												<i class="ni ni-lock-circle-open"></i></span>
											</div>
											<input type="password" class="form-control" autocomplete="new-password" name="userPwd" placeholder="8~20자 이내의 영문 및 숫자" maxlength="20" required>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">비밀번호 확인</label>
										<div class="input-group input-group-merge input-group-alternative">
											<div class="input-group-prepend">
												<span class="input-group-text">
												<i class="ni ni-lock-circle-open"></i></span>
											</div>
											<input type="password" class="form-control" autocomplete="new-password" name="userPwd2" maxlength="20" placeholder="비밀번호를 다시 입력하세요." required>
										</div>
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.nickNameFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">닉네임</label>
										<input type="text" name="nickname" placeholder="닉네임" maxlength="24" class="form-control" value="${vo.nickname }" ${configVO.nickNameFlag == 2 ? 'required' : ''} />
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.juminFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">주민번호</label>
										<div class="input-group input-group-merge input-group-alternative">
											<input type="text" name="virtualNumber" placeholder="주민번호" maxlength="13" class="form-control" value="${vo.virtualNumber }" ${configVO.juminFlag == 2 ? 'required' : ''} />
										</div>
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.photoFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">사진</label>
										<div class="input-group input-group-merge input-group-alternative">
											<input type="file" class='form-control' placeholder="사진" name="photofile" ${configVO.photoFlag == 2 && !fn:contains(vo.photo, 'image/') ? 'required' : ''} />
											<c:if test="${fn:contains(vo.photo, 'image/')}">
												<div class="input-group-append">
													<a href="${UPLOAD_ROOT }${vo.photo}" class="btn">파일</a>
												</div>
											</c:if>
										</div>
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.iconFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">아이콘</label>
										<div class="input-group input-group-merge input-group-alternative">
											<input type="file" name="iconfile" class='form-control' placeholder="아이콘" ${configVO.iconFlag == 2  && !fn:contains(vo.icon, 'image/') ? 'required' : ''} />
											<c:if test="${fn:contains(vo.icon, 'image/')}">
												<div class="input-group-append">
													<a href="${UPLOAD_ROOT }${vo.icon}" class="btn">파일</a>
												</div>
											</c:if>
										</div>
									</div>
								</div>
				</c:if>
							</div>
						</div>
						<hr class="my-4">
						
						<h6 class="heading-small text-muted mb-4">연락 정보</h6>
						
						<div class="pl-4">
							<div class="row">
									
				<c:if test="${configVO.phoneFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">전화번호</label>
										<input type="text" name="phone" placeholder="전화번호" class="form-control" value="${vo.phone }"
												data-mask="999-9999-9999" maxlength="13" ${configVO.phoneFlag == 2 ? 'required' : ''} >
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.mobileTelFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">휴대전화</label>
										<input type="text" name="mobile" placeholder="휴대전화"
										class="form-control" value="${vo.mobile }"
										data-mask="999-9999-9999" maxlength="13" ${configVO.mobileTelFlag == 2 ? 'required' : ''} >
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.emailFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">이메일</label>
										<input ${configVO.emailFlag == 1 ? 'required' : ''} placeholder="이메일" maxlength="30" type="text" class="form-control"
										name="email" value="${vo.email}" id="email">
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.comPhoneFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">회사전화</label>
										<input type="text" name="compPhone" placeholder="회사전화" data-mask="999-9999-9999" maxlength="24" class="form-control" value="${vo.compPhone }" ${configVO.comPhoneFlag == 2 ? 'required' : ''} />
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.addrFlag > 0 }"> 
								<div class="col-lg-12">
									<div class="form-group">
										<label class="form-control-label">주소</label>
										<div class="row">
											<div class="col-sm-4">
												<div class="input-group input-group-merge input-group-alternative">
													<input name="zipcode" placeholder="주소" type="text" class="form-control" readonly onclick="getPostcode('P');" value="${vo.zipcode }">
													<div class="input-group-prepend">
														<a href="javascript:getPostcode('P');" class="btn btn-primary">우편번호찾기</a>
													</div>
												</div>
											</div>
											<div class="col-sm-4">
												<input ${configVO.addrFlag == 2 ? 'required' : ''} name="addr1" id="Addr1" type="text" class="form-control" readonly onclick="getPostcode('P');" value="${vo.addr1 }">
											</div>
											<div class="col-sm-4">
												<input name="addr2"  maxlength="1000" id="Addr2" type="text" class="form-control" value="${vo.addr2 }">
											</div>
										</div>
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.sMSReceiveFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">SMS 수신여부</label>
										<div class="h-100">
											<div class="custom-control custom-radio custom-control-inline ml-auto">
												<input type="radio" id="smsYnY" name="smsYn" class="custom-control-input" value="Y">
												<label class="custom-control-label" for="smsYnY">수신</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="smsYnN" name="smsYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="smsYnN">수신안함</label>
											</div>
										</div>
									</div>
								</div>
				</c:if>
				<c:if test="${configVO.emailReceiveFlag > 0 }"> 
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">이메일 수신여부</label>
										<div class="h-100">
											<div class="custom-control custom-radio custom-control-inline ml-auto">
												<input type="radio" id="emailYnY" name="emailYn" class="custom-control-input" ${configVO.emailReceiveFlag == 2 ? 'required' : ''}  value="Y">
												<label class="custom-control-label" for="emailYnY">수신</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="emailYnN" name="emailYn" class="custom-control-input" value="N">
												<label class="custom-control-label" for="emailYnN">수신안함</label>
											</div>
										</div>
									</div>
								</div>
				</c:if>
							</div>
						</div>
						<hr class="my-4">
						<h6 class="heading-small text-muted mb-4">연락 정보</h6>
						
						<div class="pl-4">
							<div class="row">
								
<c:forEach begin="1" end="5" varStatus="loop">
	<s:eval var="etcFlag" expression="configVO.etc${loop.index}Flag" />
	<s:eval var="etcType" expression="configVO.etc${loop.index}Type" />
	<s:eval var="etcName" expression="configVO.etc${loop.index}Name" />
	<s:eval var="etcSize" expression="configVO.etc${loop.index}Size" />
	<s:eval var="etcCount" expression="configVO.etc${loop.index}Count" />
	<s:eval var="etcDesc" expression="configVO.etc${loop.index}Desc" />
	<c:if test="${vo ne null }">
			<s:eval var="additionalItem" expression="vo.additionalItem${loop.index}" />
	</c:if>
	
	<c:if test="${etcFlag > 0 }"> 
		<c:set var="required" />						
		<c:if test="${etcFlag == 2}">
			<c:set var="required"><span class="red">*</span></c:set>
		</c:if>	
	</c:if>
					<div class="col-lg-6">
						<div class="form-group">
							<label class="form-control-label">${etcName} ${required}</label>
							<div class="">
								<input type="hidden" name="etc1Type" value="${etcType }" />
								<input type="hidden" name="etc1Flag" value="${etcFlag }" />
				<c:choose>
					<c:when test="${etcType eq 'text'}">
								<input  ${etcFlag == 2 ? 'required' : ''} type="text" class="form-control" maxlength="${etcSize }" name="additionalItem${loop.index}" placeholder="${etcName }" value="${additionalItem }" />
					</c:when>
					<c:when test="${etcType eq 'textarea'}">
								<textarea ${etcFlag == 2 ? 'required' : ''} name="additionalItem${loop.index}" maxlength="${etcSize }" placeholder="${etcName }" class="form-control">${additionalItem }</textarea>
					</c:when>
					<c:when test="${etcType eq 'select'}">
								<select ${etcFlag == 2 ? 'required' : ''} name="additionalItem${loop.index}" class="form-control">
						<c:forTokens items="${etcDesc}" delims="," var="desc" varStatus="s" begin = "0" end = "${etcCount-1}">
									   <option ${fn:trim(desc) eq additionalItem ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
						</c:forTokens>
								</select>
					</c:when>
					<c:when test="${etcType eq 'radio'}">
						<c:forTokens items="${etcDesc}" delims="," var="desc" varStatus="s" begin = "0" end = "${etcCount-1}">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="r${loop.index }${s.index }" name="additionalItem${loop.index}" class="custom-control-input" ${desc eq additionalItem ? 'checked' : ''} value="${fn:trim(desc)}">
									<label class="custom-control-label" for="r${loop.index }${s.index }">${desc}</label>
								</div>
						</c:forTokens>
					</c:when>
					<c:when test="${etcType eq 'checkbox'}">
						<c:forTokens items="${etcDesc}" delims="," var="desc" varStatus="s" begin = "0" end = "${etcCount-1}">
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" id="r${loop.index }${s.index }" name="additionalItem${loop.index}" class="custom-control-input" ${desc eq additionalItem ? 'checked' : ''}  value="${fn:trim(desc)}">
									<label class="custom-control-label" for="r${loop.index }${s.index }">${desc}</label>
								</div>
						</c:forTokens>
					</c:when>
					<c:when test="${etcType eq 'file'}">
								<div class="input-group input-group-merge input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text">
										<i class="ni ni-album-2"></i></span>
									</div>
									<input type="file" class="form-control" ${etcFlag == 2 && !fn:contains(additionalItem, 'image/') ? 'required' : ''} name="etc1File" />
									<c:if test="${fn:contains(additionalItem, 'image/')}">
										<div class="input-group-append">
											<a href="${UPLOAD_ROOT }${additionalItem}" class="btn">파일</a>
										</div>
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
									<input type="text" ${etcFlag == 2 ? 'required' : ''} name="additionalItem${loop.index}" class="form-control datetimepicker" value="${additionalItem}" />
					            </div>
					</c:when>
					<c:when test="${etcType eq 'mobileno'}">
								<div class="input-group">
									<input type="hidden" name="additionalItem${loop.index}" value="${additionalItem}" />
									<c:set var="mobileno" value="${fn:split(additionalItem, '-')}"/>
									<input type="text" name="phoneValueA1" class="inputPhone form-control onlyNumber" value="${mobileno[0]}" />
									<input type="text" name="phoneValueB1" class="inputPhone form-control onlyNumber" value="${mobileno[1]}"/>
									<input type="text" name="phoneValueC1" class="inputPhone form-control onlyNumber" value="${mobileno[2]}"/>
								</div>
					</c:when>
					<c:when test="${etcType eq 'address'}">
						<div class="input-group mb-2">
							<input type="hidden" name="additionalItem${loop.index}" value="${additionalItem}" />
							<c:set var="addressno" value="${fn:split(additionalItem, '~')}"/>
							<input type="text" class="form-control" name="zipCode${loop.index}" readonly onclick="javascript:openSearchAddress('zipCode${loop.index}', 'addrA${loop.index}', 'addrB${loop.index}');" value="${addressno[0] }" />
							<div class="input-group-append">
								<a onclick="javascript:openSearchAddress('zipCode${loop.index}', 'addrA${loop.index}', 'addrB${loop.index}');" class="btn btn-primary">주소찾기</a>					
							</div>
						</div>
						<input type="text" class="form-control mb-2" name="addrA${loop.index}" readonly onclick="javascript:openSearchAddress('zipCode${loop.index}', 'addrA${loop.index}', 'addrB${loop.index}');" value="${addressno[1] }" />
						<input type="text" class="form-control" name="addrB${loop.index}" value="${addressno[2] }" />
					</c:when>
					<c:when test="${etcType eq 'email' }">
						<div class="input-group">
							<input type="hidden" name="additionalItem${loop.index}" value="${additionalItem}" />
							<c:set var="semail" value="${fn:split(additionalItem, '@')}"/>
							<input type="text" class="form-control" name="emailValueA${loop.index}" value="${semail[0] }" />
							<div class="input-group-append">
								<div class="input-group-text">@</div>
							</div>
							<input type="text" class="form-control" name="emailValueB${loop.index}" value="${semail[1] }" />
						</div>
					</c:when>
				</c:choose>
							</div>
						</div>
					</div>
</c:forEach>
							</div>
						</div>
						<hr class="my-4">
							<h6 class="heading-small text-muted mb-4">기타 정보</h6>
							
							<div class="pl-4">
								<div class="row">
							<c:if test="${configVO.jobFlag > 0 }">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">직업</label>
											<select ${configVO.jobFlag == 2 ? 'required' : ''} name="job"  class="form-control">
												<c:forTokens items="${configVO.jobType}" delims="," var="desc" varStatus="s" begin = "0">
												   <option ${fn:trim(desc) eq vo.job ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
												</c:forTokens>
											</select>
										</div>
									</div>
							</c:if>
							<c:if test="${configVO.educationFlag > 0 }">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">학력</label>
											<select ${configVO.educationFlag == 2 ? 'required' : ''} name="education" class="form-control">
												<c:forTokens items="${configVO.educationType}" delims="," var="desc" varStatus="s" begin = "0">
												   <option ${fn:trim(desc) eq vo.education ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
												</c:forTokens>
											</select>
										</div>	
									</div>
							</c:if>	
							<c:if test="${configVO.incomeFlag > 0 }">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">월평균소득</label>
											<select ${configVO.incomeFlag == 2 ? 'required' : ''} name="monthIncome" class="form-control">
												<c:forTokens items="${configVO.incomeType}" delims="," var="desc" varStatus="s" begin = "0">
												   <option ${fn:trim(desc) eq vo.monthIncome ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
												</c:forTokens>
											</select>
										</div>
									</div>
							</c:if>	
							<c:if test="${configVO.interestFlag > 0 }">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">관심분야</label>
											<select ${configVO.interestFlag == 2 ? 'required' : ''} name="hobby" class="form-control">
												<c:forTokens items="${configVO.interestType}" delims="," var="desc" varStatus="s" begin = "0">
												   <option ${fn:trim(desc) eq vo.hobby ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
												</c:forTokens>
											</select>
										</div>	
									</div>
							</c:if>							
								</div>
							</div>
						
						
					</div>
				</div>
		<c:if test="${vo.userType }"></c:if>
				<div class="card bg-secondary border-0 mb-0"  id="SPCompInfo" style="display:none">
					<div class="card-header">사업자 정보입력</div>
					<div class="card-body">
						<div class="pl-4">
							<div class="row">
								<c:if test="${configVO.officeNameFlag > 0 }"> 
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">업점업체명 ${configVO.officeNameFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="officeName" company maxlength="100" value="${voc.officeName }"  ${configVO.officeNameFlag == 2 ? 'required' : ''} >
										</div>
									</div>	
								</c:if>
								
								<c:if test="${configVO.officeNumFlag > 0 }">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">사업자번호 ${configVO.officeNumFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="officeNum" company maxlength="100" value="${voc.officeNum }"  ${configVO.officeNumFlag == 2 ? 'required' : ''} >
										</div>	
									</div>
								</c:if>
								<c:if test="${configVO.officeOwnerNameFlag > 0 }"> 
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">대표자명 ${configVO.officeOwnerNameFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="ownerName" company maxlength="100" value="${voc.ownerName }"  ${configVO.officeOwnerNameFlag == 2 ? 'required' : ''} >
										</div>	
									</div>
								</c:if>
								<c:if test="${configVO.officeOwnerTelFlag > 0 }">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">대표자연락처 ${configVO.officeOwnerTelFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="ownerTel" company maxlength="100" value="${voc.ownerTel }"  ${configVO.officeOwnerTelFlag == 2 ? 'required' : ''} >
										</div>
									</div>
								</c:if>
								<c:if test="${configVO.officeStaffNameFlag > 0 }">
									<div class="col-lg-6"> 
										<div class="form-group">
											<label class="form-control-label">담당자 이름 ${configVO.officeStaffNameFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="staffName" company maxlength="100" value="${voc.staffName }"  ${configVO.officeStaffNameFlag == 2 ? 'required' : ''} >
										</div>	
									</div>
								</c:if>
								<c:if test="${configVO.officeStaffTelFlag > 0 }">
									<div class="col-lg-6">				
										<div class="form-group">
											<label class="form-control-label">담당자 연락처 ${configVO.officeStaffTelFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="staffTel" company maxlength="100" value="${voc.staffTel }"  ${configVO.officeStaffTelFlag == 2 ? 'required' : ''} >
										</div>
									</div>	
								</c:if>
								<c:if test="${configVO.officeObNumFlag > 0 }">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">통신판매번호 ${configVO.officeObNumFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="obNum" company maxlength="100" value="${voc.obNum }"  ${configVO.officeObNumFlag == 2 ? 'required' : ''} >
										</div>
									</div>	
								</c:if>
								<c:if test="${configVO.officeBTypeFlag > 0 }">
									<div class="col-lg-6"> 
										<div class="form-group">
											<label class="form-control-label">업태 ${configVO.officeBTypeFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="bType" company maxlength="100" value="${voc.bType }"  ${configVO.officeBTypeFlag == 2 ? 'required' : ''} >
										</div>
									</div>	
								</c:if>
								<c:if test="${configVO.officeBcTypeFlag > 0 }">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label">업종 ${configVO.officeBcTypeFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="bcType" company maxlength="100" value="${voc.bcType }"  ${configVO.officeBcTypeFlag == 2 ? 'required' : ''} >
										</div>
									</div>
								</c:if>
								<c:if test="${configVO.officeTaxMailFlag > 0 }">
									<div class="col-lg-6"> 
										<div class="form-group">
											<label class="form-control-label">계산서 이메일 ${configVO.officeTaxMailFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<input type="text" class="form-control" name="taxEmail" company maxlength="100" value="${voc.taxEmail }"  ${configVO.officeTaxMailFlag == 2 ? 'required' : ''} >
										</div>
									</div>
								</c:if>
								<c:if test="${configVO.officeAddrFlag > 0 }">
									<div class="col-lg-12">
										<div class="form-group">
											<label class="form-control-label">우편번호 ${configVO.officeAddrFlag == 2 ? '<span class=\"text-red\">*</span>' : ''}</label>
											<div class="row">
												<div class="col-sm-4">
													<div class="input-group mb-2">
														<input type="text" class="form-control" name="czipCode" value="${voc.czipCode }" readonly onclick="javascript:openSearchAddress('czipCode', 'caddr1', 'caddr2');"/>
														<div class="input-group-append">
															<a onclick="javascript:openSearchAddress('czipCode', 'caddr1', 'caddr2');" class="btn btn-primary">주소찾기</a>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<input type="text" class="form-control" name="caddr1" value="${voc.caddr1 }"  readonly onclick="javascript:openSearchAddress('czipCode', 'caddr1', 'caddr2');" />
												</div>
												<div class="col-sm-4">
													<input type="text" class="form-control" name="caddr2" value="${voc.caddr2 }" company ${configVO.officeAddrFlag == 2 ? 'required' : ''} />
												</div>
											</div>
										</div>
									</div>	
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</form>
			
			<div class="row mt-3">
				<div class="col-6 ">
					<a onclick="javascript:doSubmit()" class="btn btn-block btn-lg btn-primary">
						회원가입
					</a>
				</div>
				<div class="col-6 ">
					<a onclick="javascript:$.Nav('self', null, null, true)" class="btn btn-block btn-lg btn-dark">
						<small>취소</small>
					</a>
				</div>
			</div>
			
		</div>
	</div>
</div>
				
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	//$('#formJoin').validate();
});
	$(function() {
		//중복아이디체크 
		$('input[name=userId]').change(
				function() {

					var sUserId = trim($('input[name=userId]').val());
					$('input[name=userId]').val(
							trim($('input[name=userId]').val()));

					if (sUserId != '') {
						if (sUserId.length < 4) {
							$('#userIdCheck').attr('class', 'mL10 red bold');
							$('#userIdCheck').text('아이디는 4~15자로 입력하세요.');

						} else {
							$.ajax({
								type : 'post',
								url : '/ajax/checkId.do',
								data : {
									id : sUserId
								},
								dataType : 'json',
								success : function(data) {
									if (data.result == null) {
										$('#userIdCheck').attr('class',
												'mL10 blue bold');
										$('#userIdCheck').text(
												'사용 가능한 아이디 입니다.');

									} else {
										$('#userIdCheck').attr('class',
												'mL10 red bold');
										$('#userIdCheck').text(
												'사용 불가능한 아이디 입니다.');
									}
								}
							});
						}

					} else {
						$('#userIdCheck').removeClass('blue');
						$('#userIdCheck').text('사용할 아이디를 입력하세요.');
					}
				});

		//비밀번호 체크
		$('input[name=userPwd], input[name=userPwd2]')
				.change(
						function() {
							//공백 제거
							var sUserPwd = trim($('input[name=userPwd]').val());
							$('input[name=userPwd]').val(
									trim($('input[name=userPwd]').val()));
							var sUserPwd2 = trim($('input[name=userPwd2]')
									.val());
							$('input[name=userPwd2]').val(
									trim($('input[name=userPwd2]').val()));

							if (sUserPwd.length < 8) {
								$('#userPwdCheck').prop('class',
										'mL10 red bold');
								$('#userPwdCheck').text(
										'비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능합니다.');

							} else {
								$('#userPwdCheck').prop('class',
										'mL10 blue bold');
								$('#userPwdCheck').text('비밀번호가 입력되었습니다.');
							}

							if (sUserPwd != '' && sUserPwd2 != '') {
								if (sUserPwd != sUserPwd2) {
									$('#userPwdCheck2').prop('class',
											'mL10 red bold');
									$('#userPwdCheck2').text('비밀번호가 다릅니다.');

								} else {
									$('#userPwdCheck2').prop('class',
											'mL10 blue bold');
									$('#userPwdCheck2').text('비밀번호가 일치 합니다.');
								}
							}
							/* re = /[0-9]/;
						    if(!re.test(sUserPwd)) {
						    	$('#userPwdCheck').prop('class', 'mL10 red bold');
								$('#userPwdCheck').text('오류 : 비밀번호는 하나 이상의 숫자 (0-9)를 포함해야합니다!');
							}
						    re = /[a-z]/;
						    if(!re.test(sUserPwd)) {						        
						        $('#userPwdCheck').prop('class',
								'mL10 red bold');
								$('#userPwdCheck').text(
								'오류 : 비밀번호는 소문자 (a-z)를 하나 이상 포함해야합니다!');
						    }
						    re = /[A-Z]/;
						    if(!re.test(sUserPwd)) {
						        $('#userPwdCheck').prop('class','mL10 red bold');
								$('#userPwdCheck').text('오류 : 비밀번호는 대문자 (A-Z)를 하나 이상 포함해야합니다!');
							}
							re = /[!@#\$%\^&\*]/;
							if(!re.test(sUserPwd)) {
						        $('#userPwdCheck').prop('class','mL10 red bold');
								$('#userPwdCheck').text('오류 : 비밀번호는 대문자 (!@#$%^&\*)를 하나 이상 포함해야합니다!');
							} */
							if(!checkPattern(sUserPwd, 'PASSWORD')){
								$('#userPwdCheck').prop('class','mL10 red bold');
								$('#userPwdCheck').text('오류 : 비밀번호는 대문자 (!@#$%^&\*)를 하나 이상 포함해야합니다!');
							}
						});

		$('select[name=emailCode]').change(function() {
			$('input[name=email2]').val($(this).val());
		});

		//개인 회사 체크
		doPCTypeCheck('');

		var phone = '${vo.phone}';
		phone = phone.split('-');
		for ( var i in phone) {
			var index = parseInt(i) + 1;
			eval('$("input[name=phone' + index + ']")').val(phone[i]);
		}

		var mobile = '${vo.mobile}';
		mobile = mobile.split('-');
		for ( var i in mobile) {
			var index = parseInt(i) + 1;
			eval('$("input[name=mobile' + index + ']")').val(mobile[i]);
		}

		var email = '${vo.email}';
		email = email.split('@');
		for ( var i in email) {
			var index = parseInt(i) + 1;
			eval('$("input[name=email' + index + ']")').val(email[i]);
		}

		var emailYn = '${vo.emailYn}';
		checkRadio('emailYn', emailYn, null);
		var smsYn = '${vo.smsYn}';
		checkRadio('smsYn', smsYn, null);
	});

	//개인 C or 회사 P 체크 : P 일시 추가 정보 입력
	function doPCTypeCheck(obj) {
		if ($(obj).val() == 'C') {
			$('#SPCompInfo').css('display', 'inhreit');
		} else {
			$('#SPCompInfo').css('display', 'none');
		}
	}

	//check = P개인 , C 회사
	function getPostcode(check) {
		new daum.Postcode({
			oncomplete : function(data) {
				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				//개인
				if (check == 'P') {
					$('input[name=zipcode]').val(data.zonecode); //5자리 새우편번호 사용
					$('input[name=addr1]').val(fullRoadAddr);
					//data.jibunAddress;

					//회사
				} else {
					$('input[name=czipCode]').val(data.zonecode); //5자리 새우편번호 사용
					$('input[name=caddr1]').val(fullRoadAddr);

				}
			}
		}).open();
	}

	function doSubmit() {

		var sId = '${vo.userId}';

		if (sId == '') {
			if ($('#userIdCheck').prop('class').indexOf('blue') < 0) {
				$('#userIdCheck').attr('class',
				'mL10 red bold').val('사용 불가능한 아이디 입니다.');
				//alert('사용 불가능한 아이디 입니다.');
				$('input[name=userId]').focus();
				return;
			}

			if ($('#userPwdCheck').prop('class').indexOf('blue') < 0
					|| $('#userPwdCheck2').prop('class').indexOf('blue') < 0) {
				$('#userPwdCheck').attr('class', 'mL10 red bold').val('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능힙니다.');
				//alert('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능힙니다.');
				$('input[name="userPwd"]').focus();
				return;
			}
		}

	/* 	if (isNull($('input[name=userName]').val())) {
			//alert('이름을 입력해야 합니다.');
			$('input[name=userName]').next().prop('hidden',false);
			$('input[name=userName]').next().text('이름을 입력해야 합니다.');
			$('input[name=userName]').focus();
			return;
		}else{
			$('input[name=userName]').next().prop('hidden',true);
		} */
		var isRequired = true;
		var $form = document.querySelectorAll("#formJoin")[0];
		var $elements = $form.elements;
		$.each($elements,function(index, input) {
			var elem = document.createElement('span');
			elem.classList.add("mL10");
			elem.classList.add("red");
			elem.classList.add("bold");
			elem.textContent = '필수 항목입니다.';
			if(input.hasAttribute('required') && !isNull(input.parentNode.lastElementChild) && input.parentNode.lastElementChild.tagName === 'SPAN')
				input.parentNode.removeChild(input.parentNode.lastElementChild);	
			if(input.hasAttribute('required') && isNull(input.value)) {
				if(!input.hasAttribute('company')){
					input.parentNode.insertBefore(elem, (input.parentNode.childNodes.length > 1) ? input.parentNode.lastChild : input.nextSibling);
					isRequired = false;
				}else if(input.hasAttribute('company') &&  $('input[name="radPCType"]:checked').val() === 'C'){
					input.parentNode.insertBefore(elem, (input.parentNode.childNodes.length > 1) ? input.parentNode.lastChild : input.nextSibling);
					isRequired = false;
				}
			}
		});
		if(!isRequired)
			return;
		
		/* if (!isNull($('input[name=phone1]').val())) {
		var sPhone = trim($('input[name=phone1]').val()
				+ $('input[name=phone2]').val() + $('input[name=phone3]').val());
		if (sPhone.length < 11) {
			alert('연락처가 잘못 입력되었습니다.');
			return;
		}
		}
		if (!isNull($('input[name=mobile1]').val())) {
		var sMobile = trim($('input[name=mobile1]').val()
				+ $('input[name=mobile2]').val()
				+ $('input[name=mobile3]').val());
		if (sMobile != '' && sMobile.length < 11) {
			alert('휴대전화가 잘못 입력되었습니다.');
			return;
		}
		}
		if (!isNull($('input[name=mobile1]').val())) {
		if ($('input[name=emailId]').val() == ''
				|| $('input[name=emailHost]').val() == '') {
			alert('이메일을 입력해야 합니다.');
			return;
		}
		} */
		if (!confirm('등록 하시겠습니까?')) {
			return;
		}
		if (!isNull($('input[name=phone1]').val())) {
		sPhone = $('input[name=phone1]').val() + '-'
				+ $('input[name=phone2]').val() + '-'
				+ $('input[name=phone3]').val();
		$('input[name=phone]').val(sPhone);
		}
		if (!isNull($('input[name=mobile1]').val())) {
		sMobile = $('input[name=mobile1]').val() + '-'
				+ $('input[name=mobile2]').val() + '-'
				+ $('input[name=mobile3]').val();
		$('input[name=mobile]').val(sMobile);
		}
		sEmail = trim($('input[name=email1]').val()) + '@'
				+ trim($('input[name=email2]').val());
		$('input[name=email]').val(sEmail);
		
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

		$('#formJoin').submit();
	}
</script>


<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>