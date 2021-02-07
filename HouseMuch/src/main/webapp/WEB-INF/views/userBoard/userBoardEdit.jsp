<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<!-- 링크 -->
<link href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css"
	rel="stylesheet">

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/SmartEditor2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- js 작업 -->
<script type="text/javascript">
$(function(){
	/* 
	-유효성 검사 Ajax사용
	*/
	$('#boardTitle').focus();
	
	$('#btOk').click(function(){
		if($('#boardCtgNo').val()==0){
			alert('카테고리를 선택하세요.');
			event.preventDefault();
			$('#boardCtgNo').focus();
		}else if($('#boardTitle').val()==0){
			alert('제목을 입력하세요.');
			event.preventDefault();
			$('#boardTitle').focus();
		}else if($('[name="boardContent"]').val()==0){
			alert('내용을 입력하세요.');
			event.preventDefault();
			$('[name="boardContent"]').focus();
		}
		
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#smartEditor").value = $("#smartEditor").value.replace(/<br>$/, "");
		location.href='<c:url value="/userBoard/userBoardEdit.do"/>';
	});
	
});

/* function작업 */
function exit(){
	if(confirm('작성중인 글쓰기를 종료하시겠습니까?')){
		location.href="<c:url value='/userBoard/userBoardList.do'/>";
	}else{
		event.preventDefault();
	}
}
</script>
<section id="userBoard" class="userBoard">
	<div class="container">
		<br> <br> <br> <br>
		<div class="form">
			<form class="frmUserBoard" method="post"
				enctype="multipart/form-data" action="<c:url value='/userBoard/userBoardEdit.do'/>">
				<!-- 히든 -->
				<input type="hidden" name="oldFilename" id="oldFilename" value="${map['boardFilename']}">
				<input type="hidden" name="oldFilesize" id="oldFilesize" value="${map['boardFilesize']}">
				<input type="hidden" name="oldOriginalFilename" id="oldOriginalFilename" value="${map['boardOriginalFilesize']}">
				<input type="hidden" name="boardNo" id="boardNo" value="${map['boardNo']}">
				
				<div class="row">
					<div class="form-group col-2 col-xl-2" id="divLeft">
						<select name="boardCtgNo" id="boardCtgNo">
							<option value="">말머리</option>
							<c:if test="${!empty ctgList }">
								<!-- 반복문 시작 -->
									<c:forEach var="ctgVo" items="${ctgList }">
										<option value="${ctgVo.boardCtgNo }">
											${ctgVo.boardCtgName }
										</option>
									</c:forEach>
								<!-- 반복문 끝 -->
							</c:if>
						</select>
					</div>
					<div class="col-10 col-xl-10">
						<input type="text" class="form-control" name="boardTitle"
							id="boardTitle" placeholder="제목" data-rule="minlen:4"
							data-msg="Please enter at least 8 chars of subject" value="${map['boardTitle'] }"/>
						<div class="validate"></div>
					</div>
				</div>
				<div class="divFile" id="divFile">
					<input type="file" name="upfile" id="upfile" size="45">
					<c:if test="${!empty map['boardFilename'] }">
						<span style="color:#7DB249;font-weight:bold;font-size:0.8em;">
							※ 첨부 파일을 새로 지정할 경우 기존 파일
							<img src='<c:url value="/resources/aptUser_images/file.gif" />'>
							${map['boardOriginalFilename'] }은(는) 삭제됩니다
						</span>
					</c:if>
				</div>
				<div class="form-group">
					<textarea class="form-control" rows="5" id="smartEditor"
						name="boardContent" data-rule="required"
						data-msg="Please write something for us" placeholder="내용을 입력하세요.">${map['boardContent'] }</textarea>
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
					<div class="validate"></div>
				</div>
				<div class="text-center">
					<button type="submit" id="btOk">수정</button>
					<button type="button" name="btCancel" onclick="exit()">취소</button>
				</div>
			</form>
		</div>
	</div>
</section>


<%@ include file="../mainInc/mainBottom.jsp"%>