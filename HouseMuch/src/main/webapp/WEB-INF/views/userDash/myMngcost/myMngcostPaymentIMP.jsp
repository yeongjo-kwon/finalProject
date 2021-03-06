<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../user/dashinc/usertop.jsp"%>
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
	var url="/userDash/myMngcost/myMngcostPayment.do";
	
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
        				url="/userDash/myMngcost/myMngcostInquiry.do";
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
<style type="text/css">
	table#unpaidTable tbody th,
	table#unpaidTable tbody td {
		border:none;
	}
	
	#divTotalClaimPrice {
		border-top: 3px dotted #dee2e6;
		border-bottom: 3px dotted #dee2e6;
		font-weight: bold;
		font-size: 1.2em;
		padding: 8px 25px;
	}
	
	table#unpaidTable th{
		background:#ffffff;
		border-top: 1px solid #dee2e6;
		border-bottom: 1px solid #dee2e6;
	}
</style>
<!-- START : Content -->
<!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<br>
	<div class="content-wrapper" style="margin-bottom: 200px">
		<div class="content-header row">
	         <div class="content-header-left col-md-9 col-12 mb-2">
	           <div class="row breadcrumbs-top">
	             <div class="col-12">
	               <h2 class="content-header-title float-left mb-0">결제페이지</h2>
	               <div class="breadcrumb-wrapper">
	                 <ol class="breadcrumb">
	                   <li class="breadcrumb-item">
	                   	<a href="<c:url value='/userDash/userDashMain.do'/>">Home</a>
	                   </li>
	                   <li class="breadcrumb-item">관리비 관리</li>
	                   <li class="breadcrumb-item active">
	                   	<a href="<c:url value='/userDash/myMngcost/myMngcostInquiry.do'/>">관리비 납부</a>
	                   </li>
	                   <li class="breadcrumb-item active"><b>결제 페이지</b></li>
	                 </ol>
	               </div>
	             </div>
	           </div>
	         </div>
		</div>
	</div>
	<br>
	<table class="col-12">
		<tr class="text-center">
			<td>
				<p style="font-size:2em">결제 페이지로 이동합니다.</p>
				<br><br>
				<div class="spinner-border text-primary" role="status" style="font-size:2em">
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
	<br>
</div>
<!-- END: Content-->
<div class="clearfix"></div>

<%@ include file="../../user/dashinc/userbottom.jsp"%>