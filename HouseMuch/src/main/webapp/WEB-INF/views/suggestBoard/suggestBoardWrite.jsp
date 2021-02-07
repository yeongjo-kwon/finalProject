<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>
<!-- 링크 -->
<link
	href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css"
	rel="stylesheet">
<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/SmartEditor2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- css작업 -->

<!-- js작업 -->
<script type="text/javascript">
$(function(){
	/* 
	-유효성 검사 Ajax사용
	*/
	$('#suggTitle').focus();
	
	$('form[name=frmWrite]').find('#btOk').click(function(){
		if($('#suggCtgNo').val()==0){
			alert('카테고리를 선택하세요.');
			event.preventDefault();
			$('#suggCtgNo').focus();
		}else if($('#suggTitle').val()==0){
			alert('제목을 입력하세요.');
			event.preventDefault();
			$('#suggTitle').focus();
		}else if($('[name="suggContent"]').val()==0){
			alert('내용을 입력하세요.');
			event.preventDefault();
			$('[name="suggContent"]').focus();
		}
		
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#smartEditor").value = $("#smartEditor").value.replace(/<br>$/, "");
		location.href='<c:url value="/suggestBoard/suggestBoardList.do"/>';
	});
	
});

/* function작업 */
function exit(){
	if(confirm('작성중인 글쓰기를 종료하시겠습니까?')){
		location.href="<c:url value='/suggestBoard/suggestBoardList.do'/>";
	}else{
		event.preventDefault();
	}
}
</script>

<section id="userBoard" class="userBoard">
	<div class="container">
		<br> <br> <br> <br>
		<div class="form">
			<form class="frmUserBoard" method="post" name="frmWrite"
				action="<c:url value='/suggestBoard/suggestBoardWrite.do'/>">
				<div class="row">
					<div class="form-group col-2 col-xl-2" id="divLeft">
						<select name="suggCtgNo" id="suggCtgNo">
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
					<div class="form-group col-10 col-xl-10">
						<input type="text" class="form-control" name="suggTitle"
							id="suggTitle" placeholder="제목" data-rule="minlen:4"
							data-msg="Please enter at least 8 chars of subject" />
						<div class="validate"></div>
					</div>
				</div>
				<div class="form-group">
					<textarea class="form-control" name="suggContent" rows="5"
						id="smartEditor" data-rule="required"
						data-msg="Please write something for us" placeholder="내용을 입력하세요."></textarea>
					<div class="validate"></div>
					<script>
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({ 
							oAppRef : oEditors, 
							elPlaceHolder : "smartEditor", 
							sSkinURI : "${pageContext.request.contextPath}/SmartEditor2/SmartEditor2Skin.html", 
							fCreator : "createSEditor2", 
							htParams : { 
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
							bUseToolbar : true, 
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
							bUseVerticalResizer : false, 
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
							bUseModeChanger : false 
							}
						}); 
					</script>
				</div>
				<div class="text-center">
					<button type="submit" id="btOk">건의 신청</button>
					<button type="button" name="btCancel" onclick="exit()">취소</button>
				</div>
			</form>
		</div>
	</div>
</section>

<%@ include file="../mainInc/mainBottom.jsp"%>