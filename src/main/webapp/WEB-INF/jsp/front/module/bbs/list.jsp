<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		게시판 모듈 - 목록
		"001001"	"일반형 게시판"
		"001002"	"계층형 게시판"	
		"001003"	"답변형 게시판"	
		"001004"	"FAQ게시판"	
		"001005"	"썸네일 게시판"	
		"001006"	"이미지 게시판"	
		"001007"	"예약 게시판"	

 --%>

<c:set var="writeText" value="글쓰기"/>

<c:if test="${bm.boardTypeFixedCode ne '001010' and bm.boardTypeFixedCode ne '001006' and bm.boardTypeFixedCode ne '001005' and bm.boardTypeFixedCode ne '010800' and bm.boardTypeFixedCode ne '001012'}">
	<div class=" my-4">
		<form id="formSearch" action="" method="post" class='row'>
				<div class="col-lg-4  ml-auto">
					<div class="input-group ">
						<div class="input-group-prepend">
							<select name="type1" class="form-control  mr-2" style="max-width:90px">
								<option value="subject">제목</option>
								<option value="body">내용</option>
							</select>
						</div>
						<input type="text" id="searchWord" name="searchWord" class="form-control searchWord" value="${search.searchWord }"/>
						<div class="input-group-append">
							<button type="button" onclick="doSearch() " class="btn btn-dark">검색
							</button>
						</div>
					</div>
					<script>
						$(function() {
							var sType1 = '${search.type1}'; 
							if (sType1 != '')
								$('select[name=type1]').val(sType1);
						});
						
						$("#searchWord").on('focus blur', function(e) {
							console.log(e.type)
							if (e.type == 'focus') {
								$(this).closest('.form-group').addClass('focused')
							} else {
								$(this).closest('.form-group').removeClass('focused')
							}
						});
	
						$("#searchWord").on('keyup', function (e) {
						    if (e.key === 'Enter' || e.keyCode === 13) {
						    	doSearch();
						    }
						});
					</script>
			</div>
		</form>
	</div>
</c:if>

<c:if test="${fn:length(bm.boardCategoryVO) > 0}">
	<c:set var="classOn" value=""/>
	<c:if test="${search.bcseq eq 0 or empty search.bcseq}">
		<c:set var="classOn" value="active"/>
	</c:if>
	<nav class="nav mb-4 board-tabs">
		<%-- <a href="javascript:$.Nav('self', {bcseq:'0'});" class="nav-link ${classOn }">전체</a> --%>
		<c:forEach items="${bm.boardCategoryVO }" var="l">			
			<c:set var="classOn" value=""/>
			<c:if test="${search.bcseq eq l.bcSeq }">
				<c:set var="classOn" value="active"/>
			</c:if>	
				<a href="javascript:$.Nav('self', {bcseq:'${l.bcSeq }'});" class="nav-link ${classOn }">${l.cateName }</a>
	
		</c:forEach>
	</nav>
</c:if>

		
<c:if test="${bm.boardTypeFixedCode eq '001001' or bm.boardTypeFixedCode eq '001003'}">
			
			<c:set var="writeText" value="질문하기"/>
			<table class="table text-center responsive-table">
				<thead>
					<tr>
						<th class="board-number" width="100px">순번</th>
						<th class="board-content" width="*">제목</th>
						<th class="board-writer" width="150px">등록자</th>
						<th class="board-date" width="130px">작성일</th>
						<th class="board-count" width="130px">조회수</th>
					</tr>
				</thead>
	<c:forEach var="m" items="${list }" varStatus="s">				
					<tr>
						<td class="board-number">
							<c:choose>
								<c:when test="${m.noticeYn eq 'Y' }">
									<span class="badge badge-pill badge-danger">공지</span>
								</c:when>
								<c:otherwise>
									${search.paging.virtualNumber - s.index }
								</c:otherwise>
							</c:choose>
						</td>
						<td class="board-content text-left">
		<c:if test="${m.isNew}">
							<span class="badge badge-pill badge-danger mr-2">NEW</span>
		</c:if>	
		<c:if test="${m.isHot}">
							<span class="badge badge-pill badge-danger mr-2">HOT!</span>
		</c:if>	
							<a href="javascript:doView('${m.boardSeq }', '${m.regUser }', '${m.secretYn }', '${bm.autoSecretYn }');">
								${m.subject }
		<c:if test="${m.secretYn eq 'Y' or bm.autoSecretYn eq 'Y'}">
							<img class="ml-3" src="/images/ic_lock.png"/>
		</c:if>								
							</a>
						</td>
						<td class="board-writer">
		<c:if test="${m.regUserIsAdmin }">
			관리자
		</c:if>					
		<c:if test="${!m.regUserIsAdmin }">
		<c:choose>
			<c:when test="${bm.writerFormatFixedCode eq '002001'}">
					<!-- 이름 --> 
					${m.userName }
			</c:when>
			<c:when test="${bm.writerFormatFixedCode eq '002002'}">
					<!-- 닉네임 --> 
					${m.nickname }
			</c:when>
			<c:when test="${bm.writerFormatFixedCode eq '002003'}">
					<!-- 닉네임(이름) --> 
					${m.nickname }(${m.userName })
			</c:when>
			<c:when test="${bm.writerFormatFixedCode eq '002004'}">
					<!-- 이름(아이디) --> 
					${m.userName }(${m.regUser })
			</c:when>
			<c:when test="${bm.writerFormatFixedCode eq '002005'}">
					<!-- 닉네임(아이디) --> 
					${m.nickname }(${m.regUser })
			</c:when>
			<c:otherwise>
					${m.regUser }
			</c:otherwise>
		</c:choose>	
		</c:if>					
						</td>
						<td class="board-date">
							<fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/>
						</td>
						<td class="board-count">
							${m.readCount}
						</td>
					</tr>
	</c:forEach>
	<c:if test="${empty list}">
					<tr>
						<td colspan="5"><s:message code="common.noData" /></td>						
					</tr>
	</c:if>
				</tbody>
			</table>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001002' }">
	<div class="list-group list-group-flush">
	<c:if test="${!empty list}">
		<c:forEach items="${list }" var="m">
			<div class="list-group-item list-group-item-action flex-column align-items-start py-4 px-4">
				<div class="d-flex w-100 justify-content-between">
					<h4 class="mb-1">
			<c:choose>
				<c:when test="${bm.writerFormatFixedCode eq '002001'}">
							<!-- 이름 -->
							${m.userName }
				</c:when>
				<c:when test="${bm.writerFormatFixedCode eq '002002'}">
							<!-- 닉네임 --> 
							${m.nickname }
				</c:when>
				<c:when test="${bm.writerFormatFixedCode eq '002003'}">
							<!-- 닉네임(이름) -->
							${m.nickname }(${m.userName })
				</c:when>
				<c:when test="${bm.writerFormatFixedCode eq '002004'}">
							<!-- 이름(아이디) --> 
							${m.userName }(${m.regUser })
				</c:when>
				<c:when test="${bm.writerFormatFixedCode eq '002005'}">
							<!-- 닉네임(아이디) --> 
							${m.nickname }(${m.regUser })
				</c:when>
				<c:otherwise>
							${m.regUser }
				</c:otherwise>
			</c:choose>
					</h4>
						<small class="ml-4"><fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/></small>
				</div>
				<h1 class="mt-3 mb-1">
					<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${m.boardSeq }'});">
						${fn:escapeXml(m.subject)}
					</a>
				</h1>
				<p class="text-sm mb-0">
					<tt:abbr length="${bm.subjectCharCount }" value="${fn:replace(m.body,'&nbsp;','') }"/>
				
				</p>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
		<s:message code="common.noData" />
	</c:if>
			
			</div>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001004' }">
	<div class="accordion" id="accordionExample">
	<c:forEach items="${list }" var="l" varStatus="s">
		<div class="card">
			<a class="card-header" data-toggle="collapse" data-target="#faq_a${s.count }"
				aria-expanded="true" aria-controls="faq_a${s.count }">
				${l.subject }
			</a>

			<div id="faq_a${s.count }" class="collapse">
				<div class="card-body"><tt:abbr length="${bm.subjectCharCount }" value="${fn:replace(m.body,'&nbsp;','') }"/></div>
			</div>
		</div>
	</c:forEach>
	<c:if test="${empty list }">
		<div class="card">
			<div class="card-header">
				<h2 class="mb-0">
						조회된 결과가 없습니다.
				</h2>
			</div>
		</div>
	</c:if>
	</div>
		<div class="list-group">
		</div>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001005' }"><%-- 
				<div class="inner">
					<div class="m_tit fleft">${bm.boardName }</div>
				</div> --%>
		<div class="row">
	<c:forEach items="${list }" var="l">
			<div class="col-md-4 col-sm-6">
				<a class="card "
						data-toggle="modal" data-target="#imageView"
						data-image="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }"
						data-title="${l.subject }">
					
						<img class="card-img-top" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }"  alt="이미지" />
		<c:if test="${l.isNew}">
					<div class="card-img-overlay text-right">
							<span class="badge badge-pill badge-danger">NEW</span>
					</div>
		</c:if>		
					
					<div class="card-body text-center">
						<p class="text-center">${l.subject }</p>
						<%-- <p class="card-text text-sm text-muted">
							<fmt:formatDate value="${l.regDate }" pattern="${bm.dateFormatList }"/>
						</p> --%>
					</div>
				</a>
			</div>
			
		</c:forEach>
	<c:if test="${empty list}">
				<div class="col-12 py-6">
					<s:message code="common.noData" />
				</div>
	</c:if>
		</div>
				
	<div class="modal  fade" id="imageView" >
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cert-title">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<img class="card-img-top" id="cert-image" src="/upload/board/certificate/20210114123152227001.jpg"  alt="이미지" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#imageView').on('show.bs.modal',function(e){
			var rel = e.relatedTarget;
			var src = $(rel).data('image');
			var title = $(rel).data('title');
			$('#cert-image').attr('src',src);
			$('#cert-title').text(title);
		})
	</script>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001006' }">
				<div class="row">
	<c:forEach items="${list }" var="l">
					<div class="col-md-4">
						<a class="card border-0" href="javascript:$.Nav('self', {mode: 'view', bseq: '${l.boardSeq }'})" >
								<img class="card-img-top" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }"  alt="이미지" />
		<c:if test="${l.isNew}">
							<div class="card-img-overlay text-right">
									<span class="badge badge-pill badge-danger">NEW</span>
							</div>
		</c:if>		
								<p class="mt-2 mb-1 font-weight-600" style="font-size:14px">${l.subject }</p>
								<p class="mb-1" style="font-size:14px">${l.addCol1 } ~ ${l.addCol2 }</p>
								<p style="font-size:14px">${l.addCol3 }</p>
								<%-- <p class="card-text"><tt:abbr length="${bm.subjectCharCount }" value="${fn:replace(m.body,'&nbsp;','') }"/></p>
								<p class="d-flex justify-content-between card-text">
									<small class="text-muted">
		<c:choose>
			<c:when test="${bm.writerFormatFixedCode eq '002001'}">
					<!-- 이름 --> 
					${l.userName }
			</c:when>
			<c:when test="${bm.writerFormatFixedCode eq '002002'}">
					<!-- 닉네임 --> 
					${l.nickname }
			</c:when>
			<c:when test="${bm.writerFormatFixedCode eq '002003'}">
					<!-- 닉네임(이름) --> 
					${l.nickname }(${l.userName })
			</c:when>
			<c:when test="${bm.writerFormatFixedCode eq '002004'}">
					<!-- 이름(아이디) --> 
					${l.userName }(${l.regUser })
			</c:when>
			<c:when test="${bm.writerFormatFixedCode eq '002005'}">
					<!-- 닉네임(아이디) --> 
					${l.nickname }(${l.regUser })
			</c:when>
			<c:otherwise>
					${l.regUser }
			</c:otherwise>
		</c:choose>	
									</small>
									<small class="text-muted float-right">
										<fmt:formatDate value="${l.regDate }" pattern="${bm.dateFormatList }"/>
									</small>
								</p> --%>
						</a>
					</div>
	</c:forEach>
	<c:if test="${empty list}">
					<div class="col-12 py-6">
						<s:message code="common.noData" />
					</div>
	</c:if>	
				</div>
				
</c:if>


<c:if test="${bm.boardTypeFixedCode eq '001010'}">
			<div class="table-responsive">
			
			<table class="table text-center table-bordered ">
				<thead>
					<tr>
						<th class="" width="150px">년도</th>
						<th class="" width="*">용역명</th>
						<th class="" width="*">발주처</th>
						<th class="" width="*">발주기간</th>
					</tr>
				</thead>
	<c:forEach var="m" items="${list }" varStatus="s">				
					<tr>
						<td class="board-number">${fn:substring(m.addCol1,-1,4) }</td>
						<td class="board-content"> 
							${m.subject }						
						</td>
						<td class="board-writer">
							${m.addCol3 }
						</td>
						<td class="board-count">
							${m.addCol1 } ~ ${m.addCol2 }
						</td>
					</tr>
	</c:forEach>
	<c:if test="${empty list}">
					<tr>
						<td colspan="4"><s:message code="common.noData" /></td>						
					</tr>
	</c:if>
				</tbody>
			</table>
			</div>
</c:if>
<c:if test="${bm.boardTypeFixedCode eq '001011'}">
				<div class="row">
	<c:forEach items="${list }" var="l">
					<div class="col-md-4">
						<a class="card border-0" href="javascript:$.Nav('self', {mode: 'view', bseq: '${l.boardSeq }'})">
							<img class="card-img-top" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }"  alt="이미지" />
		<c:if test="${l.isNew}">
							<div class="card-img-overlay text-right">
									<span class="badge badge-pill badge-danger">NEW</span>
							</div>
		</c:if>		
							<p class="mt-2 mb-1 font-weight-600" style="font-size:14px">${l.subject }</p>
						</a>
					</div>
	</c:forEach>
	<c:if test="${empty list}">
					<div class="col-12 py-6">
						<s:message code="common.noData" />
					</div>
	</c:if>	
				</div>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001012' }">
				<div class="row">
	<c:forEach items="${list }" var="l">
					<div class="col-md-4">
						<a class="card border-0" href="javascript:$.Nav('self', {mode: 'view', bseq: '${l.boardSeq }'})" >
								<img class="card-img-top" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }"  alt="이미지" />
		<c:if test="${l.isNew}">
							<div class="card-img-overlay text-right">
									<span class="badge badge-pill badge-danger">NEW</span>
							</div>
		</c:if>		
								<p class="mt-2 mb-1 text-center" style="font-size:14px">${l.subject }</p>
						</a>
					</div>
	</c:forEach>
	<c:if test="${empty list}">
					<div class="col-12 py-6">
						<s:message code="common.noData" />
					</div>
	</c:if>	
				</div>
				
</c:if>

	<c:if test="${bm.pagerRowCount > 0 }">
		<div class="my-4">
			<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
		</div>
	</c:if>
			<div class="text-right">
			
<c:if test="${bm.authWrite eq 0 or bm.authWrite ge tagoplusSolution1_session_user.gradeLevel }">
				<a href="javascript:doWrite();" class="btn btn-primary btn-lg">${writeText }</a>
</c:if>
			</div>
<c:if test="${bm.boardTypeFixedCode eq '001003' }">
	<div class="modal  fade" id="passinput" >
		<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cert-title">비밀번호 입력</h5>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close"><span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input class="form-control" id="pwdPass" type="password">
					</div>
				</div>
				<div class="modal-footer">
					<input id="pwdId" type="hidden">
					<button type="button" onclick="checkPwd()" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</c:if>
<script type="text/javascript">

	var loginUser = '${tagoplusSolution1_session_user.userId}';
	var code = '${bm.boardTypeFixedCode}';
	function doSearch() {
		var sType1 = $('select[name=type1]').val();
		var sSearchWord = $('input[name=searchWord]').val();
		$.Nav('go', location.pathname, {
			'type1' : sType1,
			'searchWord' : sSearchWord
		});
	}

	function doView(seq, id, secretYn, autoSecretYn) {
		if (secretYn == 'Y' || autoSecretYn == 'Y') {
			if(code == '001003'){
				$("#passinput").modal({
					backdrop:'static'
				})
				$('#pwdId').val(seq);
			}else{
				if (id != loginUser) {
					alert('비밀글 입니다.');
					return;
				}
			}
			
		}else{
			$.Nav('self', {
				mode : 'view',
				status : 'i',
				bseq : seq
			});
		}
	}
	
	
	
	function checkPwd(){
		var pass = $("#pwdPass").val();
		var seq = $("#pwdId").val();
		$.ajax({
			url: '/ajax/checkBoardCode'
				,type: 'post'
				,data: { bseq: seq ,pwd:pass}
				,async: true
				,success: function(response) {
					var success = response.success;
					if(success == true){
						$.Nav('self', {
							mode : 'view',
							status : 'i',
							bseq : seq
						});
					}else{
						alert("비밀번호 맞지 않습니다.")
					}
				}
			})
		
	}
	
	function doWrite() {
		
		if(code == '001003'){
			$.Nav('self', {
				mode : 'write',
				status : 'i',
				bseq : ''
			});
		}else{
			if (loginUser == '') {
				alert('로그인이 필요 합니다.');
				$.Nav('go', '/login');
			}else{
				$.Nav('self', {
					mode : 'write',
					status : 'i',
					bseq : ''
				});
			}
		}

		
	}
</script>