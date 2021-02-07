<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<!-- BEGIN: Head-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>HouseMuch</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}//resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Open+Sans:ital,wght@0,400;0,600;0,700;0,800;1,400;1,600;1,700;1,800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100;1,300;1,400;1,500&display=swap" rel="stylesheet">
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/charts/apexcharts.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/editors/quill/katex.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/editors/quill/monokai-sublime.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/editors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/select/select2.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Inconsolata&amp;family=Roboto+Slab&amp;family=Slabo+27px&amp;family=Sofia&amp;family=Ubuntu+Mono&amp;display=swap">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/calendars/fullcalendar.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/pickers/flatpickr/flatpickr.min.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/extensions/dataTables.checkboxes.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/responsive.bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/nouislider.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/wizard/bs-stepper.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/spinner/jquery.bootstrap-touchspin.css">
 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/swiper.min.css">
       
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/buttons.bootstrap4.min.css">
   
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/pickers/pickadate/pickadate.css">   

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/maps/leaflet.min.css">

    <!-- END: Vendor CSS-->
    

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/themes/bordered-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/dashboard-ecommerce.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/charts/chart-apex.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/extensions/ext-component-toastr.css">
 	
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/form-quill-editor.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-email.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-chat.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-chat-list.css">
   
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/pickers/form-flat-pickr.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-calendar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/form-validation.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-invoice-list.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-invoice.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/extensions/ext-component-sliders.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-ecommerce.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/pickers/form-pickadate.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/form-wizard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/form-number-input.css">
  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-ecommerce-details.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-user.css">
 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/page-profile.css">
  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/page-pricing.css">  

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/page-blog.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/ui-colors.css">
  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/ui-feather.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/maps/map-leaflet.css">
      
    <!-- END: Page CSS-->
    
    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
    <!-- END: Custom CSS-->

	<!-- 비교 -->
<!-- 0123 제이쿼리  top에 안들어있어서 김이나 추가 절대 지우지 말것 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<!-- 왼쪽 서브메뉴 스크롤 추가 -->
<script type="text/javascript">
function subMenuScroll(){
	window.scrollTo(0,1000);
}
</script>

</head>
<!-- END: Head-->


<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static" data-open="click" data-menu="vertical-menu-modern" data-col="">

    <!-- BEGIN: Header-->
    <nav class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-light navbar-shadow">
        <div class="navbar-container d-flex content">
            <div class="bookmark-wrapper d-flex align-items-center">
                <ul class="nav navbar-nav d-xl-none">
                    <li class="nav-item"><a class="nav-link menu-toggle" href="javascript:void(0);"><i class="ficon" data-feather="menu"></i></a></li>
                </ul>
                <ul class="nav navbar-nav bookmark-icons">
                    <li class="nav-item d-none d-lg-block"><a class="nav-link" href="<c:url value='/sample/email.do'/>" data-toggle="tooltip" data-placement="top" title="Email"><i class="ficon" data-feather="mail"></i></a></li>
                    <li class="nav-item d-none d-lg-block"><a class="nav-link" href="<c:url value='/sample/chat.do'/>" data-toggle="tooltip" data-placement="top" title="Chat"><i class="ficon" data-feather="message-square"></i></a></li>
                    <li class="nav-item d-none d-lg-block"><a class="nav-link" href="<c:url value='/sample/calendar.do'/>" data-toggle="tooltip" data-placement="top" title="Calendar"><i class="ficon" data-feather="calendar"></i></a></li>
                </ul>
             
            </div>
            <ul class="nav navbar-nav align-items-center ml-auto">
                
           
                <li class="nav-item nav-search"><a class="nav-link nav-link-search"><i class="ficon" data-feather="search"></i></a>
                    <div class="search-input">
                        <div class="search-input-icon"><i data-feather="search"></i></div>
                        <input class="form-control input" type="text" placeholder="검색하세요!" tabindex="-1" data-search="search">
                        <div class="search-input-close"><i data-feather="x"></i></div>
                        <ul class="search-list search-list-main"></ul>
                    </div>
                </li>
                
                <li class="nav-item dropdown dropdown-notification mr-25"><a class="nav-link" href="javascript:void(0);" data-toggle="dropdown"><i class="ficon" data-feather="bell"></i><span class="badge badge-pill badge-danger badge-up">5</span></a>
                    <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                        <li class="dropdown-menu-header">
                            <div class="dropdown-header d-flex">
                                <h4 class="notification-title mb-0 mr-auto">Notifications</h4>
                                <div class="badge badge-pill badge-light-primary">6 New</div>
                            </div>
                        </li>
                        <li class="scrollable-container media-list"><a class="d-flex" href="javascript:void(0)">
                                <div class="media d-flex align-items-start">
                                    
                                   
                                </div>
                            </a><a class="d-flex" href="javascript:void(0)">
                                <div class="media d-flex align-items-start">
                                    <div class="media-left">
                                        <div class="avatar"><img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-3.jpg" alt="avatar" width="32" height="32"></div>
                                    </div>
                                    
                                </div>
                            </a><a class="d-flex" href="javascript:void(0)">
                                <div class="media d-flex align-items-start">
                                    <div class="media-left">
                                        <div class="avatar bg-light-danger">
                                            <div class="avatar-content">MD</div>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                    
                                    </div>
                                </div>
                            </a>
                            <div class="media d-flex align-items-center">
                                <h6 class="font-weight-bolder mr-auto mb-0">System Notifications</h6>
                                <div class="custom-control custom-control-primary custom-switch">
                                    <input class="custom-control-input" id="systemNotification" type="checkbox" checked="">
                                    <label class="custom-control-label" for="systemNotification"></label>
                                </div>
                            </div><a class="d-flex" href="javascript:void(0)">
                                <div class="media d-flex align-items-start">
                                    <div class="media-left">
                                        <div class="avatar bg-light-danger">
                                            <div class="avatar-content"><i class="avatar-icon" data-feather="x"></i></div>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <p class="media-heading"><span class="font-weight-bolder">Server down</span>&nbsp;registered</p><small class="notification-text"> USA Server is down due to hight CPU usage</small>
                                    </div>
                                </div>
                            </a><a class="d-flex" href="javascript:void(0)">
                                <div class="media d-flex align-items-start">
                                    <div class="media-left">
                                        <div class="avatar bg-light-success">
                                            <div class="avatar-content"><i class="avatar-icon" data-feather="check"></i></div>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <p class="media-heading"><span class="font-weight-bolder">Sales report</span>&nbsp;generated</p><small class="notification-text"> Last month sales report generated</small>
                                    </div>
                                </div>
                            </a><a class="d-flex" href="javascript:void(0)">
                                <div class="media d-flex align-items-start">
                                    <div class="media-left">
                                        <div class="avatar bg-light-warning">
                                            <div class="avatar-content"><i class="avatar-icon" data-feather="alert-triangle"></i></div>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <p class="media-heading"><span class="font-weight-bolder">High memory</span>&nbsp;usage</p><small class="notification-text"> BLR Server using high memory</small>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="dropdown-menu-footer"><a class="btn btn-primary btn-block" href="javascript:void(0)">Read all notifications</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown dropdown-user"><a class="nav-link dropdown-toggle dropdown-user-link" id="dropdown-user" href="javascript:void(0);" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="user-nav d-sm-flex d-none"><span class="user-name font-weight-bolder">유저네임</span><span class="user-status">Admin</span></div><span class="avatar"><img class="round" src="${pageContext.request.contextPath}//resources/app-assets/images/portrait/small/avatar-s-22.jpg" alt="avatar" height="40" width="40"><span class="avatar-status-online"></span></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user"><a class="dropdown-item" href="#"><i class="mr-50" data-feather="user"></i> Profile</a><a class="dropdown-item" href="#"><i class="mr-50" data-feather="mail"></i> Inbox</a><a class="dropdown-item" href="#"><i class="mr-50" data-feather="check-square"></i> Task</a><a class="dropdown-item" href="#"><i class="mr-50" data-feather="message-square"></i> Chats</a>
                        <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="mr-50" data-feather="settings"></i> Settings</a><a class="dropdown-item" href="#"><i class="mr-50" data-feather="credit-card"></i> Pricing</a><a class="dropdown-item" href="#"><i class="mr-50" data-feather="help-circle"></i> FAQ</a><a class="dropdown-item" href="#"><i class="mr-50" data-feather="power"></i> Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
     <!-- END: Header-->


    <!-- BEGIN: Main Menu-->
    <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true" onclick="subMenuScroll()">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mr-auto"><a class="navbar-brand" href="${pageContext.request.contextPath}/main/main.do">
                <span class="brand-logo">
     
                            
                </span>
                        <div class="brand-text">
							<img alt="하우스머치관리자로고" src='<c:url value="/resources/aptAdmin_images/housemuch_adminLogo.png" />'>
						</div>
                    </a></li>
                <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="d-block d-xl-none text-primary toggle-icon font-medium-4" data-feather="x"></i><i class="d-none d-xl-block collapse-toggle-icon font-medium-4  text-primary" data-feather="disc" data-ticon="disc"></i></a></li>
            </ul>
        </div>
        <div class="shadow-bottom"></div>
        <div class="main-menu-content">
            <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

                <!-- 입주민 홈으로 가는 링크 : 어떤페이지로 할 지 결정하기 -->
                <li class="nav-item">
	                <a class="align-items-center" href="<c:url value='/main/main.do'/>"><span class="menu-title">입주민 홈으로 이동</span></a>
                </li>
                 <hr>
                <!-- navi 시작 -->
                <!----------------------------------------------- 여기부터 공통메뉴  ------------------------------------------------------------->
                <li class=" navigation-header"><span data-i18n="Apps &amp; Pages">일반 관리 업무</span><i data-feather="more-horizontal"></i>
                </li>
           
       
                <!-- 일반1 : 입주민 투표 현황-->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">입주민 관리 업무</span></a>
                    <ul class="menu-content">
                        <!-- 행정1-1 : 입주민 투표 현황 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminNoti/adminNotiRegList.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">입주민 투표 현황</span></a>
                        </li>
                       
                    </ul>
                    <ul class="menu-content">
                        <!-- 일반2-1 : 입주민 게시판 카테고리 편집-->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminAll/adminBoardCtg.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">게시판 카테고리 관리</span></a>
                        </li>
                    </ul>
                    <ul class="menu-content">
                
	      		        <!-- 일반3-1 : 건의 목록-->
	                	<li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminCar/adminCarVisit.do'/>">
	                       <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">건의사항 관리</span></a>
	                    </li>
	                </ul>
                </li>
				<hr>
  
                <!----------------------------------------------- 여기까지 관리자 공통메뉴  ------------------------------------------------------------->
              
                <!----------------------------------------------- 여기부터 단독메뉴 - 시설  ------------------------------------------------------------->
              	<li class=" navigation-header"><span data-i18n="Apps &amp; Pages">시설 관리 업무</span><i data-feather="more-horizontal"></i>
                </li>
                <!-- 시설1 :  -->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">보수 업체 관리</span></a>
                    <ul class="menu-content">
                        
                        <!-- 시설1-1 :  -->
                        <li><a class="d-flex align-items-center" href="<c:url value='#'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">보수 업체 목록</span></a>
                        </li>
                        
                        <!-- 시설1-2 :  -->
                        <li><a class="d-flex align-items-center" href="<c:url value='#'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">보수 비용 내역 조회</span></a>
                        </li>
                    </ul>
                </li>
                
                <!-- 시설2 :  -->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">보수 비용 청구</span></a>
                    <ul class="menu-content">
                        
                        <!-- 시설1-1 :  -->
                        <li><a class="d-flex align-items-center" href="<c:url value='#'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">보수 비용 청구</span></a>
                        </li>
                        
                        <!-- 시설1-2 :  -->
                        <li><a class="d-flex align-items-center" href="<c:url value='#'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">보수 비용 청구 내역</span></a>
                        </li>
                    </ul>
                </li>
                <hr>
                <!----------------------------------------------- 여기까지 단독메뉴  ------------------------------------------------------------->
             	
                <!----------------------------------------------- 여기부터 단독메뉴 - 행정  ------------------------------------------------------------->
                <li class=" navigation-header"><span data-i18n="Apps &amp; Pages">행정 관리 업무</span><i data-feather="more-horizontal"></i>
                </li>
           
       
                <!-- 행정1 : 일정 및 공지 관리 -->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">일정 및 공지 관리</span></a>
                    <ul class="menu-content">
                        
                        <!-- 행정1-3 : 일정 및 공지 목록 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminNoti/adminNotiList.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">일정/공지 목록</span></a>
                        </li>
                        
                        <!-- 행정1-1 : 일정 및 공지 등록 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminNoti/adminNotiRegister.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">일정/공지 등록</span></a>
                        </li>
                        
                        <!-- 행정1-2 : 일정 및 공지 수정 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminNoti/adminNotiEdit.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Details">일정/공지 수정</span></a>
                        </li>
                        
                        <!-- 행정1-3 : 일정 및 공지 삭제 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminNoti/adminNotiDel.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">일정/공지 삭제</span></a>
                        </li>
                    </ul>
                </li>

                <!-- 행정2 : 부가시설 관리 -->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">부가 시설 관리</span></a>
                    <ul class="menu-content">
                        <!-- 행정2-1 : 부가시설 등록 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminAdd/adminAddInfoRegister.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">시설 정보 등록</span></a>
                        </li>
                        <!-- 행정2-2 : 부가시설 수정 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminAdd/adminAddEdit.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Details">시설 정보 수정</span></a>
                        </li>
                        <!-- 행정2-3 : 부가시설목록  -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminAdd/adminAddInfoList.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">부가 시설 목록 관리</span></a>
                        </li>
                        <!-- 행정2-4 : 부가시설 신청내역 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminAdd/adminAddResidence.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">부가 시설 신청내역</span></a>
                        </li>
                        <!-- 행정2-5 : 부가시설 접수중단 목록(ADD_OUTDATE IS NOT NULL)-->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminAdd/adminAddDel.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">부가 삭제 내역(신청 안받는 시설 목록)</span></a>
                        </li>
                    </ul>
                </li>
                
                <!-- 행정3 : 차량 관리 -->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">차량 관리</span></a>
                    <ul class="menu-content">
                        <!-- 행정3-1 : 방문차량 등록현황 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminCar/adminCarVisit.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">방문 차량 관리</span></a>
                        </li>
                        
                        <!-- 행정3-2 : 차량 등록 상세 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminCar/adminCarDetail.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Details">등록 차량 상세조회</span></a>
                        </li>
                        
                        <!-- 행정3-3 : 세대차량관리 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminCar/adminCarResidence.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">세대 차량 관리</span></a>
                        </li>
                        
                        <!-- 행정3-4 : 방문 차량 등록(작업용) -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminLiving/adminCar/adminCarResidence.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">방문 차량 등록(작업용)</span></a>
                        </li>
                    </ul>
                </li>
                <hr>
                <!----------------------------------------------- 여기까지 단독메뉴  ------------------------------------------------------------->
                
                <!----------------------------------------------- 여기부터 단독메뉴 - 회계  ------------------------------------------------------------->
             	<li class=" navigation-header"><span data-i18n="Apps &amp; Pages">회계 관리 업무</span><i data-feather="more-horizontal"></i>
                </li>	
                	
                <!-- 회계1 : 관리비 관리 -->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">관리비 관리</span></a>
                    <ul class="menu-content">
                        
                        <!-- 회계1-1 : 지출내역 등록 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminMngcost/adminMngcostInquiry.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">지출내역 관리</span></a>
                        </li>
                        
                        <!-- 회계1-2 : 지출내역 조회 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminMngcost/adminMngcostRegister.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">지출내역 등록</span></a>
                        </li>
                    </ul>
                </li>
                
                <!-- 회계2 : 납입내역 관리 -->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">납입내역 관리</span></a>
                    <ul class="menu-content">
                        
                        <!-- 회계1-1 : 관리비 청구 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminMngcost/adminMngcostOrder.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">관리비 청구</span></a>
                        </li>
                        
                        <!-- 회계1-2 : 납입내역 조회 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='#'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">납입내역 조회</span></a>
                        </li>
                    </ul>
                </li>
                <!----------------------------------------------- 여기까지 단독메뉴  ------------------------------------------------------------->
                
                <!----------------------------------------------- 여기부터 단독메뉴 - 소유주  ------------------------------------------------------------->
             	<li class=" navigation-header"><span data-i18n="Apps &amp; Pages">아파트 총 관리 업무</span><i data-feather="more-horizontal"></i>
                </li>	
                	
                <!-- 소유주1 : 아파트 관리 -->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">아파트 관리</span></a>
                    <ul class="menu-content">
                        
                        <!-- 소유주1-1 : 관리자 관리 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminOwner/ownerManage.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">관리자 관리</span></a>
                        </li>
                        
                        <!-- 소유주1-2 : 입주민 관리 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='/admin/adminOwner/ownerResident.do'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">입주민 관리</span></a>
                        </li>
                    </ul>
                </li>
                
                <!-- 소유주2 : 결제 서류 확인 -->
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><span class="menu-title text-truncate" data-i18n="eCommerce">아파트 결제 관리</span></a>
                    <ul class="menu-content">
                        
                        <!-- 소유주1-1 : 보수 비용 확인 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='#'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Wish List">비용결제 관리</span></a>
                        </li>
                        
                        <!-- 소유주1-2 : 결제내역 조회 -->
                        <li><a class="d-flex align-items-center" href="<c:url value='#'/>">
                        <i data-feather="circle"></i><span class="menu-item" data-i18n="Shop">결제내역 조회</span></a>
                        </li>
                    </ul>
                </li>
                <!----------------------------------------------- 여기까지 단독메뉴  ------------------------------------------------------------->
                
                
            </ul><!-- 사이드 대메뉴ul -->
        </div>
    </div>
    <!-- END: Main Menu-->
    

