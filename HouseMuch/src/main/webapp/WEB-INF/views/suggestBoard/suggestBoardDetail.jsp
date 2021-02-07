<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<link
	href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css"
	rel="stylesheet">

<style type="text/css">
.boardContent {
	text-align: left;
	padding: 10px;
}
</style>

<script type="text/javascript">
	function btList() {
		location.href = "<c:url value='/suggestBoard/suggestBoardList.do'/>";
	}

	function btEdit(no) {
		location.href = "<c:url value='/suggestBoard/suggestBoardEdit.do?suggBoardNo=${param.suggBoardNo}'/>";
	}

	function btDelete() {
		if(confirm('정말로 삭제하시겠습니까?')){
			location.href = "<c:url value='/suggestBoard/suggestBoardDelete.do?suggBoardNo=${param.suggBoardNo}'/>";
		}else{
			event.preventDefault();
		}
	}
</script>

<!-- 건의게시판 상세보기 -->
<section id="userBoard" class="userBoard">
	<div class="container">
		<br> <br> <br> <br>
		<form>
			<input type="hidden" name="suggBoardNo" id="suggBoardNo"
				value="${map['suggBoardNo'] }"> 
			<input type="hidden" name="memberNo" id="memberNo" value="${map['memberNo'] }">
		</form>
		<div class="center">
			<div class="text-right">
				<c:if test="${map['memberNo'] == sessionMemberNo or authMap['AUTH_LEVEL']!=1}">
					<button type="submit" onclick="btEdit()">수정</button>
					<button type="submit" onclick="btDelete()">삭제</button>
				</c:if>
				<button type="submit" onclick="btList()">목록</button>
			</div>
		</div>
		<!-- 게시판 글 상세보기 -->
		<div class="boardDetail">
			<table class="tbUserBoard">
				<tr>
					<th>번호</th>
					<td>${map['suggBoardNo'] }</td>
					<th>작성일</th>
					<td><fmt:formatDate value="${map['suggRegdate'] }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>분류</th>
					<td>${map['suggCtgName'] }</td>
					<th>답변일</th>
					<c:if test="${!empty map['answNo'] }">
						<td><fmt:formatDate value="${map['answRegdate'] }"
								pattern="yyyy-MM-dd" /></td>
					</c:if>
					<c:if test="${empty map['answNo'] }">
						<td>미처리</td>
					</c:if>
				</tr>
				<tr>
					<th>이 름</th>
					<td>${map['memberName'] }</td>
					<th>처리</th>
					<c:if test="${!empty map['answNo'] }">
						<td>처리완료</td>
					</c:if>
					<c:if test="${empty map['answNo'] }">
						<td>미처리</td>
					</c:if>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">${map['suggTitle'] }</td>
				</tr>
			</table>
			<div class="boardContent">${map['suggContent'] }</div>
		</div>
		<c:import url="/suggestBoard/suggestAnswer.do?suggBoardNo=${param.suggBoardNo }"/>
		<%-- <%@ include file="../suggestBoard/suggestAnswer.jsp" %> --%>
	</div>
</section>

<%@ include file="../mainInc/mainBottom.jsp"%>