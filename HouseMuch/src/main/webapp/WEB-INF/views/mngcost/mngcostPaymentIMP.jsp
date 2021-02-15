<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	IMP.init('imp37624259');
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:',
	    amount : 14000, //판매 가격
	    buyer_email : ,
	    buyer_name : ,
	    buyer_tel : ,
	    buyer_addr : ,
	    buyer_postcode : 
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
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
	
	<!-- END: 대시보드 박스 -->
</div>
</section>
<div class="clearfix"></div>
<section></section>
<!-- ======= End About Section ======= -->
<%@ include file="../mainInc/mainBottom.jsp" %>