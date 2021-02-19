<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../user/dashinc/usertop.jsp"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/userBoard/css/boardPaging.css">
<link
	href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css"
	rel="stylesheet">

<style type="text/css">
.tbStyle {
	background-color: #7db2490d;
}

table.table {
	TEXT-ALIGN: center;
}

.page-item.active {
	background-color: #E5F9F0;
	border-color: #82E3C8;
}
</style>
<script type="text/javascript">
	$(function(){
		tbStyle();
		
		$('#chkAll').click(function(){
			//만약에 최상단 체크박스가 체크되면
			if($(this).prop("checked")){
				$('input[name=chk]').prop("checked",true); //전체 선택
			}else{ //아니면
				$('input[name=chk]').prop("checked",false); //전체 해제
			}
		});
		
	});

	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	function tbStyle(){
		$('.tbBoard tbody tr').mouseover(function(){
			$(this).addClass('tbStyle');
		}).mouseout(function(){
			$(this).removeClass('tbStyle');
		});
	}
</script>

<form action="<c:url value='/userDash/suggList.do'/>" name="frmPage"
	method="post">
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition }"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>

<!-- 여기부터 -->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container p-0">


		<!-- Table head options start -->
		<div class="content-header row">
			<!-- 첫번째 div -->
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">내 건의글 조회</h2>
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="<c:url value='/userDash/userDashMain.do'/>">마이페이지</a></li>
							<li class="breadcrumb-item"><a
								href="<c:url value='/userDash/suggList.do'/>"> 내 글 목록</a></li>
							<li class="breadcrumb-item active">내 건의글 조회</li>
						</ol>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="table-head">
			<div class="col-12">
				<div class="card" style="align: right">
					<div class="card-header">
						<h4 class="card-title">게시글 관리</h4>
					</div>
					<div class="card-body p-0">
						<div class="col-12 mb-1 p-0">
							<!-- 기본 Select -->
							<form class="frmUserBoard" method="post" name="frmUserBoard"
								action='<c:url value="/userDash/suggList.do"/>'>
								<div class="col-md-2 col-6 mb-1 float-left">
									<div class="form-group">
										<!-- <label for="basicSelect">분류</label> -->
										<select class="form-control" id="basicSelect"
											name="searchCondition">
											<option value="SUGG_TITLE"
												<c:if test="${param.searchCondition=='SUGG_TITLE' }">
								            		selected="selected"
								            	</c:if>>글제목</option>
								            	<option value="SUGG_CONTENT"
												<c:if test="${param.searchCondition=='SUGG_CONTENT' }">
							            		selected="selected"
							            	</c:if>>글내용</option>
											<option value="SUGG_CTG_NAME"
												<c:if test="${param.searchCondition=='SUGG_CTG_NAME' }">
							            		selected="selected"
							            	</c:if>>분류</option>
											<option value="MEMBER_NAME"
												<c:if test="${param.searchCondition=='MEMBER_NAME' }">
							            		selected="selected"
							            	</c:if>>글쓴이
											</option>
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
					<div>
						<c:if test="${!empty searchVo.searchKeyword }">
							<p>검색어 : ${searchVo.searchKeyword }, ${pagingInfo.totalRecord }건
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
									<th class="font-medium-1 text-center">처 리</th>
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
											<!-- <td><input type="checkbox" name="chk" id="chk" /></td> -->
											<td>${suggBoardNo}</td>
											<td>${map['SUGG_CTG_NAME'] }</td>
											<td><a
												href="<c:url value='/suggestBoard/suggestBoardDetail.do?suggBoardNo=${suggBoardNo }'/>"
												style="color: black;"> 
												<!-- 제목이 긴 경우 일부만 보여주기 -->
												<c:if test="${fn:length(map['SUGG_TITLE'])>=25}">
													${fn:substring(map['SUGG_TITLE'],0,25) } ...
												</c:if>
												<c:if test="${fn:length(map['SUGG_TITLE'])<25}">
													${map['SUGG_TITLE'] }
												</c:if>
												</a>
											</td>
											<td><fmt:formatDate value="${map['SUGG_REGDATE'] }"
													pattern="yyyy-MM-dd" /></td>
											<td>${map['MEMBER_NAME'] }</td>
											<c:if test="${!empty map['ANSW_NO']}">
												<td>
													<fmt:formatDate value="${map['ANSW_REGDATE'] }" pattern="yyyy-MM-dd"/>
												</td>
												<td>처리완료</td>
											</c:if>
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
								<c:if test="${pagingInfo.firstPage>1 }">
									<li class="page-item prev"><a class="page-link" href="#"
										onclick="pageFunc(${pagingInfo.firstPage-1})"></a></li>
								</c:if>
								<!-- [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pagingInfo.firstPage }"
									end="${pagingInfo.lastPage }">
									<c:if test="${i==pagingInfo.currentPage }">
										<li class="page-item active"><a class="page-link"
											href="javascript:void(0);"> ${i}</a></li>
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
					</div>
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

<%@ include file="../user/dashinc/userbottom.jsp"%>