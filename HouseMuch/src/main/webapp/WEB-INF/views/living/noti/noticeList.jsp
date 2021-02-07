<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../mainInc/mainTop.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

</script>
<style>
.apt-bg-primary{
	background-color:#5c9f24; 
}
.apt-bg-secondary{
	background-color:#f6f6f6; 
}
.apt-bg-light{
	background-color:#F2FBDD; 
}
.apt-bg-dark{
	background-color:#22550E; 
}

.apt-text-primary{
	color:#5c9f24; 
}
.apt-text-secandary{
	color:#666666; 
}
.apt-text-third{
	color:#F2FBDD; 
}
.apt-text-dark{
	color:#22550E; 
}

.btn{
	background-color:#5c9f24;
	border-color: #5c9f24;
}
.btn:hover{
	background-color:#326717;
	border-color: #326717;
}

.btn-light{
	background-color:#F2FBDD;
	border-color: #E2F7BC;
	color: #22550E;
}
.btn-light:hover{
	background-color:#ffffff;
	border-color: #5c9f24;
}

</style>
<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2 class="mt-2" style="line-height: 2; vertical-align: middle;">아파트
					공지사항</h2>
				<ol>
					<li><a href="<c:url value='/main/index.do'/>">Home</a></li>
					<li>공지사항 목록</li>
				</ol>
			</div>
		</div>
	</section>
	<!-- End Breadcrumbs -->

</main>

<section class="inner-page">
	<div class="container" >

<!-- divsearch 시작 -->
<div id="divSearch">

	<!-- 페이지param넘길 form -->
		<form
			action="<c:url value='/living/noti/noticeList.do'/>"
			name="frmPage" method="post">
			<input type="hidden" name="currentPage"> 
			<input type="hidden" name="searchCondition" value="${param.searchCondition }">
			<input type="hidden" name="searchKeyword"	value="${param.searchKeyword }">
		</form>
		<!-- 페이지param넘길 form : 끝-->

		<!-- 기본 Select -->
		<form name="frmSearch" method="post" 
			action='<c:url value="/living/noti/noticeList.do"/>'>
			
	

			<!-- 검색창 시작  -->
		<%-- 	<div id="searchKeyword" class="col input-group">
				<div class="input-group">
					<input type="text" class="form-control" name="searchKeyword"
						title="검색어 입력" value="${param.searchKeyword}"
						placeholder="검색어를 입력하세요" aria-label="Amount" />
					<div class="input-group-prepend">
						<button class="btn btn-outline-primary" type="submit"
							style="box-sizing: border-box;">
							<i data-feather="search"></i>
						</button>
					</div>
				</div>
			</div> --%>
			<!-- 검색창 : 끝   -->

			<!-- 검색셀렉박스 시작 -->
			<div class="clearfix">

				<%-- <p class="mt-5" style="display: inline; vertical-align: middle;">공지글
					총 ${list.size() } 건</p> --%>
				<c:if test="${!empty param.searchKeyword }">
					<p class="col align-right font-lg-1">검색어 :
						${param.searchKeyword}, ${pager.totalRecord } 건 검색되었습니다.</p>
				</c:if>

				<div id="searchCondition" class="col-md-4 col-12 mb-4 p-0 float-right" >
					<select id="searchCondition" name="searchCondition"	class="form-control">
						<!-- namd="nCtgNo"에서 변경 -->
						<option value="0" selected="selected">공지 분류 선택</option>
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
					</select>

<!-- 					<label for="nCtgNo"></label> <select id="nCtgNo" name="nCtgNo"
						class="form-control">
						<option value="2">시설보수 공지</option>
						<option value="3">생활 공지</option>
						<option value="4">관리비 공지</option>
						<option value="1">일정 공지</option>
					</select> -->
				</div>
			</div>
			<!-- 검색셀렉박스 끝 -->
		</form><!-- frmSearch끝 -->
</div><!-- divSearch 끝  -->


<!-- 테이블시작 -->
<div class="table-responsive" style="background-color: #ffffff; padding: 0; margin-right: 20px; margin-bottom: 50px; box-shadow: 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
	<table class="table table-hover table-hover-animation" style="margin-bottom: 0; border-radius: 5px 5px 5px 5px ;">


		<colgroup>
			<col style="width: 10%;" />
			<col style="width: 15%;" />
			<col style="width: 45%;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
		</colgroup>
		<thead
			style="background-color: #7DB249; border-radius: 5px 5px 5px 5px ;color: #ffffff; font-size: 1.2em; font-weight: 200; box-shadow: 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
			<tr>
				<th scope="col" class="font-medium-1 text-center">번호</th>
				<th scope="col" class="font-medium-1 text-center">분류</th>
				<th scope="col" class="font-medium-1 text-center">제목</th>
				<th scope="col" class="font-medium-1 text-center">첨부</th>
				<th scope="col" class="font-medium-1 text-center">작성일</th>
				<th scope="col" class="font-medium-1 text-center">조회수</th>
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
					<tr onclick="location.href='<c:url value="/living/noti/noticeDetail.do?noticeNo=${noticeNo}"/>'" 
						class="table-hover table-hover-animation">
					<!-- 공지글 번호 -->
						<td class="text-center">
							<span class="font-weight-bold">${vo.noticeNo }</span>
						</td>

						<!-- 공지글 카테고리 -->
						<td class="text-center">${vo.nCtgName }</td>

						<!-- 공지글 제목 -->
						<td class="text-center">${vo.noticeTitle }</td>

						<!-- 첨부-->
						<td class="text-center">
							<img alt="첨부파일아이콘" 
							src="${pageContext.request.contextPath}/resources/aptUser_images/file_icon.png">
						</td>


						<!-- 작성일-->
						<td class="text-center"><fmt:formatDate value="${vo.noticeRegdate }"
								pattern="yyyy-MM-dd" /></td>

						<!-- 조회수 -->
						<td class="text-center">조회수</td>

					</tr>
				</c:forEach>

			</c:if>
			<!-- 기본공지 리스트 반복 끝 -->
		</tbody>
	</table>
</div><!-- 테이블 끝 -->

<!-- divPage : 시작 -->


  <!-- E-commerce Pagination Starts -->
                    <section id="ecommerce-pagination">
                        <div class="row">
                            <div class="col-sm-12">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center mt-2">
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

								<!-- 다음블럭으로(다음페이지) -->

								<c:if test="${pager.lastPage < pager.totalPage }">
									<li class="page-item"><a class="page-link" href="#"
										onclick="pageFunc(${pager.lastPage+1})" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </section>
                    <!-- E-commerce Pagination Ends -->



<!-- divPage : 끝 -->


</div><!-- 컨테이너 끝 -->
</section><!--  class="inner-page" -->
<div class="clearfix"></div>

<%@ include file="../../mainInc/mainBottom.jsp"%>
