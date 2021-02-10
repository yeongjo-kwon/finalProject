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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		var emailCode="zz";	//이메일 전송 인증번호 저장 위한 코드
		
		$("#code").attr("disabled", true); 
		
		$('#sendCode').click(function(){
			if($('#email').val()!=$('#realEmail').val()){
				alert('등록된 이메일과 일치하지 않습니다.');
				event.preventDefault();
			}else if($('#name').val().length<1){
				alert('이름을 입력하세요.');
				event.preventDefault();
			}else{	//이메일 올바르게 기입
				$.ajax({
        			url:"<c:url value='/login/findIdMail.do'/>",
        			type:"GET",
        			data:{
        				memberName:$('#name').val(),
        				email:$('#email').val(),
        				or:2
        				},
        			success:function(data){
        				$("#code").attr("disabled", false); //활성화
                		$('#code').next().html('인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 <br>확인 해 주세요.');
                		emailCode = data;
        			},
    				error:function(xhr, status, error){
    					alert('error! : ' + error)
    				}
        		});	//ajax				
				
			}
		});
		
		$('#code').blur(function(){	//인증번호 입력란
			var inputCode = $('#code').val();	//사용자가 입력한 인증번호
			if(inputCode==emailCode && inputCode!=null){
				$(this).next().css("color","#7DB249");
				$(this).next().html("인증번호가 일치합니다.");
				$('#chkCodeYn').val("Y");
			}else if(inputCode==null){
				$(this).next().css("color","red");
				$(this).next().html("인증번호를 입력해주세요.");        			        			
				$('#chkCodeYn').val("N");
			}else{
				$(this).next().css("color","red");
				$(this).next().html("인증번호를 다시 확인해주세요.");        			
				$('#chkCodeYn').val("N");
			}
		});
		
		$('#pwdChk').submit(function(){
			if($('#chkCodeYn').val()!="Y"){
				alert('이메일 인증을 받고 다시 시도해주세요')
				$('#email').focus();
				event.preventDefault();
			}else{
				alert('인증되었습니다. 비밀번호 재설정 화면으로 이동합니다.');
			}
		});
		
		
	});

</script>

<!-- ======= Section ======= -->
	<section class="contact">
		<div class="container card" style="margin-top: 50px; margin-bottom: 50px; padding-top:80px; padding-bottom:50px;">
			
			<div align="center" style="margin-bottom:50px;"><img src="<c:url value='/resources/common_img/findPwd.png'/>" alt="findId"></div>
			
			<div style="width:800px; float: left; margin-left: 300px; " class="mb-4">
				<h4 style="display: inline-block; margin-right:5px;">본인확인 이메일로 인증</h4><span style="color:green;">(${email })</span>
				<p>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</p>
			</div>
	         
			<form action="<c:url value='/login/findResetPwd.do'/>" method="get" id="pwdChk">
				
				<div class="form col-lg-12 php-email-form " align="center">
				<input type="hidden" id="realEmail" name="realEmail" value=${realEmail }>
				<input type="hidden" id="chkCodeYn" name="chkCodeYn">
				
					<div class="form-group form-row row" align="left" style="display: inline-block;">
		        		<label for="name">이름</label> 
		        		<input type="text" class="form-control" name="memberName" id="name" style="width:400px;">		 	
					</div>
					<br>
					<div class="form-group form-row row " align="left" style="display: inline-block; margin-left:123px;">
	                	<label for="email44">이메일 주소</label> 
	                	<input type="text" class="form-control" name="email" style="width:400px;" id="email">
	                	<div class="validate"></div>             
					</div>
	               
					<div class="form-group form-row row" style="display:inline">
						<input type="button" class="btn get-started-btn row" value="인증번호 받기" id="sendCode">
					</div>
	               
					<br>
					<div class="form-group form-row row" align="left" style="display: inline-block;">
						<input type="text" class="form-control" name="code" placeholder="인증번호 6자리 입력" style="width:400px;" id="code">
						<span class="error" style="color:red;"></span>   
					</div>
	               
					<br>
					<br>
					
					<div class="text-center ">
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
    
