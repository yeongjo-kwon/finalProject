<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var contextPath="/apt";
	
	IMP.init('imp37624259');
	
	var hp="";
	if("${sessionScope.hp1}"!=null){
		hp=["${sessionScope.hp1}", "${sessionScope.hp3}", "${sessionScope.hp3}"].join('-');
	}
	
	//결제 후 이동url
	var url="/mngcost/mngcostPayment.do";
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명: ${impVo.payName}',
	    amount : '${impVo.payAmount}', //판매 가격
	    buyer_email : '${sessionScope.email}',
	    buyer_name : '${sessionScope.memberName}',
	    buyer_tel : hp,
	    buyer_addr : '${impVo.apartVo.address}',
	    buyer_postcode : '${impVo.apartVo.zipcodeSeq}'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '관리비 결제가 완료되었습니다.\r\n';
	        msg += '고유ID : ' + rsp.imp_uid +"\r\n";
	        msg += '납입처 ID : ' + rsp.merchant_uid +"\r\n";
	        msg += '결제 금액 : ' + rsp.paid_amount +"\r\n";
	        msg += '카드 승인번호 : ' + rsp.apply_num +"\r\n";
	        
	        //납부처리 update
	        $.ajax({
	        	url:contextPath+"/mngcost/updatePaymentListMulti.do",
	        	type:"post",
	        	data:$('form[name=frmUpdatePayList]').serialize(),
	        	dataType:'json',
	        	async:false,
	        	success:function(res){
        			if(Number(res)>0){
        				msg+="납부처리가 성공적으로 완료되었습니다.\r\n";
        				url="/mngcost/mngcostInquiry.do";
        			}else{
        				msg+="죄송합니다. 납부처리 과정에서 에러가 발생하였습니다!\r\n";
        				msg+="카드 승인번호를 이용하여 문의 부탁드립니다.";
        			}
	        	},
				error:function(xhr, status, error){
					alert("error : "+error);
					msg+="죄송합니다. 납부처리 과정에서 에러가 발생하였습니다!\r\n";
					msg+="카드 승인번호를 이용하여 문의 부탁드립니다.";
				}
	        });
	    } else {
	        var msg = '관리비 결제에 실패하였습니다.\r\n';
	        msg += '에러내용 : ' + rsp.error_msg;
	        msg += '\r\n미납 내역 페이지로 이동합니다.';
	    }
	    
	    alert(msg);
	    location.href=contextPath+url;
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
					<li>결제페이지</li>
				</ol>
			</div>
		</div>
	</section><!-- End Breadcrumbs -->
</main><!-- End #main -->

<section id="about">
<div class="container">
	<!-- START : 대시보드 박스 -->
	<table class="col-12">
		<tr class="text-center">
			<td>
				<p>결제 페이지로 이동합니다.</p>
				<div class="spinner-border text-primary" role="status">
	              <span class="sr-only">Loading...</span>
	            </div>
	            <form action="#" name="frmUpdatePayList" method="post">
		            <!-- 0, NULL값 들어있는 값 제외 -->
		            <c:set var="k" value="0"/>
		            <c:forEach var="mngcostPaymentListVo" items="${impVo.mngcostPaymentListList}">
			            <c:if test="${mngcostPaymentListVo.mngcostListNo!=0}">
				            <input type="hidden" name="mngcostPaymentListList[${k}].mngcostListNo"
				            	value="${mngcostPaymentListVo.mngcostListNo}">
				            <input type="hidden" name="mngcostPaymentListList[${k}].mngcostTotalPrice"
				            	value="${mngcostPaymentListVo.mngcostTotalPrice}">
			            	<c:set var="k" value="${k+1}"/>
			            </c:if>
		            </c:forEach>
	            </form>
			</td>
		</tr>
	</table>
	<!-- END: 대시보드 박스 -->
</div>
</section>
<div class="clearfix"></div>
<section></section>
<!-- ======= End About Section ======= -->
<%@ include file="../mainInc/mainBottom.jsp" %>