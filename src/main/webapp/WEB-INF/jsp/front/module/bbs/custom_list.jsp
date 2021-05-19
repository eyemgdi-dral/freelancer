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
<c:if test="${bm.boardTypeFixedCode ne '001004'}">
	<div class=" my-4">
		<form id="formSearch" action="" method="post" class='navbar-search navbar-search-light form-inline mr-sm-3'>
			<div class="form-group justify-content-center">
				
				<div class="input-group input-group-alternative input-group-merge">
					<div class="input-group-prepend">
						<select name="type1" class="form-control  mr-2" style="max-width:90px">
							<option value="subject">제목</option>
							<option value="body">내용</option>
							<option value="id">글쓴이</option>
						</select>
					</div>
					<input type="text" id="searchWord" name="searchWord" class="form-control  mr-2 mL3 searchWord" value="${search.searchWord }"/>
					<div class="input-group-append">
						<span class="input-group-text"><i class="fas fa-search"></i></span>
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
		<a href="javascript:$.Nav('self', {bcseq:'0'});" class="nav-link ${classOn }">전체</a>
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
			
			
			<table class="table table-neutral text-center table-bordered">
				<thead>
					<tr>
						<th class="board-number" width="100px">순번</th>
						<th class="board-content" width="*">제목</th>
						<th class="board-writer" width="150px">등록자</th>
						<th class="board-date" width="130px">등록일</th>
					</tr>
				</thead>
	<c:forEach var="m" items="${list }" varStatus="s">				
					<tr>
						<td class="board-number">${search.paging.virtualNumber - s.index }</td>
						<td class="board-content">
		<c:if test="${m.isNew}">
							<span class="badge badge-pill badge-danger mr-2">NEW</span>
		</c:if>	
							<a href="javascript:doView('${m.boardSeq }', '${m.regUser }', '${m.secretYn }', '${bm.autoSecretYn }');">
								${m.subject }
		<c:if test="${m.secretYn eq 'Y' or bm.autoSecretYn eq 'Y'}">
							<img class="mL3" src="/images/ic_lock.png"/>
		</c:if>								
							</a>
						</td>
						<td class="board-writer">
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
						</td>
						<td class="board-date">
							<fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/>
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
						${m.subject }
					</a>
				</h1>
				<p class="text-sm mb-0">
				${fn:substring(m.body, 0, bm.subjectCharCount) } ...
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
				<div class="card-body">${l.body }</div>
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
				<div class="border-0 card card-lift--hover">
					<a href="${l.linkUrl }" class="position-relative" target="_blank">
						<img class="card-img-top" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }"  alt="이미지" />
		<c:if test="${l.isNew}">
					<div class="card-img-overlay text-right">
							<span class="badge badge-pill badge-danger">NEW</span>
					</div>
		</c:if>		
					</a>
					<div class="card-body text-center">
							
						<div class="d-flex justify-content-between align-items-center">
							<h5 class="h2 card-title mb-2">${l.subject }</h5>
							<p class="card-text text-sm text-muted">
								<fmt:formatDate value="${l.regDate }" pattern="${bm.dateFormatList }"/>
							</p>
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
	<c:if test="${empty list}">
				<div class="col-12 py-6">
					<s:message code="common.noData" />
				</div>
	</c:if>
		</div>
				
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001006' }">
				<div class="row">
	<c:forEach items="${list }" var="l">
					<div class="col-md-4">
						<div class="card">
							<a href="javascript:$.Nav('self', {mode: 'view', bseq: '${l.boardSeq }'})" class="position-relative">
								<img class="card-img-top" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }"  alt="이미지" />
		<c:if test="${l.isNew}">
							<div class="card-img-overlay text-right">
									<span class="badge badge-pill badge-danger">NEW</span>
							</div>
		</c:if>		
							</a>
							<div class="card-body">
								<h5 class="card-title">${l.subject }
								</h5>
								<p class="card-text">${fn:substring(l.body, 0, bm.subjectCharCount) } ...</p>
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
								</p>
							</div>
						</div>
					</div>
	</c:forEach>
	<c:if test="${empty list}">
					<div class="col-12 py-6">
						<s:message code="common.noData" />
					</div>
	</c:if>	
				</div>
				
</c:if>
	
<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
			<div class="text-right">
<c:if test="${bm.authWrite eq 0 or bm.authWrite ge tagoplusSolution1_session_user.gradeLevel }">
				<a href="javascript:doWrite();" class="btn btn-outline-primary">글쓰기</a>
</c:if>
			</div>

<script type="text/javascript">

	var loginUser = '${tagoplusSolution1_session_user.userId}';

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
			if (id != loginUser) {
				alert('비밀글 입니다.');
				return;
			}
		}

		$.Nav('self', {
			mode : 'view',
			bseq : seq
		});
	}

	function doWrite() {
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
</script>