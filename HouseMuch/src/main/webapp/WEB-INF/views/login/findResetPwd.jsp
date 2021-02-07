<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/nonTop.jsp" %>

<style type="text/css">
.next-btn {
    float: right;
    width: 10%;
    height: 100%;
    background: #5c9f24;
    color: #ffffff;
    font-size: 24px;
    line-height: inherit;
    border: 0;
    outline: 0;
}
.form-row{
	display:block;
}
</style>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/components.css">

<!-- 
	findPwd 에서 if문 처리 후 인증코드가 각각 일치하면 넘어오는 페이지
	비밀번호 재설정 페이지
	해당 아이디의 새로운 비밀번호 적고 변경하기 누르면 alert 변경되었습니다 로그인 창으로 이동
	
	#userId에 넘어온 아이디 넣어주기. form 마저 작성
 -->

<!-- ======= Section ======= -->
	<section class="contact">
		<div class="container card" style="margin-top: 50px; margin-bottom: 50px; padding-top:80px; padding-bottom:50px;">
			
			<div align="center" style="margin-bottom:50px;"><img src="<c:url value='/resources/common_img/findPwd.png'/>" alt="findId"></div>
			
			<div style="width:800px; float: left; margin-left: 300px;  ">
				<h4>비밀번호 재설정</h4>
				<p>비밀번호를 변경해 주세요.<br>
				다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호로 변경해 주세요.</p>
			</div>
	         
            <form class="auth-login-form mt-2" action="#" method="POST">
				
				<div class="form col-lg-12 php-email-form " align="center">
				
					<input type="hidden" id="userId">
					
					<br>
					<div class="form-group form-row row">
						<div >
							<input type="password" class="form-control" style="width:400px;" id="newPwd" name="login-password"  placeholder="새 비밀번호를 입력해주세요" />
						</div>
					</div>
					<div class="form-group form-row row">
						<div >
							<input type="password" class="form-control" style="width:400px;" id="newPwd2" name="login-password" placeholder="새 비밀번호 확인"  />
						</div>
					</div>

				
					<br><br>
					<div class="text-center ">
						<button type="submit">변경하기</button>
					</div>
	
				</div>     
			</form>    
 			
 			
 		</div>
	</section>

	<!-- End About Section -->
	
	<!-- main.js 적용 안하려고 일부러 bottom 가져옴 -->
	
<!-- ======= Footer ======= -->
<footer id="footer">
	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-4 col-md-6">
					<div class="footer-info">
						<h3>HOUse MUCH?</h3>
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
						<li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/main/index.do#why-us'/>">소개 </a></li>
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
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
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

</body>

</html>
    

