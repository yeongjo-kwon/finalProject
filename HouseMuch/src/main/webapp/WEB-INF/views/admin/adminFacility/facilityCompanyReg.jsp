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
    
    $('#regFrm').submit(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
        
        //유효성 검사
        var content = $('#smarteditor').val();
        if(content == "" || content == null || content == '&nbsp;' || content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){ 
        	alert("본문을 작성해주세요."); 
        	editor_object.getById["smartEditor"].exec("FOCUS"); //포커싱 
        	event.preventDefault();
        	return false;
        }else if($('#mngCompCtgNo').val()==0){
			alert('분류명을 택해주세요');
			$('#mngCompCtgNo').css('border-color','red');
			$('#mngCompCtgNo').focus();
			event.preventDefault();
			return false;
		}else if($('#mngCompName').val().length<1){
			alert('업체명을 입력해주세요');
			$('#mngCompName').css('border-color','red');
			$('#mngCompName').focus();
			event.preventDefault();
			return false;			
		}else if($('#price').val().length<1){
			alert('계약 금액을 입력해주세요');
			$('#price').css('border-color','red');
			$('#price').focus();
			event.preventDefault();
			return false;			
		}else if($('#contractDate').val().length<1){
			alert('계약 날짜 입력해주세요');
			$('#contractDate').css('border-color','red');
			$('#contractDate').focus();
			event.preventDefault();
			return false;			
		}else if($('#mngCompTel ').val().length<1){
			alert('업체 연락처를 입력해주세요');
			$('#mngCompTel').css('border-color','red');
			$('#mngCompTel').focus();
			event.preventDefault();
			return false;			
		}else if(!validate_tel($('#mngCompTel ').val())){
			alert('숫자만 입력 가능합니다.');
			$('#mngCompTel').css('border-color','red');
			$('#mngCompTel').focus();
			event.preventDefault();
			return false;	
		}
        
        //스마트 에디터 사용시 무의미 하게 생기는 p태그 제거하기
        content = $('#smarteditor').val().replace(/<p><br><\/p>/gi, "<br>");	//<p><br></p> -> <br>로 변환
        /*
        	대상 문자열.replace(/찾을 문자열/gi, "변경할 문자열");
        -> 여기서 꼭 알아야 될 점은 (/) 표시 안ㅇ ㅔ넣는 찾을 문자열의 따옴표는 없어야 한다.
        	뒤의 gi 의 의미는
        		g : 전체 모든 문자열을 변경 global
        		i : 영문 대소문자를 무시, 모두 일치하는 패턴 검색 ignore
        */
        
        content = content.replace(/<\/p><p>/gi, "<br>");	// </p><p> -> <br>
        content = content.replace(/(<\/p><br>|<p><br>)/gi,"<br><br>");	//</p><br>, <p><br> -> <br><br>
        content = content.replace(/(<p>|<\/p>)/gi,"");	//<p> 또는 </p> 모두 제거시
        
        $('#smarteditor').val(content);
        
        var strPrice=$('#price').val();
        var price=strPrice.replace(",","");
        price=Number(price);
        $('#contractPrice').val(price);
		
    });
    
});

function validate_tel(tel){
    var pattern=new RegExp(/^[0-9]*$/g);
    return pattern.test(tel);
}
	
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
                        	<form action="<c:url value='/admin/adminFacility/facilityContract.do'/>" method="post" id="regFrm">
                            	<div class="row">
                            	<!-- <form>  -->
                            	
	                                <div class="col-xl-3 col-md-6 col-12 mb-1">
	                                    <div class="form-group">
	                                        <select class="form-control" id="mngCompCtgNo" name="mngCompCtgNo">
												<option value="0">분류</option>
												<c:forEach var="ctgVo" items="${ctgList }">
													<option value="${ctgVo.mngCompCtgNo }">${ctgVo.mngCompCtgName }</option>
												</c:forEach>
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
	                                        <label for="mngCompTel">전화번호</label>
											<input type="text" class="form-control col-12" id="mngCompTel" name="mngCompTel" placeholder="-없이 숫자만 기입하세요" style="text-align:right;">									
	                                    </div>
	                                </div>
	                                
	                                <div class="col-xl-3 col-md-6 col-12">
	                                    <div class="form-group">
	                                        <label for="contractPrice">계약금액</label>
											<input type="text" class="form-control numeral-mask" placeholder="원" style="text-align:right;" name="price" id="price">
	                                    	<input type="hidden" name="contractPrice" id="contractPrice">
	                                    </div>
	                                </div>
	                                <div class="col-xl-3 col-md-6 col-12">
	                                    <div class="form-group">
	                                        <label for="contractDate">계약일</label>
		                             		<input type="text" class="form-control flatpickr-basic flatpickr-input" readonly="readonly" placeholder="YYYY-MM-DD" name="contractDate" id="contractDate">
	                                    </div>
	                                </div>
	
	                                <div class="col-xl-3 col-md-6 col-12">
										<label for="disabledInput">부가시설 관리 여부</label>
	                                	<div class="demo-inline-spacing" style="margin-top:10px;">
		                                    <div class="custom-control custom-radio m-0 mr-2">
		                                        <input type="radio" class="custom-control-input" name="isAddFacility" id="radio1" value="Y">
		                                        <label class="custom-control-label" for="radio1">Y</label>
		                                    </div>
		                                    <div class="custom-control custom-radio m-0">
												<input type="radio" class="custom-control-input" name="isAddFacility" id="radio2" checked="checked" value="N">
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
	                                        <input type="submit" class="btn btn-primary center"  value="등록" id="submit">
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