<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/adminTop.jsp" %>


   <!-- START : Content -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}
</script>

<!-- 컨텐츠시작 -->
    <div class="app-content content ecommerce-application">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">부가시설 목록</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<c:url value='/admin/adminLiving/adminLiving.do'/>">행정관리 메인</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="<c:url value='/admin/adminLiving/adminAdd/adminAddInfoList.do'/>">부가시설 목록</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">부가시설 목록</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                    <div class="form-group breadcrumb-right">
                        <div class="dropdown">
                            <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="grid"></i></button>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="app-todo.html"><i class="mr-1" data-feather="check-square"></i><span class="align-middle">Todo</span></a><a class="dropdown-item" href="app-chat.html"><i class="mr-1" data-feather="message-square"></i><span class="align-middle">Chat</span></a><a class="dropdown-item" href="app-email.html"><i class="mr-1" data-feather="mail"></i><span class="align-middle">Email</span></a><a class="dropdown-item" href="app-calendar.html"><i class="mr-1" data-feather="calendar"></i><span class="align-middle">Calendar</span></a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-detached content-right">
                <div class="content-body">
                
                
<!-- searchKeyword , searchCondition 보내는 frmSearch 시작 -->     
                <!-- 검색어, 검색조건 넘기는 frmPage -->
                <form name="frmPage" method="post" 
								action='<c:url value="/admin/adminLiving/adminAdd/adminAddInfo.do"/>'>
								<input type="hidden" name="currentPage"> 
							<input type="hidden" name="searchCondition" value="${param.searchCondition }">
							<input type="hidden" name="searchKeyword"	value="${param.searchKeyword }">
								
								
                    <!-- E-commerce Content Section Starts : 부가시설 분류선택 -->
                    <section id="ecommerce-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="ecommerce-header-items">
                                    <div class="result-toggler">
                                        <button class="navbar-toggler shop-sidebar-toggler" type="button" data-toggle="collapse">
                                            <span class="navbar-toggler-icon d-block d-lg-none"><i data-feather="menu"></i></span>
                                        </button>
                                        <!-- 검색결과 개수 안내-->
                                        <div class="search-results">
	                                        <c:if test="${!empty param.searchKeyword }">
	                                       		<p class="col align-right font-lg-1" >검색 결과 : ${param.searchKeyword}, ${pager.totalRecord } 건</p>
	                                        </c:if>
                                        </div>
                                    </div>
                                    
                                    <!-- 시설분류 드롭다운 시작 -->
                                    <div class="view-options d-flex">
                                        <div class="btn-group dropdown-sort">
                                            <button type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="active-sorting p-0">시설분류</span>
                                            </button>
                                            <div class="dropdown-menu">

                                            	<c:if test="${empty addCtgList}">
                                            		분류가 없음
                                            	</c:if>

                                            </div>
                                        </div>
                                    </div>
								<!-- 시설분류 드롭다운  끝 -->
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- E-commerce Content Section Starts : 부가시설 분류선택  -->

                    <!-- background Overlay when sidebar is shown  starts-->
                    <div class="body-content-overlay"></div>
                    <!-- background Overlay when sidebar is shown  ends-->

                    <!-- E-commerce Search Bar Starts : 부가시설 목록에서 검색-->
                    <section id="ecommerce-searchbar" class="ecommerce-searchbar">
                        <div class="row mt-1">
                            <div class="col-sm-12">
                                <div class="input-group input-group-merge">
                                    <input type="text" class="form-control search-product" 
                                    id="shop-search" placeholder="부가시설을 검색하세요" 
                                    aria-label="Search..." aria-describedby="shop-search"
                                    name="searchKeyword" title="검색어 입력" value="${param.searchKeyword}"/>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i data-feather="search" class="text-muted"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- E-commerce Search Bar Ends : 부가시설 목록에서 검색 끝-->
			</form>
<!-- searchKeyword , searchCondition 보내는 frmSearch 끝 -->


                    <!-- E-commerce Products Starts -->
                    <section id="ecommerce-products" class="grid-view">
		                  <c:if test="${empty list }">
		                  	<p>등록된 부가시설이 없습니다</p>
		                  </c:if>
<c:if test="${!empty list }">
  <c:forEach var="vo" items="${list}">
                  
                  
                        <!-- 시설카드 : 시작 -->
                        <div class="card ecommerce-card">
                            
                            <div class="item-img text-center p-0" >
                                <a href="app-ecommerce-details.html">
                            <c:if test="${empty vo.addinfoImgOriginalFilename }">
                                <img class="img-fluid card-img-top" alt="시설썸네일"
                                src="${pageContext.request.contextPath}/resources/aptAdmin_images/thumbnail-default.svg"/></a>
                            </c:if>    
                            <c:if test="${!empty vo.addinfoImgOriginalFilename }">
                                <img class="img-fluid card-img-top" alt="${vo.addinfoImgOriginalFilename}" 
                                src=""/></a>
                            </c:if>
                            </div>
                            
                            <div class="card-body">
                            <!-- 요금줄 -->
                                <div class="item-wrapper">
                                    <div class="item-rating">
                                    
                                        <ul class="unstyled-list list-inline">
                                            <li class="ratings-list-item"><i data-feather="star" class="filled-star"></i></li>
                                            <li class="ratings-list-item"><i data-feather="star" class="filled-star"></i></li>
                                            <li class="ratings-list-item"><i data-feather="star" class="filled-star"></i></li>
                                            <li class="ratings-list-item"><i data-feather="star" class="filled-star"></i></li>
                                            <li class="ratings-list-item"><i data-feather="star" class="unfilled-star"></i></li>
                                        </ul> 
                                    </div>
                                  <%--   <div>
                                        <div class="item-cost">
                                            <h6 class="item-price">등록일 ${vo.addRegdate}</h6>
                                        </div>
                                    </div> --%>
                                    <div>
                                        <div class="item-cost">
                                            <h6 class="item-price">월  ${vo.addPrice}원</h6>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- 시설명 -->
                                <h6 class="item-name">
                                    <a class="text-body" href="<c:url value='/admin/adminLiving/adminAdd/adminAddEdit.do?addNo=${vo.addNo }'/>">${vo.addName }</a>
                                    <span class="card-text item-company">관리 <a href="javascript:void(0)" class="company-name">업체?</a></span>
                                </h6>
                                
                                <!-- 현재 이용자 수 -->
                                <p class="card-text item-description">현재 이용자 수 : ${vo.orderCnt }</p>
                            </div>
                            <div class="item-options text-center">

                                <a href="<c:url value='/admin/adminLiving/adminAdd/adminAddResidence.do?addNo=${vo.addNo }'/>" class="btn btn-light btn-wishlist">
                                    <span class="add-to-cart">이용자 내역 조회</span>
                                </a>
                                <a href="<c:url value='/admin/adminLiving/adminAdd/adminAddDel.do?addNo=${vo.addNo }'/>" class="btn btn-danger btn-wishlist">
                                    <span class="add-to-cart">접수 중단</span>
                                </a>
                                <a href="<c:url value='/admin/adminLiving/adminAdd/adminAddEdit.do?addNo=${vo.addNo }'/>" class="btn btn-primary btn-wishlist">
                                    <span class="add-to-cart">상세정보 수정</span>
                                </a>
                            </div>
                        </div>
                        <!-- 시설카드 : 끝 -->
	</c:forEach>
</c:if><!-- 부가시설리스트 반복 끝 -->
                    </section>
                    <!-- E-commerce Products Ends -->

                    <!-- E-commerce Pagination Starts -->
                    <section id="ecommerce-pagination">
                        <div class="row">
                            <div class="col-sm-12">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center mt-2">
                                       <!-- 이전블럭으로(이전페이지) -->
								<c:if test="${pager.firstPage>1 }">
									<li class="page-item"><a class="page-link" href="#"
										onclick="pageFunc(${pager.firstPage-1})" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<!-- 블록 시작 : [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pager.firstPage}"
									end="${pager.lastPage}">
									<c:if test="${i==pager.currentPage }">
										<li class="page-item"><span
											style="color: blue; font-weight: bold" class="page-link">
												${i}</span></li>
									</c:if>
									<c:if test="${i!=pager.currentPage }">
										<li class="page-item"><a href="#"
											onclick="pageFunc(${i})" class="page-link"> ${i}</a></li>
									</c:if>
								</c:forEach>
								<!-- 블록 끝 : [1][2][3][4][5][6][7][8][9][10] -->

								<!-- 다음블럭으로(다음페이지) -->

								<c:if test="${pager.lastPage < pager.totalPage }">
									<li class="page-item"><a class="page-link" href="#"
										onclick="pageFunc(${pager.lastPage+1})" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </section>
                    <!-- E-commerce Pagination Ends -->

                </div>
            </div>
            
            <!-- 여기부터 사이드바 -->
            <div class="sidebar-detached sidebar-left">
                <div class="sidebar">
                    <!-- Ecommerce Sidebar Starts -->
                    <div class="sidebar-shop">
                        <div class="row">
                            <div class="col-sm-12">
                                <h6 class="filter-heading d-none d-lg-block">조건별 조회</h6>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                            <!-- 요금별 보기 시작 -->
                                <!-- Price Filter starts -->
                                <div class="multi-range-price">
                                    <h6 class="filter-title mt-0">월 이용 요금</h6>
                                    <ul class="list-unstyled price-range" id="price-range">
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="priceAll" name="price-range" class="custom-control-input" checked />
                                                <label class="custom-control-label" for="priceAll">전체</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="priceRange1" name="price-range" class="custom-control-input" />
                                                <label class="custom-control-label" for="priceRange1">무료시설</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="priceRange2" name="price-range" class="custom-control-input" />
                                                <label class="custom-control-label" for="priceRange2">10000 (원) 미만</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="priceARange3" name="price-range" class="custom-control-input" />
                                                <label class="custom-control-label" for="priceARange3">10000 - 20000 (원)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="priceRange4" name="price-range" class="custom-control-input" />
                                                <label class="custom-control-label" for="priceRange4">20000 (원) 이상</label>
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
                                                <input type="radio" id="personAll" name="person-range" class="custom-control-input" checked />
                                                <label class="custom-control-label" for="personAll">전체 보기</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="personRange1" name="person-range" class="custom-control-input" />
                                                <label class="custom-control-label" for="personRange1">전체 이용 시설</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="personRange2" name="person-range" class="custom-control-input" />
                                                <label class="custom-control-label" for="personRange2">50 명 미만</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="personARange3" name="person-range" class="custom-control-input" />
                                                <label class="custom-control-label" for="personRange3">50 - 100 명</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="personRange4" name="person-range" class="custom-control-input" />
                                                <label class="custom-control-label" for="personRange4">100 - 200 명</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                </div>
                                <!-- Categories Ends -->
                                <!-- 이용중인 인원 별 보기 끝 -->


  
                         
								<!-- 위치별 보기 -->
                                <!-- Categories Starts -->
                               <!--  <div id="product-categories">
                                    <h6 class="filter-title">층 별 시설</h6>
                                    <ul class="list-unstyled categories-list">
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="category1" name="category-filter" class="custom-control-input" checked />
                                                <label class="custom-control-label" for="category1">지하2층</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="category2" name="category-filter" class="custom-control-input" />
                                                <label class="custom-control-label" for="category2">지하1층</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="category3" name="category-filter" class="custom-control-input" />
                                                <label class="custom-control-label" for="category3">지상1층</label>
                                            </div>
                                        </li>
                                       
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="category10" name="category-filter" class="custom-control-input" />
                                                <label class="custom-control-label" for="category10">지상2층</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div> -->
                                <!-- Categories Ends -->
                                <!-- 위치별 보기 끝 -->

                                <!-- 특성별 보기 시작 -->
                                <!-- Brands starts -->
                                <div class="brands">
                                    <h6 class="filter-title">특성별</h6>
                                    <ul class="list-unstyled brand-list">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="productBrand2" checked />
                                                <label class="custom-control-label" for="productBrand2">재밌는</label>
                                            </div>
                                            <span>4</span>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="productBrand3" />
                                                <label class="custom-control-label" for="productBrand3">유익한</label>
                                            </div>
                                            <span>7</span>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="productBrand4" />
                                                <label class="custom-control-label" for="productBrand4">편안한</label>
                                            </div>
                                            <span>11</span>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Brand ends -->
                                <!-- 특성별 보기 끝 -->

                                <!-- Clear Filters Starts -->
                                <div id="clear-filters">
                                    <button type="button" class="btn btn-block btn-primary">검색조건 다시 선택</button>
                                </div>
                                <!-- Clear Filters Ends -->
                                
                            </div>
                        </div>
                    </div>
                    <!-- Ecommerce Sidebar Ends -->

                </div>
            </div>
        </div>
    </div>
    <!-- END: Content-->
    <div class="clearfix"></div>
<%@ include file="../../adminInc/adminBottom.jsp" %>