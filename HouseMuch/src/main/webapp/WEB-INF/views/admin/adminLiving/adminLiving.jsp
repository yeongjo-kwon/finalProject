<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../adminInc/adminTop.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/app-assets/js/yinajs/weather.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/charts/chart-chartjs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/pages/app-todo.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/pages/app-todo.js"></script>
<link href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-todo.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-todo.min.scss" rel="stylesheet">
<!-- START : 대시보드 박스 -->
           
<style>
::marker {
    unicode-bidi: isolate;
    font-variant-numeric: tabular-nums;
    text-transform: none;
    text-indent: 0px !important;
    text-align: start !important;
    text-align-last: start !important;
}

ul {
    list-style-type: disc;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}
</style>
<!-- 박스 레이아웃 -->
  <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper container p-0">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">행정 관리 업무</h2>
                            
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
            <div class="content-body">
                <section id="dashboard-ecommerce">               <!-- Dashboard Ecommerce Starts -->
                    
                    
                     <div class="row match-height"> 
                       
                        <!-- Statistics Card -->
                        
                        <div class="col-xl-6 col-md-5 col-12">
                            <div class="card card-statistics">
                                <div class="card-header">
                                    <h4 class="card-title">주간 업무 현황</h4>
                                    <div class="d-flex align-items-center pr-2">
                                        <p class="card-text font-medium-1 mr-25 mb-0">01월 둘째 주</p>
                                    </div>
                                </div>
                                <div class="card-body statistics-body">
                                    <div class="row">
                                        <div class="col-xl-4 col-sm-6 col-12 mb-2 mb-xl-0">
                                            <div class="media">
                                                <div class="avatar bg-light-primary mr-2">
                                                    <div class="avatar-content">
                                                        <i data-feather="trending-up" class="avatar-icon"></i>
                                                    </div>
                                                </div>
                                                <div class="media-body my-auto">
                                                    <h4 class="font-weight-bolder mb-0  font-medium-4 ">230</h4>
                                                    <p class="card-text font-small-4 mb-0">방문 차량</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-sm-6 col-12 mb-2 mb-xl-0">
                                            <div class="media">
                                                <div class="avatar bg-light-info mr-2">
                                                    <div class="avatar-content">
                                                        <i data-feather="user" class="avatar-icon"></i>
                                                    </div>
                                                </div>
                                                <div class="media-body my-auto">
                                                    <h4 class="font-weight-bolder font-medium-4 mb-0 ">32</h4>
                                                    <p class="card-text font-small-4 mb-0">부가시설 신청</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-sm-6 col-12 mb-2 mb-sm-0">
                                            <div class="media">
                                                <div class="avatar bg-light-danger mr-2">
                                                    <div class="avatar-content">
                                                        <i data-feather="box" class="avatar-icon"></i>
                                                    </div>
                                                </div>
                                                <div class="media-body my-auto">
                                                    <h4 class="font-weight-bolder mb-0  font-medium-4 ">1</h4>
                                                    <p class="card-text font-small-4 mb-0">공지요청</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- <div class="col-xl-3 col-sm-6 col-12">
                                            <div class="media">
                                                <div class="avatar bg-light-success mr-2">
                                                    <div class="avatar-content">
                                                        <i data-feather="dollar-sign" class="avatar-icon"></i>
                                                    </div>
                                                </div>
                                                <div class="media-body my-auto">
                                                    <h4 class="font-weight-bolder mb-0">$9745</h4>
                                                    <p class="card-text font-small-3 mb-0">Revenue</p>
                                                </div>
                                            </div>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Statistics Card -->
                                <!-- Medal Card -->
<!--                         <div class="col-xl-6 col-md-7 col-12">
                            <div class="card card-congratulation-medal">
                                <div class="card-body">
                                    <h5 class="primary-color" >이번 주 날씨</h5>
                                    <i class="animated-weather-icons svg"></i>
                        
	<div class="col-md-6" "style="float:left;width:20%;">
	                                    <p class="card-text font-lg-5">건의사항 제목 1</p>
	                                    <p class="card-text font-small-3">건의사항 제목 2</p>
	                                    <p class="card-text font-small-3">건의사항 제목 3</p>
                                    </div>
                                    
                                    <div class="col-md-6" style="float:left">
	                                    <h3 class="mb-75 mt-2 pt-50" style="display:inline;">
	                                        <a href="javascript:void(0);">총 2 건</a>
	                                    </h3>
	                                    
	                                    <button type="button" class="btn btn-primary">건의 답변 하기</button>
	                                    <img src="" class="congratulation-medal" alt="" />
                                    </div> 
                                </div>
                            </div>
                        </div>
 -->                        <!--/ Medal Card -->
 
				<!-- openWeather api 날씨 시작-->    
    			<div class="col-xl-6 col-md-7 col-12">
                    <div class="card-body">
<iframe id="yinaWeather" src="${pageContext.request.contextPath}/admin/adminLiving/openWeather.do" 
	width="100%" height="166px" background-color="#fff"></iframe>
	
             		 </div><!-- card-body -->
                 </div><!-- 카드 col-md-7 -->
				<!-- openWeather api 날씨 끝-->    
                        
                        

                 <!--    <div class="row match-height"> -->
                        <div class="col-lg-4 col-12">
                            <div class="row match-height">
                                <!-- Bar Chart - Orders -->
                                <div class="col-lg-6 col-md-3 col-6">
                                    <div class="card">
                                        <div class="card-body pb-50">
                                            <h6>부가시설</h6>
                                            <h5 class="font-weight-bolder mb-1">동 별 이용자</h5>
                                            <div id="statistics-order-chart"></div>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Bar Chart - Orders -->

                                <!-- Line Chart - Profit -->
                                <div class="col-lg-6 col-md-3 col-6">
                                    <div class="card card-tiny-line-stats">
                                        <div class="card-body pb-50">
                                            <h6>1월</h6>
                                            <h5 class="font-weight-bolder mb-1">부가시설 신청 추이</h5>
                                            <div id="statistics-profit-chart"></div>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Line Chart - Profit -->

                               <!--  <!-- Earnings Card -->
                                <div class="col-lg-12 col-md-6 col-12">
                                    <div class="card earnings-card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-6">
                                                    <h4 class="card-title mb-1">입주민 투표 현황</h4>
                                                    <div class="font-medium-2 mb-1">01-12 ~ 01-30</div>
                                                    <h5 class="mb-2">CCTV 추가 설치에 찬성</h5>
                                                    <p class="card-text text-muted font-small-2">
                                                        <span class="font-weight-bolder font-medium-1">293</span><span>명 참여</span><span class="font-weight-bolder font-medium-1"> / 482</span>
                                                    </p>
                                                </div>
                                                <div class="col-6">
                                                    <div id="earnings-chart"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                             
                            </div>
                        </div>


                   

                 
                        <!-- Company Table Card -->
                        <div class="col-lg-8 col-12">
                            <div class="card card-company-table">
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table table-hover-animation">
                                       
                                            <thead>
                                                <tr class="font-medium-1 text-center">
                                                    <th  scope="col">번호</th>
                                                    <th  scope="col">작성자</th>
                                                    <th  scope="col">건의 제목</th>
                                                    <th  scope="col">등록일</th>
                                                    <th  scope="col">상태</th>
                                                </tr>
                                            </thead>
                                            <tbody class="text-center">
                                                <tr>
                                                   <td  scope="row">
                                                       <div class="d-flex align-items-center text-center">01</div>
                                                   </td>
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-center">
                                                                    <img src="${pageContext.request.contextPath}/resources/aptAdmin_images/profile_default.png" alt="입주민 프사" />
                                                                <div class="font-weight-bolder ml-1">김이나</div>
                                                               
                                                        </div>
                                                    </td>
                                                    <td scope="row">
                                                        <div class="d-flex align-items-center text-center">
                                                            <span class="text-center">생활지원센터에 건의 합니다</span>
                                                        </div>
                                                    </td>
                                                    <td  scope="row" class="text-nowrap">
                                                        <div class="d-flex flex-column">
                                                            <span class="font-weight-bolder mb-25">2021-01-20</span>
                                                        </div>
                                                    </td>
                                                 
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-warning text-center">대기중 </div>
                                                    </td>
                                                </tr>
                                                
                                                
                                                <tr>
                                                   <td  scope="row">
                                                       <div class="d-flex align-items-center">02</div>
                                                   </td>
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center">
                                                                    <img src="${pageContext.request.contextPath}/resources/aptAdmin_images/profile_default.png" alt="입주민 프사" />
                                                                <div class="font-weight-bolder ml-1">김이나</div>
                                                               
                                                        </div>
                                                    </td>
                                                    <td scope="row">
                                                        <div class="d-flex align-items-center text-center">
                                                            <span>생활지원센터에 건의 합니다</span>
                                                        </div>
                                                    </td>
                                                    <td  scope="row" class="text-nowrap">
                                                        <div class="d-flex flex-column">
                                                            <span class="font-weight-bolder mb-25">2021-01-20</span>
                                                        </div>
                                                    </td>
                                                 
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-warning text-center">대기중 </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                   <td  scope="row">
                                                       <div class="d-flex align-items-center">03</div>
                                                   </td>
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center">
                                                                    <img src="${pageContext.request.contextPath}/resources/aptAdmin_images/profile_default.png" alt="입주민 프사" />
                                                                <div class="font-weight-bolder ml-1">김이나</div>
                                                               
                                                        </div>
                                                    </td>
                                                    <td scope="row">
                                                        <div class="d-flex align-items-center text-center">
                                                            <span>생활지원센터에 건의 합니다</span>
                                                        </div>
                                                    </td>
                                                    <td  scope="row" class="text-nowrap">
                                                        <div class="d-flex flex-column">
                                                            <span class="font-weight-bolder mb-25">2021-01-20</span>
                                                        </div>
                                                    </td>
                                                 
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-warning text-center">대기중 </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                   <td  scope="row">
                                                       <div class="d-flex align-items-center">04</div>
                                                   </td>
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center">
                                                                    <img src="${pageContext.request.contextPath}/resources/aptAdmin_images/profile_default.png" alt="입주민 프사" />
                                                                <div class="font-weight-bolder ml-1">김이나</div>
                                                               
                                                        </div>
                                                    </td>
                                                    <td scope="row">
                                                        <div class="d-flex align-items-center text-center">
                                                            <span>생활지원센터에 건의 합니다</span>
                                                        </div>
                                                    </td>
                                                    <td  scope="row" class="text-nowrap">
                                                        <div class="d-flex flex-column">
                                                            <span class="font-weight-bolder mb-25">2021-01-20</span>
                                                        </div>
                                                    </td>
                                                 
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-warning text-center">대기중 </div>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                   <td  scope="row">
                                                       <div class="d-flex align-items-center">05</div>
                                                   </td>
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center">
                                                                    <img src="${pageContext.request.contextPath}/resources/aptAdmin_images/profile_default.png" alt="입주민 프사" />
                                                                <div class="font-weight-bolder ml-1">김이나</div>
                                                               
                                                        </div>
                                                    </td>
                                                    <td scope="row">
                                                        <div class="d-flex align-items-center text-center">
                                                            <span>생활지원센터에 건의 합니다</span>
                                                        </div>
                                                    </td>
                                                    <td  scope="row" class="text-nowrap">
                                                        <div class="d-flex flex-column">
                                                            <span class="font-weight-bolder mb-25">2021-01-20</span>
                                                        </div>
                                                    </td>
                                                 
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-warning text-center">대기중 </div>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                   <td  scope="row">
                                                       <div class="d-flex align-items-center">06</div>
                                                   </td>
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-center">
                                                                    <img src="${pageContext.request.contextPath}/resources/aptAdmin_images/profile_default.png" alt="입주민 프사" />
                                                                <div class="font-weight-bolder ml-1">김이나</div>
                                                               
                                                        </div>
                                                    </td>
                                                    <td scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <span>생활지원센터에 건의 합니다</span>
                                                        </div>
                                                    </td>
                                                    <td  scope="row" class="text-nowrap">
                                                        <div class="d-flex flex-column">
                                                            <span class="font-weight-bolder mb-25">2021-01-20</span>
                                                        </div>
                                                    </td>
                                                 
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-success text-center">답변완료 </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                   <td  scope="row">
                                                       <div class="d-flex align-items-center">07</div>
                                                   </td>
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-center">
                                                                    <img src="${pageContext.request.contextPath}/resources/aptAdmin_images/profile_default.png" alt="입주민 프사" />
                                                                <div class="font-weight-bolder ml-1">김이나</div>
                                                               
                                                        </div>
                                                    </td>
                                                    <td scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <span>생활지원센터에 건의 합니다</span>
                                                        </div>
                                                    </td>
                                                    <td  scope="row" class="text-nowrap">
                                                        <div class="d-flex flex-column">
                                                            <span class="font-weight-bolder mb-25">2021-01-20</span>
                                                        </div>
                                                    </td>
                                                 
                                                    <td  scope="row">
                                                        <div class="d-flex align-items-center text-success text-center">답변완료 </div>
                                                    </td>
                                                </tr>
                                                
                                            
                                       
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Company Table Card -->
  
                        <!-- Developer Meetup Card -->
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card card-developer-meetup">
                                <div class="meetup-img-wrapper rounded-top text-center">
                                    <img src="../../../app-assets/images/illustration/email.svg" alt="Meeting Pic" height="170" />
                                </div>
                                <div class="card-body">
                                    <div class="meetup-header d-flex align-items-center">
                                        <div class="meetup-day">
                                            <h6 class="mb-0">THU</h6>
                                            <h3 class="mb-0">24</h3>
                                        </div>
                                        <div class="my-auto">
                                            <h4 class="card-title mb-25">Developer Meetup</h4>
                                            <p class="card-text mb-0">Meet world popular developers</p>
                                        </div>
                                    </div>
                                    <div class="media">
                                        <div class="avatar bg-light-primary rounded mr-1">
                                            <div class="avatar-content">
                                                <i data-feather="calendar" class="avatar-icon font-medium-3"></i>
                                            </div>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mb-0">Sat, May 25, 2020</h6>
                                            <small>10:AM to 6:PM</small>
                                        </div>
                                    </div>
                                    <div class="media mt-2">
                                        <div class="avatar bg-light-primary rounded mr-1">
                                            <div class="avatar-content">
                                                <i data-feather="map-pin" class="avatar-icon font-medium-3"></i>
                                            </div>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mb-0">Central Park</h6>
                                            <small>Manhattan, New york City</small>
                                        </div>
                                    </div>
                                    <div class="avatar-group">
                                        <div data-toggle="tooltip" data-popup="tooltip-custom" data-placement="bottom" data-original-title="Billy Hopkins" class="avatar pull-up">
                                            <img src="../../../app-assets/images/portrait/small/avatar-s-9.jpg" alt="Avatar" width="33" height="33" />
                                        </div>
                                        <div data-toggle="tooltip" data-popup="tooltip-custom" data-placement="bottom" data-original-title="Amy Carson" class="avatar pull-up">
                                            <img src="../../../app-assets/images/portrait/small/avatar-s-6.jpg" alt="Avatar" width="33" height="33" />
                                        </div>
                                        <div data-toggle="tooltip" data-popup="tooltip-custom" data-placement="bottom" data-original-title="Brandon Miles" class="avatar pull-up">
                                            <img src="../../../app-assets/images/portrait/small/avatar-s-8.jpg" alt="Avatar" width="33" height="33" />
                                        </div>
                                        <div data-toggle="tooltip" data-popup="tooltip-custom" data-placement="bottom" data-original-title="Daisy Weber" class="avatar pull-up">
                                            <img src="../../../app-assets/images/portrait/small/avatar-s-20.jpg" alt="Avatar" width="33" height="33" />
                                        </div>
                                        <div data-toggle="tooltip" data-popup="tooltip-custom" data-placement="bottom" data-original-title="Jenny Looper" class="avatar pull-up">
                                            <img src="../../../app-assets/images/portrait/small/avatar-s-20.jpg" alt="Avatar" width="33" height="33" />
                                        </div>
                                        <h6 class="align-self-center cursor-pointer ml-50 mb-0">+42</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Developer Meetup Card -->

                        <!-- Browser States Card -->
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card card-browser-states">
                                <div class="card-header">
                                    <div>
                                        <h4 class="card-title">Browser States</h4>
                                        <p class="card-text font-small-2">Counter August 2020</p>
                                    </div>
                                    <div class="dropdown chart-dropdown">
                                        <i data-feather="more-vertical" class="font-medium-3 cursor-pointer" data-toggle="dropdown"></i>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="javascript:void(0);">Last 28 Days</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Last Month</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Last Year</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="browser-states">
                                        <div class="media">
                                            <img src="../../../app-assets/images/icons/google-chrome.png" class="rounded mr-1" height="30" alt="Google Chrome" />
                                            <h6 class="align-self-center mb-0">Google Chrome</h6>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div class="font-weight-bold text-body-heading mr-1">54.4%</div>
                                            <div id="browser-state-chart-primary"></div>
                                        </div>
                                    </div>
                                    <div class="browser-states">
                                        <div class="media">
                                            <img src="../../../app-assets/images/icons/mozila-firefox.png" class="rounded mr-1" height="30" alt="Mozila Firefox" />
                                            <h6 class="align-self-center mb-0">Mozila Firefox</h6>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div class="font-weight-bold text-body-heading mr-1">6.1%</div>
                                            <div id="browser-state-chart-warning"></div>
                                        </div>
                                    </div>
                                    <div class="browser-states">
                                        <div class="media">
                                            <img src="../../../app-assets/images/icons/apple-safari.png" class="rounded mr-1" height="30" alt="Apple Safari" />
                                            <h6 class="align-self-center mb-0">Apple Safari</h6>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div class="font-weight-bold text-body-heading mr-1">14.6%</div>
                                            <div id="browser-state-chart-secondary"></div>
                                        </div>
                                    </div>
                                    <div class="browser-states">
                                        <div class="media">
                                            <img src="../../../app-assets/images/icons/internet-explorer.png" class="rounded mr-1" height="30" alt="Internet Explorer" />
                                            <h6 class="align-self-center mb-0">Internet Explorer</h6>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div class="font-weight-bold text-body-heading mr-1">4.2%</div>
                                            <div id="browser-state-chart-info"></div>
                                        </div>
                                    </div>
                                    <div class="browser-states">
                                        <div class="media">
                                            <img src="../../../app-assets/images/icons/opera.png" class="rounded mr-1" height="30" alt="Opera Mini" />
                                            <h6 class="align-self-center mb-0">Opera Mini</h6>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div class="font-weight-bold text-body-heading mr-1">8.4%</div>
                                            <div id="browser-state-chart-danger"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Browser States Card -->

                        <!-- Goal Overview Card -->
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h4 class="card-title">Goal Overview</h4>
                                    <i data-feather="help-circle" class="font-medium-3 text-muted cursor-pointer"></i>
                                </div>
                                <div class="card-body p-0">
                                    <div id="goal-overview-radial-bar-chart" class="my-2"></div>
                                    <div class="row border-top text-center mx-0">
                                        <div class="col-6 border-right py-1">
                                            <p class="card-text text-muted mb-0">Completed</p>
                                            <h3 class="font-weight-bolder mb-0">786,617</h3>
                                        </div>
                                        <div class="col-6 py-1">
                                            <p class="card-text text-muted mb-0">In Progress</p>
                                            <h3 class="font-weight-bolder mb-0">13,561</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Goal Overview Card -->

                        <!-- Transaction Card -->
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card card-transaction">
                                <div class="card-header">
                                    <h4 class="card-title">Transactions</h4>
                                    <div class="dropdown chart-dropdown">
                                        <i data-feather="more-vertical" class="font-medium-3 cursor-pointer" data-toggle="dropdown"></i>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="javascript:void(0);">Last 28 Days</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Last Month</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Last Year</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="transaction-item">
                                        <div class="media">
                                            <div class="avatar bg-light-primary rounded">
                                                <div class="avatar-content">
                                                    <i data-feather="pocket" class="avatar-icon font-medium-3"></i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="transaction-title">Wallet</h6>
                                                <small>Starbucks</small>
                                            </div>
                                        </div>
                                        <div class="font-weight-bolder text-danger">- $74</div>
                                    </div>
                                    <div class="transaction-item">
                                        <div class="media">
                                            <div class="avatar bg-light-success rounded">
                                                <div class="avatar-content">
                                                    <i data-feather="check" class="avatar-icon font-medium-3"></i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="transaction-title">Bank Transfer</h6>
                                                <small>Add Money</small>
                                            </div>
                                        </div>
                                        <div class="font-weight-bolder text-success">+ $480</div>
                                    </div>
                                    <div class="transaction-item">
                                        <div class="media">
                                            <div class="avatar bg-light-danger rounded">
                                                <div class="avatar-content">
                                                    <i data-feather="dollar-sign" class="avatar-icon font-medium-3"></i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="transaction-title">Paypal</h6>
                                                <small>Add Money</small>
                                            </div>
                                        </div>
                                        <div class="font-weight-bolder text-success">+ $590</div>
                                    </div>
                                    <div class="transaction-item">
                                        <div class="media">
                                            <div class="avatar bg-light-warning rounded">
                                                <div class="avatar-content">
                                                    <i data-feather="credit-card" class="avatar-icon font-medium-3"></i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="transaction-title">Mastercard</h6>
                                                <small>Ordered Food</small>
                                            </div>
                                        </div>
                                        <div class="font-weight-bolder text-danger">- $23</div>
                                    </div>
                                    <div class="transaction-item">
                                        <div class="media">
                                            <div class="avatar bg-light-info rounded">
                                                <div class="avatar-content">
                                                    <i data-feather="trending-up" class="avatar-icon font-medium-3"></i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="transaction-title">Transfer</h6>
                                                <small>Refund</small>
                                            </div>
                                        </div>
                                        <div class="font-weight-bolder text-success">+ $98</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Transaction Card -->
                    </div><!-- row match Height -->
                </section>
                <!-- Dashboard Ecommerce ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->
  
<!-- 박스레이아웃 : 끝 -->
                

<%@ include file="../adminInc/adminBottom.jsp"%>