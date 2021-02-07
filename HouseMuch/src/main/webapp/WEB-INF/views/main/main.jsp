<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<main id="main">
 <!-- ======= Hero Banner ======= -->
 	<section id="hero" style="height: 80vh">
 		<div class="hero-container">
	    	<div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
	
		        <div class="carousel-inner" role="listbox">
		
		          <!-- Slide 1 -->
		          <div class="carousel-item active">
		          	<div class="carousel-background "><img src="${pageContext.request.contextPath}/resources/aptUser_images/aptLogin.jpg" alt="aptMain1" width="100%"></div>
		            <div class="carousel-container">
		              <div class="carousel-content">
		                <h2 class="animate__animated animate__fadeInDown">${aptName }</h2>
		                <p>◇&nbsp;&nbsp;◇&nbsp;&nbsp;◇</p>
		                <p style="width: 300px;">환영합니다!</p>
		              </div>
		            </div>
		          </div>
	   
		      </div>
			</div>
		</div>
	</section>
	<!-- End Banner -->

	
	<section class="why-us" style="margin-top:60px; text-align:center">
		<div class="container">

			<div class="row">

				<div class="col-lg-3 mt-4 mt-lg-0">
					<a href="<c:url value='/mngcost/mngcostInquiry.do'/>" >
					<div class="box">
						<h4>관리비 조회</h4>
					</div>
					</a>
				</div>

				<div class="col-lg-3 mt-4 mt-lg-0">
					<div class="box">
						<h4>에너지 조회</h4>
					</div>
				</div>

				<div class="col-lg-3 mt-4 mt-lg-0">
					<div class="box">
						<h4>생활지원 센터</h4>
					</div>
				</div>
				
				<div class="col-lg-3 mt-4 mt-lg-0">
					<div class="box">
						<h4>납부하기</h4>
					</div>
				</div>

			</div>

		</div>
	</section>
<!-- ======= About Section ======= -->
	<section class="about">
		<div class="container">

			<div class="row no-gutters">
				<div class="col-xl-6 pl-0 pl-lg-5 pr-lg-1 d-flex align-items-stretch" style="width:50%">
					<div class="content d-flex flex-column justify-content-center">
						<h3>우리아파트 공지사항</h3>
						<br>
						<table>
							<tr>
								<td>므에에</td>
							</tr>
							<tr><td>import할거삼</td></tr>
							<tr><td>므에에에에엥</td></tr>
						</table>
					</div>
				</div>
				
				<div
					class="col-xl-6 pl-0 pl-lg-5 pr-lg-1 d-flex align-items-stretch">
					<div class="content d-flex flex-column justify-content-center">
						<h3>하우스머치</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Duis aute irure dolor in reprehenderit</p>
						<div class="row">
							<div class="col-md-6 icon-box">
								<i class="bx bx-receipt"></i>
								<h4>Corporis voluptates sit</h4>
								<p>Consequuntur sunt aut quasi enim aliquam quae harum
									pariatur laboris nisi ut aliquip</p>
							</div>
							<div class="col-md-6 icon-box">
								<i class="bx bx-cube-alt"></i>
								<h4>Ullamco laboris nisi</h4>
								<p>Excepteur sint occaecat cupidatat non proident, sunt in
									culpa qui officia deserunt</p>
							</div>
							<div class="col-md-6 icon-box">
								<i class="bx bx-images"></i>
								<h4>Labore consequatur</h4>
								<p>Aut suscipit aut cum nemo deleniti aut omnis. Doloribus
									ut maiores omnis facere</p>
							</div>
							<div class="col-md-6 icon-box">
								<i class="bx bx-shield"></i>
								<h4>Beatae veritatis</h4>
								<p>Expedita veritatis consequuntur nihil tempore laudantium
									vitae denat pacta</p>
							</div>
						</div>
					</div>
					<!-- End .content-->
				</div>
			</div>

		</div>
	</section>
	<!-- End About Section -->
</main>
<%@ include file="../mainInc/mainBottom.jsp" %>


