<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../mainInc/mainTop.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/ynResources/css/shop-homepage.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/ynResources/css/shop-homepage.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>

<!-- Page Content -->
<div class="container">

	<div class="row">
		<!-- 왼쪽 col3 -->
		<div class="col-lg-3">






			<div class="section-title text-left">
				<h2 class="mt-4">부가 시설</h2>
			</div>
			<div class="list-group-vertical">
				<a href="#" class="list-group-item">Category 1</a> <a href="#"
					class="list-group-item">Category 2</a> <a href="#"
					class="list-group-item">Category 3</a>


				<!-- 여기부터 사이드바 -->

				<!-- Ecommerce Sidebar Starts -->

				<div class="card">
					<div class="card-body">
						<!-- 요금별 보기 시작 -->
						<!-- Price Filter starts -->
						<div class="multi-range-price">
							<h6 class="filter-title mt-0">월 이용 요금</h6>
							<ul class="list-unstyled price-range" id="price-range">
								<li>
									<div class="custom-control custom-radio">
										<input type="radio" id="priceAll" name="price-range"
											class="custom-control-input" checked /> <label
											class="custom-control-label" for="priceAll">전체</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-radio">
										<input type="radio" id="priceRange1" name="price-range"
											class="custom-control-input" /> <label
											class="custom-control-label" for="priceRange1">무료시설</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-radio">
										<input type="radio" id="priceRange2" name="price-range"
											class="custom-control-input" /> <label
											class="custom-control-label" for="priceRange2">10000
											(원) 미만</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-radio">
										<input type="radio" id="priceARange3" name="price-range"
											class="custom-control-input" /> <label
											class="custom-control-label" for="priceARange3">10000
											- 20000 (원)</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-radio">
										<input type="radio" id="priceRange4" name="price-range"
											class="custom-control-input" /> <label
											class="custom-control-label" for="priceRange4">20000
											(원) 이상</label>
									</div>
								</li>
							</ul>
						</div>

						<!--  월 이용 요금 별 보기 끝 -->
						<br>
						<!-- 이용중인 인원 별 보기 시작 -->
						<!-- Categories Starts -->
						<div id="product-categories">
							<div class="multi-range-price">
								<h6 class="filter-title mt-0">월 이용자 현황</h6>
								<ul class="list-unstyled price-range" id="person-range">
									<li>
										<div class="custom-control custom-radio">
											<input type="radio" id="personAll" name="person-range"
												class="custom-control-input" checked /> <label
												class="custom-control-label" for="personAll">전체 보기</label>
										</div>
									</li>
									<li>
										<div class="custom-control custom-radio">
											<input type="radio" id="personRange1" name="person-range"
												class="custom-control-input" /> <label
												class="custom-control-label" for="personRange1">전체
												이용 시설</label>
										</div>
									</li>
									<li>
										<div class="custom-control custom-radio">
											<input type="radio" id="personRange2" name="person-range"
												class="custom-control-input" /> <label
												class="custom-control-label" for="personRange2">50 명
												미만</label>
										</div>
									</li>
									<li>
										<div class="custom-control custom-radio">
											<input type="radio" id="personARange3" name="person-range"
												class="custom-control-input" /> <label
												class="custom-control-label" for="personRange3">50 -
												100 명</label>
										</div>
									</li>
									<li>
										<div class="custom-control custom-radio">
											<input type="radio" id="personRange4" name="person-range"
												class="custom-control-input" /> <label
												class="custom-control-label" for="personRange4">100
												- 200 명</label>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<!-- Categories Ends -->
						<!-- 이용중인 인원 별 보기 끝 -->




						<!-- 위치별 보기 -->
						<!-- Categories Starts -->
						<div id="product-categories">
							<h6 class="filter-title">층 별 시설</h6>
							<ul class="list-unstyled categories-list">
								<li>
									<div class="custom-control custom-radio">
										<input type="radio" id="category1" name="category-filter"
											class="custom-control-input" checked /> <label
											class="custom-control-label" for="category1">지하2층</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-radio">
										<input type="radio" id="category2" name="category-filter"
											class="custom-control-input" /> <label
											class="custom-control-label" for="category2">지하1층</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-radio">
										<input type="radio" id="category3" name="category-filter"
											class="custom-control-input" /> <label
											class="custom-control-label" for="category3">지상1층</label>
									</div>
								</li>

								<li>
									<div class="custom-control custom-radio">
										<input type="radio" id="category10" name="category-filter"
											class="custom-control-input" /> <label
											class="custom-control-label" for="category10">지상2층</label>
									</div>
								</li>
							</ul>
						</div>
						<!-- Categories Ends -->
						<!-- 위치별 보기 끝 -->

						<!-- 특성별 보기 시작 -->
						<!-- Brands starts -->
						<div class="brands">
							<h6 class="filter-title">특성별</h6>
							<ul class="list-unstyled brand-list">
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="productBrand2" checked /> <label
											class="custom-control-label" for="productBrand2">재밌는</label>
									</div> <span>4</span>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="productBrand3" /> <label class="custom-control-label"
											for="productBrand3">유익한</label>
									</div> <span>7</span>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="productBrand4" /> <label class="custom-control-label"
											for="productBrand4">편안한</label>
									</div> <span>11</span>
								</li>
							</ul>
						</div>
						<!-- Brand ends -->
						<!-- 특성별 보기 끝 -->

						<!-- Clear Filters Starts -->
						<div id="clear-filters">
							<button type="button" class="btn btn-block btn-primary">검색조건
								다시 선택</button>
						</div>
						<!-- Clear Filters Ends -->


						<!-- Ecommerce Sidebar Ends -->




						<!-- 사이드바div 끝 -->
					</div>
					<!-- 카드바듸 -->

				</div>
				<!-- 리스트크룹끝 -->



			</div>
			<!-- 왼쪽 col3:끝 -->
			<!-- 오른쪽 col9 -->
			<div class="col-lg-9">


				<!--         <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div> -->


				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item One</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Two</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit
								amet.</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Three</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Four</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Five</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit
								amet.</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Six</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>








			</div>
			<!-- 오른쪽 col9 :끝-->
		</div>
		<!-- row -->


	</div>
	<!-- /.container -->
	<div class="clearfix"></div>

	<!-- Bootstrap core JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<%--   <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/ynResources/main.js"></script> --%>
	<%@ include file="../../mainInc/mainBottom.jsp"%>