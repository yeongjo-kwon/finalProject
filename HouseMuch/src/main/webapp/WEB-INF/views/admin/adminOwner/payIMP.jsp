<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var contextPath="/apt";

IMP.init('imp13616963');

//결제 후 이동url
var url="/admin/adminOwner/facilityPayCost.do";

var hp="";
if("${sessionScope.hp1}"!=null){
	hp=["${sessionScope.hp1}", "${sessionScope.hp3}", "${sessionScope.hp3}"].join('-');
}

IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '유지보수 추가 비용 결제',
    amount : '${impVo.payAmount}', //판매 가격
    buyer_email : '${sessionScope.email}',
    buyer_name : '${sessionScope.memberName}',
    buyer_tel : hp,
    buyer_addr : '${impVo.apartVo.address}',
    buyer_postcode : '${impVo.apartVo.zipcodeSeq}'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '추가비용 결제가 완료되었습니다.\r\n';
        
        //납부처리 update
        $.ajax({
        	url:contextPath+"/admin/adminOwner/updateCostMulti.do",
        	type:"post",
        	data:$('form[name=frmUpdatePayList]').serialize(),
        	dataType:'json',
        	async:false,
        	success:function(res){
    			if(Number(res)>0){
    				msg+="결제 처리가 성공적으로 완료되었습니다.\r\n";
    			}else{
    				msg+="죄송합니다. 결제 처리 과정에서 에러가 발생하였습니다!\r\n";
    				msg+="카드 승인번호를 이용하여 문의 부탁드립니다.";
    			}
        	},
			error:function(xhr, status, error){
				alert("error : "+error);
				msg+="죄송합니다. 결제 처리 과정에서 에러가 발생하였습니다!\r\n";
				msg+="카드 승인번호를 이용하여 문의 부탁드립니다.";
			}
        });
    } else {
        var msg = '추가비용 결제에 실패하였습니다.\r\n';
        msg += '에러내용 : ' + rsp.error_msg;
        msg += '\r\n이전 페이지로 이동합니다.';
    }
    
    alert(msg);
    location.href=contextPath+url;
});
</script>
<div class="app-content content ">
	<div class="content-wrapper">
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">유지보수 추가 결제</h2>
					
				</div>
			</div>
		</div>
	</div>
</div>
		
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
		            <c:forEach var="AddCostVO" items="${impVo.addCostList}">
			            <c:if test="${AddCostVO.costNo!=0}">
				            <input type="hidden" name="addCostList[${k}].costNo" value="${AddCostVO.costNo}">
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
<%@ include file="../adminInc/adminBottom.jsp"%>
