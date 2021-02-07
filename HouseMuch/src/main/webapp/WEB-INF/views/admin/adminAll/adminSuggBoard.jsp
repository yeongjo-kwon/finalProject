<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<style>
.table-responsive {
	text-align: center;
}
</style>

<script type="text/javascript">
	$(function(){
		$('#btSubmit').click(function(){
			if($('#validationTooltip01').val()==0){
				alert('카테고리명을 입력하세요.');
				event.preventDefault();
				$('#validationTooltip01').focus();
			}
		});
		
		$('#chkAll').click(function(){
			//만약에 최상단 체크박스가 체크되면
			if($(this).prop("checked")){
				$('input[name=chk]').prop("checked",true); //전체 선택
			}else{ //아니면
				$('input[name=chk]').prop("checked",false); //전체 해제
			}
		});
		
		$('#btSearchSubmit').click(function(){
			if($('#searchKeyword').val()==0){
				alert('검색어를 입력하세요.');
				event.preventDefault();
				$('#searchKeyword').focus();
			}
		});
		
	});
	
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>


<form action="<c:url value='/admin/adminAll/adminSuggBoard.do'/>"
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition }"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>

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
							<li class="breadcrumb-item"><a href="index.html">건의사항 관리
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
		<div class="row" id="table-head">
			<div class="col-12">
				<div class="card" style="align: right">
					<div class="card-header">
						<h4 class="card-title">아파트 건의게시판 답변 등록 및 조회</h4>
					</div>
					<div class="card-body p-0">
						<!--                <p class="card-text">
                                    Similar to tables and dark tables, use the modifier classes
                                    <code class="highlighter-rouge">.thead-dark</code> to make
                                    <code class="highlighter-rouge">&lt;thead&gt;</code>s appear dark.
                                </p> -->

						<div class="col-12 mb-1 p-0">
							<!-- 기본 Select -->
							<div class="col-md-2 col-6 mb-1 float-left">
								<div class="form-group">
									<!-- <label for="basicSelect">분류</label> -->
									<select class="form-control" id="basicSelect" name="suggCtgNo">
										<option value="">건의 분류</option>
										<!-- 게시판 카테고리 반복문 시작 -->
										<c:if test="${!empty scList }">
											<c:forEach var="scVo" items="${scList }">
												<option value="${scVo.suggCtgNo }">${scVo.suggCtgName }
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

									<input type="text" class="form-control"
										placeholder="검색어를 입력하세요" aria-label="Amount" />
									<div class="input-group-prepend">
										<button class="btn btn-outline-primary" type="button">
											<i data-feather="search" style="box-sizing: border-box;"></i>
										</button>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- 여기다 검색창 : 끝 -->
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


<%@ include file="../adminInc/adminBottom.jsp"%>