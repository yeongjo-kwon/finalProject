<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

</script>
<!-- ======= Start About Section ======= -->
<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs" style="margin-top:80px">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>관리비 납부</h2>
				<ol>
					<li><a href="<c:url value='/main/index.do'/>">Home</a></li>
					<li>관리비 납부</li>
					<li>결제페이지</li>
				</ol>
			</div>
		</div>
	</section><!-- End Breadcrumbs -->
	<%--
	<section class="inner-page">
	<div class="container">
	<p></p>
	</div>
	</section>
	--%>
</main><!-- End #main -->

<section id="about">
<div class="container">
	<!-- START : 대시보드 박스 -->
	<div class="col-12 float-left" style="background-color:#ffffff;padding:0; margin-right:20px;margin-bottom:50px; box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
      	<div class="card-body">
      		<div class="text-center">
     		</div>
        	<p class="card-text">
          		청구월 별로 관리비  미납내역을 확인하실 수 있습니다.<br><br>
        	</p>
          	<div class="text-right">조회시간 : <span id="currDate" style="font-size:0.9em"></span></div>
      	</div>
		<div class="card-body">
			<hr>
			<p class="card-text text-center" style="font-weight: bold">
				${param.msg}
			</p>
			<hr>
			<div class="text-center">
				<a href="#" id="submitPayIMP" class="btn btn-primary">결제하기</a>
			</div>
		</div>
	</div>
	<!-- END: 대시보드 박스 -->
</div>
</section>
<div class="clearfix"></div>
<section></section>
<!-- ======= End About Section ======= -->
<%@ include file="../mainInc/mainBottom.jsp" %>