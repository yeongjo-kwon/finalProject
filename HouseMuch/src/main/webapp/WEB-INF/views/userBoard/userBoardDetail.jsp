<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<link
	href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css"
	rel="stylesheet">

<style type="text/css">
</style>

<script type="text/javascript">
	function btList() {
		location.href = "<c:url value='/userBoard/userBoardList.do'/>";
	}

	function btEdit(no) {
		location.href = "<c:url value='/userBoard/userBoardEdit.do?boardNo=${param.boardNo}'/>";
	}

	function btDelete() {
		if(confirm('정말로 삭제하시겠습니까?')){
			location.href = "<c:url value='/userBoard/userBoardDelete.do?boardNo=${param.boardNo}'/>";
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
			<input type="hidden" name="boardNo" id="boardNo"
				value="${map['boardNo'] }"> 
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
					<td>${map['boardNo'] }</td>
					<th>작성일</th>
					<td><fmt:formatDate value="${map['boardRegdate'] }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>이 름</th>
					<td>${map['memberName'] }</td>
					<th>조회</th>
					<td>${map['boardReadcount'] }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">[${map['boardCtgName']}] ${map['boardTitle'] }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">추가예정</td>
				</tr>
			</table>
			<div class="boardContent" style="overflow: auto;">${map['boardContent'] }</div>
		</div>
		<c:import url="/userBoard/boardComment.do?boardNo=${param.boardNo }"/>
	</div>
</section>

<%@ include file="../mainInc/mainBottom.jsp"%>