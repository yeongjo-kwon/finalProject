<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">
    
    
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript">
	$(function(){
		var str="<tr><th scope='row'>#</th>";
		str+="<td colspan='3'>납부내역을 선택하세요.</td></tr>";
		$('#mngcostInfoTable').find('tbody').html(str);
		
		$('select.form-control').change(function(){
			if($('#mngcostClaimdate').val().length>0){
				ajaxInquiry();
			}else{
				alert("납부 내역을 선택하세요");
				$(this).val(0);
				location.href="#about";
			}
			
			if($(this).attr("id")=="mngcostMCtgNo"){
				$('#mngcostSCtgNo').html("<option value='0'>관리비 소분류</option>");
				if($(this).val()!=0){
					ajaxCtgSetting($(this));
				}
			}
		});
	});
	
	function sendDate(date, obj){
		$('#mngcostClaimdate').val(date);
		$('#mngcostSCtgNo').val(0);
		$('#mngcostMCtgNo').val(0);
		$(obj).parent().children().css("background","");
		$(obj).css("background", "#f4fcee");
		
		//부가시설 요금 더하기
		$(obj).parent().children().find('#plusAddInfo').html("");
		$.ajax({
			url:"<c:url value='/mngcost/mngcostPlusAddInfo.do'/>",
			type:"get",
			data:"mngcostClaimdate="+$('#mngcostClaimdate').val(),
			dataType:"json",
			success:function(res){
				var str="< 포함된 부가시설 이용 요금 >";
				$.each(res, function(idx, item){
					str+="<br>+ "+numFormat(item.addPrice)+"원 ["+item.addName+"]";
				});
				$(obj).find('#plusAddInfo').html(str);
			},
			error:function(xhr, status, error){
				alert("error : "+error);
			}
		});
		
		//공동 관리비 상세보기
		ajaxInquiry();
	}
	
	//날짜 포맷
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();
	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join('-');
	}
</script>
<!-- ======= Start About Section ======= -->
<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>관리비 조회</h2>
				<ol>
					<li><a href="<c:url value='/main/index.do'/>">Home</a></li>
					<li>관리비 조회</li>
				</ol>
			</div>
		</div>
	</section>
	<!-- End Breadcrumbs -->
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
	<input type="hidden" id="mngcostClaimdate">
    
	<div class="app-content content"><!-- 바꾸면 안됨 -->
	   	<!-- col-md-12까지가 한계-->
	   	<div class="card-title">
	    	<h4 class="card-title"><i data-feather='list'></i>관리비 내역</h4>
	    </div>
	    <br>
	    
	   	<div class="col-md-12 float-left" style="background-color:#ffffff;padding:0; margin-right:20px;margin-bottom:50px; box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
	      	<div class="card-body">
	        	<p class="card-text">
	          		청구월 별로 관리비  납부내역을 확인하실 수 있습니다.<br>
	          		납부 금액은 '&nbsp;공동 관리비 / 세대 수  <code>+ 부가시설 이용 요금</code>&nbsp;' 으로 산정 됩니다.
	        	</p>
	      	</div>
	    	<table class="table table-hover" style="margin-bottom:0;">
	    		<colgroup>
					<col style="width:10%;" />
					<col style="width:20%;min-width:130px;" />
					<col style="width:40%;" />
					<col style="width:20%;min-width:130px;" />
					<col style="max-width:70px;" />		
				</colgroup>
	        	<thead>
	          		<tr>
			            <th scope="col" class="text-center">#</th>
			            <th scope="col">청구일</th>
			            <th scope="col">금액</th>
			            <th scope="col">납부기한</th>
			            <th scope="col" class="text-center">납부</th>
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
		        		<c:set var="index" value="1"/>
			        	<c:forEach var="mngcostPayListVo" items="${mngcostPayList}">
				        	<tr onclick="sendDate('${mngcostPayListVo.mngcostClaimdate}', this)"
				        			style = "cursor:pointer;">
					            <th scope="row" class="text-center">${index}</th>
					            <td id="claimDate">
					            	<fmt:formatDate value="${mngcostPayListVo.mngcostClaimdate}"
					            		pattern="yyyy-MM-dd"/>
					            </td>
					            <td>
					            	<fmt:formatNumber value="${mngcostPayListVo.mngcostTotalPrice}"
					            		pattern="#,###"/>원
					            	<div id="plusAddInfo" style="font-size: 0.5em;"></div>
					            </td>
					            <td>
					            	<fmt:parseDate value="${mngcostPayListVo.mngcostLimitdate}"
					            		var="limitDate" pattern="yyyy-MM-dd"/>
					            	<fmt:formatDate value="${limitDate}"  pattern="yyyy-MM-dd"/>
					            </td>
					            <td class="text-center">
					            	<c:set var="paydate" value="${mngcostPayListVo.mngcostPaydate}"/>
					            	<c:if test="${empty paydate}">
					            		<a href="<c:url value='/mngcost/mngcostPayment.do?mngcostListNo=${mngcostPayListVo.mngcostListNo}'/>">
					            			<button class="btn btn-primary">납부</button></a>
					            	</c:if>
					            	<c:if test="${!empty paydate}">
					            		<fmt:formatDate value="${paydate}" pattern="yyyy-MM-dd"/>
					            	</c:if>
					            </td>
				          	</tr>
				          	<c:set var="index" value="${index+1}"/>
			          	</c:forEach>
		          	</c:if>
	        	</tbody>
			</table>
		</div>
		<br>
		
	    <div class="card-body">
        	<h4 class="card-title float-left">공동 관리비 지출 내역</h4>
      	</div>
      	<div class="col-md-8 col-12 mb-4 float-right">
      		<div class="col-md-6 col-6 mb-2 float-right">
		    <select class="form-control" id="mngcostSCtgNo" name="mngcostSCtgNo">
		    	<option value="0">관리비 소분류</option>
		    </select>
		    </div>
		    <div class="col-md-6 col-6 mb-2 float-right">
		    <select class="form-control" id="mngcostMCtgNo" name="mngcostMCtgNo">
		        <option value="0">관리비 대분류</option>
		    	<c:forEach var="mngcostMainCtgVo" items="${mngcostMainCtgList}">
		    		<option value="${mngcostMainCtgVo.mngcostMCtgNo}">
		    			${mngcostMainCtgVo.mngcostMCtgName}</option>
		    	</c:forEach>
		    </select>
		    </div>
	    </div>
		<div class="col-md-12 float-left" style="background-color:#ffffff; padding:0;
				margin-right:20px;box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
		    <table class="table table-striped" id="mngcostInfoTable" style="margin-bottom:0;">
			    <colgroup>
					<col style="width:5%;" />
					<col style="width:23%;min-width:50px;" />
					<col style="width:40%;" />
					<col style="width:23%;min-width:50px;" />
				</colgroup>
			    <thead>
			       	<tr>
				        <th scope="col">#</th>
				        <th scope="col">지출일자</th>
				        <th scope="col">관리비 내용</th>
				        <th scope="col">금액</th>
			       	</tr>
			    </thead>
			    <tbody class="">
			    	<!-- 조회결과가 올 자리 -->
			    </tbody>
			</table>
		</div>
	</div><!-- 대시보드 박스 : 클래스app-content content -->
<!-- END: 대시보드 박스 -->
</div>
</section>

    
<div class="clearfix"></div>
<section></section>
<!-- ======= End About Section ======= -->
<%@ include file="../mainInc/mainBottom.jsp" %>