<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>HouseMuch</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-120.png">
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon.ico">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Open+Sans:ital,wght@0,400;0,600;0,700;0,800;1,400;1,600;1,700;1,800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100;1,300;1,400;1,500&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/user/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/user/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/user/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/user/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/user/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/user/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/user/assets/css/style.css" rel="stylesheet">
  
  <style type="text/css">
  	.sb-menu{
	  	top: 0;
	    display: block;
	    height: 250px;
	    opacity: 1;
  	}
  	.nav-menu a{
  		font-size:20px; !important
  	}
  </style>


  <!-- =======================================================
  * Template Name: Groovin - v2.2.0
  * Template URL: https://bootstrapmade.com/groovin-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center col-lg-10">

      <h1 class="logo mr-5"><a href='<c:url value='/main/main.do'/>'> 
      <img alt="하우스머치 로고" src='${pageContext.request.contextPath}/resources/aptUser_images/housemuch_logo.png'>
      </a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.jsp" class="logo mr-auto"><img src="${pageContext.request.contextPath}/resources/user/assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <div class="nav-menu d-none d-lg-block" style="width:100%">
      
       <ul id="menu123" style="display: inline-flex;" class="m-auto">
         <li>
         	<a href="<c:url value='/mngcost/mngcostInquiry.do'/>">관리비 조회</a>
         </li>
         <li><a href="<c:url value='/energy/energyChart.do'/>">에너지 조회</a></li>
         <li><a href="<c:url value='/living/noti/noticeList.do'/>">생활지원 센터</a></li>
         <li><a href="<c:url value='/userBoard/userBoardList.do'/>">입주민 커뮤니티</a></li>
         <li><a href="<c:url value='/mngcost/mngcostPayment.do'/>">관리비 납부</a></li>
       </ul>
      
      <ul style="float: right">  
          <li class="nav-item d-none d-lg-block">
          	<a href="javascript:void(window.open('<c:url value="/user/chat/chat.do"/>', 'chat','width=1000, height=800'))">
         		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
          	</a>
          </li>
          <li class="drop-down" style="padding-top:0;">
          <a href="#" >
         	<img class="round" src="${pageContext.request.contextPath}/resources/user_images/${memVo.memberImgFilename }" alt="avatar" height="40" width="40" style="background-color: #fff; padding-top:0px; border-radius : 50%; overflow: hidden;">
          </a>
            <ul style="text-align: left; width:150px;">
              <li><a href="#">내 계정 관리</a></li>
              <li><a href="<c:url value='/userDash/userDashMain.do'/>">마이 페이지</a></li>
              
              <!-- 관리자 대시보드로 들어가는 링크  -->
              <li><a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">관리자 페이지</a></li>
              
              <li><a href="javascript:void(window.open('<c:url value="/user/chat/chat.do"/>', 'chat','width=1000, height=800'))">1:1 채팅 </a></li>
              <li><a href="<c:url value='/login/logout.do'/>">로그아웃</a></li>
            </ul>
          </li>
          
          
        </ul>
 
      </div><!-- .nav-menu -->

    </div>
    
	<div class="sb-menu container align-items-center col-lg-10 " style="width:100%; height:22vh; display: none;">
	      <h1 class="logo mr-5" style="visibility: hidden;"><a href='<c:url value='/main/main.do'/>'> 
		      <img alt="하우스머치 로고" src='${pageContext.request.contextPath}/resources/aptUser_images/housemuch_logo.png'>
		  </a></h1>
		<div class="nav-menu " style="width:100%">  
			<ul style="display: inline-flex;">
				<li>
			       	<ul >
			     		<li><a href="<c:url value='/mngcost/mngcostInquiry.do'/>">관리비 조회</a></li>
			     	</ul>
			     </li>
			     <li>
			     	<ul style="display: block">
			     		<li><a href="#">공과금 기록</a>
			     		<li><a href="<c:url value='/energy/energyChart.do'/>">공과금 조회</a>
			     	</ul>
		     	</li>
			     <li class="ml-2 mr-3">
			     	<ul style="display: block">
			     		<li><a href="<c:url value='/living/noti/noticeList.do'/>">공지사항</a>
			     		 <li><a href="<c:url value='/living/noti/aptScheduler.do'/>">아파트 일정</a>
			     		<li><a href="<c:url value='/living/add/addFacilityList.do'/>">부가시설</a>
			     		<li><a href="#">차량관리</a>
			     		<li><a href="<c:url value='/suggestBoard/suggestBoardList.do'/>">건의 게시판</a>
			     	</ul>
		     	</li>
			     <li class="mr-3">
			     	<ul style="display: block">
			     		<li><a href="<c:url value='/userBoard/userBoardList.do'/>">입주민 게시판</a>
			     		<li><a href="#">입주민 투표</a>
			     	</ul>
		     	</li>
			     <li>
			     	<ul style="display: block">
			     		<li><a href="/mngcost/mngcostPayment.do">납부하기</a>
			     	</ul>
		     	</li>
	     	</ul>
		</div>    
	</div>
	
  </header><!-- End Header -->

 