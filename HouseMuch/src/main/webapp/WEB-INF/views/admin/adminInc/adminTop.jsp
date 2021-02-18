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
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/calendars/fullcalendar.min.css"> 달력주석테스트--%>
	<link href='${pageContext.request.contextPath}/resources/ynCalendar/lib/main.css' rel='stylesheet' />
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

<!-- css -->
<style type="text/css">
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
    font-size: 20px;
    letter-spacing: 0.05em;
    display: block;
    padding: 0 20px 0 20px;
}

a {
	color: #7DB249;
	text-decoration: none;
	background-color: transparent;
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

.brand-text img {
    object-fit: cover;
    height: 3rem;
}

.topMenu > .dept01 > li > a:before {
	content: "";
    position: absolute;
    width: 100%;
    height: 2px;
    bottom: -6px;
    left: 0;
    background-color: #5c9f24;
    visibility: hidden;
    width: 0px;
    transition: all 0.3s ease-in-out 0s;
}

.topMenu a:hover:before, .topMenu li:hover > a:before, .topMenu .active > a:before {
  visibility: visible;
  width: 100%;
}
</style>

<!-- 비교 -->
<!-- 0123 제이쿼리  top에 안들어있어서 김이나 추가 절대 지우지 말것 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<!-- 탑 메뉴 js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/hanhee.js/userNadminDashTop.js"></script>

<script type="text/javascript">
/* 왼쪽 서브메뉴 스크롤 추가 */
function subMenuScroll(){
	window.scrollTo(0,1000);
}
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
			<!-- 반응형 START -->
			<div class="bookmark-wrapper d-flex align-items-center">
             <ul class="nav navbar-nav d-xl-none">
               <li class="nav-item"><a class="nav-link menu-toggle" href="javascript:void(0);"><i class="ficon" data-feather="menu"></i></a></li>
             </ul>
           </div>
			<!-- 반응형 END -->
			<div class="nav-menu d-none d-lg-block topMenu"
				style="width: 100%;">
				<!-- 메뉴넣기 -->
				<!-- 첫번째 -->
				<!-- dept 1 -->
				<ul class="dept01">
					<li><a href="<c:url value='/mngcost/mngcostInquiry.do'/>">관리비 조회</a> 
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a
								href="<c:url value='/mngcost/mngcostInquiry.do'/>"> 관리비 조회 </a>
							</li>
						</ul>
					</li>
				</ul>
				<!-- 두번째 -->
				<!-- dept 1 -->
				<ul class="dept01">
					<li><a href="<c:url value='/energy/energyChart.do'/>">에너지 조회</a> 
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a
								href="<c:url value='/energy/energyChart.do'/>"> 공과금 조회 </a>
							</li>
						</ul>
					</li>
				</ul>
				<!-- 세번째 -->
				<ul class="dept01">
					<li><a href="<c:url value='/living/noti/noticeList.do'/>">생활지원 센터</a> 
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a
								href="<c:url value='/living/noti/noticeList.do'/>"> 공지사항 </a>
							</li>
							<li id="subMenu"><a
								href="<c:url value='/living/noti/aptScheduler.do'/>"> 아파트 일정</a>
							</li>
							<li id="subMenu"><a
								href="<c:url value='/living/add/addFacilityList.do'/>">
									부가시설 </a>
							</li>
							<li id="subMenu"><a href="#"> 차량관리 </a></li>
							<li id="subMenu"><a
								href="<c:url value='/suggestBoard/suggestBoardList.do'/>">
									건의 게시판 </a>
							</li>
						</ul>
					</li>
				</ul>
				<!-- 네번째 -->
				<!-- dept 1 -->
				<ul class="dept01">
					<li><a href="<c:url value='/userBoard/userBoardList.do'/>">입주민 커뮤니티</a> 
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a
								href="<c:url value='/userBoard/userBoardList.do'/>"> 입주민 게시판
							</a>
						</li>
						</ul>
					</li>
				</ul>
				<!-- 다섯번째 -->
				<!-- dept 1 -->
				<ul class="dept01">
					<li><a href="<c:url value='/mngcost/mngcostPayment.do'/>">관리비 납부</a> 
						<!-- dept 2 -->
						<ul class="dept02">
							<li id="subMenu"><a
								href="<c:url value='/mngcost/mngcostPayment.do'/>"> 납부하기 </a>
							</li>
						</ul>
					</li>
				</ul>
				<!--  -->
				<ul class="nav navbar-nav align-items-center ml-auto ">
					<li class="nav-item dropdown dropdown-user">
						<a class="nav-link dropdown-toggle dropdown-user-link"
							id="dropdown-user" href="javascript:void(0);"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="user-nav d-sm-flex d-none">
							<span class="user-name font-weight-bolder">${memVo.memberName }</span>
							<span class="user-status">${memVo.id }</span>
						</div> 
							<span class="avatar">
								<img class="round"
									src="${pageContext.request.contextPath}/resources/user_images/${memVo.memberImgFilename }"
									alt="avatar" height="40" width="40">
								<span class="avatar-status-online"></span>
							</span>
						</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="dropdown-user">
							<a class="dropdown-item"
								href="<c:url value='/admin/adminEdit.do'/>"><i
								class="mr-50" data-feather="user"></i>내 계정 관리</a><a
								class="dropdown-item"
								href="<c:url value='/admin/adminAll/adminAllMain.do'/>"><i
								class="mr-50" data-feather="check-square"></i>관리자 페이지</a><a
								class="dropdown-item" href="#"><i class="mr-50"
								data-feather="message-square"></i> 1:1채팅</a> <a
								class="dropdown-item" href="<c:url value='/login/logout.do'/>"><i
								class="mr-50" data-feather="power"></i>로그아웃</a>
						</div></li>
				</ul>
			</div>
			<!-- 메뉴 여기까지 -->
		</div>
	</nav>
	<!-- END: Header-->


	<!-- BEGIN: Main Menu-->
	<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow"
		data-scroll-to-active="true" onclick="subMenuScroll()">
		<div class="navbar-header">
			<ul class="nav navbar-nav flex-row">
				<li class="nav-item mr-auto"><a class="navbar-brand"
					href="${pageContext.request.contextPath}/main/main.do"> <span
						class="brand-logo"> </span>
						<div class="brand-text">
							<img alt="하우스머치관리자로고"
								src='<c:url value="/resources/aptAdmin_images/housemuch_adminLogo.png" />'>
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

				<!-- 입주민 홈으로 가는 링크 : 어떤페이지로 할 지 결정하기 -->
				<li class="nav-item"><a class="align-items-center"
					href="<c:url value='/main/main.do'/>"><span class="menu-title">입주민
							홈으로 이동</span></a></li>
				<hr>
				<!-- navi 시작 -->
				<!----------------------------------------------- 여기부터 공통메뉴  ------------------------------------------------------------->
				<li class=" navigation-header"><span
					data-i18n="Apps &amp; Pages">일반 관리 업무</span><i
					data-feather="more-horizontal"></i></li>


				<!-- 일반1 : 일반 관리 업무 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">입주민 관리 업무</span></a>
					<ul class="menu-content">
						<!-- 일반2-1 : 입주민 게시판 카테고리 편집-->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminAll/adminBoardCtg.do'/>"> <i
								data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">게시판 카테고리 관리</span></a></li>
					</ul>
					<ul class="menu-content">

						<!-- 일반3-1 : 건의 목록-->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminAll/adminSuggBoard.do'/>"> <i
								data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">건의사항 관리</span></a></li>
					</ul></li>
				<hr>

				<!----------------------------------------------- 여기까지 관리자 공통메뉴  ------------------------------------------------------------->

				<!----------------------------------------------- 여기부터 단독메뉴 - 시설  ------------------------------------------------------------->
				<li class=" navigation-header"><span
					data-i18n="Apps &amp; Pages">시설 관리 업무</span><i
					data-feather="more-horizontal"></i></li>
				<!-- 시설1 :  -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">보수 업체 관리</span></a>
					<ul class="menu-content">

						<!-- 시설1-1 :  -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminFacility/facilityCompanyList.do'/>"> <i data-feather="circle"></i><span
								class="menu-item" data-i18n="Wish List">계약 업체 목록</span></a></li>

						<!-- 시설1-2 :  -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminFacility/facilityCompanyReg.do'/>"> <i data-feather="circle"></i><span
								class="menu-item" data-i18n="Shop">계약 업체 등록</span></a></li>
					</ul></li>

				<!-- 시설2 :  -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">보수 비용 청구</span></a>
					<ul class="menu-content">

						<!-- 시설1-1 :  -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminFacility/facilityAddCost.do'/>"> <i data-feather="circle"></i><span
								class="menu-item" data-i18n="Wish List">추가 요금 청구</span></a></li>

					</ul></li>
				<hr>
				<!----------------------------------------------- 여기까지 단독메뉴  ------------------------------------------------------------->

				<!----------------------------------------------- 여기부터 단독메뉴 - 행정  ------------------------------------------------------------->
				<li class=" navigation-header"><span
					data-i18n="Apps &amp; Pages">행정 관리 업무</span><i
					data-feather="more-horizontal"></i></li>


				<!-- 행정1 : 일정 및 공지 관리 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">일정 및 공지 관리</span></a>
					<ul class="menu-content">

						<!-- 행정1-3 : 일정 및 공지 목록 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminNoti/adminNotiList.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">일정/공지 목록</span>
						</a></li>

						<!-- 행정1-1 : 일정 및 공지 등록 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminNoti/adminNotiRegister.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">일정/공지 등록</span>
						</a></li>

						<!-- 행정1-2 : 일정 및 공지 수정 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminNoti/adminNotiEdit.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Details">일정/공지 수정</span>
						</a></li>

						<!-- 행정1-3 : 일정 및 공지 삭제 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminNoti/adminNotiDel.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">일정/공지 삭제</span>
						</a></li>
					</ul></li>

				<!-- 행정2 : 부가시설 관리 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">부가 시설 관리</span></a>
					<ul class="menu-content">
						<!-- 행정2-3 : 부가시설목록  -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminAdd/adminAddInfoList.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">부가 시설 목록 관리</span>
						</a></li>
						<!-- 행정2-1 : 부가시설 등록 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminAdd/adminAddInfoRegister.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">시설 정보 등록</span>
						</a></li>
						<!-- 행정2-2 : 부가시설 수정 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminAdd/adminAddEdit.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Details">시설 정보 수정</span>
						</a></li>
						<!-- 행정2-4 : 부가시설 신청내역 -->
						<%-- <li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminAdd/adminAddResidence.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">부가 시설 신청내역</span>
						</a></li> --%>
						<!-- 행정2-5 : 부가시설 접수중단 목록(ADD_OUTDATE IS NOT NULL)-->
						<%-- <li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminAdd/adminAddDel.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">운영 중단 시설 내역</span>
						</a></li> --%>
					</ul></li>

				<!-- 행정3 : 차량 관리 -->
				 <li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">차량 관리</span></a>
					<ul class="menu-content">
						<!-- 행정3-1 : 방문차량 등록현황 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='#'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">세대별 등록 차량 조회</span>
						</a></li>

						<!-- 행정3-2 : 차량 등록 상세 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminCar/adminCarDetail.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Details">방문 차량 조회</span>
						</a></li>
					</ul></li>
						<%--
						<!-- 행정3-3 : 세대차량관리 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminCar/adminCarResidence.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">세대 차량 관리</span>
						</a></li>

						<!-- 행정3-4 : 방문 차량 등록(작업용) -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminLiving/adminCar/adminCarResidence.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">방문 차량 등록(작업용)</span>
						</a></li>
					</ul></li> --%>
				<hr>
				<!----------------------------------------------- 여기까지 단독메뉴  ------------------------------------------------------------->

				<!----------------------------------------------- 여기부터 단독메뉴 - 회계  ------------------------------------------------------------->
				<li class=" navigation-header"><span
					data-i18n="Apps &amp; Pages">회계 관리 업무</span><i
					data-feather="more-horizontal"></i></li>

				<!-- 회계1 : 관리비 관리 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">지출내역 관리</span></a>
					<ul class="menu-content">

						<!-- 회계1-1 : 지출내역 등록 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminMngcost/adminMngcostInquiry.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">지출내역 정보</span>
						</a></li>

						<!-- 회계1-2 : 지출내역 조회 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminMngcost/adminMngcostRegister.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">지출내역 등록</span>
						</a></li>

						<!-- 회계1-3 : 세대 전기료 등록 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminMngcost/adminElectricChargeRegister.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">세대 전기료 등록</span>
						</a></li>
					</ul></li>

				<!-- 회계2 : 납입내역 관리 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">납입내역 관리</span></a>
					<ul class="menu-content">

						<!-- 회계1-1 : 관리비 청구 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminMngcost/adminMngcostOrder.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">관리비 청구</span>
						</a></li>

						<!-- 회계1-2 : 납입내역 조회 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminMngcost/adminPaymentListInquiry.do'/>">
								<i data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">납입내역 조회</span>
						</a></li>
					</ul></li>
				<!----------------------------------------------- 여기까지 단독메뉴  ------------------------------------------------------------->

				<!----------------------------------------------- 여기부터 단독메뉴 - 소유주  ------------------------------------------------------------->
				<li class=" navigation-header"><span
					data-i18n="Apps &amp; Pages">아파트 총 관리 업무</span><i
					data-feather="more-horizontal"></i></li>

				<!-- 소유주1 : 아파트 관리 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">아파트 관리</span></a>
					<ul class="menu-content">

						<!-- 소유주1-1 : 관리자 관리 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminOwner/ownerManage.do'/>"> <i
								data-feather="circle"></i><span class="menu-item"
								data-i18n="Wish List">관리자 관리</span></a></li>

						<!-- 소유주1-2 : 입주민 관리 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminOwner/ownerResident.do'/>"> <i
								data-feather="circle"></i><span class="menu-item"
								data-i18n="Shop">입주민 관리</span></a></li>
					</ul></li>

				<!-- 소유주2 : 결제 서류 확인 -->
				<li class=" nav-item"><a class="d-flex align-items-center"
					href="#"><span class="menu-title text-truncate"
						data-i18n="eCommerce">아파트 결제 관리</span></a>
					<ul class="menu-content">

						<!-- 소유주1-1 : 보수 비용 확인 -->
						<li><a class="d-flex align-items-center"
							href="<c:url value='/admin/adminOwner/facilityPayCost.do'/>"> <i data-feather="circle"></i><span
								class="menu-item" data-i18n="Wish List">추가 비용 결제 관리</span></a></li>

					</ul></li>
				<!----------------------------------------------- 여기까지 단독메뉴  ------------------------------------------------------------->


			</ul>
			<!-- 사이드 대메뉴ul -->
		</div>
	</div>
	<!-- END: Main Menu-->