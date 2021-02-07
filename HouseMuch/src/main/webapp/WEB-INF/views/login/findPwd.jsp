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
	로그인 화면 혹은 아이디 찾기에서 비밀번호 찾기 누르면 나오는 페이지
	비밀번호 찾기 => 비밀번호 재설정 할거임
	인증번호 보내기 누르면 아래에 인증번호 입력하는 란 활성화
	인증번호 보내기 누르면 쿠키에 인증번호 저장 되고 이메일에 보낸 인증번호와 쿠키 저장된 인증번호 같으면 (다시 자세히 공부해야함)
	다음 으로 넘어감 (if문 처리 => 일치하지않으면 alert 일치하지않습니다)
	
	아이디 찾기 a링크 누르면 아이디 찾기 페이지로 이동 
	
	form 마저 작성
	
	유효성 검사 <인증번호 보내기> 버튼 클릭할때
	등록한 이름 혹은 이메일이 없으면 => 일치하는 회원이 없습니다.
 -->

<!-- ======= Section ======= -->
	<section class="contact">
		<div class="container card" style="margin-top: 50px; margin-bottom: 50px; padding-top:80px; padding-bottom:50px;">
			
			<div align="center" style="margin-bottom:50px;"><img src="<c:url value='/resources/common_img/findPwd.png'/>" alt="findId"></div>
			
			<div style="width:800px; float: left; margin-left: 300px; margin-bottom: 50px; ">
				<h4>비밀번호가 기억이 나지 않으시나요?</h4>
				<p>비밀번호를 재설정 할 계정과 해당 계정에 등록한 이메일을 입력해주세요.</p>
			</div>
	         
			<form>
				
				<div class="form col-lg-12 php-email-form " align="center">
				
					<div class="form-group form-row row" align="left" style="display: inline-block;">
		        		<label for="userId">아이디</label> 
		        		<input type="text" class="form-control" name="userId"  style="width:400px;">		 	
					</div>
					<br>
					<div class="form-group form-row row " align="left" style="display: inline-block; margin-left:123px;">
						<label for="email">이메일 주소</label> 
						<input type="text" class="form-control" name="email" style="width:400px;">
	            		<div class="validate"></div>			 	
					</div>
					<div class="form-group form-row row" style="display:inline">
						<input type="button" class="btn get-started-btn row" value="인증번호 받기" >
					</div>
					<br>
					<div class="form-group form-row row" align="left" style="display: inline-block;">
	            		<input type="text" class="form-control" name="code" disabled="disabled" placeholder="인증번호 6자리 입력" style="width:400px;">
	            		<div class="validate"></div>	
					</div>
					<br><br>
					<div class="text-center ">
						<a href="<c:url value='/login/findResetPwd.do'/>"> 페이지 이동 TEST !!! 후에 지울거임  </a>
						<button type="submit">다음</button>
					</div>
	
				</div>     
			</form>    
 			
 			<div class="divider my-2">
            	<div class="divider-text">or</div>
            </div>
            
 			<div class="form-group" align="center" style="margin-top:20px;">
 				<label>아이디를 찾으시나요?</label>
 				<a href="<c:url value='/login/findId.do'/>">아이디 찾기</a>
 			</div>
 			
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
    
