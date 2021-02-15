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

button.btn.btn-flat-danger.waves-effect {
	padding: 0 0 10px 0;
	font-size: 1.5em;
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
		location.href = "<c:url value=''/>";
	}
	
	/* 관리비 납부 페이지로 이동 */
	function moveToPay(){
		location.href = "<c:url value='/mngcost/mngcostPayment.do'/>";
	}
	
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
									<!-- 미납됐을 때 -->
									<button type="button" class="btn btn-danger">미납</button>
									<!-- 구현해야함 -->
									<span class="payMonth">${month }월 관리비 100,000원</span>
									<!-- 구현해야함 -->
									<button type="button" class="btn btn-flat-danger"
										onclick="moveToPay()">관리비 납부하기</button>
	
									<!-- 완납했을 때 -->
									<!-- <div class=" col-sm-4 paid1" style="width: 200px;">
										<button type="button" class="btn btn-user">완납</button>
									</div>
									<div class=" col-sm-4 paid2">${month }월 관리비 100,000원</div>
									<div class=" col-sm-4 paid3">
										구현해야함
										<button type="button" class="btn btn-flat">관리비
											납부 완료</button>
									</div> -->
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
									<h2>이번 달 관리비</h2>
								</div>
							</div>
							<div class="card-body">
								<div>
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
														${fn:substring(fMap['SUGG_TITLE'],0,25) } ...
													</c:if> <c:if test="${fn:length(fMap['SUGG_TITLE'])<25}">
														${fMap['SUGG_TITLE'] }
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
									<%-- <c:if test="${}">
										<tr>
											<td colspan="5">내역이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<!-- 내역 있을 때 -->
									<c:if test="${}">
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
					<!------- 내 차량내역 ------->
					<div class="col-lg-4 col-md-6 col-12">
						<div class="card" id="divList">
							<div class="card-header">
								<h6 class="section-label">내 차량내역</h6>
								<button type="button" class="btn btn-flat" onclick="moveToCar()">더보기</button>
							</div>
							<div class="card-body">
								<table summary="최근 차량내역 5건을 보여주는 표입니다." class="dashTb">
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
<script src="${pageContext.request.contextPath}/resources/userBoard/js/dashBarChart.js"></script>
<script src="${pageContext.request.contextPath}/resources/userBoard/js/dashDChart.js"></script>

<%@ include file="../user/dashinc/userbottom.jsp"%>