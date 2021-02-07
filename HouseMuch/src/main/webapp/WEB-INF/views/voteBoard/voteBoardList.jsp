<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<link href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css" rel="stylesheet">

<c:if test="">
	<p>검색어 : 건 검색되었습니다.</p>
</c:if>
<section id="userBoard" class="userBoard">
	<div class="container">
		<br> <br> <br> <br>
		<div class="section-title">
			<h2>입주민 투표</h2>
			<p>우리 아파트 내 다양한 활동을 투표를 통해 결정해보세요.</p>
		</div>
		<table class="tbBoard"
			summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
			<colgroup>
				<col style="width: 10%;" />
				<col style="width: 50%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">관리자</th>
					<th scope="col">등록일</th>
					<th scope="col">처리</th>
				</tr>
			</thead>
			<tbody>
				<!-- DB 없을 때 -->

				<!-- DB 있을 때 -->
				<!--게시판 내용 반복문 시작  -->
				<!--게시판 내용 반복처리 끝  -->
			</tbody>
		</table>
	</div>
	<div class="divPage">
		<!-- 페이지 번호 추가 -->
		<!-- 이전 블럭으로 이동 -->

		<!-- [1][2][3][4][5][6][7][8][9][10] -->

		<!-- 다음 블럭으로 이동 -->

		<!--  페이지 번호 끝 -->
	</div>
	<div class="form">
		<form class="frmUserBoard" method="post" name="frmUserBoard"
			action='<c:url value=""/>'>
			<select name="searchCondition">
				<option value="title"
					<c:if test="">
            		selected="selected"
            	</c:if>>제목</option>
				<option value="content"
					<c:if test="">
            		selected="selected"
            	</c:if>>내용</option>
				<option value="name"
					<c:if test="">
            		selected="selected"
            	</c:if>>작성자</option>
			</select> <input type="text" name="searchKeyword" title="검색어 입력" value="">
			<input type="submit" value="검색">
		</form>
	</div>
	<div class="text-center">
		<button type="submit">글쓰기</button>
	</div>
</section>

<%@ include file="../mainInc/mainBottom.jsp"%>