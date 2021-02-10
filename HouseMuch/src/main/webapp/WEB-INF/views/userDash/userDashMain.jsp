<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../user/dashinc/usertop.jsp"%>

<style type="text/css">
div#dash-title {
	margin-bottom: 15px;
}

.section-title {
	text-align: center;
	padding-bottom: 20px;
}

.section-title h2 {
	font-size: 32px;
	font-weight: bold;
	text-transform: uppercase;
	margin-top: 30px;
	padding-bottom: 0;
	color: #00000078;
}

div#divList {
	padding: 20px;
}

.section-label {
	font-size: 1.5em;
}
</style>

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
									class="congratulations-img-left" alt="card-img-left" /> <img
									src="${pageContext.request.contextPath}/resources/app-assets/images/elements/decore-right.png"
									class="congratulations-img-right" alt="card-img-right" />
								<div class="avatar avatar-xl bg-primary shadow">
									<div class="avatar-content">
										<i data-feather="award" class="font-large-1"></i>
									</div>
								</div>
								<div class="text-center">
									<h1 class="mb-1 text-white">반갑습니다. ${memVo.memberName }님!</h1>
									<p class="card-text m-auto w-75">당신의 행복한 주거라이프, 하우스머치가 함께합니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!------------ 두번째div ------------>
				<div class="row match-height">
					<!-------  ------->
					<div class="col-12 col-md-6 col-lg-6">
						<!-- 미납됐을 때 -->
						<div class="card">
							<div class="card-body">
								<div class=" col-sm-">
									<button type="button" class="btn btn-danger">미납</button>
								</div>
								<div class=" col-sm-4">
									<!-- 구현해야함 -->
									1월 관리비 100,000원
								</div>
								<div class=" col-sm-4">
									<!-- 구현해야함 -->
									<button type="button" class="btn btn-flat-danger">관리비
										납부하기</button>
								</div>
							</div>
							<!-- 완납했을 때 -->
							<!-- <div class="card col-sm-12">
							<div>
								<button type="button" class="btn btn-success">완납</button>
							</div>
							<div>
								구현해야함
								1월 관리비 100,000원
							</div>
							<div>
								구현해야함
								<button type="button" class="btn btn-flat-success">관리비
									납부 완료</button>
							</div>
						<	/div> -->
						</div>
					</div>
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card">
							<div class="card-body">오늘은 2021년 1월 24일 일요일입니다.</div>
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
								<div id="donut-chart"></div>
								<ul class="list-inline mb-0 mt-2 text-center">
									<li class="list-inline-item"><span class="cursor-pointer">
											<span class="bullet align-middle bullet-sm"
											style="background-color: #ffe700">&nbsp;</span> <span
											class="align-middle cursor-pointer">Operational</span>
									</span></li>
									<li class="list-inline-item"><span class="cursor-pointer">
											<span class="bullet align-middle bullet-sm"
											style="background-color: #ffa1a1">&nbsp;</span> <span
											class="align-middle cursor-pointer">Networking</span>
									</span></li>
									<li class="list-inline-item"><span class="cursor-pointer">
											<span class="bullet bullet-primary align-middle bullet-sm">&nbsp;</span>
											<span class="align-middle cursor-pointer">Hiring</span>
									</span></li>
									<li class="list-inline-item"><span class="cursor-pointer">
											<span class="bullet align-middle bullet-sm"
											style="background-color: #00d4bd">&nbsp;</span> <span
											class="align-middle cursor-pointer">R&D</span>
									</span></li>
								</ul>
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
								<div id="line-chart"></div>
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
							</div>
							<div class="card-body">
								<div class="mt-1">
									<!-- 테이블 시작 -->
									<!-- 내역 없을 때 -->
									<div>
										<table>
											<tr>
												<td colspan="5">내역이 존재하지 않습니다.</td>
											</tr>
										</table>
									</div>
									<!-- 내역 있을 때 -->
									<!--- 테이블 끝 --->
								</div>
							</div>
						</div>
					</div>
					<!------- 내 부가시설 ------->
					<div class="col-lg-4 col-md-6 col-12">
						<div class="card" id="divList">
							<div class="card-header">
								<h6 class="section-label">내 부가시설</h6>
							</div>
							<div class="card-body">
								<div class="mt-1">
									<!-- 테이블 시작 -->
									<!-- 내역 없을 때 -->
									<div>
										<table>
											<tr>
												<td colspan="5">내역이 존재하지 않습니다.</td>
											</tr>
										</table>
									</div>
									<!-- 내역 있을 때 -->
									<!--- 테이블 끝 --->
								</div>
							</div>
						</div>
					</div>
					<!------- 내 차량내역 ------->
					<div class="col-lg-4 col-md-6 col-12">
						<div class="card" id="divList">
							<div class="card-header">
								<h6 class="section-label">내 차량내역</h6>
							</div>
							<div class="card-body">
								<div class="mt-1">
									<!-- 테이블 시작 -->
									<!-- 내역 없을 때 -->
									<div>
										<table>
											<tr>
												<td colspan="5">내역이 존재하지 않습니다.</td>
											</tr>
										</table>
									</div>
									<!-- 내역 있을 때 -->
									<!--- 테이블 끝 --->
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- SECTION END -->
		</div>
		<!------ 내 차량내역 끝  ------>
		<!-- BODY END -->

	</div>
	<!------------ div 끝 ------------>
</div>
<!-- END: Content-->

<%@ include file="../user/dashinc/userbottom.jsp"%>