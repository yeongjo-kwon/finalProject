<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<!-- BEGIN: Head-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>HouseMuch</title>
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}//resources/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Open+Sans:ital,wght@0,400;0,600;0,700;0,800;1,400;1,600;1,700;1,800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100;1,300;1,400;1,500&display=swap"
	rel="stylesheet">
<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/charts/apexcharts.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/toastr.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/editors/quill/katex.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/editors/quill/monokai-sublime.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/editors/quill/quill.snow.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/select/select2.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css2?family=Inconsolata&amp;family=Roboto+Slab&amp;family=Slabo+27px&amp;family=Sofia&amp;family=Ubuntu+Mono&amp;display=swap">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/calendars/fullcalendar.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/pickers/flatpickr/flatpickr.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/extensions/dataTables.checkboxes.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/responsive.bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/nouislider.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/wizard/bs-stepper.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/spinner/jquery.bootstrap-touchspin.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/swiper.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/buttons.bootstrap4.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/pickers/pickadate/pickadate.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/maps/leaflet.min.css">

<!-- END: Vendor CSS-->


<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/components.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/themes/dark-layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/themes/bordered-layout.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/dashboard-ecommerce.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/charts/chart-apex.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/extensions/ext-component-toastr.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/form-quill-editor.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-email.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-chat.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-chat-list.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/pickers/form-flat-pickr.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-calendar.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/form-validation.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-invoice-list.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-invoice.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/extensions/ext-component-sliders.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-ecommerce.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/pickers/form-pickadate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/form-wizard.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/forms/form-number-input.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-ecommerce-details.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/app-user.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/page-profile.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/page-pricing.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/page-blog.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/ui-colors.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/pages/ui-feather.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/maps/map-leaflet.css">

<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<!-- END: Custom CSS-->


<!-- 비교 -->
<style type="text/css">
.main-menu.menu-light .navigation>li.active>a {
	background: #7DB249 !important;
	background: #7DB249;
	/* box-shadow: 0 0 10px 1px rgb(191 227 223); */
	color: #FFFFFF;
	font-weight: 400;
	border-radius: 4px;
}

a {
	color: #7DB249;
	text-decoration: none;
	background-color: transparent;
}

.table .thead-dark th {
	color: #FFFFFF;
	background-color: #7DB249 !important;
}

.main-menu.menu-light .navigation>li ul .active {
	background: #7DB249;
	background: linear-gradient(118deg, #2FA599);
	border-radius: 4px;
	z-index: 1;
}

.nav-menu a {
	color: #666666;
	font-size: 15px;
}

ul.dept01, ul.dept02 {
    margin: 0;
    padding: 0;
    list-style: none;
    display: inline-flex;
}

.dept01 li a {
    font-size: 1.5em;
    letter-spacing: 0.05em;
    display: block;
    padding: 0 20px 0 20px;
}

ul.dept02 {
	display: none;
}

ul.nav.navbar-nav.align-items-center.ml-auto {
    float: right;
    padding-left: 240px;
}

ul.dept02 li#subMenu:first-child {
    padding-top: 20px;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.dept01 li').mouseover(function(){
		$('.dept02').css('display','inline')
					.slideDown(200);
	}).mouseout(function(){
		$('.dept02').css('display','none')
					.slideUp(200);
	});
	
	$('.dept01 li a').mouseover(function(){
		$(this).css('color','#7DB249');
	}).mouseout(function(){
		$(this).css('color','#666666');
	});
	
	$('.dept02 li a').mouseover(function(){
		$(this).css('color','#7DB249');
	}).mouseout(function(){
		$(this).css('color','#666666');
	});
	
	
});
</script>


</head>
<!-- END: Head-->


<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern  navbar-floating footer-static"
	data-open="click" data-menu="vertical-menu-modern" data-col="">

	<!-- BEGIN: Header-->
	<nav
		class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-light navbar-shadow">
		<div class="navbar-container d-flex content">
			<!-- 전체 드롭다운 메뉴 감싸기 -->
			<div class="nav-menu d-none d-lg-block" class="topMenu">
				<!-- 메뉴넣기 -->
				<!-- 첫번째 -->
				<!-- dept 1 -->
				<ul class="dept01">
					<li>
						<a href="#">관리비 조회</a>
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a href="<c:url value='/mngcost/mngcostInquiry.do'/>">
								관리비 조회
							</a></li>
						</ul>
					</li>
				</ul>
				<!-- 두번째 -->
				<!-- dept 1 -->
				<ul class="dept01">
					<li>
						<a href="#">에너지 조회</a>
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a href="<c:url value='/energy/energyChart.do'/>">
								공과금 조회
							</a></li>
						</ul>
					</li>
				</ul>
				<!-- 세번째 -->
				<ul class="dept01">
					<li>
						<a href="#">생활지원 센터</a>
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a href="<c:url value='/living/noti/noticeList.do'/>">
								공지사항
							</a></li>
							<li id="subMenu"><a href="<c:url value='/living/noti/aptScheduler.do'/>">
								아파트 일정
							</a></li>
							<li id="subMenu"><a href="<c:url value='/living/add/addFacilityList.do'/>">
								부가시설
							</a></li>
							<li id="subMenu"><a href="#">
								차량관리
							</a></li>
							<li id="subMenu"><a href="<c:url value='/suggestBoard/suggestBoardList.do'/>">
								건의 게시판
							</a></li>
						</ul>
					</li>
				</ul>
				<!-- 네번째 -->
				<!-- dept 1 -->
				<ul class="dept01">
					<li>
						<a href="#">입주민 커뮤니티</a>
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a href="<c:url value='/userBoard/userBoardList.do'/>">
								입주민 게시판
							</a></li>
							<li id="subMenu"><a href="<c:url value='/voteBoard/voteComingSoon.do'/>">
								입주민 투표
							</a></li>
						</ul>
					</li>
				</ul>
				<!-- 다섯번째 -->
				<!-- dept 1 -->
				<ul class="dept01">
					<li>
						<a>관리비 납부</a>
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a href="<c:url value='/mngcost/mngcostPayment.do'/>">
								납부하기
							</a></li>
						</ul>
					</li>
				</ul>
				<!--  -->
				<ul class="nav navbar-nav align-items-center ml-auto ">


				<!-- <li class="nav-item nav-search"><a
					class="nav-link nav-link-search"><i class="ficon"
						data-feather="search"></i></a>
					<div class="search-input">
						<div class="search-input-icon">
							<i data-feather="search"></i>
						</div>
						<input class="form-control input" type="text" placeholder="검색하세요!"
							tabindex="-1" data-search="search">
						<div class="search-input-close">
							<i data-feather="x"></i>
						</div>
						<ul class="search-list search-list-main"></ul>
					</div></li> -->

				<%-- <li class="nav-item dropdown dropdown-notification mr-25"><a
					class="nav-link" href="javascript:void(0);" data-toggle="dropdown"><i
						class="ficon" data-feather="bell"></i><span
						class="badge badge-pill badge-danger badge-up">5</span></a>
					<ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
						<li class="dropdown-menu-header">
							<div class="dropdown-header d-flex">
								<h4 class="notification-title mb-0 mr-auto">Notifications</h4>
								<div class="badge badge-pill badge-light-primary">6 New</div>
							</div>
						</li>
						<li class="scrollable-container media-list"><a class="d-flex"
							href="javascript:void(0)">
								<div class="media d-flex align-items-start">
									<div class="media-left">
										<div class="avatar">
											<img
												src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-15.jpg"
												alt="avatar" width="32" height="32">
										</div>
									</div>
									<div class="media-body">
										<p class="media-heading">
											<span class="font-weight-bolder">Congratulation Sam 🎉</span>winner!
										</p>
										<small class="notification-text"> Won the monthly best
											seller badge.</small>
									</div>
								</div>
						</a><a class="d-flex" href="javascript:void(0)">
								<div class="media d-flex align-items-start">
									<div class="media-left">
										<div class="avatar">
											<img
												src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-3.jpg"
												alt="avatar" width="32" height="32">
										</div>
									</div>
									<div class="media-body">
										<p class="media-heading">
											<span class="font-weight-bolder">New message</span>&nbsp;received
										</p>
										<small class="notification-text"> You have 10 unread
											messages</small>
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
										<p class="media-heading">
											<span class="font-weight-bolder">Revised Order 👋</span>&nbsp;checkout
										</p>
										<small class="notification-text"> MD Inc. order
											updated</small>
									</div>
								</div>
						</a>
							<div class="media d-flex align-items-center">
								<h6 class="font-weight-bolder mr-auto mb-0">System
									Notifications</h6>
								<div class="custom-control custom-control-primary custom-switch">
									<input class="custom-control-input" id="systemNotification"
										type="checkbox" checked=""> <label
										class="custom-control-label" for="systemNotification"></label>
								</div>
							</div> <a class="d-flex" href="javascript:void(0)">
								<div class="media d-flex align-items-start">
									<div class="media-left">
										<div class="avatar bg-light-danger">
											<div class="avatar-content">
												<i class="avatar-icon" data-feather="x"></i>
											</div>
										</div>
									</div>
									<div class="media-body">
										<p class="media-heading">
											<span class="font-weight-bolder">Server down</span>&nbsp;registered
										</p>
										<small class="notification-text"> USA Server is down
											due to hight CPU usage</small>
									</div>
								</div>
						</a><a class="d-flex" href="javascript:void(0)">
								<div class="media d-flex align-items-start">
									<div class="media-left">
										<div class="avatar bg-light-success">
											<div class="avatar-content">
												<i class="avatar-icon" data-feather="check"></i>
											</div>
										</div>
									</div>
									<div class="media-body">
										<p class="media-heading">
											<span class="font-weight-bolder">Sales report</span>&nbsp;generated
										</p>
										<small class="notification-text"> Last month sales
											report generated</small>
									</div>
								</div>
						</a><a class="d-flex" href="javascript:void(0)">
								<div class="media d-flex align-items-start">
									<div class="media-left">
										<div class="avatar bg-light-warning">
											<div class="avatar-content">
												<i class="avatar-icon" data-feather="alert-triangle"></i>
											</div>
										</div>
									</div>
									<div class="media-body">
										<p class="media-heading">
											<span class="font-weight-bolder">High memory</span>&nbsp;usage
										</p>
										<small class="notification-text"> BLR Server using
											high memory</small>
									</div>
								</div>
						</a></li>
						<li class="dropdown-menu-footer"><a
							class="btn btn-primary btn-block" href="javascript:void(0)">Read
								all notifications</a></li>
					</ul></li> --%>
				<li class="nav-item dropdown dropdown-user"><a
					class="nav-link dropdown-toggle dropdown-user-link"
					id="dropdown-user" href="javascript:void(0);"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="user-nav d-sm-flex d-none">
							<span class="user-name font-weight-bolder">${memVo.memberName }</span><span
								class="user-status">${memVo.id }</span>
						</div> <span class="avatar"><img class="round"
							src="${pageContext.request.contextPath}/resources/user_images/${memVo.memberImgFilename }"
							alt="avatar" height="40" width="40"><span
							class="avatar-status-online"></span></span>
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="dropdown-user">
						<a class="dropdown-item" href="<c:url value='/userDash/myAccount/memberEdit.do'/>"><i class="mr-50"
							data-feather="user"></i>내 계정 관리</a><a class="dropdown-item"
							href="<c:url value='/userDash/userDashMain.do'/>"><i
							class="mr-50" data-feather="check-square"></i>마이페이지</a><a
							class="dropdown-item" href="#"><i class="mr-50"
							data-feather="message-square"></i> 1:1채팅</a> <a class="dropdown-item"
							href="<c:url value='/login/logout.do'/>"><i class="mr-50"
							data-feather="power"></i>로그아웃</a>
					</div></li>
			</ul>
			</div>
			<!-- 메뉴 여기까지 -->
			
		</div>
	</nav>
	<!-- END: Header-->


	<!-- BEGIN: Main Menu-->
	<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow"
		data-scroll-to-active="true">
		<div class="navbar-header">
			<ul class="nav navbar-nav flex-row">
				<li class="nav-item mr-auto"><a class="navbar-brand"
					href="${pageContext.request.contextPath}/main/main.do"> <span
						class="brand-logo"> </span>
						<div class="brand-text">
							<img alt="하우스머치입주민로고"
								src='<c:url value="/resources/aptUser_images/housemuch_logo.png" />'>
						</div>
				</a></li>
				<li class="nav-item nav-toggle"><a
					class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i
						class="d-block d-xl-none text-primary toggle-icon font-medium-4"
						data-feather="x"></i><i
						class="d-none d-xl-block collapse-toggle-icon font-medium-4  text-primary"
						data-feather="disc" data-ticon="disc"></i></a></li>
			</ul>
		</div>
		<div class="shadow-bottom"></div>
		<div class="main-menu-content">
			<ul class="navigation navigation-main" id="main-menu-navigation"
				data-menu="menu-navigation">

				<!-- 입주민 대시보드 메인 화면 -->
				<li class="nav-item"><a class="align-items-center"
					href="<c:url value='/userDash/userDashMain.do'/>"><span
						class="menu-title">마이페이지</span></a></li>
				<hr>
				<!-- navi 시작 -->
				<!----------------------------------------------- 여기부터 메뉴1  ------------------------------------------------------------->
				<li class=" navigation-header"><span
					data-i18n="Apps &amp; Pages">내 관리비</span><i
					data-feather="more-horizontal"></i></li>

				<!-- 관리비 조회 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><i data-feather='menu'></i><span
						class="menu-title text-truncate" data-i18n="eCommerce">관리비
							조회</span></a>
					<ul class="menu-content">
						<!-- 관리비 조회 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/userDash/myMngcost/mngcostCheck.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">관리비 조회</span>
						</a></li>

					</ul></li>

				<!-- 공과금 조회 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><i data-feather='menu'></i><span
						class="menu-title text-truncate" data-i18n="eCommerce">공과금
							조회</span></a>
					<ul class="menu-content">
						<!-- 에너지 조회 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='#'/>"> <i data-feather="circle"></i><span
								class="menu-item" data-i18n="Shop">공과금 조회</span>
						</a></li>
					</ul></li>
				<hr>

				<!----------------------------------------------- 여기부터 메뉴2  ------------------------------------------------------------->
				<li class=" navigation-header"><span
					data-i18n="Apps &amp; Pages">우리 아파트</span><i
					data-feather="more-horizontal"></i></li>
				<!-- 내 글 목록 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><i data-feather='menu'></i><span
						class="menu-title text-truncate" data-i18n="eCommerce">내 글
							목록</span></a>
					<ul class="menu-content">
						<!-- 내 게시글 조회 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/userDash/boardList.do'/>"> <i
								data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">내 게시글 조회</span>
						</a></li>
					</ul>
					<ul class="menu-content">
						<!-- 건의게시글 조회 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/userDash/suggList.do'/>"> <i
								data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">내 건의글 조회</span>
						</a></li>
					</ul></li>


				<!-- 내 부가시설 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><i data-feather='menu'></i><span
						class="menu-title text-truncate" data-i18n="eCommerce">내
							부가시설</span></a>
					<ul class="menu-content">
						<!-- 내 부가시설 조회 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/living/add/addOrderList.do?memberNo=${sessionScope.memVo.memberNo}'/>"> <i data-feather="circle"></i><span
								class="menu-item" data-i18n="Shop">내 부가시설 조회</span>
						</a></li>
					</ul></li>

				<!-- 내 차량내역-->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><i data-feather='menu'></i><span
						class="menu-title text-truncate" data-i18n="eCommerce">내
							차량내역</span></a>
					<ul class="menu-content">
						<!-- 내 차량내역 조회 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='#'/>"> <i data-feather="circle"></i><span
								class="menu-item" data-i18n="Shop">내 차량내역 조회</span>
						</a></li>
					</ul></li>

				<!-- 내 친구목록-->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><i data-feather='menu'></i><span
						class="menu-title text-truncate" data-i18n="eCommerce">내
							친구목록</span></a>
					<ul class="menu-content">
						<!-- 내 친구목록 조회 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='#'/>"> <i data-feather="circle"></i><span
								class="menu-item" data-i18n="Shop">내 친구목록 조회</span>
						</a></li>
					</ul></li>

				<!-- 내 계정관리-->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><i data-feather='menu'></i><span
						class="menu-title text-truncate" data-i18n="eCommerce">내
							계정관리</span></a>
					<ul class="menu-content">
						<!-- 내 계정관리 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/userDash/myAccount/memberEdit.do'/>"> <i data-feather="circle"></i><span
								class="menu-item" data-i18n="Shop">내 계정관리</span>
						</a></li>
					</ul></li>


			</ul>
			<!-- 사이드 대메뉴ul -->
		</div>
	</div>
	<!-- END: Main Menu-->