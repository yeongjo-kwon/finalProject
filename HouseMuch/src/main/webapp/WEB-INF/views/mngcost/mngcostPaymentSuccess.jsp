<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

</script>
<!-- ======= Start About Section ======= -->
<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs" style="margin-top:80px">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>관리비 납부</h2>
				<ol>
					<li><a href="<c:url value='/main/index.do'/>">Home</a></li>
					<li>관리비 납부</li>
					<li>결제페이지</li>
				</ol>
			</div>
		</div>
	</section><!-- End Breadcrumbs -->
	<%--
	<section class="inner-page">
	<div class="container">
	<p></p>
	</div>
	</section>
	--%>
</main><!-- End #main -->

<section id="about">
<div class="container">
	<!-- START : 대시보드 박스 -->
	<div class="text-center">
	<table style="background:silver">
		<tr>
			<td>
				<h1>결제 완료 !</h1>

			</td>
		</tr>
	</table>
	</div>
	<!-- END: 대시보드 박스 -->
</div>
</section>
<div class="clearfix"></div>
<section></section>
<!-- ======= End About Section ======= -->
<%@ include file="../mainInc/mainBottom.jsp" %>