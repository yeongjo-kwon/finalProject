<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<!-- 차트리소스 -->
 <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/styles.css" rel="stylesheet" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
 
 <!-- 탭 -->
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/animate.css/animate.min.css" rel="stylesheet">
   <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
 <!-- 탭 끝 -->
<style>
.apt-bg-primary{
	background-color:#5c9f24; 
}
.apt-bg-secondary{
	background-color:#f6f6f6; 
}
.apt-bg-light{
	background-color:#F2FBDD; 
}
.apt-bg-dark{
	background-color:#22550E; 
}

.apt-text-primary{
	color:#5c9f24; 
}
.apt-text-secandary{
	color:#666666; 
}
.apt-text-third{
	color:#F2FBDD; 
}
.apt-text-dark{
	color:#22550E; 
}

.btn{
	background-color:#5c9f24;
	border-color: #5c9f24;
}
.btn:hover{
	background-color:#326717;
	border-color: #326717;
}

.btn-light{
	background-color:#F2FBDD;
	border-color: #E2F7BC;
	color: #22550E;
}
.btn-light:hover{
	background-color:#ffffff;
	border-color: #5c9f24;
}

a{
	color: #5c9f24;
}
/* 탭css */

.nav-tabs .nav-item.open .nav-link, .nav-tabs .nav-item.open .nav-link:focus, .nav-tabs .nav-item.open .nav-link:hover, .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-item.show .nav-link:focus, .nav-tabs .nav-item.show .nav-link:hover, .nav-tabs .nav-link.active, .nav-tabs .nav-link.active:focus, .nav-tabs .nav-link.active:hover {
    color: #fff;
    background-color: #3f51b5;
    border-color: transparent;
    border-bottom-color: #3f51b5;
}
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #fff;
    background-color: #3f51b5;
    border-color: #e0e0e0;
}
.nav-tabs-line .nav-link {
    padding: .715rem 1.429rem;
    border-bottom: 2px solid transparent;
}
.nav-tabs .nav-link {
    color: #757575;
    transition: .25s;
}
.nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .215rem;
    border-top-right-radius: .215rem;
}
.nav-link {
    position: relative;
    display: block;
    padding: .715rem 1.072rem;
    overflow: hidden;
}

.nav-tabs-line .nav-link {
    padding: .715rem 1.429rem;
    border-bottom: 2px solid transparent;
}
.nav-tabs .nav-link {
    color: #757575;
    transition: .25s;
}
.nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .215rem;
    border-top-right-radius: .215rem;
}
.nav-link {
    position: relative;
    display: block;
    padding: .715rem 1.072rem;
    overflow: hidden;
}
.nav-link {
    display: block;
    padding: .715rem 1.429rem;
}
</style>

<div class="yiWrapper" style="width:100%; min-height:700px; margin: 0 auto;">
<div class="clearfix" style="height:100px;background-color:#ffffff;position:sticky;"></div>

<main id="main" style="position:sticky">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs m-0" style="background-color: #fff">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2 class="mt-2" style="line-height: 1; vertical-align: middle;"> 우리집 에너지 조회</h2>
				<ol style="font-size:0.9em; line-height:2;">
					<li><a href="<c:url value='/main/main.do'/>">Home</a></li>
					<li>우리집 에너지 조회</li>
					
				</ol>
			</div>
		</div>
	</section>
	<!-- End Breadcrumbs -->

</main>
    
<!-- <main> -->
	<section id="energyChart" class="pt-2">
		<div class="container center">
		<!-- 설명바 -->
			<div class="card mb-4">
				<div class="card-body pt-8 text-center">
				<b>310호</b>관리비 지불내역에 포함된 세대 에너지 사용량 현황입니다. 자세한 관리비 지출내역 조회를 원하신다면 <a href="#">관리비 조회</a>를 참고하세요<br>
				<hr>
				<p class="text-center m-0">
				기본구조 : 기본요금 + 전력량요금 &nbsp;&nbsp;|&nbsp;&nbsp;	세금: 부가가치세(10%) + 전력산업기반기금(3.7%) 
				</p>
				
				<!-- 더 자세한 내용은 <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js
						documentation</a> . -->
						
				</div>
			</div>
			
			<!-- 차트반반row -->
				<div class="row">
				<div class="col-lg-6">
					<div class="card mb-4">
						<div class="card-header text-justify">
							<span class="text-align-start">
							<i class="fas fa-chart-bar mr-1"></i>전기 사용량(Kwh)
							</span>
						<!-- 	<span class="text-align-end">사용기간  2020년 8월 ~ 2021년 1월 </span> -->
						</div>
						<div class="card-body">
							<canvas id="myBarChart" width="100%" height="50"></canvas>
						</div>
						<div class="card-footer small text-muted">최종집계  2020-02-03 11:59 AM</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-pie mr-1"></i>우리아파트 평균 에너지 사용현황 
						</div>
						<div class="card-body">
							<canvas id="myPieChart" width="100%" height="50"></canvas>
						</div>
						<div class="card-footer small text-muted">최종집계  2020-02-03 11:59 AM</div>
					</div>
				</div><!-- 파이차트 끝 -->
			</div><!-- 차트반반 row 끝 -->
			
			
			<!-- area차트 -->
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area mr-1"></i> Area Chart Example
				</div>
				<div class="card-body">
					<canvas id="myAreaChart" width="100%" height="30"></canvas>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>
		
		</div><!-- 차트컨테이너 -->
</section>
<!-- 차트섹섹션-->
<!-- </main> -->

</div>

<!-- 차트스크립트 -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-bar-demo.js"></script>
        <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-pie-demo.js"></script>
<!-- 탭리소스 -->
  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/counterup/counterup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/venobox/venobox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/js/main.js"></script>
<%@ include file="../mainInc/mainBottom.jsp"%>