<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/adminTop.jsp"%>
<script type="text/javascript">
	$(function(){
		$('form[name=frmDel]').submit(function(){
			if($('#userPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#userPwd').focus();
				event.preventDefault();
			}else if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
			}
		});
		
		$('#btBack').click(function(){
			history.back();
		});
		
	});	
</script>

  <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
                 <div class="content-header row">
<div class="content-body">
<div class="container">

	<form name="frmDel" action="<c:url value='/admin/adminLiving/adminNoti/adminNotiDel.do'/>" method="post" >
		<input type="hidden" id="noticeNo" name="noticeNo" value="${param.noticeNo}">
		<input type="text" id="oldFileName" name="oldFileName" value="${param.noticeFilename}">
																		<!-- 컨트롤러에서 oldFileName으로 받음 -->
		<p>공지 삭제 시, 아파트 일정에캘린더에서 일정도 함께 삭제됩니다.<br>
		${param.noticeNo }번 공지를 삭제하시겠습니까?
		</p>
		
		권한 확인을 위해 비밀번호를 입력해주세요. 
	    <input type="text" id="userPwd" name="userPwd" >
		<input type="button" value="돌아가기" class="btn btn-secondary" id="btBack">
		<input type="submit" value="공지 삭제" class="btn btn-primary">
	</form>

</div>
</div>

            </div>
        </div>
    </div>
    <!-- END: Content-->


<div class="clearfix"></div>



<%@ include file="../../adminInc/adminBottom.jsp"%>