<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<link href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css" rel="stylesheet">

<section id="userBoard" class="userBoard">
	<div class="container">
		<br> <br> <br> <br>
		<div class="center">
			<div class="text-right">
				<button type="submit" id="btEdit">수정</button>
				<button type="submit" id="btDelete">삭제</button>
				<button type="submit" id="btList">목록</button>
			</div>
		</div>
		<!-- 게시판 글 상세보기 -->
		<div class="boardDetail">
			<table class="tbUserBoard">
				<tr>
					<th>번호</th>
					<td>번호</td>
				</tr>
				<tr>
					<th>관리자</th>
					<td>관리자</td>
				</tr>
				<tr>
					<th>투표기간</th>
					<td>투표기간</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>제목</td>
				</tr>
			</table>
			<div>내용</div>
		</div>
	</div>
</section>

<%@ include file="../mainInc/mainBottom.jsp"%>