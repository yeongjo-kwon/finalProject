<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../user/dashinc/usertop.jsp"%>

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
	<div class="content-wrapper container p-0">
		<!------------ div 시작 ------------>
		<!------------ 첫번째div ------------>
		<div class="row">
			<!------- 타이틀 ------->
			<div class="col-sm-12" id="dash-title">
				<h2 class="content-header-title float-left mb-0">관리비 조회</h2>
				<div class="breadcrumb-wrapper">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="<c:url value='/main/main.do'/>">마이페이지</a></li>
						<li class="breadcrumb-item active">내 관리비</li>
						<li class="breadcrumb-item active">관리비 조회</li>
					</ol>
				</div>
			</div>
		</div>
		<!------------ 두번째div ------------>
		<div class="card">
			<div class="row">
				<div class="btn-group text-center">
					<button type="button" class="btn btn-outline-secondary">2021년
						1월</button>
					<button type="button"
						class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="sr-only">Toggle Dropdown</span>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" href="javascript:void(0);">Option 1</a> <a
							class="dropdown-item" href="javascript:void(0);">Option 2</a> <a
							class="dropdown-item" href="javascript:void(0);">Option 3</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="javascript:void(0);">Separated
							link</a>
					</div>
				</div>
			</div>
			<div class="row">
			
			</div>
		</div>
		<!------------ div 끝 ------------>
	</div>
</div>
<!-- END: Content-->

<%@ include file="../../user/dashinc/userbottom.jsp"%>