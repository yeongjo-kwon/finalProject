<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/nonTop.jsp" %>

<!-- 
	가입[3]
	아이디 / 비밀번호 / 비밀번호 확인 / 이름 /이메일=인증번호 전송 / 휴대폰번호 = 3칸 
	유효성 검사
	-> 아이디 중복확인은 ajax로 change 할때마다 = msg ajax에서 적용 ( 이미 존재하는 아이디 입니다. / 사용 가능한 아이디 입니다. ) , input hidden (아이디 중복체크 결과 ) Y N 조절
	
	-> 프로필 사진 설정은 마이페이지의 회원수정에서 가능
 -->

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/themes/bordered-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/form-validation.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/page-auth.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/style.css">
    <!-- END: Custom CSS-->

	<!-- user - css추가 -->    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/bootstrap.css">

    <!-- BEGIN: Content-->
	<div class="container col-lg-10">
		<div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row"></div>
            <div class="content-body">
                <div class="auth-wrapper auth-v1 px-2">
                    <div class="py-2">
                        <!-- 신청 -->
                        <div class="card mb-0 mt-5">
                            <div class="card-body" style="width:500px;">
                                <a href="javascript:void(0);" class="brand-logo">
                                    <!--  <h2 class="brand-text text-primary ml-1" style="color: #5c9f24;">HouseMuch</h2> -->
                                    <img alt="하우스머치 로고" src='<c:url value="/resources/aptUser_images/housemuch_logo.png"/>'>
                                </a>
                                <p class="mt-1">HOUSEMUCH에 오신걸 환영합니다!<br>발급받으신 세대키에 따라 주소가 자동 등록 되어 들어갑니다.</p>
								
							
								
								<!-- 가입 폼 !!!  -->
                                <form class="auth-register-form mt-1 p-2" method="POST">
                                    <input type="hidden" id="chkId">
                                    
                                    <div class="form-group">
                                        <label for="id" class="form-label" style="font-size: 15px;">아이디</label><span style="color:red;">*</span>
                                        <input type="text" class="form-control" id="id" name="id" style="ime-mode:inactive" tabindex="1" autofocus />
                                    	<span class="error"> </span>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" class="form-label" style="font-size: 15px;">비밀번호</label><span style="color:red;">*</span>
                                        <input type="password" class="form-control" id="pwd" name="pwd" tabindex="2" />
                                    	<span class="error"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd2" class="form-label" style="font-size: 15px;">비밀번호 확인</label><span style="color:red;">*</span>
                                        <input type="password" class="form-control" id="pwd2" name="pwd2"  tabindex="3"/>
                                    	<span class="error"></span>
                                    </div>
			 						
			 						<div class="form-group">
                                        <label for="memberName" class="form-label" style="font-size: 15px;">이름</label><span style="color:red;">*</span>
										<input type="text" class="form-control" name="memberName" id="memberName" tabindex="4">
										<span class="error"></span>
									</div>
			 						
			 						<div class="form-group mb-0">
										<input type="hidden" id="emailChk">
                                        <label for="email" class="form-label" style="font-size: 15px;">이메일</label><span style="color:red;">*</span><br>
										<input type="email" class="form-control col-md-8 mr-2" name="email" id="email" tabindex="5" placeholder="이메일 입력" style="display: inline-block;">
										<input type="button" class="btn btn-primary" name="chkBtn" id="chkBtn" value="인증번호 받기" >
									</div>
									
									<div class="form-gorup mt-0">
										<span class="error" id="erMail"></span>									
									</div>
									
			 						<div class="form-group mt-1" id="hideMail">
										<input type="hidden" id="codeChk">
										<input type="tel" class="form-control" name="chkMail" id="chkMail" placeholder="인증번호 입력" tabindex="6" readonly="readonly">
										<span class="error"></span>
									</div>
									
			 						<div class="form-group">
                                        <label for="aptName" class="form-label" style="font-size: 15px;">휴대전화(선택사항)</label>
										<div class="row d-flex align-items-end m-auto" >
											<div class="col-md-4 col-4">
												<input type="number" class="form-control row" name="hp1" id="hp1" style="display: inline;" tabindex="6" maxlength="3">
												<span style="margin-left: 15px;">&nbsp;-</span>									
											</div>
											<div class="col-md-4 col-4">
												<input type="number" class="form-control row" name="hp2" id="hp2" style="display: inline;" tabindex="7" maxlength="4">
												<span style="margin-left: 15px;">&nbsp;-</span>
											</div>
											<div class="col-md-4 col-4">
												<input type="number" class="form-control row" name="hp3" id="hp3" style="display: inline;" tabindex="8" maxlength="4">
											</div>
										</div>
										<span class="error"></span>
									</div>
																	
                                    
                                    
                                    <button class="btn btn-block btn-primary mt-5 mb-3" tabindex="9" style="font-size: 15px;" id="join">가입하기</button>
                                </form>

                               
                               

                            </div>
                        </div>
                        <!-- /신청폼 -->
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- END: Content-->
    

<!-- ======= Footer ======= -->
<footer id="footer">
	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-4 col-md-6">
					<div class="footer-info">
						<h3 style="color: white;">HOUse MUCH?</h3>
						<p>
							서울특별시 강남구 테헤란로 124  <br>
							4층 아이티윌<br>
							<br> 
							<strong>Phone:</strong>+82 02 6255 8061<br> 
							<strong>Email:</strong>info@housemuch.com<br>
							<strong>site:</strong>https://www.itwill.net<br>
						</p>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 footer-links">
					<h4>Useful Links</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/main/index.do'/>">Home</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/main/index.do#about'/>">소개 </a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/main/index.do#contact'/>">문의</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/register/registerApt.do'/>">신청</a></li>
					</ul>
				</div>

				<div class="col-lg-4 col-md-6 footer-links">
					<h4>Thanks to</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> 이수빈</li>
						<li><i class="bx bx-chevron-right"></i> 권영조</li>
						<li><i class="bx bx-chevron-right"></i> 김이나</li>
						<li><i class="bx bx-chevron-right"></i> 김한희</li>
					</ul>
				</div>


			</div>
		</div>
	</div>

	<div class="container">
		<div class="copyright">
			&copy; Copyright <strong><span>Groovin</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/groovin-free-bootstrap-theme/ -->
			Designed by <a href="https://bootstrapmade.com/" style="color: #5c9f24;">BootstrapMade</a>
		</div>
	</div>
</footer>
<!-- End Footer -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/php-email-form/validate.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/counterup/counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/venobox/venobox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	
	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/user/assets/js/main.js"></script>
    <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/pages/page-auth-login.js"></script>
    <!-- END: Page JS-->
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
    <script>
    	var emailCode="";	//이메일 전송 인증번호 저장 위한 코드
    
        $(function(){
        	if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        	
        	//
        	$('input[type=text]').each(function(){
        		$(this).blur(function(){
        			if($(this).val().length<1){
        				$(this).next().html('필수 입력 사항 입니다');
        			}else{
        				$(this).next().html('');
        			}
        		});
        	});
        	
        	$('#id').blur(function(){
        		
        		var id=$(this).val();
        		
        		if(id.length<1){
        			$(this).next().html('필수 입력 사항 입니다');
        		}else{
	        		if(!validate_userid(id)){
	        			$(this).next().html('아이디는 영문,숫자,특수기호 _만 가능합니다.');
	        			$('#chkId').val('N');
	        		}else{
	        			$.ajax({
	        				url:"<c:url value='/register/ajaxCheckId.do'/>",
	        				type:"GET",
	        				data:{id:id},
	        				success:function(res){
	        					var msg="", chkYn="";
	        					if(res){	//사용 불가
	        						msg="이미 등록된 아이디 입니다.";
	        						chkYn="N";
	        					}else{	//사용 가능
	        						msg="사용 가능한 아이디 입니다!";
	        						chkYn="Y";
	        					}
	        					
	        					$('#chkId').val(chkYn);
								if($('#chkId').val()=="Y"){
									$('#id').next().css("color","#7DB249");
									$('#id').css("border-color","");
								}else{
									$('#id').next().css("color","red");									
									$('#id').css("border-color","red");
								}
	        					$('#id').next().html(msg);
	        				},
	        				error:function(xhr, status, error){
	        					alert('error! : ' + error)
	        				}
	        			});	//ajax
	        		}        			
        		} //if
        		
        	});
        	
        	$('#pwd').blur(function(){
        		if($(this).val().length<1){
        			$(this).next().html('필수 입력 사항 입니다');
        		}else{
        			$(this).next().html('');
        		}
        	});
        	
        	$('#pwd2').blur(function(){
        		if($('#pwd').val()!=$('#pwd2').val()){
        			$(this).next().html('비밀번호가 일치하지 않습니다');
        		}else{
        			$(this).next().html('');        			
        		}
        	});
        	
        	$('#email').blur(function(){
        		var email=$(this).val();
        		
        		if(email.length<1){
        			$('#erMail').html('필수 입력 사항 입니다');
    			}else{
    				if(!validate_email(email)){
    					$('#erMail').html('이메일 형식에 맞지 않습니다.');
        			}else{
        				$.ajax({
	        				url:"<c:url value='/register/ajaxChkMail.do'/>",
	        				type:"GET",
	        				data:{email:email},
	        				success:function(res){
	        					var msg="", chkYn="";
	        					if(res){	//사용 불가
	        						msg="이미 등록된 이메일 입니다.";
	        						chkYn="N";
	        					}else{	//사용 가능
	        						msg="사용 가능한 이메일 입니다.";
	        						chkYn="Y";
	        					}
	        					
	        					$('#emailChk').val(chkYn);
								if($('#emailChk').val()=="Y"){
									$('#erMail').css("color","#7DB249");
									$('#email').css("border-color","");
								}else{
									$('#erMail').css("color","red");									
									$('#email').css("border-color","red");
								}
								$('#erMail').html(msg);
	        				},
	        				error:function(xhr, status, error){
	        					alert('error! : ' + error)
	        				}
	        			});	//ajax	
        			}
    			}
        		
        	});
        	
        	$('#chkBtn').click(function(){	//이메일 전송 및 인증 ajax
        		var email=$('#email').val();	//입력한 이메일
        		
        		if(validate_email(email) && email.length>=2){
        			if($('#emailChk').val()=="Y"){
		        		$.ajax({
		        			url:"<c:url value='/register/sendMail.do'/>",
		        			type:"GET",
		        			data:{email:email},
		        			success:function(data){
		        				$('#chkMail').removeAttr("readonly");
		                		$('#chkMail').next().html('인증번호를 발송했습니다.<br> 인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.');
		                		emailCode = data;
		        			},
		    				error:function(xhr, status, error){
		    					alert('error! : ' + error)
		    				}
		        		});	//ajax
        			}else{
        				$('#email').focus();
        			}
    			}else{
    				$('#erMail').html('이메일 형식에 맞지 않습니다.');
    			}
        		
        	});
        	
        	$('#chkMail').blur(function(){	//인증번호 입력란
        		var inputCode = $('#chkMail').val();	//사용자가 입력한 인증번호
        		if(inputCode==emailCode && inputCode!=null){
					$('#chkMail').next().css("color","#7DB249");
        			$('#chkMail').next().html("인증번호가 일치합니다.");
        		}else if(inputCode==null){
					$('#chkMail').next().css("color","red");
        			$('#chkMail').next().html("인증번호를 입력해주세요.");        			        			
        		}else{
					$('#chkMail').next().css("color","red");
        			$('#chkMail').next().html("인증번호를 다시 확인해주세요.");        			
        		}
        	});
        	
    	
        	//유효성 체크
    		$('#join').click(function(){	//submit 할때 
        		if($('#id').val().length<1 || !validate_userid($('#id').val())){	//아이디를 안적거나 정규식에 맞지 않다면
       				$('#id').focus();
       				event.preventDefault();				
       			}else if($('#pwd').val().length<1){ //비밀번호 안적을 경우
       				$('#pwd').focus();
       				event.preventDefault();
       			}else if($('#pwd').val()!=$('#pwd2').val()){ //비밀번호와 비밀번호일치가 맞지 않다면
       				$('#pwd2').focus();
       				event.preventDefault();
       			}else if($('#memberName').val().length<1){	// 이름을 안적었을 경우
       				$('#memberName').focus();
       				event.preventDefault();
       			}else if($('#email').val().length<1 || !validate_email($('#email').val())){	//이메일을 안적거나 정규식에 맞지 않은 경우
       				$('#email').focus();
       				event.preventDefault();
       			}else if($('#chkId').val()!='Y'){	//아이디 중복 인 경우
    				$('#id').focus();
    				event.preventDefault();
    			}else if($('#emailChk').val()!='Y'){	//이메일 중복 인 경우
    				$('#email').focus();
    				event.preventDefault();    				
    			}
    		});
        	
        });


    </script>
    
</body>
</html>