<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../mainInc/mainTop.jsp" %>

  <!-- Required meta tags -->

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ynCalendar/css/calendar.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ynCalendar/css/theme.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ynCalendar/css/spinner.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ynCalendar/css/style.css">

<style>
/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/
.clearfix::after,
.calendar ol::after {
  content: ".";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}

/* ================
Calendar Styling */
.calendar {
  border-radius: 10px;
}

.month {
  font-size: 2rem;
}

@media (min-width: 992px) {
  .month {
    font-size: 3.5rem;
  }
}

.calendar ol li {
  float: left;
  width: 14.28571%;
}

.calendar .day-names {
  border-bottom: 1px solid #eee;
}

.calendar .day-names li {
  text-transform: uppercase;
  margin-bottom: 0.5rem;
}

.calendar .days li {
  border-bottom: 1px solid #eee;
  min-height: 8rem;
}

.calendar .days li .date {
  margin: 0.5rem 0;
}

.calendar .days li .event {
  font-size: 0.75rem;
  padding: 0.4rem;
  color: white;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  border-radius: 4rem;
  margin-bottom: 1px;
}

.calendar .days li .event.span-2 {
  width: 200%;
}

.calendar .days li .event.begin {
  border-radius: 1rem 0 0 1rem;
}

.calendar .days li .event.end {
  border-radius: 0 1rem 1rem 0;
}

.calendar .days li .event.clear {
  background: none;
}

.calendar .days li:nth-child(n+29) {
  border-bottom: none;
}

.calendar .days li.outside .date {
  color: #ddd;
}

/*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/
body {
  min-height: 100vh;
  background-color: #7DB249;
  background-image: linear-gradient(160deg, #F2FBDD 0%, #7DB249 100%);
}

</style>
<%-- 
<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2 class="mt-1" style="line-height: 2; vertical-align: middle;">아파트 일정</h2>
				<ol>
					<li><a href="<c:url value='/main/index.do'/>">Home</a></li>
					<li>아파트 일정</li>
				</ol>
			</div>
		</div>
	</section>
	<!-- End Breadcrumbs -->

</main> --%>

<section class="inner-page">
	<div class="container" >
	<section class="breadcrumbs" style="background-color: transparent;">
			<div class="d-flex justify-content-between align-items-center">
				<h2 style="line-height: 2; vertical-align: middle;font-weight:500;font-size:1.5em;">아파트 일정</h2>
				<ol class="d-flex float-right"  style="text-decoration: none; list-style: none;">
					
					<li style="list-style: none; margin-left: 10px; color:#ffffff" >
						<a href="<c:url value='/main/index.do'/>">Home</a>
					</li>
					
					<li style="list-style: none; margin-left: 10px;">아파트 일정</li>
				</ol>
			</div>
			<p class="lead" style="font-size:16px">일정을 클릭하시면 상세 공지사항을 확인하실 수 있습니다.</p>
			
</section>
	</div>
<!-- 달력후보1 -->

<!-- <div class="jquery-script-clear"></div> -->

<!--   <div class="container" style="margin:0 auto">

    For Demo Purpose
    <header class="text-center text-white mb-2">
      <h1 class="display-4">우리 아파트 일정</h1>
      <p class="lead">일정을 클릭하시면 상세 공지사항을 확인하실 수 있습니다.</p>
    </header>

    Calendar : 이번달 넣어주는 calendar
    <div id="calendar" style="background-color:#fafafa"></div>


  </div> -->

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!--  

 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/js/all.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script type="module" src="${pageContext.request.contextPath}/resources/ynCalendar/js/main.js"></script>
  <script type="text/javascript">

 var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })(); 

</script> 

-->

<!-- 달력후보2 -->


  <!-- For Demo Purpose -->


<div class="container" style="margin:0 auto">
  <!-- Calendar -->
  <div class="calendar shadow bg-white p-5">
    <div class="d-flex align-items-center"><i class="fa fa-calendar fa-3x mr-3"></i>
      <!-- <h2 class="month font-weight-bold mb-0 text-center m-0-auto">2021년 1월</h2> -->
	
	<div class="text-center col-12">
		
		<div id="nowMonth"></div>
	</div>

    </div>
    <p class="text-muted mb-5">단지 내 소화전 및 소화기 점검일</p>
    <ol class="day-names list-unstyled">
      <li class="font-weight-bold text-uppercase">Sun</li>
      <li class="font-weight-bold text-uppercase">Mon</li>
      <li class="font-weight-bold text-uppercase">Tue</li>
      <li class="font-weight-bold text-uppercase">Wed</li>
      <li class="font-weight-bold text-uppercase">Thu</li>
      <li class="font-weight-bold text-uppercase">Fri</li>
      <li class="font-weight-bold text-uppercase">Sat</li>
    </ol>

    <ol class="days list-unstyled">
      <li>
        <div class="date">1</div>
      </li>
      <li>
        <div class="date">2</div>
        <div class="event bg-warning">단지 내 소화전 및 소화기 점검</div>
      </li>
      <li>
        <div class="date">3</div>
      </li>
      <li>
        <div class="date">4</div>
        <div class="event bg-info">새해 맞이 바자회</div>
      </li>
      <li>
        <div class="date">5</div>
      </li>
      <li>
        <div class="date">6</div>
      </li>
      <li>
        <div class="date">7</div>
      </li>
      <li>
        <div class="date">8</div>
      </li>
      <li>
        <div class="date">9</div>
      </li>
      <li>
        <div class="date">10</div>
      </li>
      <li>
        <div class="date">11</div>
      </li>
      <li>
        <div class="date">12</div>
      </li>
      <li>
        <div class="date">13</div>
        <div class="event all-day begin span-2 bg-purple">지하주차장 보수공사</div>
      </li>
      <li>
        <div class="date">14</div>
      </li>
      <li>
        <div class="date">15</div>
        <div class="event all-day end bg-purple">지하주차장 보수공사</div>
      </li>
      <li>
        <div class="date">16</div>
      </li>
      <li>
        <div class="date">17</div>
      </li>
      <li>
        <div class="date">18</div>
      </li>
      <li>
        <div class="date">19</div>
      </li>
      <li>
        <div class="date">20</div>
      </li>
      <li>
        <div class="date">21</div>
        <div class="event bg-primary">입주민 설문조사</div>
        <div class="event bg-success">헬스장 이벤트</div>
      </li>
      <li>
        <div class="date">22</div>
        <div class="event bg-info">CCTV증설</div>
      </li>
      <li>
        <div class="date">23</div>
      </li>
      <li>
        <div class="date">24</div>
      </li>
      <li>
        <div class="date">25</div>
      </li>
      <li>
        <div class="date">26</div>
      </li>
      <li>
        <div class="date">27</div>
      </li>
      <li>
        <div class="date">28</div>
      </li>
      <li>
        <div class="date">29</div>
      </li>
      <li>
        <div class="date">30</div>
      </li>
      <li>
        <div class="date">31</div>
      </li>
      <li class="outside">
        <div class="date">1</div>
      </li>
      <li class="outside">
        <div class="date">2</div>
      </li>
      <li class="outside">
        <div class="date">3</div>
      </li>
      <li class="outside">
        <div class="date">4</div>
      </li>
    </ol>
  </div>
</div>





			</section>
<div class="clearfix"></div>

<%@ include file="../../mainInc/mainBottom.jsp" %>