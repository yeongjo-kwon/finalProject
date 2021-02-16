<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<!-- 차트리소스 -->
 <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/styles.css" rel="stylesheet" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
 
 <!-- 탭 -->
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/animate.css/animate.min.css" rel="stylesheet">
   <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
 <!-- 탭 끝 -->
 <!-- 머터리얼io -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/ynResources/icon/yn-material.css" rel="stylesheet">
 <!-- data-feather-->
 <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
//전역변수 
var data =${dataList};
console.log("dataList"+data);//그대로들어옴

var labels =${labelList};//따옴표없어서 에러남 -> 자바에서 붙여서 보냄 -> 에러안남
console.log("labelList"+labels);
function ynBarChart(ctx){
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
	
	var ynBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: labels,
	    datasets: [{
	      label: "사용량(kwh)",
	      backgroundColor: "rgba(255,64,30,0.7)",
	      borderColor: "rgba(255,64,30,0.8)",
	      data: data,
	    }],
	  },
	  options: {
	    scales: {
		      xAxes: [{
		        time: {
		          unit: 'month'
		        },
		        gridLines: {
		          display: false
		        },
		        ticks: {
		          maxTicksLimit: 12
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          max: 500,
		          maxTicksLimit: 10
		        },
		        gridLines: {
		          display: true
		        }
		      }],
		    },
		    legend: {
		      display: true
	    }
	  }
	});
}

$(function(){
	  
	console.log("나와랏");
	var ctx = document.getElementById("ynBarChart");
	ynBarChart(ctx);
	
	$('.utiltab').on('click',function(){
		var ctgId = $(this).attr('id');
		console.log("ctgId는  "+ctgId);
		var uCtgNo = ctgId.slice(-1);
		console.log("uCtgNo는  "+uCtgNo);
		/* $.ajax({
			url:"<c:url value='/energy/utilCostChart.do'/>",
				data:{
					nCtgNo=$().
					
				}
					type:
						dataType:
		}); */
	});

});

</script> 
 
 
 <style>
.apt-bg-primary{
	background-color:#5c9f24; 
}
.apt-bg-secondary{
	background-color:#f6f6f6; 
}
.apt-bg-light{
	background-color:#F2FBDD; 
}
.apt-bg-dark{
	background-color:#22550E; 
}

.apt-text-primary{
	color:#5c9f24; 
}
.apt-text-secandary{
	color:#666666; 
}
.apt-text-third{
	color:#F2FBDD; 
}
.apt-text-dark{
	color:#22550E; 
}

.btn{
	background-color:#5c9f24;
	border-color: #5c9f24;
}
.btn:hover{
	background-color:#326717;
	border-color: #326717;
}

.btn-light{
	background-color:#F2FBDD;
	border-color: #E2F7BC;
	color: #22550E;
}
.btn-light:hover{
	background-color:#ffffff;
	border-color: #5c9f24;
}


/* 탭css */

/* 눌릴때&호버 */
.nav-tabs .nav-item.open .nav-link, .nav-tabs .nav-item.open .nav-link:focus, .nav-tabs .nav-item.open 
.nav-link:hover, .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-item.show .nav-link:focus, .nav-tabs 
.nav-item.show .nav-link:hover, .nav-tabs .nav-link.active, .nav-tabs .nav-link.active:focus, .nav-tabs 
.nav-link.active:hover {
    color: #5c9f24;
    /* background-color: #f6f6f6; */
    border-color: transparent;
   border-bottom-color: #5c9f24; 
}


/* 눌린 후 대기중 */
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #5c9f24;
     background-color:#fff; /* rgba(246,246,246,0.5);  */
    border-color: #e0e0e0;
   border-bottom: 3px solid #5c9f24;
    box-shadow: 0 0 6px rgba(0,0,0,0.2);
}


.nav-tabs-line .nav-link {
    padding: .715rem 1.429rem;
    border-bottom: 3px solid #5c9f24;
}
.nav-tabs .nav-link {
    color: #565656;
    transition: .25s;
}
.nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .215rem;
    border-top-right-radius: .215rem;
}
.nav-link {
    position: relative;
    display: block;
    padding: .715rem 1.072rem;
    overflow: hidden;
}


.nav-link {
    position: relative;
    display: block;
    padding: .715rem 1.072rem;
    overflow: hidden;
}
.nav-link {
    display: block;
    padding: .715rem 1.429rem;
}

.fulltab-item{
	width:25%;
	boder:none;
	text-align: center;
}
.fulltab-item.active{
	border-bottom:3px solid #5c9f24;
}

.tab-pane{
	background-color: #fff;
	padding:4rem;
	box-shadow: 0 0 6px rgba(0,0,0,0.2);
}
</style>

<div class="yiWrapper" style="width:100%; min-height:700px; margin: 0 auto;">
<div class="clearfix" style="height:80px;background-color:#f6f6f6;position:sticky;"></div>
 
      <!-- ======= 탭+차트 Section ======= -->
    <section id="departments" style="background-color: rgba(237,240,234,0.5)">
			<h3 class="apt-text-dark text-center mb-10"><b>${DongHo} 에너지 조회</b></h3>
			<br>
      <div class="container p-0" data-aos="fade-up">
    <!--     <div class="section-title card pb-1 mb-5 mt-10">
          <div class="card-body pt-8 text-center">
				
				관리비 지불내역에 포함된 세대 에너지 사용량 현황입니다.
				자세한 관리비 지출내역 조회를 원하신다면 <a href="#">관리비 조회</a>를 참고하세요<br>
				
				</div>
        </div>
 -->
 
    <div class="row">
                <!-- Example Tabs Line Left -->
                <div class="example-wrap">
                  <div class="nav-tabs-vertical" data-plugin="tabs">
                    <ul class="nav nav-tabs nav-tabs-line mr-25" role="tablist">
                      <li class="nav-item fulltab-item" role="presentation"><a class="nav-link active" data-toggle="tab" href="#exampleTabsLineLeftOne"
                          aria-controls="exampleTabsLineLeftOne" role="tab">전기</a></li>
                      <li class="nav-item fulltab-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineLeftTwo"
                          aria-controls="exampleTabsLineLeftTwo" role="tab">수도</a></li>
                      <li class="nav-item fulltab-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineLeftThree"
                          aria-controls="exampleTabsLineLeftThree" role="tab">가스</a></li>
                      <li class="nav-item fulltab-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineLeftFour"
                          aria-controls="exampleTabsLineLeftFour" role="tab">전체</a></li>
                    </ul>
                    <div class="tab-content py-15">
                      <div class="tab-pane active" id="exampleTabsLineLeftOne" role="tabpanel">
                        Mel, incorruptis confidam derepta inportuno perpetuam placatae. Expetenda summam
                        venandi cotidie euripidis vexetur, scribendi recta fortunam
                        hanc oblivione. Iniuria ipso statuam utrumque asperiores
                        eae cogitemus, evertitur triarium perspexit conclusionemque
                        propterea repellendus agatur scilicet, leniter intervalla
                        nocet praeterierunt tuum privatione, senserit sale vias,
                        delectatum dedecora ratione o religionis derigatur diuturnum
                        arbitrantur conspiratione, legam opera splendore iste democritum
                        apte romanum legum egregios.
                      </div>
                      <div class="tab-pane" id="exampleTabsLineLeftTwo" role="tabpanel">
                        Mnesarchum velit cumanum utuntur tantam deterritum, democritum vulgo contumeliae
                        abest studuisse quanta telos. Inmensae. Arbitratu dixisset
                        invidiae ferre constituto gaudeat contentam, omnium nescius,
                        consistat interesse animi, amet fuisset numen graecos incidunt
                        euripidis praesens, homines religionis dirigentur postulant.
                        Magnum utrumvis gravitate appareat fabulae facio perveniri
                        fruenda indicaverunt texit, frequenter probet diligenter
                        sententia meam distinctio theseo legerint corporis quoquo,
                        optari futurove expedita.
                      </div>
                      <div class="tab-pane" id="exampleTabsLineLeftThree" role="tabpanel">
                       <!-- <canvas id="myAreaChart" width="100%" height="30"></canvas> -->
                         Dicent feramus necesse proficiscuntur libidinem quisquis, petulantes divitias compositis,
                        disseretur voluptates crudeli sustulisti. Hostis res utuntur
                        bono incurrunt navigandi laboribus istae tali, miserum
                        metuamus labor quasi synephebos iudicante. Effecerit sicine
                        falsarum pugnantibus imperitos, vero successionem exhorrescere
                        illis magnopere deteriora maioribus necessariam industria.
                        Illi variari stabilique augendas suscipiet, corrigere conducunt,
                        divinum affecti, eruditus clarorum. Spatio gustare cupiditates
                        desideret aliena sinat utrumque.
                      </div>
                      <div class="tab-pane" id="exampleTabsLineLeftFour" role="tabpanel">
                        Dicent feramus necesse proficiscuntur libidinem quisquis, petulantes divitias compositis,
                        disseretur voluptates crudeli sustulisti. Hostis res utuntur
                        bono incurrunt navigandi laboribus istae tali, miserum
                        metuamus labor quasi synephebos iudicante. Effecerit sicine
                        falsarum pugnantibus imperitos, vero successionem exhorrescere
                        illis magnopere deteriora maioribus necessariam industria.
                        Illi variari stabilique augendas suscipiet, corrigere conducunt,
                        divinum affecti, eruditus clarorum. Spatio gustare cupiditates
                        desideret aliena sinat utrumque.
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End Example Tabs Line Left -->
              </div>
            </div>
          </div>
        </div>
        <!-- End Panel Tabs -->
 
 
 
 
 
 
 
 
 
        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-2 mb-5 mb-lg-0 pr-0">
            <ul class="nav nav-tabs flex-column pt-0">
	            	
		             <!-- 전기탭제목 -->
		              <li class="nav-item">
		                <a class="nav-link active show utiltab" data-toggle="tab" href="#tab-2" id="util3">
		                <p></p>
		             	<h4>전기</h4>
		                <p></p>
		                </a>
		              </li>
		             
		             <!-- 수도탭제목 -->
		              <li class="nav-item">
		                <a class="nav-link utiltab" data-toggle="tab" href="#tab-1" id="util2">
		              <p></p>
		                  <h4>수도</h4>
		                <p></p>
		                </a>
		              </li>
		             
		             <!-- 가스탭제목 -->
		              <li class="nav-item">
		                <a class="nav-link utiltab" data-toggle="tab" href="#tab-3" id="util1">
		              <p></p>
		                  <h4>가스</h4>
		                <p></p>
		                </a>
		              </li>
		             
		            </ul>
		          </div>	
          <div class="col-lg-10 pl-0">
            <div class="tab-content bg-white p-10" style="box-shadow: 0 0 6px rgba(0,0,0,0.2);">
			<!-- 전기탭판 -->
              <div class="tab-pane active show p-5" id="tab-2">
                <h5 class="text-center"><span class="material-icons orange600 mr-1 ">lightbulb</span>
                최근 12개월 평균 사용량 <b>${electAvgMap['ELEC_AMOUNT_AVG'] }</b>(Kwh) , 평균요금 <b><fmt:formatNumber pattern="###,###,###" value="${electAvgMap['ELEC_PRICE_AVG'] }"/></b>원
                
                </h5>
                
			<!-- 	<p class="text-center mb-2"><i data-feather="info"></i>기본구조 : 기본요금 + 전력량요금 &nbsp;&nbsp;|&nbsp;&nbsp;	세금: 부가가치세(10%) + 전력산업기반기금(3.7%) </p> -->
                <p class="text-center apt-text-secandary font-sm-1 mb-2">전기 사용량은 매 달 집계되며, 요금은 관리비에 세대별 전기료 항목으로 부과됩니다.</p>
                <hr><br>
              	<canvas id="ynBarChart" width="100%" height="50"></canvas>
              </div>
              
              <!-- 수도 탭판-->
              <div class="tab-pane p-5" id="tab-1">
                <h5><span class="material-icons blue600 mr-1 md-24" style="vertical-align: center">opacity</span> 수도 사용량은 두 달에 한 번 집계되며, 요금은 두달에 한 번 납부합니다.</h5>
             	<canvas id="myAreaChart" width="100%" height="30"></canvas>
              </div>

			<!-- 가스 탭판 -->
              <div class="tab-pane p-5" id="tab-3">
                <h5> <span class="material-icons red600 mr-2">fireplace</span> 가스 사용량은 두 달에 한 번 집계되며, 요금은 두달에 한 번 납부합니다.</h5>
               <canvas id="myPieChart" width="100%" height="50"></canvas>
              </div>
              
            </div>
          </div>
        </div>

      </div>
    </section><!-- End 탭+차트 Section -->

</div>
<script type="text/javascript">
  feather.replace();

</script>
<!-- 차트스크립트 -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-area-demo.js"></script>
  <%--       <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-bar-demo.js"></script> --%>
        <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-pie-demo.js"></script>

<!-- 이나차트 -->
       <%--  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/yina-bar-chart.js"></script> --%>
<!-- 탭리소스 -->
  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/counterup/counterup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/venobox/venobox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/js/main.js"></script>
<%@ include file="../mainInc/mainBottom.jsp"%>