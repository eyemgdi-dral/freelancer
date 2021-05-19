<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판별 게시물 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

<div class="main-content">
<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
<div class="container-fluid mt--6">
	<form id="form1" action="./${bm.boardCode }" method="get">
		<div class="card">
			<div class="card-body">
				<div class="container-fluid">
					<div class="form-group row">
						<div class="col-lg-4">
								<div class="input-group mr-2">
									<div class="input-group-prepend">
										<select name="type1" class="form-control">
											<option value="">제목 + 내용</option>
											<option value="subject">제목</option>
											<option value="body">내용</option>
											<option value="username">이름 + 닉네임</option>
											<option value="id">아이디</option>
										</select>
									</div>
									<input type="text" name="searchWord" class="form-control searchWord" value="${search.searchWord }" /> 
								</div>
						</div>
								<a id="btnSearch" onclick="javascript:doSearch();" class="btn btn-primary">검색</a>
								<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn btn-primary">검색 초기화</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row mb-3">
			<div class="col-lg-6">
				전체 게시물 수 : <fmt:formatNumber value="${search.totalCount }" pattern="#,###" />
			</div>
			<div class="col-lg-6 text-right">
				<a onclick="javascript:doSelect('${bm.boardCode}', 'delete');" class="btn btn-danger">선택삭제</a>
				<a onclick="javascript:doSelect('${bm.boardCode}', 'copy');" class="btn btn-info">선택복사</a>
				<a onclick="javascript:doSelect('${bm.boardCode}', 'move');" class="btn btn-light">선택이동</a>
				<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}');" class="btn btn-primary">글쓰기</a>
			</div>
		</div>
		
<c:if test="${!empty listBCs and bm.boardTypeFixedCode ne '001004'}">		
		
					<div class="tab mb-3">
						<ul class="nav nav-pills flex-column flex-sm-row" id="tabs-text" role="tablist">
					
	<c:set var="tabClass" value="" />
	<c:if test="${empty search.bcseq || search.bcseq eq 0}">
		<c:set var="tabClass" value=" active" />
	</c:if>
							<li class="nav-item">
								<a class="nav-link mb-sm-3 mb-md-0 ${tabClass }" onclick="javascript:$.Nav('self', {bcseq: ''});">전체</a>
							</li>

	<c:forEach items="${listBCs }" var="c">
		<c:set var="tabClass" value="" />
		<c:if test="${search.bcseq eq c.bcSeq}">
			<c:set var="tabClass" value=" active" />
		</c:if>
						<li class="nav-item">
							<a class="nav-link mb-sm-3 mb-md-0 ${tabClass }" onclick="javascript:$.Nav('self', {bcseq: '${c.bcSeq}'});">${c.cateName }</a>
						</li>
	</c:forEach>
						</ul>
					</div>
				
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001010' }">
		<div class="card">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="5%" />
							<col width="10%" />
							<col width="*" />
							<col width="10%" />
							<col width="12%" />
							<col width="7%" />
							<col width="7%" />
							<col width="7%" />
							<col width="8%" />
						</colgroup>
						<thead class="table-info">
							<tr>
								<th><input type="checkbox" id="chkAll"  /> </th>
								<th>카테고리</th>
								<th>용역명</th>
								<th>년도</th>
								<th>발주처</th>
								<th>발주기간</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
	<c:if test="${!empty list}">
		<c:forEach items="${list }" var="m" varStatus="s">
							<tr>
								<td class="first">
									<input type="checkbox" name="chks" value="${m.boardSeq }" />
								</td>
								<td>${m.cateName }</td>
								<td class="text-left">
									<a href="javascript:$javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${m.boardSeq }'});">${m.subject }</a>
								</td>
								
								<td>
									${fn:substring(m.addCol2, -1, 4)}
								</td>
								<td>
									${m.addCol3}
								</td>
								<td>
									${m.addCol1} ~ ${m.addCol2}
								</td>
								
								<td>
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
								<td>
									<fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/>
								</td>
								<td><fmt:formatNumber value="${m.readCount }" pattern="#,###" /></td>
							</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
							<tr>
								<td colspan="8"><s:message code="common.noData" /></td>
							</tr>
	</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</c:if>
<c:if test="${bm.boardTypeFixedCode eq '001011' }">
		<div class="card">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="5%" />
							<col width="10%" />
							<col width="*" />
							<col width="10%" />
							<col width="12%" />
							<col width="7%" />
						</colgroup>
						<thead class="table-info">
							<tr>
								<th><input type="checkbox" id="chkAll"  /> </th>
								<th>제목</th>
								<th>이미지</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
	<c:if test="${!empty list}">
		<c:forEach items="${list }" var="m" varStatus="s">
							<tr>
								<td class="first">
									<input type="checkbox" name="chks" value="${m.boardSeq }" />
								</td>
								<td class="text-left">
									<a href="javascript:$javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${m.boardSeq }'});">${m.subject }</a>
								</td>
								
								<td>
									<img class="card-img-top" src="${UPLOAD_ROOT}${m.fileVOList[0].saveFilename }" alt="이미지">
								</td>
								
								<td>
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
								<td>
									<fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/>
								</td>
								<td><fmt:formatNumber value="${m.readCount }" pattern="#,###" /></td>
							</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
							<tr>
								<td colspan="8"><s:message code="common.noData" /></td>
							</tr>
	</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</c:if>
<c:if test="${bm.boardTypeFixedCode eq '001001' or bm.boardTypeFixedCode eq '001003' }">
		<div class="card">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="5%" />
							<col width="5%" />
							<col width="*" />
							<col width="10%" />
							<col width="12%" />
							<col width="7%" />
							<col width="8%" />
						</colgroup>
						<thead class="table-info">
							<tr>
								<th><input type="checkbox" id="chkAll"  /> </th>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								
								<th>작성일</th>
								<th>조회수</th>
								<th>추천수</th>
							</tr>
						</thead>
						<tbody>
	<c:if test="${!empty list}">
		<c:forEach items="${list }" var="m" varStatus="s">
							<tr>
								<td class="first">
									<input type="checkbox" name="chks" value="${m.boardSeq }" />
								</td>
								<td>
									<c:choose>
										<c:when test="${m.noticeYn eq 'Y' }">
											<span class="badge badge-pill badge-danger">공지</span>
										</c:when>
										<c:otherwise>
											${search.paging.virtualNumber - s.index }
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-left">
									<a href="javascript:$javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${m.boardSeq }'});">${m.subject }</a>
								</td>
								<td>
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
								<td>
									<fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/>
								</td>
								<td><fmt:formatNumber value="${m.readCount }" pattern="#,###" /></td>
								<td>
									<fmt:formatNumber value="${m.recommCount }" pattern="#,###" /> - <fmt:formatNumber value="${m.notRecommCount }" pattern="#,###" />
								</td>
							</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
							<tr>
								<td colspan="8"><s:message code="common.noData" /></td>
							</tr>
	</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001002' }">
		<div class="card">
			<div class="card-body">
			
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
						<small class="ml-4"><fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/></small>
					</h4>
					<div>
						<input type="checkbox" name="chks" value="${m.boardSeq }" class="mr-2"/>
						<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${m.boardSeq }'});" class="btn btn-sm btn-primary">수정</a>
						<a onclick="javascript:doDelete('${m.boardSeq }', '${m.boardCode }');" class="btn btn-sm btn-danger">삭제</a>
					</div>
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
		</div>
	</div>
</c:if>
				
<c:if test="${bm.boardTypeFixedCode eq '001005' }">
		<div class="row">
	<c:if test="${!empty list}">
		<c:forEach items="${list }" var="l">
			<div class="col-sm-4 col-md-3 col-lg-2">
				<div class="card">
					<img class="card-img-top" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }" alt="이미지">
					<div class="card-body">
						<h5 class="card-title">${l.subject }</h5>
						<p class="card-text">
							<small class="text-muted"><a href="${l.linkUrl }" target="_blank"><tt:abbr length="25" value="${l.linkUrl }"/></a></small>
						</p>
						<input type="checkbox" name="chks" value="${l.boardSeq }" class="mr-2"/>
						<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});" class="btn btn-sm btn-primary">수정</a>
						<a onclick="javascript:doDelete('${l.boardSeq }', '${l.boardCode }');" class="btn btn-sm btn-danger">삭제</a>
					</div>
				</div>
			</div>	
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
		<div class="col-12 text-center">
			<s:message code="common.noData" />
		</div>
	</c:if>
		</div>
	
</c:if>
<c:if test="${bm.boardTypeFixedCode eq '001012' }">
		<div class="row">
	<c:if test="${!empty list}">
		<c:forEach items="${list }" var="l">
			<div class="col-sm-4 col-md-3 col-lg-2">
				<div class="card">
					<img class="card-img-top" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }" alt="이미지">
					<div class="card-body">
						<h5 class="card-title">${l.subject }</h5>
						<input type="checkbox" name="chks" value="${l.boardSeq }" class="mr-2"/>
						<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});" class="btn btn-sm btn-primary">수정</a>
						<a onclick="javascript:doDelete('${l.boardSeq }', '${l.boardCode }');" class="btn btn-sm btn-danger">삭제</a>
					</div>
				</div>
			</div>	
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
		<div class="col-12 text-center">
			<s:message code="common.noData" />
		</div>
	</c:if>
		</div>
	
</c:if>
<c:if test="${bm.boardTypeFixedCode eq '001006' }">
		<div class="row" >
	<c:forEach items="${list }" var="l" varStatus="s">
			<div class="col-sm-4 col-md-3 col-lg-3">
				<div class="card">
				<c:if test="${l.fileVOList[0].saveFilename ne null }">
					<img class="card-img-top" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }" alt="이미지">
				</c:if>
					<div class="card-body">
						<h5 class="card-title mb-0 mt-2"><tt:abbr length="20" value="${l.subject }"/></h5>
						<p class="card-text">${l.addCol1 } ~ ${l.addCol2 }</p>
						<p class="card-text">${l.addCol3 }</p>
					</div>
					<div class="card-img-overlay d-flex align-items-baseline">
						<div class="custom-control custom-checkbox  mr-auto">
							<input type="checkbox" name="chks" class="custom-control-input" id="chks-${s.index }" value="${l.boardSeq }">
							<label class="custom-control-label" for="chks-${s.index }">&nbsp;</label>
						</div>
						<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});" class="btn btn-sm btn-primary">수정</a>
						<a onclick="javascript:doDelete('${l.boardSeq }', '${l.boardCode }');" class="btn btn-sm btn-danger">삭제</a>
					</div>
				</div>
			</div>
	</c:forEach>
	<c:if test="${empty list}">
		<div class="col-12 text-center my-6">
			<s:message code="common.noData" />
		</div>
	</c:if>
		</div>
			
				
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001008' }">
	
		<div class="tab mb-4">
			<ul class="nav nav-pills flex-column flex-sm-row">
	<c:set var="classOn" value=""/>
	<c:if test="${search.bcseq eq 0 or empty search.bcseq}">
		<c:set var="classOn" value="active"/>
	</c:if>
				<li class="nav-item">
					<a class="nav-link mb-sm-3 mb-md-0 ${classOn }" onclick="javascript:$.Nav('self', {bcseq:'0'});">전체</a>
				</li>
	<c:forEach items="${bm.boardCategoryVO }" var="l">			
		<c:set var="classOn" value=""/>
		<c:if test="${search.bcseq eq l.bcSeq }">
			<c:set var="classOn" value="active"/>
		</c:if>			
				<li class="nav-item">
					<a class="nav-link mb-sm-3 mb-md-0 ${classOn }" onclick="javascript:$.Nav('self', {bcseq:'${l.bcSeq }'});">${l.cateName }</a>
				</li>
	</c:forEach>
			</ul>
		</div>

		<div class="row">
			<c:forEach items="${list }" var="l" varStatus="s">
				<div class="col-sm-4 col-md-3 col-lg-3">
					<div class="card bg-dark text-white border-0">
						<img class="card-img opacity-6" src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }" alt="Card image">
						<div class="card-img-overlay d-flex flex-column justify-content-between">
							<div class="d-flex">
								<div class="custom-control custom-checkbox  mr-auto">
									<input type="checkbox" name="chks" class="custom-control-input" id="chks-${s.index }" value="${l.boardSeq }">
									<label class="custom-control-label" for="chks-${s.index }">&nbsp;</label>
								</div>
								<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});" class="btn btn-sm btn-primary">수정</a>
								<a onclick="javascript:doDelete('${l.boardSeq }', '${l.boardCode }');" class="btn btn-sm btn-danger">삭제</a>
							</div>
							<div>
								<h5 class="h2 card-title text-white mb-2">
									<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});">${l.subject }</a>
								</h5>
								<p class="card-text"><tt:abbr length="${bm.subjectCharCount }" value="${l.body }"/></p>
								<p class="card-text text-sm font-weight-bold"><fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/></p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<script>
			var $grid = $('.grid').isotope({
				itemSelector : '.grid_item',
				percentPosition : true,
				masonry : {
					columnWidth : '.grid_item'
				}
			})
			$grid.imagesLoaded().progress(function() {
				$grid.isotope('layout');
			});
		</script>

</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001004' }">
		<div class="tab mb-4">
			<ul class="nav nav-pills flex-column flex-sm-row">
	<c:set var="classOn" value=""/>
	<c:if test="${search.bcseq eq 0 or empty search.bcseq}">
		<c:set var="classOn" value="active"/>
	</c:if>
				<li class="nav-item">
					<a class="nav-link mb-sm-3 mb-md-0 ${classOn }" onclick="javascript:$.Nav('self', {bcseq:'0'});">전체</a>
				</li>
	<c:forEach items="${bm.boardCategoryVO }" var="l">			
		<c:set var="classOn" value=""/>
		<c:if test="${search.bcseq eq l.bcSeq }">
			<c:set var="classOn" value="active"/>
		</c:if>			
				<li class="nav-item">
					<a class="nav-link mb-sm-3 mb-md-0 ${classOn }" onclick="javascript:$.Nav('self', {bcseq:'${l.bcSeq }'});">${l.cateName }</a>
				</li>
	</c:forEach>
			</ul>
		</div>
		<ul class="list-group">
	<c:forEach items="${list }" var="l" varStatus="s">
			<li class="list-group-item d-flex align-items-center question">
				<span class="icon icon-shape bg-blue text-white rounded-circle shadow mr-3">
					<i class="ni ni-chat-round"></i>
				</span>	  			
	  			<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="chks${l.boardSeq }" name="chks" value="${l.boardSeq }" >
					<label class="custom-control-label" for="chks${l.boardSeq }">
					${l.subject }</label>
				</div>
				<span class="ml-auto">
					<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});" class="btn btn-sm btn-primary">수정</a>
					<a onclick="javascript:doDelete('${l.boardSeq }', '${l.boardCode }');" class="btn btn-sm btn-danger">삭제</a>
				</span>	
		  	</li>
			<li class="list-group-item answer bg-light" style="display:none;">${l.body }</li>
	</c:forEach>
		</ul>

	<c:if test="${empty list }">
			<ul class="list-group">
				<li class="faq_q list-group-item">조회된 결과가 없습니다.</li>
			</ul>
	</c:if>
			
</c:if>
	</form>
</div>	



<c:if test="${bm.pagerRowCount > 0 }">
	<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
	</c:if>
<div class="container-fluid mt-6">
	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table-bordered table text-center">
					<tbody>
						<tr>
							<th>게시판 유형</th>
							<td>${bm.boardTypeFixedCode } : ${bm.boardTypeFixedCodeName }</td>
						</tr>
						<tr>
							<th>게시판 css 이름</th>
							<td>${bm.cssPrefix }</td>
						</tr>
						<tr>
							<th>카테고리 개수</th>
							<td>${fn:length(bm.boardCategoryVO) }</td>
						</tr>
						<tr>
							<th>게시판 관리자</th>
							<td>${bm.boardAdmin }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#chkAll').change(function() {
			$('input[name=chks]').prop('checked', $(this).is(':checked'));
		});
	});

		
	$('.question').click(function(e){
	 	if (e.target !== this){
	 		return;
	 	}
		console.log(event.target)
		$(this).closest('.list-group').find('.answer').slideUp('fast')
		
		$faq_a = $(this).next('.answer')
		if ($faq_a.css('display') == 'none') {
			$faq_a.slideDown('fast')
		} else {
			$faq_a.slideUp('fast')
		} 
	})
	function doViewAnser(idx) {
		
	}
	
	function doSearch() {
		$('#form1').submit();	
	}
	
	function doSelect (bcode, mode) {
		
		if (!$('input[name=chks]').is(':checked')) {
			alert('상품을 선택해 주세요');
			return;
		}
		
		var bseqs = new Array();
		$('input[name=chks]').each(function() {
			if ($(this).prop('checked')) {
				bseqs.push($(this).val());
			}
		});
		
		if (mode == 'delete') {
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			$.Nav('go', '../proc.do', {status : 'd', bseqs : bseqs, bcode : bcode });
			
		} else {
			openPop('?bseqs=' + bseqs + '&bcode=' + bcode + '&mode='+mode, 'boardCategory');
		}
	}
	
	/* function doDelete (bSeq, bCode) {
		if (bSeq == '') {
			if (!$('input[name=chks]').is(':checked')) {
				alert('삭제할 상품을 선택해 주세요');
				return;
			}
			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			var bseqs = new Array();
			$('input[name=chks]').each(function() {
				if ($(this).prop('checked')) {
					bseqs.push($(this).val());
				}
			});
			
			$.Nav('go', '../proc.do', {status : 'd', bseqs : bseqs, bcode : bCode });		
			
		} else {			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			
			$.Nav('go', '../proc.do', {bseq : bSeq, status : 'd', bcode : bCode });
		}		
	} */
	
	function doDelete (bSeq, bCode) {
		if (!confirm('삭제하시겠습니까?')) {
			return;
		}
		
		$.Nav('go', '../proc.do', {bseq : bSeq, status : 'd', bcode : bCode });
	}	
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
</div>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>