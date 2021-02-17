<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript">
	/*차트에 넣을 값 변환 (한희님 용)
	function convPriceToNum(price){
		var num=price.trim().replace(/,/gi, '').replace('원', '');
		return Number(num);
	}*/
	$(function(){
		var d=new Date();
		$('#currDate').html(formatDate(d));
	
		var cnt=0;
		$('#unpaidTable tbody #chkMngcostListNo').each(function(){
			//연체 정보 담을 div 변수 처리
			var plusInfoEl=$(this).parent().parent().find('#plusAddInfo');
			//연체 여부
			//현재 년월일
			var currYMD=formatYMD(d);
			
			//납부기한 년월일
			var limitYMD=$(this).next().next().val().split(' ')[0];
			//비교 년월일
			var d1=new Date(limitYMD); 
			d1.setMonth(d1.getMonth()+1);
			var oneYMD=formatYMD(d1); //1달 연체
			
			var d2=new Date(limitYMD); 
			d2.setMonth(d2.getMonth()+2);
			var twoYMD=formatYMD(d2); //2달 연체
			
			var d3=new Date(limitYMD); 
			d3.setMonth(d3.getMonth()+3);
			var threeYMD=formatYMD(d3); //3달 연체
			
			var d4=new Date(limitYMD); 
			d4.setMonth(d4.getMonth()+12);
			var yearYMD=formatYMD(d4); //1년 연체
			
			//연체일과 비교
			var addPrice=0;
			var payPrice=Number($(this).next().val());
			if(yearYMD < currYMD){
				addPrice=Math.ceil(payPrice*0.194/10)*10;
				$(this).next().val(payPrice+addPrice);
				plusInfoEl.html("1년 연체 : "+numFormat(payPrice+addPrice)+"(+19.4%)");
			}else if(threeYMD < currYMD){
				addPrice=Math.ceil(payPrice*0.05/10)*10;
				$(this).next().val(payPrice+addPrice);
				plusInfoEl.html("3달 연체 : "+numFormat(payPrice+addPrice)+"(+5%)");
			}else if(twoYMD < currYMD){
				addPrice=Math.ceil(payPrice*0.035/10)*10;
				$(this).next().val(payPrice+addPrice);
				plusInfoEl.html("2달 연체 : "+numFormat(payPrice+addPrice)+"(+3.5%)");
			}else if(oneYMD < currYMD || limitYMD < currYMD){
				addPrice=Math.ceil(payPrice*0.02/10)*10;
				$(this).next().val(payPrice+addPrice);
				plusInfoEl.html("1달 연체 : "+numFormat(payPrice+addPrice)+"(+2%)");
			}		
			
			if($(this).val()=="${param.mngcostListNo}"){
				$(this).prop("checked", true);
				cnt++;
			}
		});
		
		if(cnt==0) {
			var checkEl=$('#unpaidTable thead input[type=checkbox]')
			checkEl.prop("checked", true);
			checkAll(checkEl);
		}
		
		getTCPrice();
		
		//체크박스 전체 선택/해제
		$('#unpaidTable thead input[type=checkbox]').change(function(){
			checkAll($(this));
		});
		
		//체크 변경 될 시
		$('#unpaidTable input[type=checkbox]').change(function(){
			getTCPrice();
		});
		
		$('#unpaidTable #listTableRow').click(function(){
			bool=$(this).find('th input[type=checkbox]').prop("checked");
			$(this).find('th input[type=checkbox]').prop("checked", !bool);
			getTCPrice();
		});
		
		$('#submitPayIMP').click(function(){
			var chkCount=0;
			var payName="";
			$('#unpaidTable tbody #chkMngcostListNo:checked').each(function(){
				chkCount++;
			});
			
			if(chkCount<=0){
				alert("납부할 내역이 선택되지 않았습니다. 내역을 선택해주세요.");
				return false;
			}else if(chkCount>1){
				payName=$('#unpaidTable tbody input[type=checkbox]:checked').next().next().next().val().split(' ')[0]+" 청구분";
				payName+=" 외 "+(chkCount-1)+"건";
			}else{
				payName=$('#unpaidTable tbody input[type=checkbox]:checked').next().next().next().val().split(' ')[0]+" 청구분";
			}
			
			$('#payName').val(payName);
			
			$('form[name=frmPayIMP]').submit();
		});
	});
	
	function checkAll(checkEl){
		var bool=checkEl.is(":checked");
		$('#unpaidTable').find('input[type="checkbox"]').each(function(){
			$(this).prop("checked", bool);
		});
	}
	
	function getTCPrice(){
		var tCPrice=0;
		$('#unpaidTable tbody #chkMngcostListNo:checked').each(function(){
			tCPrice+=Number($(this).next().val());
		});
		
		$('#spanTotalClaimPrice').html(numFormat(tCPrice));
		$('#payAmount').val(tCPrice);
	}
	
	//날짜 포맷
	function formatYMD(date) {
	    var d=date,
	        year = d.getFullYear(),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate();
	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;
	    
	    return [year, month, day].join('-');
	};
	
	//날짜+시간 포맷
	function formatDate(date) {
	    var d=date,
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear(),
	    	hour = '' + d.getHours(),
	    	minute = '' + d.getMinutes(),
	    	second = '' + d.getSeconds();
	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;
	    if (hour.length < 2) hour = '0' + hour;
	    if (minute.length < 2) minute = '0' + minute;
	    if (second.length < 2) second = '0' + second;
		
	    return [year, month, day].join('-')+" "+[hour, minute, second].join(':');
	};
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
</style>
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
</main><!-- End #main -->

<section id="about">
<div class="container">
	<!-- START : 대시보드 박스 -->
	<div class="app-content content"><!-- 바꾸면 안됨 -->
	   	<div class="card-title">
	    	<h4 class="card-title"><i data-feather='list'></i>미납 내역</h4>
	    </div>
	    <br>
	    <form action="<c:url value='/mngcost/mngcostPaymentIMP.do'/>" method="post" name="frmPayIMP">
		   	<div class="col-md-6 col-lg-5" style="background-color:#ffffff;padding:0; margin:auto; box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
		      	<div class="card-body">
		      		<div class="text-center">
		      			<img alt="하우스머치 로고" style="width:50%;margin: 10% 0;"
		      				src='${pageContext.request.contextPath}/resources/aptUser_images/housemuch_logo.png'>
	      			</div>
		        	<p class="card-text">
		        		아파트명 : ${apartVo.aptName}<br>
		        		주 &nbsp; &nbsp; &nbsp; &nbsp;소 : ${apartVo.address}<br>
		        		<br>
		          		청구월 별로 관리비  미납내역을 확인하실 수 있습니다.<br><br>
		        	</p>
		        	<input type="hidden" name="apartVo.address" value="${apartVo.address}">
		        	<input type="hidden" name="apartVo.zipcodeSeq" value="${apartVo.zipcodeSeq}">
		          	<div class="text-right">조회시간 : <span id="currDate" style="font-size:0.9em"></span></div>
		      	</div>
		    	<table class="table table-hover text-center" id="unpaidTable" style="margin-bottom:0;">
		    		<colgroup>
						<col style="width:8%;" />
						<col style="width:22%;min-width:130px;" />
						<col style="width:30%;min-width:130px;" />
						<col style="width:40%;" />
					</colgroup>
		        	<thead>
		          		<tr>
				            <th scope="col"><input type="checkbox"></th>
				            <th scope="col">기한</th>
				            <th scope="col">청구</th>
				            <th scope="col" class="text-right">금액&nbsp; &nbsp;</th>
		          		</tr>
		        	</thead>
			        <tbody>
			        	<c:if test="${empty mngcostPayList}">
			        		<tr>
			        			<th scope="row"></th>
			        			<td colspan="4">내역이 존재하지 않습니다.</td>
			        		</tr>
			        	</c:if>
			        	<c:if test="${!empty mngcostPayList}">
			        		<c:set var="k" value="0"/>
				        	<c:forEach var="mngcostPayListVo" items="${mngcostPayList}">
					        	<tr style="cursor:pointer;" id="listTableRow">
						            <th scope="row" class="text-center">
						            	<input type="checkbox" name="mngcostPaymentListList[${k}].mngcostListNo"
						            		value="${mngcostPayListVo.mngcostListNo}" id="chkMngcostListNo" hidden="hidden">
						            	<input type="checkbox" name="mngcostPaymentListList[${k}].mngcostTotalPrice"
						            		value="${mngcostPayListVo.mngcostTotalPrice}">
						            	<input type="hidden" value="${mngcostPayListVo.mngcostLimitdate}">
						            	<input type="hidden" value="${mngcostPayListVo.mngcostClaimdate}">
									</th>
						            <td>
						            	<fmt:parseDate value="${mngcostPayListVo.mngcostLimitdate}"
						            		var="limitDate" pattern="yyyy-MM-dd"/>
						            	<fmt:formatDate value="${limitDate}"  pattern="yyyy-MM-dd"/>
						            </td>
						            <td id="claimDate">
						            	<fmt:formatDate value="${mngcostPayListVo.mngcostClaimdate}"
						            		pattern="yyyy-MM"/>월 청구분
						            </td>
						            <td class="text-right">
						            	<fmt:formatNumber value="${mngcostPayListVo.mngcostTotalPrice}"
						            		pattern="#,###"/>&nbsp; &nbsp;
						            	<div id="plusAddInfo" style="font-size:0.7em;padding-right:15px"></div>
						            </td>
					          	</tr>
					          	<c:set var="k" value="${k+1}"/>
				          	</c:forEach>
			          	</c:if>
		        	</tbody>
				</table>
				<div id="divTotalClaimPrice">
					합 &nbsp; &nbsp; &nbsp; &nbsp; 계 
					<span id="spanTotalClaimPrice" style="float:right"></span>
					<input type="hidden" name="payAmount" id="payAmount">
					<input type="hidden" name="payName" id="payName">
				</div>
				<div class="card-body">
					<hr>
					<p class="card-text text-center" style="font-weight: bold">
						아파트 관리 규정에 따라<br>관리비 연체 시에는<br>
						연체 기간에 따른 연체료를<br>
						함께 납부하셔야합니다.<br>
						<br>
						관리비가 연체되지 않도록 주의 부탁립니다.<br>
						<br>
						&lt; 감사합니다 &gt;
					</p>
					<hr>
					<div class="text-center">
						<a href="#" id="submitPayIMP" class="btn btn-primary">결제하기</a>
					</div>
				</div>
			</div>
		</form>
		<br>
	</div>
	<!-- END: 대시보드 박스 -->
</div>
</section>
<div class="clearfix"></div>
<section></section>
<!-- ======= End About Section ======= -->
<%@ include file="../mainInc/mainBottom.jsp" %>