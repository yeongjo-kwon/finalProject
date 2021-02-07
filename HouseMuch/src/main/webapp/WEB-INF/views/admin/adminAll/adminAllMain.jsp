<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<style type="text/css">
.swiper-wrapper{
	position: relative;
}

.wrap-text{
	position: absolute;
	top: 50%;
	left: 50%;
	transform:translate(-50%,-50%);
}
</style>
<!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container p-0">
		<div class="content-header row">
			<!-- 첫번째 div -->
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">공통 관리 업무</h2>
				</div>
			</div>
			<!-- 두번째 div -->
			<div class="content-header-left col-md-9 col-12 mb-2">
				<!-- default swiper -->
				<section id="component-swiper-default">
					<div class="card">
						<div class="card-body">
							<div class="swiper-default swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<img class="img-fluid"
											src="${pageContext.request.contextPath}/resources/app-assets/images/banner/banner-2.jpg"
											alt="banner" />
									</div>
									<div class="wrap-text">
										<p style="font-size: 2.0em;">용산파크 아파트 관리페이지입니다. <br><br>오늘도 좋은 하루 보내세요!</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!--/ default swiper -->
			</div>
		</div>
	</div>
</div>
</div>

<%@ include file="../adminInc/adminBottom.jsp"%>