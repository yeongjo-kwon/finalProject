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

#weather{
	overflow: hidden;
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
                    
                    	<div class="card-body">
				<!-- <div class="col-xl-6 pl-0 pl-lg-5 pr-lg-1 d-flex align-items-stretch">
					<div class="content d-flex flex-column justify-content-center"> -->
						<h3>아파트 일정</h3>
						<div style="width:500px;">
							<c:import url="/main/mainScheduler.do"></c:import>
						</div>
						
					</div>
					<!-- End .content-->
                       
                        <!-- Statistics Card -->
                        
                        <div class="col-xl-6 col-md-5 col-12">
                            <div class="card card-statistics">
                               <!--  <div class="card-header">
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
                                        <div class="col-xl-3 col-sm-6 col-12">
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
                                        </div>
                                    </div>
                                </div> -->
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
				<div class="card col-xl-6 col-md-7 col-12">
				<div class="card-body">
    			<div class="">
                    <div class="card-body">
<iframe id="yinaWeather" src="${pageContext.request.contextPath}/admin/adminLiving/openWeather.do"  id="weather" class="p-2"
	width="100%" height="166px" background-color="#fff" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
	
             		 </div><!-- card-body -->
                 </div><!-- 카드 col-md-7 -->
				</div>
				</div>
				<!-- openWeather api 날씨 끝-->    
                    
                    
                    
                    <!-- ======= About Section ======= -->
	<section class="about">

			<div class="row no-gutters">
				<!-- <div class="col-xl-6 d-flex align-items-stretch box-bin" style="width:50%"> -->
	<div class="card col">
	<div class="card-body">
					<div class="p-5">
						<h3 class="d-inline" style="font-weight:700; font-size:34px;"><a href="<c:url value='/living/noti/noticeList.do'/>"> 우리아파트 공지사항</a></h3>
						
						<br>
						<div class="mt-2">
							<c:import url="/main/mainNotice.do"></c:import>
						</div>
					</div>
	</div>
	</div>
					
				</div>
					<div class="card col">
	<div class="card-body">
				<!-- <div class="col-xl-6 pl-0 pl-lg-5 pr-lg-1 d-flex align-items-stretch">
					<div class="content d-flex flex-column justify-content-center"> -->
						<h3>아파트 일정</h3>
						<div style="width:500px;">
							<c:import url="/main/mainScheduler.do"></c:import>
						</div>
						
					</div>
					<!-- End .content-->
				</div>
			<!-- </div> -->

	</section>
	<!-- End About Section -->
                        
                        

      
  
                        
                    </div><!-- row match Height -->
                </section>
                <!-- Dashboard Ecommerce ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->
  
<!-- 박스레이아웃 : 끝 -->
                

<%@ include file="../adminInc/adminBottom.jsp"%>