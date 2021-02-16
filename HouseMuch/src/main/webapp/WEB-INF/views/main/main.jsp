<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>
<style type="text/css">
.box-bin{
	padding: 50px 30px;
    box-shadow: 0px 2px 15px rgb(0 0 0 / 10%);
    transition: all ease-in-out 0.3s;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"<c:url value='/main/covid19.do'/>",
			type:"get",
			data:{"serviceKey":"cUzOoH2EICTDxM3SPynXBN4dZ6rtJimY1"},
			dataType:"json",
			success:function(res){
				var resultCode=res.resultCode;	//응답코드
				var resultMessage=res.resultMessage;	//API처리 결과
				
				if(resultCode!=0){ //0이 아니면 에러임
					alert(resultCode + "=>" + resultMessage);
				}else{ //정상일때
					if(res!=null){
						var totalCase = res.TotalCase;
						var totalCaseBefore = res.TotalCaseBefore;
						var totalRecovered = res.TotalRecovered;
						var todayRecovered = res.TodayRecovered;
						var totalDeath = res.TotalDeath;
						var todayDeath = res.TodayDeath;
						var nowCase = res.NowCase;
						
						$('#totalCase').html(totalCase);
						$('#totalCaseBefore').html("+"+totalCaseBefore);
						$('#totalRecovered').html(totalRecovered);
						$('#todayRecovered').html("+"+todayRecovered);
						$('#totalDeath').html(totalDeath);
						$('#todayDeath').html("+"+todayDeath);
						$('#gage').html(nowCase);
						$('#updateTime').html(res.updateTime);
						
					}
				}
			},
			error:function(xhr, status, error){
				alert("error! : " + error);
			}
		});
	});
	
</script>
<main id="main">
 <!-- ======= Hero Banner ======= -->
 	<section id="hero" style="height: 80vh">
 		<div class="hero-container">
	    	<div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
	
		        <div class="carousel-inner" role="listbox">
		
		          <!-- Slide 1 -->
		          <div class="carousel-item active">
		          	<div class="carousel-background "><img src="${pageContext.request.contextPath}/resources/aptUser_images/aptLogin.jpg" alt="aptMain1" width="100%"></div>
		            <div class="carousel-container">
		              <div class="carousel-content">
		                <h2 class="animate__animated animate__fadeInDown">${aptName }</h2>
		                <p>◇&nbsp;&nbsp;◇&nbsp;&nbsp;◇</p>
		                <p style="width: 300px;">환영합니다!</p>
		              </div>
		            </div>
		          </div>
	   
		      </div>
			</div>
		</div>
	</section>
	<!-- End Banner -->
	
	<section class="mt-2 container mb-0 pb-0">
		<div class="col-lg-12 mt-2 mt-lg-2 mb-0 row" style="margin-right: 0px;padding-right: 0px;margin-left: 0px;padding-left: 0px;">
			<div class="box-bin d-flex container">
				<div>
					<h2>국내 현황판</h2>
					<span id="updateTime" style="font-weight: bold;"></span><br> 00시 데이터 기준으로 오전9시~10시 사이에 자동으로 업데이트 됩니다.
				</div>
				<div class="card-body">
					<div class="d-flex d-lg-flex d-md-block align-items-center">
						<h2>
						<span style="color: #f89009;" id="totalCase"></span>
						</h2>
						<span class="badge bg-warning font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none" id="totalCaseBefore"></span>
					</div>
					<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 확진자</h6>
				</div>
				
				<div class="card-body">
					<div class="d-flex d-lg-flex d-md-block align-items-center">
						<h2>
						<span style="color: #009a87;" id="totalRecovered"></span>
						</h2>
						<span class="badge bg-success font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none" id="todayRecovered"></span>
					</div>
					<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 완치자</h6>
				</div>
				
				<div class="card-body" >
					<div class="d-flex d-lg-flex d-md-block align-items-center">
						<h2>
						<span style="color: #ee2323;" id="totalDeath"></span>
						</h2>
						<span class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none" id="todayDeath"></span>
					</div>
					<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 사망자</h6>
				</div>
				
				<div class="card-body" id="total">
					<div class="d-flex d-lg-flex d-md-block align-items-center">
						<h2>
						<span style="color: #006dd7;" id="gage"></span>
						</h2>
					</div>
					<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 격리자수</h6>
				</div>
				
				
			</div>
		</div>
	</section>
	
	<section class="why-us mt-0" style="text-align:center">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 mt-2">
					<a href="<c:url value='/mngcost/mngcostInquiry.do'/>" >
					<div class="box">
						<h4>관리비 조회</h4>
					</div>
					</a>
				</div>

				<div class="col-lg-3 mt-4 mt-lg-0">
					<a href="<c:url value='/energy/energyChart.do'/>">
					<div class="box">
						<h4>에너지 조회</h4>
					</div>
					</a>
				</div>

				<div class="col-lg-3 mt-4 mt-lg-0">
					<a href="<c:url value='/living/noti/noticeList.do'/>">
					<div class="box">
						<h4>생활지원 센터</h4>
					</div>
					</a>
				</div>
				
				<div class="col-lg-3 mt-4 mt-lg-0">
					<a href="<c:url value='/mngcost/mngcostPayment.do'/>">
					<div class="box">
						<h4>납부하기</h4>
					</div>
					</a>
				</div>

			</div>

		</div>
	</section>
<!-- ======= About Section ======= -->
	<section class="about">
		<div class="container">

			<div class="row no-gutters">
				<div class="col-xl-6 d-flex align-items-stretch box-bin" style="width:50%">
					<div class="p-5">
						<h3 class="d-inline" style="font-weight:700; font-size:34px;"><a href="<c:url value='/living/noti/noticeList.do'/>"> 우리아파트 공지사항</a></h3>
						
						<br>
						<div class="mt-2">
							<c:import url="/main/mainNotice.do"></c:import>
						</div>
					</div>
				</div>
				
				<div class="col-xl-6 pl-0 pl-lg-5 pr-lg-1 d-flex align-items-stretch">
					<div class="content d-flex flex-column justify-content-center">
						<h3>아파트 일정</h3>
						<div style="width:500px;">
							<c:import url="/main/mainScheduler.do"></c:import>
						</div>
						
					</div>
					<!-- End .content-->
				</div>
			</div>

		</div>
	</section>
	<!-- End About Section -->
</main>
<%@ include file="../mainInc/mainBottom.jsp" %>


