<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/charts/apexcharts.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/charts/chart-apex.min.css">
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/charts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/cards/card-statistics.min.js"></script>


<style type="text/css">
.swiper-wrapper {
	position: relative;
}

.wrap-text {
	position: absolute;
	top: 50%;
	left: 40%;
	transform: translate(-50%, -50%);
}

.content-header-left.col-md-9.col-12.mb-2 {
	text-align: center;
}

.swiper-default.swiper-container {
	height: 200px;
	box-shadow: 0 0 10px 0;
}

/* .bg-light-primary {
    background: #d3fded !important;
    color: #2FA599 !important;
} */

.img-fluid {
    height: 100%;
    width: 100%;
}
</style>

<!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>

	<!-- 찐 START -->
	<div class="content-wrapper container p-0">
		<!-- HEADER START -->
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">공통 관리 업무</h2>
				</div>
			</div>
		</div>
		<!-- HEADER END -->

		<!-- BODY START -->
		<div class="content-body ">
			<!-- SECTION START -->
			<section>
				<!-- 첫번째 DIV START -->
				<div class="row-12">
					<!-- default swiper -->
					<section id="component-swiper-default">
						<div class="swiper-default swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img class="img-fluid"
										src="${pageContext.request.contextPath}/resources/app-assets/images/banner/banner-4.jpg"
										alt="banner" />
								</div>
								<div class="wrap-text">
									<p style="font-size: 2.0em;">${aptVo.aptName }
										아파트 관리자 페이지입니다. <br> <br>오늘도 좋은 하루 보내세요!
									</p>
								</div>
							</div>
						</div>
					</section>
					<!--/ default swiper -->
				</div>
				<!-- 첫번째 DIV END -->

				<!-- 두번째 DIV START -->
				<div class="row match-height">
					<!-- 2-1 -->
					<div class="col-xl-4 col-md-6 col-12 mt-2">
						<div class="card">
							<div class="card-header flex-column align-items-start pb-0">
								<div class="avatar bg-light-primary p-50 m-0">
									<div class="avatar-content">
										<i data-feather="users" class="font-medium-5"></i>
									</div>
								</div>
								<h2 class="font-weight-bolder mt-1">${aptVo.totalHousehold }</h2>
								<p class="card-text">입주민 가구 수</p>
							</div>
							<div id="line-area-chart-2"></div>
						</div>
					</div>
					<!-- 2-2 -->
					<div class="col-xl-8 col-md-6 col-12 mt-2">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" style="font-weight: bold;">우리 아파트 정보</h4>
							</div>
							<div class="card-body">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">아파트 이름: ${aptVo.aptName }</li>
									<li class="list-group-item">우편 번호 : ${aptVo.zipcodeSeq }</li>
									<li class="list-group-item">도로명 주소 : ${aptVo.address }</li>
									<li class="list-group-item">지번 주소 : ${aptVo.addressDetail }</li>
									<li class="list-group-item">총 가구 수 : ${aptVo.totalHousehold }</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 두번째 DIV END -->

				<!-- 세번째 DIV START -->
				<div></div>
				<!-- 세번째 DIV END -->
			</section>
			<!-- SECTION END -->
		</div>
		<!-- BODY END -->

	</div>
	<!-- 찐 END -->
</div>
<!-- FINISH: Content-->
<%@ include file="../adminInc/adminBottom.jsp"%>