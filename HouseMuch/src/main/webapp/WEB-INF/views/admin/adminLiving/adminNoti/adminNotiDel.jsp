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
                 
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">공지사항 삭제</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">행정관리자 메인
                                    </li>
                                    <li class="breadcrumb-item">일정 및 공지 관리
                                    </li>
                                    <li class="breadcrumb-item active">일정/공지 삭제</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                    <div class="form-group breadcrumb-right">
                        <div class="dropdown">
                            <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="grid"></i></button>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="app-todo.html"><i class="mr-1" data-feather="check-square"></i><span class="align-middle">Todo</span></a><a class="dropdown-item" href="app-chat.html"><i class="mr-1" data-feather="message-square"></i><span class="align-middle">Chat</span></a><a class="dropdown-item" href="app-email.html"><i class="mr-1" data-feather="mail"></i><span class="align-middle">Email</span></a><a class="dropdown-item" href="app-calendar.html"><i class="mr-1" data-feather="calendar"></i><span class="align-middle">Calendar</span></a></div>
                        </div>
                    </div>
                </div>
                 
                </div>
                 
<div class="content-body">
<div class="container row">
<div class="card p-1 col-6">

	<form name="frmDel" action="<c:url value='/admin/adminLiving/adminNoti/adminNotiDel.do'/>" method="post" >
		<input type="hidden" id="noticeNo" name="noticeNo" value="${param.noticeNo}">
		<input type="hidden" id="oldFileName" name="oldFileName" value="${param.noticeFilename}">
																		<!-- 컨트롤러에서 oldFileName으로 받음 -->
		<div class="card-header card-title">
			<div class="text-center">
			<h4 class="text-center mb-5">
		공지 삭제 시, 아파트 일정에캘린더에서 일정도 함께 삭제됩니다.<br><br><br>
			[ ${param.noticeNo }번 공지 ]를 삭제합니다.<br><br>
			권한 확인을 위해 비밀번호를 입력해주세요.
			
			</h4> 
			</div>
		</div>
		
		<div class="row text-center w-100 m-1">
		
	    <input type="text" id="userPwd" name="userPwd" style="width:97%; height: 3em;border:1px solid #ddd; border-radius:3px;"><br>
		</div>
<div class="card-body">
		<div class="text-center">
		<input type="button" value="돌아가기" class="btn btn-secondary" id="btBack">
		<input type="submit" value="공지 삭제" class="btn btn-primary">
</div>
</div>
	</form>
</div>

</div>
</div>
</div>

            </div>
    <!-- END: Content-->


<div class="clearfix"></div>



<%@ include file="../../adminInc/adminBottom.jsp"%>