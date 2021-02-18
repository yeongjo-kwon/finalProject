<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../user/dashinc/usertop.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

//처음 로딩 시 전기차트 불러오기
var data =${dataList};
var labels =${labelList};//따옴표없어서 에러남 -> 자바에서 붙여서 보냄 -> 에러안남
console.log("dataList"+data);//그대로들어옴
console.log("labelList"+labels);

/*
 * 차트만들 때 넣을 변수
   1.요소id  / 2.데이터배열  / 3.라벨배열
 */
var elementId;//document.getElementById("houseElectChart");
var dataArr =[];
var labelArr =[];
$(function(){

	//처음로딩시 전기차트탭
	elementId = document.getElementById("houseElectChart");
	houseElectChart(elementId,data,labels);

	//탭클릭하면 공과금 분류번호 읽어서 ajax태우기
	$('.fulltab-item a').on('click',function(){
		var ctgId = $(this).attr('id');
		console.log("ctgId는  "+ctgId);
		
		var uCtgNo = ctgId.slice(-1);
		console.log("uCtgNo는  "+uCtgNo);
		
		var householdCode = '${sessionScope.memVo.householdCode}';
		console.log("householdCode는  "+householdCode);

		
	
		$.ajax({
			url:"<c:url value='/energy/utilCostChart.do'/>",
			async: false,
			type:"post",
			data:{
					uCtgNo:uCtgNo,
					householdCode:householdCode,
			},
			dataType:"json",
			success:function(res){
				
				console.log(res);
				dataArr = new Array();
				labelArr = new Array();

				//length = 7
				var avgValues =  res.pop();//맨마지막 요소 뽑아서 리턴하고 그 요소는 사라짐
				
				//length = 6
				for(var i=0;i<res.length;i++){
					dataArr.push(res[i].U_COST_AMOUNT);
					labelArr.push(res[i].U_COST_USEDATE);
				}
				
				var avgPrice = avgValues.PRICE_AVG;//평균 요금 값 뽑았다 슈발탱 ㅜㅜ
				var avgUse = avgValues.AMOUNT_AVG;//평균 사용량 
				console.log("avgValues => "+avgValues);
				console.log("평균요금 => "+avgPrice);
				console.log("평균사용량 => "+ avgUse);
				console.log("분류번호 => "+ uCtgNo);

				console.log("데이터배열 => "+ dataArr);
				console.log("라벨배열 => "+ labelArr);
				
				if(uCtgNo==3){
					elementId = document.getElementById("houseElectChart");
					houseElectChart(elementId,dataArr,labelArr);	//수도 차트 만들기	
				}
				else if(uCtgNo==2){//수도
					elementId = document.getElementById("houseWaterChart");
					houseWaterChart(elementId,dataArr,labelArr);	//수도 차트 만들기	
				}
				else if(uCtgNo==1){
					elementId = document.getElementById("houseGasChart");
					houseGasChart(elementId,dataArr,labelArr);	//가스 차트 만들기	
				}
				
				
				//평균사용량, 평균요금 set
				/* document.writeln(navigator.language);
				avgUse.toLocaleString('ko-KR');
				avgPrice.toLocaleString('ko-KR'); */
				
				var tabId = "#util-tab"+uCtgNo;
				var avgUseId = "#avgUse"+uCtgNo;
				var avgPriceId = "#avgPrice"+uCtgNo;
				
				$(avgUseId).text(avgUse.toLocaleString('ko-KR'));
				$(avgPriceId).text(avgPrice.toLocaleString());
			},
			error:function(xhr,status,error){
				alert("ajaxChart에러:"+error);
			}

			
		});//ajax
	});//click

});//


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
	width:100%;
    color: #5c9f24;
    border-color: transparent;
   border-bottom-color: #5c9f24; 
}


/* 눌린 후 대기중 */
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
width:100%;
    color: #5c9f24;
     background-color:#fff;
    border-color: #e0e0e0;
   border-bottom: 3px solid #5c9f24;
    box-shadow: 0 0 6px rgba(0,0,0,0.2);
}


.nav-tabs-line .nav-link {

    padding: .715rem 1.429rem;
    border-bottom: 3px solid #5c9f24;
}
.nav-tabs .nav-link {
    border: 1px solid #ddd;
    background-color:rgba(230,230,230,0.5);
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
    display: block;
    padding: .715rem 1.429rem;
}

.fulltab-item{
	width:33.333333%;
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


.ynbread{
	display: flex;
    flex-wrap: wrap;
    padding: 0.75rem 1rem;
    margin-bottom: 1rem;
    list-style: none;
 
    border-radius: 0.25rem;
}
</style>

<!-- 여기부터 -->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container p-0">


		<!-- Table head options start -->
		<div class="content-header row mt-5">
			<!-- 첫번째 div -->
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">
<b><span id="dongho" class="apt-text-dark">${DongHo}</span> <span class="text-secondary">공과금 조회</span></b>
</h2>
					<div class="breadcrumb-wrapper bg-none">
						<ol class="ynbread">
							<li class="breadcrumb-item"><a class="apt-text-primary"
								href="<c:url value='/userDash/userDashMain.do'/>">마이페이지</a></li>
							<li class="breadcrumb-item"><a class="apt-text-primary"
								href="<c:url value='/userDash/boardList.do'/>"> 공과금 조회</a></li>
							<li class="breadcrumb-item active">${DongHo} 공과금 조회</li>
						</ol>
					</div>
				</div>
			</div>
		</div>


		<div class="row" id="table-head">


      <!-- ======= 탭+차트 Section ======= -->
    <section id="departments" style="margin: 0 auto;" >
      <div class="container p-0" data-aos="fade-up">
      
			
			<br>

    <div class="row container conter-block"  style="min-width: 1200px;">		
                <!-- 탭제목 시작 -->
                <div class="example-wrap">
                  <div class="nav-tabs-vertical w-100" data-plugin="tabs" style="min-width: 1200px;">
                    <ul class="row nav nav-tabs nav-tabs-line mr-25" role="tablist"  style="width:100%">
                      <li class="nav-item fulltab-item" role="presentation"><a class="nav-link active" data-toggle="tab" href="#exampleTabsLineLeftOne"
                          aria-controls="exampleTabsLineLeftOne" role="tab" id="util3">전기</a></li>
                      
                      <li class="nav-item fulltab-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineLeftTwo"
                          aria-controls="exampleTabsLineLeftTwo" role="tab" id="util2">수도</a></li>
                      
                      <li class="nav-item fulltab-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineLeftThree"
                          aria-controls="exampleTabsLineLeftThree" role="tab" id="util1">가스</a></li>
                    </ul>
                   
                    
                    
					  <!-- 여기부터 차트 -->                  
					 <div class="row tab-content w-100">
                    
                    	<!-- 전기차트탭 -->
                      <div class="tab-pane active" id="exampleTabsLineLeftOne" role="tabpanel">
	                       
	                    <!-- 평균 -->
	                    <div class="row card m-0 auto w-100 mb-5" style="min-width:1080px;text-align:center">
		                       	<div class="card-body" style="width: 100%;text-align:center">
			                        <h5 class="d-block text-center" >
			                        	<i data-feather="zap" class="material-icons orange600"></i> 
			               					최근 12개월기준  평균 사용량 <b>${electAvgMap['ELEC_AMOUNT_AVG'] }</b>(Kwh) , 평균요금 <b>
					                		<fmt:formatNumber pattern="###,###,###" value="${electAvgMap['ELEC_PRICE_AVG'] }"/></b>원
			             			</h5>
					                <p class="text-center apt-text-secandary font-sm-1 mb-2">전기 사용량은 매 달 집계되며, 요금은 관리비에 세대별 전기료 항목으로 부과됩니다.</p>
					                
					                
		                       	</div>
		               </div>
						<!-- 전기평균 끝 -->                    
	                       
			              	
		              	<div class="row m-0 auto w-100" style="min-width: 1080px;">
		              		<canvas id="houseElectChart" width="100%" height="50"></canvas>
		              	</div>
                      </div>
                      
                      <!-- 수도차트 탭 -->
                      <div class="tab-pane row" id="exampleTabsLineLeftTwo" role="tabpanel" id="util-tab2">
	                       
	                       <div class="row card m-0 auto w-100 mb-5" style="min-width:1080px;text-align:center">
	                       	<div class="card-body" style="width: 100%;text-align:center">
				                <h5 class="text-center"><span class="material-icons blue600 mr-1 md-24" style="vertical-align: center">opacity</span> 
		               			최근 12개월기준  평균 사용량 <b><span id="avgUse2"></span></b>(L) , 평균요금 <b><span id="avgPrice2"></span></b>원
		               			</h5>
		               			<p class="text-center apt-text-secandary font-sm-1 mb-2">
								수도 사용량은 두 달에 한 번 집계되며, 요금은 두달에 한 번 납부합니다.</p>
				              
               	             </div>
	                       </div>
	  						
		              	 <div class="row m-0 auto w-100">
                        	<canvas id="houseWaterChart" width="100%" height="30"></canvas>
                     	 </div>
                      </div>
                      
                      <!-- 가스차트 탭 -->
                      <div class="tab-pane row" id="exampleTabsLineLeftThree" role="tabpanel" id="util-tab1" style="min-width: 1200px;">
                        <div class="row card m-0 auto w-100 mb-5" style="min-width:1080px;text-align:center">
	                       	<div class="card-body" style="width: 100%;text-align:center;">
				                <h5 class="text-center"><span class="material-icons red600 mr-2">fireplace</span> 
		               			최근 12개월기준  평균 사용량   <b><span id="avgUse1"></span></b>(MJ), 평균요금 <b><span id="avgPrice1"></span></b> (원)
		               			</h5>
								 <p class="text-center apt-text-secandary font-sm-1 mb-2">
								가스 사용량은 두 달에 한 번 집계되며, 요금은 두달에 한 번 납부합니다.</p>
			               
	                    </div>
                       </div>
                       
                       <div class="row m-0 auto w-100" style="min-width: 1080px;">
                        <canvas id="houseGasChart" width="100%" height="30" style="min-width: 960px;"></canvas>
                        </div>
                      </div>
                      
                 
                   
				 </div><!-- 여기까치 차트탭 -->
                </div>
            </div>
          </div><!-- 탭div끝 -->
          </div>
         
        
        <!-- End Panel Tabs -->
        
        
    </section><!-- End 탭+차트 Section -->
        
        </div>
					<!-- 페이저-->
					<!-- Table head options end -->
				</div>
				<!-- content-wrapper -->
			</div>
			<!-- content-wrapper -->
		</div>
		<!-- content-wrapper -->
	</div>
	<!-- content-wrapper -->
</div>
<!-- app-content content -->
        
        
        
        
        
        

<script type="text/javascript">
  feather.replace();

</script>
<!-- 차트스크립트 -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
      <%--   <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-area-demo.js"></script> --%>
  

<!-- 이나차트 -->
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/yina-chart.js"></script>

<!-- 탭리소스 -->
  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/jquery.easing/jquery.easing.min.js"></script>

  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/assets/vendor/waypoints/jquery.waypoints.min.js"></script>


  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/venobox/venobox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/js/main.js"></script>

<%@ include file="../user/dashinc/userbottom.jsp"%>