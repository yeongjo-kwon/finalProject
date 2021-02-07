<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/adminTop.jsp" %>

<script type="text/javascript">
//넘어온 값이 빈값인지 체크합니다.
//!value 하면 생기는 논리적 오류를 제거하기 위해
//명시적으로 value == 사용
//[], {} 도 빈값으로 처리
var isEmpty = function(value){
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
	 return true
	}else{
	 return false
	}
};

$(function() {
	
	var startDate='${vo.startDateStr}';
	var entDate = '${vo.endDateStr}';

	//처음 로드되었을 때 일정값(날짜)이 있으면  
	if(isEmpty(startDate)){
		$('.aptSchedule').hide();
	}else{
		$('#scdDate').val(startDate+' to '+entDate);
		$('.aptSchedule').show();
		//$('#scdDate').prop('placeholder','일정을 입력하세요');
	}
	
	var category = ${vo.nCtgNo};
	if(category == 1 ){
		$('.aptSchedule').show();//맨처음 로드되었을 때 일정공지면 나타나게
	}else{
		$('.aptSchedule').hide();//맨처음 로드되었을 때는  일정공지가 아니면  안나타나게
	}
	
	$('#nCtgNo').on('change',function(){
		if($(this).val() == 1){
			$('.aptSchedule').show();
		}else{
			$('.aptSchedule').hide();
		}
	}); 
	

	//공지수정 이벤트
	$('#btOK').on('click', function(){
		
/* 			var noticeContent = $('#blog-editor-container').find('.editor').html();	//에디터안에서
		$('#noticeContent').val(noticeContent); */
	
		
		//데이트피커로 받아온 날짜 str
		var scdStr =  $('#scdDate').val();//"2021-02-09 to 2021-05-06"
										  //"012345678901234567890123"
		console.log(scdStr);									  
		//시작일 종료일 각각 찢어서 히든에 값 넣기												  
		var startDateStr = scdStr.substr(0,10);
		var endDateStr = scdStr.substr(14,24);

		$('#startDateStr').val(startDateStr);
		$('#endDateStr').val(endDateStr);
						
/*			
		$('form[name=frmEdit]').submit(function(){
			location.href="<c:url value='/admin/adminLiving/adminNoti/adminNotiEdit.do?"+${vo.noticeNo}+"'/>";
		});
		
	*/	
	});
	
	//파일첨부시 첨부파일명 가져오는이벤트
	$('input[name="noticeFile"]').change(function(e){
		// 원래 여러번 첨부하면 맨 마지만꺼만 첨부되는건데 텍스트가 안없어지고 계속 보여짐 
		// -> 그래서 그 전에 첨부해서 나왔던 텍스트 사라지고 다시 맨 마지막에 첨부되서 파일명 보이는것만 보이게 하는거임, 어차피 처리되는건 중복없이 한개씩 맨 마지막에 선택한 애들만 들어감
		$('#filepath').text('');
		
		var files=$('input[name="noticeFile"]')[0].files;
        
        for(var i= 0; i<files.length; i++){
			//첨부파일명 텍스트 가져와서 <p>안에 넣기 : 안해도 첨부는 됨
        	var filepath = $('#filepath').text();
			$('#filepath').append("첨부된 파일&nbsp;:&nbsp;&nbsp;"+files[i].name+"<br>");
        }
    });
	
	
	
	
});
	
	
</script>



    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">공지 사항 수정</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">행정관리자 메인</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">일정 및 공지 관리</a>
                                    </li>
                                    <li class="breadcrumb-item active">일정/공지 수정</li>
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
                <!-- Blog Edit -->
                <div class="blog-edit-wrapper">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="media">
                                        <div class="avatar mr-75">
                                           <img src="${pageContext.request.contextPath}/resources/user_images/member-default.jpg" width="38" height="38" alt="Avatar" />
                                         </div>
                                        <div class="media-body">
                                            <h6 class="mb-25">작성자 : ${sessionScope.memVo.memberName}</h6><!-- userName -->
                                            <jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                                            <p class="card-text">오늘 날짜 : <c:out value="${today}"/></p>
											
                                        </div>
                                    </div>
                                    <!-- Form -->
  								 <form name="frmEdit" id="frmEdit" method="post" class="mt-2" enctype="multipart/form-data"
  								  action="<c:url value='/admin/adminLiving/adminNoti/adminNotiEdit.do'/>">
                                    
                                    <!-- 데이트피커로 받은날짜 > script에서 substr > 히든에 넣고 넘기기 -->
                                    <input type="hidden" id="startDateStr" name="startDateStr">
                                    <input type="hidden" id="endDateStr" name="endDateStr">
                                    <input type="hidden" id="noticeNo" name="noticeNo" value="${vo.noticeNo }">
                                    <input type="hidden" id="scdNo" name="scdNo" value="${vo.scdNo}">
                                    <input type="hidden" id="oldFileName" name="oldFileName" value="${vo.noticeFilename}">
                                    	<!-- 여기서 noticeFilename -> oldFileName으로 바뀜 -->
                              
                                        <div class="row">
											<!-- 공지분류 -->
                                            <div class="col-md-3 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="nCtgNo">공지 분류</label><span style="color:red">*</span>
                                                    <select id="nCtgNo" name="nCtgNo" class="form-control">
                          							
                                                    <!-- 누르고 들어온 글에 해당되는 option으로 selected 할것 -->
                         								<option value="2"
                         									<c:if test="${vo.nCtgNo == 2}">
                          									selected="selected"
                         									</c:if>
                         								>시설보수 공지</option>
                                                   
                                                       <option value="3"
   														<c:if test="${vo.nCtgNo == 3}">
                          									selected="selected"
                         									</c:if>
                                                       >생활 공지</option>

                                                       <option value="4"
   														<c:if test="${vo.nCtgNo == 4}">
                          									selected="selected"
                         									</c:if>
                                                       >관리비 공지</option>

                                                       <option value="1"
   														<c:if test="${vo.nCtgNo == 1}">
                          									selected="selected"
                         									</c:if>
                                                       >일정 공지</option>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-9 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="noticeTitle">공지 제목</label><span style="color:red">*</span>
                                                    <input type="text" id="noticeTitle" name="noticeTitle" class="form-control" value="${vo.noticeTitle }"/>
                                                </div>
                                            </div>
                                            
                                            <!-- 여기다 date picker-->
			                                <div class="col-md-3 col-12 aptSchedule">
                                                <div class="form-group mb-2">
				                                    <label for="scdDate">일정 선택</label><span style="color:red">*</span>
				                                    <input type="text" id="scdDate" name="scdDate" class="form-control flatpickr-range" /> 
				                                   <%-- value="${vo.startDateStr } to ${vo.endDateStr }"/> --%>
				                                </div>
			                                </div>
                                            <!-- date picker : 끝-->
                                            
                                            <div class="col-md-9 col-12 aptSchedule">
                                                <div class="form-group mb-2">
                                                    <label for="scdContent">일정 요약</label><span style="color:red">*</span>
                                                    <input type="text" id="scdContent" name="scdContent" class="form-control" 
                                                    value="${vo.scdContent }" placeholder="일정 요약 내용을 입력하세요" />
                                                </div>
                                            </div>
                                            
                                            
                                       <!-- 공지내용 시작 -->
										<div class="col-12">
											<div class="form-group mb-2">
												<div id="blog-editor-wrapper">
													<label for="noticeContent">공지 내용</label>
													<div id="blog-editor-container" >
													<textarea id="noticeContent" name="noticeContent" class="form-control">${vo.noticeContent}</textarea>
													<!-- 	<div class="editor" style="min-height:600px;" id="livingEditor">
															에디터에 공지 내용 넣을 것  noticeContent
													</div> -->
													</div>
												</div>
											</div>
										</div>
                                       <!-- 공지내용 끝 -->

                               				<!-- 파일첨부 시작-->
                                            <div class="col-12 ">
                                                <div class="border rounded p-2">
                                                    <h4 class="mb-1">파일첨부</h4>
                                                      <small class="text-muted">새로운 파일을 업로드하면 기존 파일은 삭제됩니다.</small>
                                              <!-- 오리지날파일명  -->
                                                            <p class="my-50">    
                                                            	<c:if test="${!empty vo.noticeFilename }">                   <!-- 누르면다운로드 -->
                                                            <a href="javascript:void(0);" id="blog-image-text">	첨부된 파일&nbsp;:&nbsp;&nbsp;${vo.noticeOriginalFilename }</a>
                                                            	</c:if>            
                                                        <%--     	<c:if test="${empty vo.noticeFilename }">                   
                                                            <a href="javascript:void(0);" id="blog-image-text">	첨부된 파일&nbsp;:&nbsp;&nbsp;</a>
                                                            	</c:if>            
                                                            </p> --%>
                                                            	<%-- 첨부된 파일&nbsp;:&nbsp;&nbsp;<a href="javascript:void(0);" id="blog-image-text">${fileInfo}</a>
                                                            	fileInfo로 하면 저장된 파일명나옴 시분초지저분한거  --%>
                                                            
                                      			<!-- 일반 파일첨부 창-->
												<div class="d-inline-block">
													<div class="form-group">
														<div class="custom-file">
															<label class="custom-file-label" for="noticeFile"></label>
 															<input type="file" class="custom-file-input notiFileInput" id="noticeFile"
																name="noticeFile" />
														</div>
													</div>
												</div>
											</div>
                                        </div>
                              			<!-- 일반 파일첨부 끝-->
                              			
                                            <div class="col-6 mt-3" style="text-align: left;">							<!-- 에러남  $noticeFilename=${vo.noticeFilename}  -->
                                            <a href="<c:url value='/admin/adminLiving/adminNoti/adminNotiDel.do?noticeNo=${vo.noticeNo }&noticeFilename=${vo.noticeFilename}'/>">
                                                <button type="button" class="btn btn-outline-danger col-4">공지 삭제</button>
                                            </a>
                                            </div>    
                                            <div class="col-6 mt-3" style="text-align: right;">
                                                <button type="reset" class="btn btn-outline-secondary col-3">다시 입력</button>
                                                <button type="submit" class="btn btn-primary col-4" id="btOK">수정 완료</button>
                                            </div>
                                            
                                        </div><!-- row -->
                                    </form>
                                    <!--/ Form -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Blog Edit -->

            </div>
        </div>
    </div>
    <!-- END: Content-->



<%@ include file="../../adminInc/adminBottom.jsp"%>