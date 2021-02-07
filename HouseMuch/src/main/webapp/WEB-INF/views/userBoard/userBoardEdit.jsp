<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<link href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css" rel="stylesheet">

<style type="text/css">
.ck-editor__editable {
	min-height: 400px;
}
</style>
<script
	src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script>
<section id="userBoard" class="userBoard">
	<div class="container">
		<br>
		<br> <br>
		<br>
		<div class="form">
			<form class="frmUserBoard" method="post"
				enctype="multipart/form-data" action="">
				<div class="row">
					<div class="form-group col-2 col-xl-2" id="divLeft">
						<select name="category" id="divCg">
							<option>말머리</option>
							<option></option>
							<option></option>
						</select>
					</div>
					<div class="form-group col-10 col-xl-10">
						<input type="text" class="form-control" name="subject"
							id="subject" placeholder="제목" data-rule="minlen:4"
							data-msg="Please enter at least 8 chars of subject" />
						<div class="validate"></div>
					</div>
				</div>
				<div class="form-group">
					<textarea class="form-control" name="message" rows="5"
						id="boardContent" name="boardContent" data-rule="required"
						data-msg="Please write something for us" placeholder="내용을 입력하세요."></textarea>
					<script>
						ClassicEditor
				        .create( document.querySelector( '#boardContent' ) )
				        .catch( error => {
				            console.error( error );
						} );
					</script>
					<div class="validate"></div>
				</div>
				<div class="form-group" id="divFile">
					<input type="file">
				</div>
				<div class="text-center">
					<button type="submit">수정</button>
					<button type="submit">취소</button>
				</div>
			</form>
		</div>
	</div>
</section>



<%@ include file="../mainInc/mainBottom.jsp"%>