<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../user/dashinc/usertop.jsp"%>

<style type="text/css">
div#dash-title {
	margin-bottom: 15px;
}

.section-title h2 {
	font-size: 32px;
	font-weight: bold;
	text-transform: uppercase;
	margin-top: 20px;
	margin-bottom: 20px;
	padding-bottom: 0;
	color: #00000078;
	float: left;
}

#chooseDate{
	margin: 25px 20px 20px 20px;
    width: 140px;
	padding-bottom: 0;
}

.section-label {
	font-size: 1.5em;
}

.dashTb tr td {
	border-bottom: 1px solid lightgray;
}

table.dashTb {
	width: 100%;
}

.btn-flat {
	color: #7DB249;
}

.btn-user {
	border-color: #7DB249;
	background-color: #7DB249;
	color: #FFFFFF !important;
}

p.todayIs {
	font-size: 2.0em;
	text-align: center;
	margin-top: 15px;
}

span.payMonth {
	font-size: 1.5em;
	padding: 0 50px 0 50px;
}

button.btn.btn-flat-danger.waves-effect, .btn-flat {
	padding: 0 0 10px 0;
	font-size: 1.5em;
}

.dashTb tbody tr td a {
	color: #666666;
	text-decoration: none;
    background-color: transparent;
}

button#mngBtn {
    height: 20px;
    width: 50px;
}

input#mngcostClaimdate {
    width: 0;
}

form[name="hiddenFrm"] {
    float: right;
    padding-top: 23px;
}
</style>

<script type="text/javascript">
	/* 내 건의게시글 보기로 이동 */
	function moveToSugg() {
		location.href = "<c:url value='/userDash/suggList.do'/>";
	}

	/* 내 부가시설 보기로 이동 */
	function moveToFacility() {
		location.href = "<c:url value='/living/add/addOrderList.do?householdCode=${memVo.householdCode}'/>";
	}

	/* 내 차량 등록 내역으로 이동 */
	function moveToCar() {
		location.href = "<c:url value='/living/car/carMainList.do'/>";
	}
	
	/* 관리비 납부 페이지로 이동 */
	function moveToPay(){
		location.href = "<c:url value='/userDash/myMngcost/myMngcostPayment.do'/>";
	}
	
	/* 공백 및 '원' 제거 */
	function convPriceToNum(price){
		var num=price.trim().replace(/,/gi, '').replace('원', '');
		return Number(num);
	}
	
	function chooseDate(date){
		//값 세팅
		$('#mngcostClaimdate').val(date);
	}
	
	$(function(){
		/* if($('#mngcostClaimdate').val()==0){
			$('.doughnutDiv').html("<span>조회할 달을 선택하세요.</span>");
		} */
		document.getElementById("myDoughnutChart");
		
		/* 월별 관리비 조회 차트 */
		var labels=[];
		var data=[];
		<c:forEach var="cVo" items="${cList}">
			labels.push('${cVo.YM}');
			data.push(convPriceToNum('${cVo.TPRICE}'));
		</c:forEach>
		
		/* var cArr=${cList};
		$(cArr).each(function(idx,item){
			labels.push(item.YM);
			data.push(convPriceToNum(item.TPRICE));
			alert("item.YM="+item.YM);
		});
		alert("cArr="+cArr); */
		
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
			type:"line",
			data:{
				labels:labels,
				datasets:[{
					label:labels,
					data: data, //실제값
		            backgroundColor:[
			  			'rgba(255, 99, 132, 0.2)'
			  			,'rgba(54, 162, 235, 1)'
			            ,'rgba(255, 206, 86, 1)'
			            ,'rgba(75, 192, 192, 1)'
			            ,'rgba(153, 102, 255, 1)'
			            ,'rgba(255, 159, 64, 1)'
			            ,'rgba(255, 128, 128, 1)'
			            ,'rgba(227, 227, 0, 1)'
			            ,'rgba(200, 191, 231, 1)'
			            ,'rgba(192, 192, 192, 1)'
			  		],
		            fill:true, //line의 안쪽 색을 넣을건지
		            borderColor: 'rgba(255, 99, 132, 1)',
		            borderWidth: 1 //border의 굵기
				}]
			},
			options:{
				scales: {
		            yAxes: [{ //y축과 관련한 옵션
		                ticks: {
		                    beginAtZero: true, //0부터 표기할지
		              		userCallback: function(value, index,values){
		              			return value.toLocaleString(); //천단위 콤마
		              		}
		                },
		                scaleLabel: {
		                    display: true,
		                    labelString:'단위 (원)' //y축 label 설정
		                },
		                stacked:true
		           }]
		      	}
			}
		});
		
	/* 관리비 상세조회 차트 */
	var labels=[];
	var data=[];
	<c:forEach var="mVo" items="${mList}">
		labels.push('${mVo.mngcostContent}');
		data.push('${mVo.mngcostPrice}');
	</c:forEach>
	
	var ctx = document.getElementById("myDoughnutChart").getContext('2d');
	var myDoughnutChart = new Chart(ctx, {
	    type: 'doughnut',
	    data: {
	    	labels: labels,
	  		datasets:[{
		  		data:data,
		  		backgroundColor:[
		  			'rgba(255, 99, 132, 0.2)'
		  			,'rgba(54, 162, 235, 1)'
		            ,'rgba(255, 206, 86, 1)'
		            ,'rgba(75, 192, 192, 1)'
		            ,'rgba(153, 102, 255, 1)'
		            ,'rgba(255, 159, 64, 1)'
		            ,'rgba(255, 128, 128, 1)'
		            ,'rgba(227, 227, 0, 1)'
		            ,'rgba(200, 191, 231, 1)'
		            ,'rgba(192, 192, 192, 1)'
		  		]
		  	}]
		},
		options: {
		    responsive:true,
		    legend:{
		       position:'bottom'
		    }
		}
	});
		
});
	
</script>

<!-- START : Content -->
<div class="app-content content">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>

	<!-- 찐 START -->
	<div class="content-wrapper container p-0">
		<!------------ 첫번째div ------------>
		<div class="content-header row">
			<!------- 타이틀 ------->
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-sm-12" id="dash-title">
					<h2 class="content-header-title float-left mb-0">마이페이지</h2>
				</div>
			</div>
		</div>
		<!-- BODY START -->
		<!------- 입주민 ------->
		<div class="content-body ">
			<!-- SECTION START -->
			<section>

				<!-- 첫번째 DIV START -->
				<div class="row match-height">
					<div class="col-sm-12">
						<div class="card card-congratulations">
							<div class="card-body text-center">
								<img
									src="${pageContext.request.contextPath}/resources/app-assets/images/elements/decore-left.png"
									class="congratulations-img-left" alt="card-img-left" />
								<img
									src="${pageContext.request.contextPath}/resources/app-assets/images/elements/decore-right.png"
									class="congratulations-img-right" alt="card-img-right" />
								<div class="avatar avatar-xl bg-primary shadow">
									<div class="avatar-content">
										<i data-feather="award" class="font-large-1"></i>
									</div>
								</div>
								<div class="text-center">
									<h1 class="mb-1 text-white">반갑습니다. ${memVo.memberName }님!</h1>
									<p class="card-text m-auto w-75">당신의 행복한 주거라이프, 하우스머치가
										함께합니다.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!------------ 두번째div ------------>
				<div class="row match-height">
					<!-------  ------->
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card">
							<div class="card-body">
								<div style="padding-top: 5px;">
									<!-- 관리비 미납/완납 여부에 따라 다른 뷰페이지 보여주기 -->
									<c:set var="total" value="0"/>
									<!-- for문 시작 -->
									<c:forEach var="pVo" items="${pList }">
										<!-- 미납됐을 때 -->
										<c:if test="${pVo.mngcostLimitdate<today and empty pVo.mngcostPaydate }">
											<c:set var="total" value="${total + pVo.mngcostTotalPrice }"/>
										</c:if>
										<%-- <!-- 완납했을 때 -->
										<c:if test="${pVo.mngcostLimitdate>today and !empty pVo.mngcostPaydate }">
											<span>관리비가 모두 납입되었습니다.</span>
										</c:if> --%>
									</c:forEach>
									<!-- for문 끝 -->
									<!-- 미납됐을 때 결과 처리 -->
									<button type="button" class="btn btn-danger">미납</button>
									<span class="payMonth">미납 금액 총 
										<span style="font-weight: bold;">
											<fmt:formatNumber value="${total }" pattern="#,###"/>
										</span>원
									</span>
									<button type="button" class="btn btn-flat-danger"
										onclick="moveToPay()">관리비 납부하기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card">
							<div class="card-body">
								<p class="todayIs">오늘은 ${today }입니다.</p>
							</div>
						</div>
					</div>
				</div>

				<!------------ 세번째div ------------>
				<div class="row match-height">
					<!-- 3-1 -->
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card">
							<div class="card-header">
								<div class="section-title">
									<h2>관리비 내역 차트</h2>
									<select id="chooseDate" onchange="chooseDate(this.value)">
										<!-- 반복 시작 -->
										<option value="">날짜를 선택하세요.</option>
										<c:forEach var="sVo" items="${sList }">
											<option value="${sVo.mngcostClaimdate }">
												<fmt:formatDate value="${sVo.mngcostClaimdate }" pattern="yyyy-MM"/>
											</option>
										</c:forEach>
										<!-- 반복 끝 -->
									</select>
									<!-- hidden용 폼 -->
									<form name="hiddenFrm" action="<c:url value='/userDash/userDashMain.do'/>" method="post">
										<input type="submit" id="mngBtn" value="확인">
										<input type="hidden" id="mngcostClaimdate" name="mngcostClaimdate">
									</form>
								</div>
							</div>
							<div class="card-body">
								<div class="doughnutDiv">
									<canvas id="myDoughnutChart" width="550" height="400"></canvas>
								</div>
							</div>
						</div>
					</div>
					<!-- 3-2 -->
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card">
							<div class="card-header">
								<div class="section-title">
									<h2>관리비 월별 그래프</h2>
								</div>
							</div>
							<div class="card-body">
								<div>
									<canvas id="myChart" width="550" height="400"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!------------ 네번째div ------------>
				<div class="row">
					<!------- 내 건의사항 ------->
					<div class="col-lg-4 col-md-6 col-12">
						<div class="card" id="divList">
							<div class="card-header">
								<h6 class="section-label">내 건의사항</h6>
								<button type="button" class="btn btn-flat"
									onclick="moveToSugg()">더보기
								</button>
							</div>
							<div class="card-body">
								<table summary="최근 건의게시글 5건을 보여주는 표입니다." class="dashTb">
									<!-- 내역 없을 때 -->
									<c:if test="${empty fList }">
										<tr>
											<td colspan="5">내역이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<!-- 내역 있을 때 -->
									<c:if test="${!empty fList }">
										<!-- for문 시작 -->
										<c:forEach var="fMap" items="${fList }">
											<tr>
												<td>
													<img alt="도트 이미지"
														src="<c:url value='/resources/aptUser_images/dot3.JPG'/>">
														&nbsp; <!-- 제목이 긴 경우 일부만 보여주기 --> 
													<c:if test="${fn:length(fMap['SUGG_TITLE'])>=25}">
														<a href="<c:url value='/suggestBoard/suggestBoardDetail.do?suggBoardNo=${fMap["SUGG_BOARD_NO"] }'/>">
															${fn:substring(fMap['SUGG_TITLE'],0,25) } ...
														</a>
													</c:if> 
													<c:if test="${fn:length(fMap['SUGG_TITLE'])<25}">
														<a href="<c:url value='/suggestBoard/suggestBoardDetail.do?suggBoardNo=${fMap["SUGG_BOARD_NO"] }'/>">
															${fMap['SUGG_TITLE'] }
														</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<!--- for문 끝 --->
								</table>
							</div>
						</div>
					</div>
					<!------- 내 부가시설 ------->
	               <div class="col-lg-4 col-md-6 col-12">
	                  <div class="card" id="divList">
	                     <div class="card-header">
	                        <h6 class="section-label">내 부가시설</h6>
	                        <button type="button" class="btn btn-flat"
	                           onclick="moveToFacility()">더보기
	                        </button>
	                     </div>
	                     <div class="card-body">
	                        <table summary="최근 부가시설 내역 5건을 보여주는 표입니다." class="dashTb">
	                           <!-- 내역 없을 때 -->
	                            <c:if test="${empty addList}">
	                              <tr>
	                                 <td colspan="5">이용중인 시설이 없습니다.</td>
	                              </tr>
	                           </c:if>
	                           <!-- 내역 있을 때 -->
	                           <c:if test="${!empty addList}">
	                              <!-- for문 시작 -->
	                              <c:forEach var="addVo" items="${addList}">
	                                 <tr>
	                                    <td><img alt="도트 이미지"
	                                       src="<c:url value='/resources/aptUser_images/dot3.JPG'/>">
	                                       &nbsp;
	                                       <a href="<c:url value='/living/add/addFacilityDetail.do?addNo=${addVo.addNo }'/>">
	                                       ${addVo.addName}
	                                       </a>
	                                    </td>
	                                 </tr>
	                              </c:forEach>
	                           </c:if>
	                           <!--- for문 끝 --->
	                        </table>
	                     </div>
	                  </div>
	                </div>
					<!------- 내 차량내역 ------->
					<div class="col-lg-4 col-md-6 col-12">
						<div class="card" id="divList">
							<div class="card-header">
								<h6 class="section-label">내 차량내역</h6>
								<button type="button" class="btn btn-flat" onclick="moveToCar()">더보기</button>
							</div>
							<div class="card-body">
								<table summary="최근 차량내역 5건을 보여주는 표입니다." class="dashTb">
									<c:import url="/living/car/carMainList.do" />
									<!-- 내역 없을 때 -->
									<%-- <c:if test="">
										<tr>
											<td colspan="5">내역이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<!-- 내역 있을 때 -->
									<c:if test="">
										<!-- for문 시작 -->
										<c:forEach var="" items="">
											<tr>
												<td><img alt="도트 이미지"
													src="<c:url value='/resources/aptUser_images/dot3.JPG'/>">
													&nbsp;</td>
											</tr>
										</c:forEach>
									</c:if> --%>
									<!--- for문 끝 --->
								</table>
							</div>
						</div>
					</div>
					<!------ 내 차량내역 끝  ------>
				</div>
			</section>
			<!-- SECTION END -->
		</div>
		<!-- BODY END -->
	</div>
	<!------------ 찐 DIV 끝 ------------>
</div>
<!-- END: Content-->

<!-- chart.js 차트 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.min.js"></script>
<!-- 대시보드 내 차트 js -->
<%-- <script src="${pageContext.request.contextPath}/resources/userBoard/js/dashBarChart.js"></script>
<script src="${pageContext.request.contextPath}/resources/userBoard/js/dashDChart.js"></script> --%>

<%@ include file="../user/dashinc/userbottom.jsp"%>