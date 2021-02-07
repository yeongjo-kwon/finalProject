<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/nonTop.jsp" %>

<!-- 
	문의하기 폼 에서 이메일 Send (완료)
 -->


<style type="text/css">
/* subin Button */
.subin-button {
  margin-left: 25px;
  line-height:1.5;
  vertical-align:center;
  border-radius: 4px;
  padding: 6px 25px 6px 25px;
  white-space: nowrap;
  transition: 0.3s;
  font-size: 13px;
  display: inline-block;
  text-transform: uppercase;
  font-weight: 400;
  font-family: "Poppins", sans-serif;
  border: 2px solid #fff;
}

.search-box {
    position: relative;
    width: 100%;
    height: 70px;
    border: 7px solid #5c9f24;
}
.apt-search-input {
    float: left;
    width: 80%;
    height: 100%;
    padding: 20px;
    font-size: 18px;
    border: 0;
    border-radius: 0px;
    outline: 0;
}
.search-icon {
    float: left;
    width: 5%;
    padding: 0px 13px 35px 30px;
    width: auto;
    height: auto;
}
.apt-search-btn {
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
    
</style>

<main id="main">
 <!-- ======= Hero Section ======= -->
 	<section id="hero">
 		<div class="hero-container">
	    	<div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
	
	        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
	
	        <div class="carousel-inner" role="listbox">
	
	          <!-- Slide 1 -->
	          <div class="carousel-item active" style="background: url(${pageContext.request.contextPath}/resources/assets/img/slide/aptMain1.jpg);">
	          	<div class="carousel-background "><img src="${pageContext.request.contextPath}/resources/user/assets/img/slide/aptMain1.jpg" alt="aptMain1" width="100%"></div>
	            <div class="carousel-container">
	              <div class="carousel-content">
	                <h2 class="animate__animated animate__fadeInDown">HOUSE MUCH?</h2>
	                <p class="animate__animated animate__fadeInUp" style="font-size: 20px; width:500px;">우리집 관리비, 스마트하게</p>
	                <div>
	                  <a href="<c:url value='/register/registerApt.do'/>" class="subin-button animate__animated animate__fadeInUp scrollto" style="color: white; width:170px; font-size: 20px;">신청하기</a>
	                </div>
	              </div>
	            </div>
	          </div>
	
	          <!-- Slide 2 -->
	          <div class="carousel-item" style="background: url(resources/assets/img/slide/aptMain2.jpg);">
				<div class="carousel-background"><img src="<c:url value='/resources/user/assets/img/slide/aptMain2.jpg'/>" alt="aptMain2" width="100%"></div>
	            <div class="carousel-container">
	              <div class="carousel-content">
	                <h2 class="animate__animated animate__fadeInDown">Our Site</h2>
	                <p class="animate__animated animate__fadeInUp" style="width: 500px; font-size: 20px;">여유롭고 편리한 생활<br> House Much에서 시작하세요</p>
	                <div>
	                  <a href="<c:url value='/register/registerApt.do'/>" class="subin-button animate__animated animate__fadeInUp scrollto" style="color: white; width:170px; font-size: 20px;">신청하기</a>
	                </div>
	              </div>
	            </div>
	          </div>
	
	          <!-- Slide 3 -->
	          <div class="carousel-item" style="background: url(resources/assets/img/slide/slide-3.jpg);">
	            <div class="carousel-background"><img src="<c:url value='/resources/user/assets/img/slide/slide-3.jpg'/>" alt="slide-3" width="100%"></div>
	            <div class="carousel-container">
	              <div class="carousel-content">
	                <h2 class="animate__animated animate__fadeInDown">With Us</h2>
	                <p class="animate__animated animate__fadeInUp" style="width: 500px; font-size: 20px;">우리 아파트도 HouseMuch에 등록하고싶다면</p>
	                <div>
	                  <a href="<c:url value='/register/registerApt.do'/>" class="subin-button animate__animated animate__fadeInUp scrollto" style="color: white; width:170px; font-size: 20px;">신청하기</a>
	                </div>
	              </div>
	            </div>
	          </div>
	
	        </div>
	
	        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
	          <span class="carousel-control-prev-icon icofont-simple-left" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	
	        <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
	          <span class="carousel-control-next-icon icofont-simple-right" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	        </a>
	
	      </div>
		</div>
	</section>
	<!-- End Hero -->

	<!-- Search 수빈이의 피 땀 눈물이 담긴 .... 
	<section id="search" class="form services ">
		<div class="form-group container search-box" style="height:100px; background-color: #5c9f24; padding-left: 0px;">
			<span class="search-icon" style="background-color: white;"><img src="<c:url value='/resources/user/assets/img/searchIcon_green.png'/>" width="32px;" style=" margin-right: 10px; padding-top: 19px;"></span>
			<input type="text" name="aptName" class="apt-search-input" placeholder="우리 아파트를 검색해보세요!">
			<input type="button" value="검색" class="apt-search-btn">
		</div>
	</section>
	End Search -->
	
					
	<!-- ======= About Section ======= 
	<section id="about" class="portfolio">
		<div class="container">

			<div class="section-title">
				<h2>About</h2>
				<p>House Much? 에 대한 사이트 소개</p>
			</div>

			<div class="row">
				<div class="col-lg-12 d-flex justify-content-center">
					<ul id="portfolio-flters" >
						<li data-filter=".filter-first"><i class="icofont-chart-bar-graph"></i></li>
						<li data-filter=".filter-app"><i class="icofont-tasks-alt"></i></li>
						<li data-filter=".filter-card"><i class="icofont-users-alt-5"></i></li>
						<li data-filter=".filter-web"><i class="icofont-simple-smile"></i></li>
					</ul>
				</div>
			</div>

			<div class="row portfolio-container ">

				<div class="col-lg-12 col-md-6 portfolio-item filter-first ">
					<div class="portfolio-wrap">
						<img src="<c:url value='/resources/user/assets/img/slide/site_info1.png'/>" class="img-fluid"
							alt="관리비 조회">
						<div class="portfolio-info">
							<div class="portfolio-links">
								<a href="<c:url value='/resources/user/assets/img/slide/site_info1.png'/>" data-gall="portfolioGallery" class="venobox" title="App 1">
								<i class="bx bx-plus"></i></a>								
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-12 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img src="<c:url value='/resources/user/assets/img/slide/site_info2.png'/>" class="img-fluid"
							alt="일정 확인하기">
						<div class="portfolio-info">
							<div class="portfolio-links">
								<a href="<c:url value='/resources/user/assets/img/slide/site_info2.png'/>"
									data-gall="portfolioGallery" class="venobox" title="Web 3"><i
									class="bx bx-plus"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-12 col-md-6 portfolio-item filter-card">
					<div class="portfolio-wrap">
						<img src="<c:url value='/resources/user/assets/img/slide/site_info3.png'/>" class="img-fluid"
							alt="다양한 커뮤니티 시스템">
						<div class="portfolio-info">
							<div class="portfolio-links">
								<a href="<c:url value='/resources/user/assets/img/slide/site_info3.png'/>"
									data-gall="portfolioGallery" class="venobox" title="App 2"><i
									class="bx bx-plus"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-12 col-md-6 portfolio-item filter-web">
					<div class="portfolio-wrap">
						<img src="<c:url value='/resources/user/assets/img/slide/site_info4.png'/>" class="img-fluid"
							alt="편리한 커뮤니티 시설 예약">
						<div class="portfolio-info">
							<div class="portfolio-links">
								<a href="<c:url value='/resources/user/assets/img/slide/site_info4.png'/>"
									data-gall="portfolioGallery" class="venobox" title="Card 2">
									<i class="bx bx-plus"></i></a>
							</div>
						</div>
					</div>
				</div>

			
			</div>
		</div>
	</section>
	 End About Section -->
	
	<div></div>
	
	<!-- ======= Why Us Section ======= -->
	<section id="why-us" class="why-us">
		<div class="container">

			<div class="section-title">
				<h2>소개</h2>
				<p>House Much? 에 대한 사이트 소개</p>
			</div>

			<div class="row">

				<div class="col-lg-3">
					<div class="box">
						<span>01</span>
						<h4>한눈에 들어오는 관리비 조회</h4>
						<p>관리비 상세 내역을 언제 어디서나 확인 가능
						</p>
					</div>
				</div>

				<div class="col-lg-3 mt-4 mt-lg-0">
					<div class="box">
						<span>02</span>
						<h4>아파트 일정 확인하기</h4>
						<p>보다 쉽고 간편하게 우리 아파트 일정 확인 </p>
					</div>
				</div>

				<div class="col-lg-3 mt-4 mt-lg-0">
					<div class="box">
						<span>03</span>
						<h4>다양한 커뮤니티 시스템</h4>
						<p>공지사항, 전자투표, 설문조사 등 실시간 조회 가능
						</p>
					</div>
				</div>

				<div class="col-lg-3 mt-4 mt-lg-0">
					<div class="box">
						<span>04</span>
						<h4>편리한 커뮤니티 시설 예약</h4>
						<p>담당하는 곳에 따로 예약할 필요 없이 편리한 예약 기능<br>
						</p>
					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- End Why Us Section -->


	<!-- ======= Frequently Asked Questions Section ======= 
	<section id="faq" class="faq section-bg">
		<div class="container">

			<div class="section-title">
				<h2>Frequently Asked Questions</h2>
				<p>Magnam dolores commodi suscipit. Necessitatibus eius
					consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit.
					Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit
					alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
			</div>

			<div class="faq-list">
				<ul>
					<li data-aos="fade-up"><i class="bx bx-help-circle icon-help"></i>
						<a data-toggle="collapse" class="collapse" href="#faq-list-1">Non
							consectetur a erat nam at lectus urna duis? <i
							class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i>
					</a>
						<div id="faq-list-1" class="collapse show" data-parent=".faq-list">
							<p>Feugiat pretium nibh ipsum consequat. Tempus iaculis urna
								id volutpat lacus laoreet non curabitur gravida. Venenatis
								lectus magna fringilla urna porttitor rhoncus dolor purus non.</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="100"><i
						class="bx bx-help-circle icon-help"></i> <a data-toggle="collapse"
						href="#faq-list-2" class="collapsed">Feugiat scelerisque
							varius morbi enim nunc? <i class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i>
					</a>
						<div id="faq-list-2" class="collapse" data-parent=".faq-list">
							<p>Dolor sit amet consectetur adipiscing elit pellentesque
								habitant morbi. Id interdum velit laoreet id donec ultrices.
								Fringilla phasellus faucibus scelerisque eleifend donec pretium.
								Est pellentesque elit ullamcorper dignissim. Mauris ultrices
								eros in cursus turpis massa tincidunt dui.</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="200"><i
						class="bx bx-help-circle icon-help"></i> <a data-toggle="collapse"
						href="#faq-list-3" class="collapsed">Dolor sit amet
							consectetur adipiscing elit? <i
							class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i>
					</a>
						<div id="faq-list-3" class="collapse" data-parent=".faq-list">
							<p>Eleifend mi in nulla posuere sollicitudin aliquam ultrices
								sagittis orci. Faucibus pulvinar elementum integer enim. Sem
								nulla pharetra diam sit amet nisl suscipit. Rutrum tellus
								pellentesque eu tincidunt. Lectus urna duis convallis convallis
								tellus. Urna molestie at elementum eu facilisis sed odio morbi
								quis</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="300"><i
						class="bx bx-help-circle icon-help"></i> <a data-toggle="collapse"
						href="#faq-list-4" class="collapsed">Tempus quam pellentesque
							nec nam aliquam sem et tortor consequat? <i
							class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i>
					</a>
						<div id="faq-list-4" class="collapse" data-parent=".faq-list">
							<p>Molestie a iaculis at erat pellentesque adipiscing
								commodo. Dignissim suspendisse in est ante in. Nunc vel risus
								commodo viverra maecenas accumsan. Sit amet nisl suscipit
								adipiscing bibendum est. Purus gravida quis blandit turpis
								cursus in.</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="400"><i
						class="bx bx-help-circle icon-help"></i> <a data-toggle="collapse"
						href="#faq-list-5" class="collapsed">Tortor vitae purus
							faucibus ornare. Varius vel pharetra vel turpis nunc eget lorem
							dolor? <i class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i>
					</a>
						<div id="faq-list-5" class="collapse" data-parent=".faq-list">
							<p>Laoreet sit amet cursus sit amet dictum sit amet justo.
								Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt
								eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor
								sed. Ut venenatis tellus in metus vulputate eu scelerisque.</p>
						</div></li>

				</ul>
			</div>

		</div>
	</section>
	 End Frequently Asked Questions Section -->

	<br>

	<!-- ======= Contact Section ======= -->
	<section id="contact" class="contact">
		<div class="container">

			<div class="section-title">
				<h2>문의하기</h2>
				<p>HouseMuch 프로젝트 문의하기</p>
			</div>

			<div class="row contact-info">

				<div class="col-md-4">
					<div class="contact-address">
						<i class="icofont-google-map"></i>
						<h3>Address</h3>
						<address>서울특별시 강남구 테헤란로 124 4층 아이티윌</address>
					</div>
				</div>

				<div class="col-md-4">
					<div class="contact-phone">
						<i class="icofont-phone"></i>
						<h3>Phone Number</h3>
						<p>
							<a href="tel:+82262558061">+82262558061</a>
						</p>
					</div>
				</div>

				<div class="col-md-4">
					<div class="contact-email">
						<i class="icofont-envelope"></i>
						<h3>Email</h3>
						<p>
							<a href="info@housemuch.com">info@housemuch.com</a>
						</p>
					</div>
				</div>
			</div>
			
			<div id="map" style="width:100%;height:350px;"></div>
			
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10981ca2a9ffd2b10be44bd43781bbe6"></script>
			<script>
			var mapContainer = document.getElementById('map'), 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.499260107506196, 127.0317281386183), 
			        level: 3
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			var markerPosition  = new kakao.maps.LatLng(37.499260107506196, 127.0317281386183); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			</script>	
			
			<br><br>
			
			<!-- 문의하기!! -->
			
			<div class="form">
				<form action="<c:url value='/email/indexMail.do'/>" method="post" role="form" class="php-email-form">
					<div class="form-row">
						<div class="col-md-6 form-group">
							<input type="text" name="senderName" class="form-control" id="name"
								placeholder="보내시는 분 성함" data-rule="minlen:3"
								data-msg="이름을 입력해주세요!">
							<div class="validate"></div>
						</div>
						<div class="col-md-6 form-group">
							<input type="email" class="form-control" name="senderMail" id="email"
								placeholder="보내시는 분 이메일" data-rule="email"
								data-msg="보내시는 분의 이메일을 적어주세요!">
							<div class="validate"></div>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="subject"
							id="subject" placeholder="문의제목" data-rule="minlen:4"
							data-msg="문의 사항의 제목을 입력해주세요!" />
						<div class="validate"></div>
					</div>
					<div class="form-group">
						<textarea class="form-control" name="message" rows="5"
							data-rule="required" data-msg="문의사항을 입력해주세요!"
							placeholder="문의사항"></textarea>
						<div class="validate"></div>
					</div>
					<div class="mb-3">
						<div class="loading">Loading</div>
						<div class="error-message"></div>
						<div class="sent-message">Your message has been sent. Thank
							you!</div>
					</div>
					<div class="text-center">
						<button type="submit">문의하기</button>
					</div>
				</form>
			</div>
 			
 			
		</div>
	</section>
	<!-- End Contact Section -->

</main>
<!-- End #main -->

<%@ include file="../mainInc/nonBottom.jsp" %>