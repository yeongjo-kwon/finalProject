<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/adminTop.jsp"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}
</script>

<!-- 여기부터 -->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container p-0">

		<!-- 여기까지 box로 감싸는 기본틀 : 밑에 div맡출 것-->

		<!-- 헤더시작 -->
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h2 class="content-header-title float-left mb-0">일정 및 공지</h2>
						<div class="breadcrumb-wrapper">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">행정관리자
										업무</a></li>
								<li class="breadcrumb-item"><a href="#">일정 및 공지 관리</a></li>
								<li class="breadcrumb-item active">일정 및 공지 목록</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<div
				class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
				<div class="form-group breadcrumb-right">
					<div class="dropdown">
						<button
							class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<i data-feather="grid"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="app-todo.html"><i class="mr-1"
								data-feather="check-square"></i><span class="align-middle">Todo</span></a><a
								class="dropdown-item" href="app-chat.html"><i class="mr-1"
								data-feather="message-square"></i><span class="align-middle">Chat</span></a><a
								class="dropdown-item" href="app-email.html"><i class="mr-1"
								data-feather="mail"></i><span class="align-middle">Email</span></a><a
								class="dropdown-item" href="app-calendar.html"><i
								class="mr-1" data-feather="calendar"></i><span
								class="align-middle">Calendar</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 헤더 : 끝 -->

		<!-- Table head options start -->
		<div class="row" id="table-head">
			<div class="col-12">
				<div class="card" style="align-content: right;">
					<!-- <div class="card-header">
						<h4 class="card-title">아파트 공지 게시판 관리</h4>
					</div> -->


					<div class="card-body p-0" style="margin-top: 20px; float:right">

						<!-- 페이지param넘길 form -->
						<form name="frmPage" method="post"
							action="<c:url value='/admin/adminLiving/adminNoti/adminNotiList.do'/>">
							<input type="hidden" name="currentPage"> 
							<input type="hidden" name="searchCondition" value="${param.searchCondition }">
							<input type="hidden" name="searchKeyword"	value="${param.searchKeyword }">
						</form>
						
						<!-- 페이지param넘길 form : 끝-->

						<div class="p-0">



							<!-- 기본 Select -->
							<form name="frmSearch" method="post" 
								action='<c:url value="/admin/adminLiving/adminNoti/adminNotiList.do"/>'>
								
								
								<div id="divSearch" class="row col-12 d-flex pr-0">
								<div id="divSearch" class="col-6 d-inline">
								<p class="col-md-6 align-right font-lg-1"></p>
								<c:if test="${!empty param.searchKeyword }">
							<p class="col-md-6 align-right font-lg-1 align-text-bottom" >검색어 : ${param.searchKeyword}, ${pager.totalRecord } 건
								검색되었습니다.</p>
						</c:if>	
								</div>
								
								
								<div id="divSearch" class="col-6 d-flex pr-0">
								
									<div class="form-group col-md-6 mb-1 d-inline" id="searchCondition" >
										<select id="searchCondition" name="searchCondition"	class="form-control">
											<!-- namd="nCtgNo"에서 변경 -->
											<option value="NOTICE_TITLE"
												<c:if test="${param.searchCondition == 'NOTICE_TITLE'}">
							            		selected="selected"
							            	</c:if>>공지
												제목</option>
											<option value="NOTICE_CONTENT"
												<c:if test="${param.searchCondition == 'NOTICE_CONTENT'}">
							            		selected="selected"
							            	</c:if>>공지
												내용</option>
											<option value="N_CTG_NAME"
												<c:if test="${param.searchCondition == 'N_CTG_NAME'}">
							            		selected="selected"
							            	</c:if>>공지
												분류</option>

											<!-- 	<option value="2">시설보수 공지</option>
										<option value="3">생활 공지</option>
										<option value="4">관리비 공지</option>
										<option value="1">일정 공지</option> -->
										</select>
									</div>
							<!-- 	</div> -->
								<!-- 기본 Select -->
								
								
								<!-- 여기다 검색창 -->
								<div id="searchKeyword" class="col-md-6 input-group d-inline">
								<div class="input-group">
										<input type="text" class="form-control" name="searchKeyword"
											title="검색어 입력" value="${param.searchKeyword}"
											placeholder="검색어를 입력하세요" aria-label="Amount" />
										<div class="input-group-prepend p-0">
											<button class="btn btn-primary" type="submit" style="box-sizing: border-box; border-radius:0 5px 5px 0;">
											<i  data-feather="search" ></i></button>
										</div>
	     						</div>
								
	     						</div>
									
							
									
							</div><!-- 검색박스div -->
						</div><!-- #divSearch -->
						</form>
						
					</div>
				</div>
				<!-- 카드바디div -->
				
<!-- 여기다 검색창 : 끝 -->



					<!-- 테이블시작 -->
					<div class="table-responsive">
						<table class="table table-hover-animation">
							<thead class="thead-dark"
								style="background-color: #0E515F; color: #fff; font-size: 1.2em; font-weight: 200;">
								<tr>
									<th class="font-medium-1 text-center">번호</th>
									<th class="font-medium-1 text-center">분류</th>
									<th class="font-medium-1 text-center">제목</th>
									<th class="font-medium-1 text-center">작성일</th>
									<th class="font-medium-1 text-center">작성자</th>
									<th class="font-medium-1 text-center">액션</th>
								</tr>
							</thead>
							<tbody>

								<!-- 리스트 없으면 list.size()==0 -->
								<c:if test="${empty list}">
									<tr>
										<td><span class="text-center">공지 글이 없습니다.</span></td>
									</tr>
								</c:if>


								<!-- 레코드반복시작 -->
								<c:if test="${!empty list}">
									<c:forEach var="vo" items="${list}">
										<tr>
											<!-- 공지글 번호 -->
											<td><span class="font-weight-bold">${vo.noticeNo }</span>
											</td>

											<!-- 공지글 카테고리 -->
											<td>${vo.nCtgName }</td>

											<!-- 공지글 제목 -->

											<td>${vo.noticeTitle }</td>

											<!-- 공지글 등록일-->
											<td><fmt:formatDate value="${vo.noticeRegdate }"
													pattern="yyyy-MM-dd" /></td>

											<!-- 작성자 이름 인데 일단 회원번호로 테스트-->
											<td>${vo.memberName}</td>

											<!-- 포인트다 여기서 수정/삭제 가능 -->
											<td>
												<div class="dropdown">
													<button type="button"
														class="btn btn-sm dropdown-toggle hide-arrow"
														data-toggle="dropdown">
														<i data-feather="more-vertical"></i>
													</button>
													<div class="dropdown-menu">
														<a class="dropdown-item"
					href="<c:url value='/admin/adminLiving/adminNoti/adminNotiEdit.do?noticeNo=${vo.noticeNo }'/>">
															<i data-feather="edit-2" class="mr-50"></i><span>공지수정</span></a>
																									<!-- noticeNo 만보내라 -->
														<a class="dropdown-item"
		href="<c:url value='/admin/adminLiving/adminNoti/adminNotiDel.do?noticeNo=${vo.noticeNo }'/>">
															<i data-feather="trash" class="mr-50"></i><span>공지삭제</span></a>
													</div>
												</div>
											</td>
										</tr>


									</c:forEach>
								</c:if>
								<!-- 기본공지 리스트 반복 끝 -->


							</tbody>
						</table>
					</div>
					<!-- 테이블 끝 -->
					
					<!-- 페이저-->
					<div class="center-block" style="clear: both; margin: 0 auto;">
						<nav aria-label="Page navigation example">
							<ul class="pagination">

								<!-- 이전블럭으로(이전페이지) -->
								<c:if test="${pager.firstPage>1 }">
									<li class="page-item"><a class="page-link" href="#"
										onclick="pageFunc(${pager.firstPage-1})" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<!-- 블록 시작 : [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pager.firstPage}"
									end="${pager.lastPage}">
									<c:if test="${i==pager.currentPage }">
										<li class="page-item"><span
											style="color: blue; font-weight: bold" class="page-link">
												${i}</span></li>
									</c:if>
									<c:if test="${i!=pager.currentPage }">
										<li class="page-item"><a href="#"
											onclick="pageFunc(${i})" class="page-link"> ${i}</a></li>
									</c:if>
								</c:forEach>
								<!-- 블록 끝 : [1][2][3][4][5][6][7][8][9][10] -->


								<!-- 	<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								 -->
								<!-- 다음블럭으로(다음페이지) -->

								<c:if test="${pager.lastPage < pager.totalPage }">
									<li class="page-item"><a class="page-link" href="#" onclick="pageFunc(${pager.lastPage+1})" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>

							</ul>
						</nav>
					</div>
					<!-- 페이저  끝-->
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
<%@ include file="../../adminInc/adminBottom.jsp"%>