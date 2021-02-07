<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/adminTop.jsp" %>
<!-- 스마트 에디터 리소스  -->
<link
	href="${pageContext.request.contextPath}/resources/userBoard/css/boardStyle.css"
	rel="stylesheet">
<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/SmartEditor2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- 스마트 에디터 리소스 :끝  -->


<!-- 스마트 에디터 js  -->
<script type="text/javascript">
$(function(){
	/* 
	-유효성 검사 Ajax사용
	*/
	$('#addName').focus();
	
	$('form[name=frmWrite]').find('#btOK').click(function(){
	/*	if($('#addCtgNo').val()==0){
			alert('시설 분류를 선택하세요.');
			event.preventDefault();
			$('#addCtgNo').focus();
		}else if($('#addName').val()==0){
			alert('시설명을 입력하세요.');
			event.preventDefault();
			$('#addName').focus();
		}else if($('[name="addContent"]').val()==0){
			alert('내용을 입력하세요.');
			event.preventDefault();
			$('[name="addContent"]').focus();
		}
	*/	
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#smartEditor").value = $("#smartEditor").value.replace(/<br>$/, "");
		location.href='<c:url value="/admin/adminLiving/adminAdd/adminAddInfoList.do"/>';
	});
	
	//파일첨부시 첨부파일명 가져오는이벤트
	$('input[name="addinfoImgFile"]').change(function(e){
		// 원래 여러번 첨부하면 맨 마지만꺼만 첨부되는건데 텍스트가 안없어지고 계속 보여짐 
		// -> 그래서 그 전에 첨부해서 나왔던 텍스트 사라지고 다시 맨 마지막에 첨부되서 파일명 보이는것만 보이게 하는거임, 어차피 처리되는건 중복없이 한개씩 맨 마지막에 선택한 애들만 들어감
		$('#fileText').text('');
		
		var files=$('input[name="addinfoImgFile"]')[0].files;
        
        for(var i= 0; i<files.length; i++){
			//첨부파일명 텍스트 가져와서 <p>안에 넣기 : 안해도 첨부는 됨
        	var fileText = $('#fileText').text();
			$('#fileText').append("첨부된 파일&nbsp;:&nbsp;&nbsp;"+files[i].name+"<br>");
        }
    });

	
});

/* function작업 */
function exit(){
	if(confirm('작성중인 작업을 종료하시겠습니까?')){
		location.href="<c:url value='/admin/adminLiving/adminAdd/adminAddInfoList.do'/>";
	}else{
		event.preventDefault();
	}
}


</script>
<!-- 스마트 에디터 js : 끝 -->



   <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">부가시설 등록</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                    	<a href="<c:url value='/admin/adminLiving/adminLiving.do'/>">행정 관리 메인</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">부가시설 관리</a>
                                    </li>
                                    <li class="breadcrumb-item active">부가시설 등록</li>
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
                                            <h6 class="mb-25">작성자 : ${sessionScope.memVo.memberName}</h6><!-- 로그인된 사용자 이름 -->
                                            <jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                                            <p class="card-text">오늘 날짜 : <c:out value="${today}"/></p><!-- 글 등록 시점 현재 날짜  -->
                                        </div>
                                    </div>
                                    <!-- Form -->
                                    <form action="<c:url value='/admin/adminLiving/adminAdd/adminAddInfoRegister.do'/>" 
                                    method="post" class="mt-2" name="frmWrite" enctype="multipart/form-data">
                                     
                                     <!-- hidden친구들 -->
                                     <!-- <input type="hidden" name="addNo" title="시설 번호는 수정에서만"> -->
                                     <!-- hidden친구들 : 끝-->
                                     
                                        <div class="row">
                                            <div class="col-md-6 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="addName">부가시설 명</label>
                                                    <input type="text" id="addName"  name="addName" class="form-control" 
                                                    		placeholder="부가시설 명을 입력하세요"/>
                                                </div>
                                            </div>
                                            <!-- 분류카테고리  -->
                                            <div class="col-md-6 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="addCtgNo">시설 분류</label>
                                                    <select id="addCtgNo" name="addCtgNo" class="form-control">
                                                        <option value="1">특화 시설</option>
                                                        <option value="2">교육 시설</option>
                                                        <option value="3">문화 시설</option>
                                                        <option value="4">스포츠 시설</option>
                                                        <option value="5">편의시설(무료)</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- 분류카테고리  -->
                                            
                                            <!-- 위치정보 -->
                                            <div class="col-md-6 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="addLocationInfo">위치 정보</label>
                                                    <input type="text" id="addLocationInfo" name="addLocationInfo" class="form-control" value="" placeholder="위치정보를 입력하세요" />
                                                </div>
                                            </div>
                                            <!-- 이용요금  -->
                                            <div class="col-md-6 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="blog-edit-slug">월 이용 요금</label>
                                                    <input type="text" id="addPrice" name="addPrice" class="form-control" 
                                                       placeholder="관리비에 부과될 월 이용 요금을 입력하세요" />
                                                </div>
                                            </div>
                                            
                                            <div class="col-12">
                                                <div class="form-group mb-2">
                                                    <label for="addContent">상세 설명</label>
                                                    <div id="blog-editor-wrapper">
                                                        <!-- <div id="blog-editor-container">
                                                            <div class="editor"> -->
                                                              <!-- 스마트에디터 시작 -->
                                                              
                                                              
                                                              
                                                              <div class="form-group">
																<textarea class="form-control" name="addContent" rows="5"
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
																		bUseVerticalResizer : true, 
																		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
																		bUseModeChanger : false 
																		}
																	}); 
																</script>
															</div>
                                                              <!-- 스마트에디터 시작 :끝 -->
                                                              
                                                              
                                                              
                                                            <!-- </div>
                                                        </div> -->
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- 썸넬첨부 -->
                                            <div class="col-12 mb-2">
                                                <div class="border rounded p-2">
                                                    <div class="media flex-column flex-md-row">
                                                        <img src="${pageContext.request.contextPath}/resources/aptAdmin_images/thumbnail-default.svg" id="blog-feature-image" class="rounded mr-2 mb-1 mb-md-0" width="170" height="110" alt="Blog Featured Image" />
                                                        <div class="media-body">
                                                            <h5 class="mb-1 mt-1">썸네일 이미지 첨부</h5>
                                                            <small class="text-muted">새로운 썸네일 이미지를 등록하면 기존의 썸네일 이미지는 삭제됩니다.</small>
                                                            <p class="my-50" id="fileText" name="fileText"></p>
                                                            <!--  -->
                                                                <a href="javascript:void(0);" id="blog-image-text" ><span class="my-50 d-block" id="fileText"></span></a>
                                                            <div class="d-inline-block">
                                                                <div class="form-group mb-0">
                                                                    <div class="custom-file">
                                                                      <label class="custom-file-label" for="addinfoImgFile"></label>
 															<input type="file" class="custom-file-input notiFileInput" id="addinfoImgFile"
																name="addinfoImgFile" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 썸넬첨부 끝 -->
                                            
                                            
                                            <!-- 버튼 -->
                                            <div class="col-12 mt-50">
	                                            <!-- <div class="col-5 mt-2" style="text-align: left;">
	                                                <button type="button" class="btn btn-outline-danger col-4">시설 정보 삭제</button>
	                                            </div>  -->
	                                            <div class="col-6 col-12 mt-3" style="text-align: right;">
	                                                <button type="reset" class="btn btn-outline-secondary col-3" id="btCLEAR">다시 입력</button>
	                                                <button type="submit" class="btn btn-primary col-4" id="btOK">시설 정보 등록</button>
	                                            </div> 
	                                            
	                                        <%--     <div class="col-6 mt-3" style="text-align: left;">							<!-- 에러남  $addinfoImgFilename=${vo.addinfoImgFilename}  -->
                                            <a href="<c:url value='/admin/adminLiving/adminNoti/adminAddInfoDel.do'/>">
                                                <button type="button" class="btn btn-outline-danger col-4">시설 정보 삭제</button>
                                            </a>
                                            </div>    
                                            <div class="col-6 mt-3" style="text-align: right;">
                                                <button type="reset" class="btn btn-outline-secondary col-3">다시 입력</button>
                                                <button type="submit" class="btn btn-primary col-4" id="btOK">시설정보 등록</button>
                                            </div>--%> 
                                            
                                                <!-- <button type="submit" class="btn btn-primary mr-1">등록</button>
                                                <button type="reset" class="btn btn-outline-secondary">취소</button> -->
                                            </div>
                                            <!-- 버튼 : 끝 -->
                                        </div>
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
<%@ include file="../../adminInc/adminBottom.jsp" %>