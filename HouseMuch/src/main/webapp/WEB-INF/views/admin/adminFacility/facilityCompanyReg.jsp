<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<style>

</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/SmartEditor2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "${pageContext.request.contextPath}/SmartEditor2/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false,
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
})

	
</script>



<!-- 여기부터 -->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	
	<div class="content-body">
	
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">보수 업체 계약 등록</h2>
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="<c:url value='/admin/adminFacility/facilityCompanyList.do'/>" style="color:gray;">보수 업체 계약 목록</a></li>
							<li class="breadcrumb-item">보수 업체 계약 등록</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		
		
        <!-- Basic Inputs start -->
       	<section id="basic-input">
           	<div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                        	<form>
                            	<div class="row">
                            	<!-- <form>  -->
                            	
	                                <div class="col-xl-3 col-md-6 col-12 mb-1">
	                                    <div class="form-group">
	                                        <select class="form-control" id="mngCompCtgNo" name="mngCompCtgNo">
												<option value="0">분류</option>
												<option value="1">관리</option>
												<option value="2">경비</option>
											</select>
	                                    </div>
	                                </div>
	                                <div class="col-xl-9 col-md-6 col-12 mb-1">
	                                    <div class="form-group">
	 										<input type="text" class="form-control col-12" id="mngCompName" name="mngCompName" placeholder="업체명">									
	                                    </div>
	                                </div>
	                                
	                                <div class="col-xl-3 col-md-6 col-12 mb-1">
	                                    <div class="form-group">
	                                        <label for="disabledInput">전화번호</label>
											<input type="text" class="form-control col-12" id="mngCompTel" name="mngCompTel" placeholder="02-1234-5678" style="text-align:right;">									
	                                    </div>
	                                </div>
	                                
	                                <div class="col-xl-3 col-md-6 col-12">
	                                    <div class="form-group">
	                                        <label for="disabledInput">계약금액</label>
											<input type="text" class="form-control" placeholder="원" style="text-align:right;">
	                                    </div>
	                                </div>
	                                <div class="col-xl-3 col-md-6 col-12">
	                                    <div class="form-group">
	                                        <label for="disabledInput">계약일</label>
		                             		<input type="text" class="form-control flatpickr-basic flatpickr-input" readonly="readonly" placeholder="YYYY-MM-DD">
	                                    </div>
	                                </div>
	
	                                <div class="col-xl-3 col-md-6 col-12">
										<label for="disabledInput">부가시설 관리 여부</label>
	                                	<div class="demo-inline-spacing" style="margin-top:10px;">
		                                    <div class="custom-control custom-radio m-0 mr-2">
		                                        <input type="radio" class="custom-control-input" name="isAddFacility" id="radio1">
		                                        <label class="custom-control-label" for="radio1">Y</label>
		                                    </div>
		                                    <div class="custom-control custom-radio m-0">
												<input type="radio" class="custom-control-input" name="isAddFacility" id="radio2" checked="checked">
												<label class="custom-control-label" for="radio2">N</label>
		                                    </div>
	                                    </div>
	                                </div>
	    
	                                <div class="col-xl-12 col-md-12 col-12">
	                                    <div class="form-group">
	                                        <textarea name="contractContent" id="smarteditor" rows="100" cols="100" style="width:100%; height:412px;"></textarea>
	                                    </div>
	                                </div>

	                                <div class="col-xl-12 col-md-6 col-12">
	                                    <div class="form-group" style="text-align:center;">
	                                        <input type="button" class="btn btn-primary center"  value="등록">
	                                    </div>
	                                </div>
                                <!-- </form>  -->
                            	</div>
                        	</form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Basic Inputs end -->		

	</div>
</div>


<%@ include file="../adminInc/adminBottom.jsp"%>