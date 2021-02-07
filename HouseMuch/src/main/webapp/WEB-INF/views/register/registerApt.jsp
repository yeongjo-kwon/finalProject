<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/nonTop.jsp" %>

<!-- 
	소유주가 사이트 운영진에게 아파트 신청 => 이메일 보내기 작업 (완료)
	XXXXXXXXXXXXXX 변경
	소유주가 사이트 운영진에게 아파트 신청 => 별도의 아파트 신청 쪽지함 테이블로 들어감 => 사이트 운영진이 그 쪽지 확인 가능
	
	유효성 완료
	
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/vendors.min.js"></script>
    
   
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app.js"></script>
    
    해당 js들 지우니까 잘됨 ... 하 ... ㅠㅠ
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
								<p>우리 아파트도 HOUSE MUCH 와 함께 하고 싶으신가요? <br>간단하게 신청하세요!</p>
								
								<!-- 신청 폼 !!!  -->
								
                                <form id="frmApt" class=" mt-2" action="<c:url value='/register/registerApt.do'/>" method="POST">
                                    <div class="form-group">
                                        <label for="subject" class="form-label" style="font-size: 15px;">아파트명</label>
                                        <input type="text" class="form-control" id="subject" name="fromAptName" tabindex="1" autofocus/>
                                    </div>
                                    <div class="form-group">
                                        <label for="senderName" class="form-label" style="font-size: 15px;">이름</label>
                                        <input type="text" class="form-control" id="senderName" name="fromName" tabindex="2"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="hp" class="form-label" style="font-size: 15px;">연락처</label>
                                        <input type="text" class="form-control" id="hp" name="fromHp" tabindex="3" placeholder="010-000-0000" />
                                    </div>
			 						<div class="form-group">
                                        <label for="email" class="form-label" style="font-size: 15px;">메일</label>
										<input type="email" class="form-control" name="fromEmail" id="email" data-rule="email" tabindex="4" placeholder="email@email.com">
									</div>
									<div class="form-group">
                                        <label for="message" class="form-label" style="font-size: 15px;">문의사항</label>
										<textarea class="form-control" name="fromDetail" rows="5" tabindex="5" id="message" ></textarea>
									</div>									
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox" >
                                            <input class="custom-control-input" type="checkbox" id="remember-me" />
                                            <label class="custom-control-label" for="remember-me"> 동의합니다 </label>
                                            <div>
                                            	고객 상담을 위하여 성함, 이메일, 아파트명, 전화번호를 수집하며
                                            	최대 3개월 까지 보관 후 파기합니다. 수집된 정보는 명시된 목적 외에 
                                            	다른 목적으로 사용되지 않습니다.
                                            </div>
                                        </div>
                                    </div>
                                    <input type="button" class="btn btn-block btn-primary" style="font-size: 15px;" id="send" value="제출하기">
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


    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <!-- END: Page Vendor JS-->


    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/pages/page-auth-login.js"></script>
    <!-- END: Page JS-->
    
    <script>
        $(window).on('load', function() {
           
            $('.nav-menu ul li').last().addClass('active');
            
            $('#send').click(function(){
            	
            	if($('#subject').val().length<1){
            		alert('아파트 명을 입력해주세요!');
            		$('#subject').focus();
            		event.preventDefault();
            		return false;
            	}
            	if($('#senderName').val().length<1){
            		alert('이름을 입력해주세요!');
            		$('#senderName').focus();
            		event.preventDefault();
            		return false;
            	}
            	if($('#hp').val().length<1){
            		alert('연락처를 입력해주세요!');
            		$('#hp').focus();
            		event.preventDefault();
            		return false;
            	}
            	
            	if($('#email').val().length<1){
            		alert('이메일을 입력해주세요!');
            		$('#email').focus();
            		event.preventDefault();
            		return false;
            	}
            	if($('#message').val().length<1){
            		alert('문의사항 내용을 입력해주세요!');
            		$('#message').focus();
            		event.preventDefault();
            		return false;
            	}
            	if(!$('#remember-me').is(":checked")){
            		alert('약관에 동의 해주셔야 신청이 진행됩니다.');
            		$('#remember-me').focus();
            		event.preventDefault();
            		return false;
            	}
            	
            	$('#frmApt').submit();
            });//submit
        });


    </script>
    
</body>
</html>