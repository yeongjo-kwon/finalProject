<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../mainInc/mainTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">
    

<!-- ======= Start About Section ======= -->
<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs" style="margin-top:80px">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>차량 관리</h2>
				<ol>
					<li><a href="<c:url value='/main/index.do'/>">Home</a></li>
					<li>차량 관리</li>
				</ol>
			</div>
		</div>
	</section>
</main><!-- End #main -->

<section id="about">
<div class="container">
	<!-- START : 대시보드 박스 -->
	<input type="hidden" id="mngcostClaimdate">
    
	<div class="app-content content"><!-- 바꾸면 안됨 -->
	   	<div class="card-title">
	    	<h4 class="card-title"><i data-feather='list'></i>차량 등록</h4>
	    </div>
	    <br>
	    
	   	<div class="col-md-12 float-left" style="background-color:#ffffff;padding:0; margin-right:20px;margin-bottom:50px; box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
	      	<div class="card-body">
	        	<p class="card-text">
	          		우리 세대 차량 등록<br>
	          		<small>우리 세대의 차량과 세대를 방문할 차량을 등록 할 수 있습니다.</small>
	        	</p>
	      	</div>
	    	<table class="table table-hover" style="margin-bottom:0;">
	    		
			</table>
		</div>
		<br>
		
	    <div class="card-body">
        	<h4 class="card-title float-left">차량 조회</h4>
      	</div>
      	
		<div class="col-md-12 float-left" style="background-color:#ffffff; padding:0;
				margin-right:20px;box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
		    <table class="table table-striped" id="mngcostInfoTable" style="margin-bottom:0;">
			    <colgroup>
					<col style="width:5%;" />
					<col style="width:23%;min-width:20px;" />
					<col style="width:30%;" />
					<col style="width:10%;min-width:20px;" />
					<col style="width:10%;min-width:30px;" />
				</colgroup>
			    <thead>
			       	<tr>
				        <th scope="col">NO</th>
				        <th scope="col">차량 번호</th>
				        <th scope="col">비고</th>
				        <th scope="col">신청일자</th>
				        <th scope="col">방문 차량 여부</th>
			       	</tr>
			    </thead>
			    <tbody>
			    	<!-- 조회결과가 올 자리 -->
			    </tbody>
			</table>
		</div>
	</div>
<!-- END: 대시보드 박스 -->
</div>
</section>

    
<div class="clearfix"></div>
<section></section>
<!-- ======= End About Section ======= -->

<%@ include file="../../mainInc/mainTop.jsp" %>