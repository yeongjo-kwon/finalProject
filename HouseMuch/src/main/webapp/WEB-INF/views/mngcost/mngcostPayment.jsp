<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript">
	$(function(){
		var d=new Date();
		$('#currDate').html(formatDate(d));
	
		var cnt=0;
		$('#unpaidTable tbody input[type=checkbox]').each(function(){
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
	});
	
	function checkAll(checkEl){
		var bool=checkEl.is(":checked");
		$('#unpaidTable').find('input[type="checkbox"]').each(function(){
			$(this).prop("checked", bool);
		});

	}
	
	function getTCPrice(){
		var tCPrice=0;
		$('#unpaidTable tbody input[type=checkbox]:checked').each(function(){
			tCPrice+=Number($(this).next().val());
		});
		
		$('#spanTotalClaimPrice').html(numFormat(tCPrice));
	}
	
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
	<input type="hidden" id="mngcostClaimdate">
    
	<div class="app-content content"><!-- 바꾸면 안됨 -->
	   	<!-- col-md-12까지가 한계-->
	   	<div class="card-title">
	    	<h4 class="card-title"><i data-feather='list'></i>미납 내역</h4>
	    </div>
	    <br>
	    
	   	<div class="col-md-5 float-left" style="background-color:#ffffff;padding:0; margin-right:20px;margin-bottom:50px; box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
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
			        	<c:forEach var="mngcostPayListVo" items="${mngcostPayList}">
				        	<tr style="cursor:pointer;">
					            <th scope="row" class="text-center">
					            	<input type="checkbox" value="${mngcostPayListVo.mngcostListNo}">
					            	<input type="hidden" value="${mngcostPayListVo.mngcostTotalPrice}">
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
					            	<div id="plusAddInfo" style="font-size: 0.5em;"></div>
					            </td>
				          	</tr>
			          	</c:forEach>
		          	</c:if>
	        	</tbody>
			</table>
			<div id="divTotalClaimPrice">
				합 &nbsp; &nbsp; &nbsp; &nbsp; 계 
				<span id="spanTotalClaimPrice" style="float:right"></span>
			</div>
		</div>
		<br>
	</div>
	<!-- END: 대시보드 박스 -->
</div>
</section>
<div class="clearfix"></div>
<section></section>
<!-- ======= End About Section ======= -->
<%@ include file="../mainInc/mainBottom.jsp" %>