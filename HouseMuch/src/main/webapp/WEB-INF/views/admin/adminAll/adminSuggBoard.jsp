<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<style>
.table-responsive {
	text-align: center;
}

.section-title h2 {
	font-size: 25px;
	font-weight: bold;
	text-transform: uppercase;
	padding-bottom: 0;
	color: #2FA599;
	margin-left: 10px;
}

.page-item.active {
	background-color: #E5F9F0;
	border-color: #82E3C8;
}
</style>

<script type="text/javascript">
	$(function(){
		$('#chkAll').click(function(){
			//만약에 최상단 체크박스가 체크되면
			if($(this).prop("checked")){
				$('input[name=chk]').prop("checked",true); //전체 선택
			}else{ //아니면
				$('input[name=chk]').prop("checked",false); //전체 해제
			}
		});
		
	});
	
	//미처리 건
	function pageFuncN(curPage){
		$('#unCurrentPage').val(curPage);
		$('form[name=frmPageN]').submit();
	}
	
	//처리완료건
	/* function pageFunc(curPage){
		$('#currentPage').val(curPage);
		$('form[name=frmPage]').submit();
	} */
</script>



<!-- 여기부터 -->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container p-0">

		<!-- 여기까지 box로 감싸는 기본틀 : 밑에 div맡출 것-->

		<!-- Table head options start -->
		<div class="content-header row">
			<!-- 첫번째 div -->
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">건의사항 관리</h2>
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">입주민 관리
									메인</a></li>
							<li class="breadcrumb-item"><a
								href="<c:url value='/admin/adminAll/adminSuggBoard.do'/>">
									게시판 카테고리 관리</a></li>
							<li class="breadcrumb-item active">건의사항 관리</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<!-- ########################### 미처리 건 ########################### -->
		<form action="<c:url value='/admin/adminAll/adminSuggBoard.do'/>"
			name="frmPageN" method="post">
			<input type="hidden" name="currentPage" id="unCurrentPage"> 
			<input type="hidden" name="searchCondition" value="${searchVoN.searchCondition }"> 
			<input type="hidden" name="searchKeyword" value="${searchVoN.searchKeyword }">
		</form>
		<!-- ########################### 처리완료 건 ########################### -->
		<%-- <form action="<c:url value='/admin/adminAll/adminSuggBoard.do'/>"
			name="frmPage" method="post">
			<input type="hidden" name="currentPage" id="currentPage"> 
			<input type="text" name="searchCondition" value="${searchVo.searchCondition }"> 
			<input type="text" name="searchKeyword" value="${searchVo.searchKeyword }">
		</form> --%>
		<div class="row" id="table-head">
			<div class="col-12">
				<div class="card" style="align: right">
					<div class="card-header">
						<h4 class="card-title">아파트 건의게시판 관리</h4>
					</div>
					<div class="card-body p-0">
						<!-- ########################### 미처리 건 ########################### -->
						<div class="col-12 mb-1 p-0">
							<!-- 기본 Select -->
							<form class="frmUserBoard" method="post" name="frmUserBoard"
								action='<c:url value="/admin/adminAll/adminSuggBoard.do"/>'>
								<div class="col-md-2 col-6 mb-1 float-left">
									<div class="form-group">
										<!-- <label for="basicSelect">분류</label> -->
										<select class="form-control" id="basicSelect" name="searchCondition">
											<option value="">건의 분류</option>
											<!-- 게시판 카테고리 반복문 시작 -->
											<c:if test="${!empty scList }">
												<c:forEach var="scVo" items="${scList }">
													<option value="${scVo.suggCtgNo }"
														<c:if test="${searchVoN.searchCondition=='scVo.suggCtgNo' }">
									            		selected="selected"
									            	</c:if>>${scVo.suggCtgName }
													</option>
												</c:forEach>
												<!-- 게시판 카테고리 반복문 끝 -->
											</c:if>
										</select>
									</div>
								</div>
								<!-- 기본 Select -->
								<!-- 여기다 검색창 -->
								<div class="col-md-4 col-6 mb-1 float-left">
									<div class="input-group">

										<input type="text" class="form-control" id="searchKeyword"
											name="searchKeyword" placeholder="제목을 입력하세요"
											aria-label="Amount" />
										<div class="input-group-prepend">
											<button class="btn btn-outline-primary" type="submit"
												id="btSubmit">
												<i data-feather="search" style="box-sizing: border-box;"></i>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- 여기다 검색창 : 끝 -->
					<div class="section-title">
						<h2>미처리 건</h2>
					</div>
					<div>
						<c:if test="${!empty searchVoN.searchKeyword }">
							<p>검색어 : ${searchVoN.searchKeyword }, ${pagingInfoN.totalRecord }건
								검색되었습니다.</p>
						</c:if>
					</div>
					<!-- 테이블시작 -->

					<div class="table-responsive" style="margin-top: 30px;">
						<table class="table">
							<thead class="thead-dark"
								style="background-color: #0E515F; color: #fff; font-size: 1.2em; font-weight: 200;">
								<tr>
									<!-- <th scope="col"><input type="checkbox" id="chkAll" /></th> -->
									<th class="font-medium-1 text-center">번호</th>
									<th class="font-medium-1 text-center">분류</th>
									<th class="font-medium-1 text-center">제목</th>
									<th class="font-medium-1 text-center">작성일</th>
									<th class="font-medium-1 text-center">글쓴이</th>
									<th class="font-medium-1 text-center">답변일</th>
									<th class="font-medium-1 text-center">처리</th>
								</tr>
							</thead>
							<tbody>
								<!-- 레코드반복시작 -->
								<!-- DB 없을 때 -->
								<c:if test="${empty suggUnList }">
									<tr>
										<td colspan="7">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<!-- DB 있을 때 -->
								<c:if test="${!empty suggUnList }">
									<!--게시판 내용 반복문 시작  -->
									<c:forEach var="map" items="${suggUnList }">
										<c:set var="suggBoardNo" value="${map['SUGG_BOARD_NO'] }" />
										<tr>
											<!-- <td><input type="checkbox" name="chk" id="chk" /></td> -->
											<td>${map['SUGG_BOARD_NO'] }</td>
											<td>${map['SUGG_CTG_NAME'] }</td>
											<td><a
												href="<c:url value='/suggestBoard/suggestBoardDetail.do?suggBoardNo=${suggBoardNo }'/>"
												style="color: black;"> ${map['SUGG_TITLE'] }</a></td>
											<td><fmt:formatDate value="${map['SUGG_REGDATE'] }"
													pattern="yyyy-MM-dd" /></td>
											<td>${map['MEMBER_NAME'] }</td>
											<c:if test="${empty map['ANSW_NO']}">
												<td>미처리</td>
												<td>미처리</td>
											</c:if>
										</tr>
									</c:forEach>
									<!--게시판 내용 반복처리 끝  -->
								</c:if>
								<!-- 레코드반복 -->
							</tbody>
						</table>
					</div>
					<!-- 테이블 끝 -->

					<!-- 페이저-->
					<!-- 이전 블럭으로 이동 -->
					<div class="center-block" style="clear: both; margin: 0 auto;">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center mt-2">
								<c:if test="${pagingInfoN.firstPage>1 }">
									<li class="page-item prev"><a class="page-link" href="#"
										onclick="pageFuncN(${pagingInfoN.firstPage-1})"></a></li>
								</c:if>
								<!-- [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pagingInfoN.firstPage }"
									end="${pagingInfoN.lastPage }">
									<c:if test="${i==pagingInfoN.currentPage }">
										<li class="page-item active"><a class="page-link"
											href="javascript:void(0);" style="background-color: #2FA599;">
												${i}</a></li>
									</c:if>
									<c:if test="${i!=pagingInfoN.currentPage }">
										<li class="page-item"><a href="#" class="page-link"
											onclick="pageFuncN(${i})">${i }</a>
									</c:if>
								</c:forEach>
								<!-- 다음 블럭으로 이동 -->
								<c:if test="${pagingInfoN.lastPage<pagingInfoN.totalPage }">
									<li class="page-item next"><a class="page-link" href="#"
										onclick="pageFuncN(${pagingInfoN.lastPage+1})"></a></li>
								</c:if>
							</ul>
						</nav>
					</div>
					<!-- 페이저-->

					<!--########################### 처리완료된 건 ###########################-->
					<%-- <div class="section-title">
						<h2>처리완료 건</h2>
					</div>
					<!-- 테이블시작 -->
					
					<div class="table-responsive" style="margin-top: 30px;">
						<table class="table">
							<thead class="thead-dark"
								style="background-color: #0E515F; color: #fff; font-size: 1.2em; font-weight: 200;">
								<tr>
									<th scope="col"><input type="checkbox" id="chkAll" /></th>
									<th class="font-medium-1 text-center">번호</th>
									<th class="font-medium-1 text-center">분류</th>
									<th class="font-medium-1 text-center">제목</th>
									<th class="font-medium-1 text-center">작성일</th>
									<th class="font-medium-1 text-center">글쓴이</th>
									<th class="font-medium-1 text-center">답변일</th>
									<th class="font-medium-1 text-center">처리</th>
								</tr>
							</thead>
							<tbody>
								<!-- 레코드반복시작 -->
								<!-- DB 없을 때 -->
								<c:if test="${empty suggList }">
									<tr>
										<td colspan="7">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<!-- DB 있을 때 -->
								<c:if test="${!empty suggList }">
									<!--게시판 내용 반복문 시작  -->
									<c:forEach var="map" items="${suggList }">
										<c:set var="suggBoardNo" value="${map['SUGG_BOARD_NO'] }" />
										<tr>
											<td><input type="checkbox" name="chk" id="chk" /></td>
											<td>${map['SUGG_BOARD_NO'] }</td>
											<td>${map['SUGG_CTG_NAME'] }</td>
											<td><a
												href="<c:url value='/suggestBoard/suggestBoardDetail.do?suggBoardNo=${suggBoardNo }'/>"
												style="color: black;"> ${map['SUGG_TITLE'] }</a></td>
											<td><fmt:formatDate value="${map['SUGG_REGDATE'] }"
													pattern="yyyy-MM-dd" /></td>
											<td>${map['MEMBER_NAME'] }</td>
											<c:if test="${!empty map['ANSW_NO']}">
												<td><fmt:formatDate value="${map['ANSW_REGDATE'] }"
														pattern="yyyy-MM-dd" /></td>
												<td>처리완료</td>
											</c:if>
										</tr>
									</c:forEach>
									<!--게시판 내용 반복처리 끝  -->
								</c:if>
								<!-- 레코드반복 -->
							</tbody>
						</table>
					</div>
					<!-- 테이블 끝 -->

					<!-- 페이저-->
					<!-- 이전 블럭으로 이동 -->
					<div class="center-block" style="clear: both; margin: 0 auto;">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center mt-2">
								<c:if test="${pagingInfo.firstPage>1 }">
									<li class="page-item prev"><a class="page-link" href="#"
										onclick="pageFunc(${pagingInfo.firstPage-1})"></a></li>
								</c:if>
								<!-- [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pagingInfo.firstPage }"
									end="${pagingInfo.lastPage }">
									<c:if test="${i==pagingInfo.currentPage }">
										<li class="page-item active"><a class="page-link"
											href="javascript:void(0);" style="background-color: #2FA599;">
												${i}</a></li>
									</c:if>
									<c:if test="${i!=pagingInfo.currentPage }">
										<li class="page-item"><a href="#" class="page-link"
											onclick="pageFunc(${i})">${i }</a>
									</c:if>
								</c:forEach>
								<!-- 다음 블럭으로 이동 -->
								<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
									<li class="page-item next"><a class="page-link" href="#"
										onclick="pageFunc(${pagingInfo.lastPage+1})"></a></li>
								</c:if>
							</ul>
						</nav>
					</div> --%>
					<!-- 페이저-->

					<!-- Table head options end -->
				</div>
				<!-- content-wrapper -->
			</div>
			<!-- content-wrapper -->
		</div>
		<!-- content-wrapper -->
	</div>
	<!-- content-wrapper -->
</div>
<!-- app-content content -->


<%@ include file="../adminInc/adminBottom.jsp"%>