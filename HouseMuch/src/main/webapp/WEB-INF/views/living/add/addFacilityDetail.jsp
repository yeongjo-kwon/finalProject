<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../mainInc/mainTop.jsp"%>
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ynResources/notice-detail/modern-business.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script src="https://unpkg.com/feather-icons"></script>
<!-- 아이콘리소스 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<script>


var addOut = function(){
	if(confirm('해지할 경우 다음 달 부터 재 신청 가능합니다. 시설 이용을 해지하시겠습니까?')){
		location.href="<c:url value='/living/add/addOut.do?addNo=${map["addNo"]}&householdCode=${sessionScope.memVo.householdCode}'/>";
	}else{
		event.preventDefault();
	}
}
</script>


<style>
.apt-bg-primary {
	background-color: #5c9f24;
}

.apt-bg-secondary {
	background-color: #f6f6f6;
}

.apt-bg-light {
	background-color: #F2FBDD;
}

.apt-bg-dark {
	background-color: #22550E;
}
.apt-bg-deep-dark {
	background-color: #1B440B;
}

.apt-text-primary {
	color: #5c9f24;
}

.apt-text-secandary {
	color: #999;
}

.apt-text-third {
	color: #F2FBDD;
}

.apt-text-dark {
	color: #22550E;
}

.btn {
	background-color: #5c9f24;
	border-color: #5c9f24;
}

.btn:hover {
	background-color: #326717;
	border-color: #326717;
}

.btn-light {
	background-color: #F2FBDD;
	border-color: #E2F7BC;
	color: #22550E;
}

.btn-light:hover {
	background-color: #ffffff;
	border-color: #5c9f24;
}
body{
	padding-top:80px;
}

.btn-out{
	background-color: #ffffff;
	border-color: #FF7063 !important; 
	color: #FF7063;
}
.btn-out:hover{
	background-color: #FF7063;
	border-color: #FF7063 !important;
	color: #ffffff;
}

</style>
<!-- Header -->
<!--< div class="sticky clearfix" style="min-height:120px;" ></div> -->
<header class="apt-bg-deep-dark text-white  pt-10 mb-1 sticky clearfix">
	<div class="container h-30 pt-10">
		<div class="row h-30 align-items-center pt-10">
			<div class="col-lg-12 pt-10">
				<br><br>
				<p class="pl-2 mb-1 mt-10 apt-text-third">${map['addCtgName'] }</p>
				<h1 class="display-5 mt-1 mb-3" style="text-shadow:2px 2px 4px rgba(0,0,0,0.6)"><b>${map['addName'] }</b></h1>
				<p class="pl-2 lead mb-5 apt-text-secondary">${map['addLocationInfo'] }</p>
			</div>
		</div>
	</div>
</header>
<div class="clearfix" ></div>
<!-- Page Content -->
<div class="container pt-10">

	


	<!-- 내용시작 -->
	<div class="row">
	
		<div class="col-lg-9">
			<hr>

			<!-- Content -->
			<div class="row">
				<c:if test="${map['addPrice']!=0}">
					<span class="col" style="padding-left:30px;">월 이용 요금 :&nbsp;&nbsp; 
					<fmt:formatNumber pattern="###,###,###" value="${map['addPrice']}"/> &nbsp;원</span>
				</c:if>
				<c:if test="${map['addPrice']==0}">
					<span class="col" style="padding-left:30px;" class="addFree">월 이용 요금 :&nbsp;&nbsp;입주민 무료</span> 
				</c:if>
				<span class="col" style="padding-left:30px;">현재 이용자 수 :&nbsp;&nbsp; ${map['orderCnt']} &nbsp;명</span>
			</div>
			<hr>
			
			<div id="addContetn">${map['addContent']}</div>
		</div>
		<!-- 내용끝 -->



		<!-- 이용신청버튼 -->
		<div class="col-lg-3 mt-3" id="divOrder" style="position:relative;width:18rem;">
			<div class="card" style="position:absolute;top:0px;" id="divOrder2"  style="width:18rem;" >
				<div class="card-header" style="width:18rem;">${map['addName']}</div>	
				<div class="card-body" style="width:18rem;">
					<c:if test="${map['addPrice']!=0}">
						<p>월 이용 요금 :&nbsp;&nbsp;<fmt:formatNumber pattern="###,###,###" value="${map['addPrice']}"/>&nbsp;원</p>
						<small class="text-left apt-text-secandary">*월 이용 요금은「부가시설 이용료」 항목<br>으로 세대 관리비 청구됩니다.</small>
					</c:if>
					<c:if test="${map['addPrice']==0}">
						<p class="addFree" >월 이용 요금 :&nbsp;&nbsp;입주민 무료</p>
						<small class="text-left apt-text-secandary">*무료 편의 시설은 입주민 누구나<br>신청 없이 무료이용 가능합니다.</small>
					</c:if>
				</div> 

				<c:choose>
					<c:when test="${map['addPrice']==0}">
						<input type="button" class="mb-0 btn-secondary" id="btOrder"
							value="무료 편의 시설" style="width:18rem;height:4rem;border-radius: 0 0 4px 4px;" disabled="disabled">	
					</c:when>
					
					<c:when test="${checkCode>0}">
						<input type="button" class="mb-0 btn-out" id="btOut" name="addOut" onclick="addOut()"
							value="이용 해지" style="width:18rem;height:4rem;border-radius: 0 0 4px 4px;border-color:#FF7063">	
					</c:when>
					
					<c:otherwise>
						<input type="button" class="mb-0 btn-primary " id="btOrder" 
						value="이용 신청" style="width:18rem;height:4rem;border-radius: 0 0 4px 4px;">	
					</c:otherwise>						
				</c:choose>
			</div>
		</div>
		<!-- 이용신청버튼 : 끝-->
		

	<div class="clearfix"></div>
	</div>
</div>
</div>


</div>
<!-- 사이드 -->

</div>
<!-- /.row -->

</div>
<!-- /.container -->

</div>
<!-- class="yiWrapper d-flex" -->

<script type="text/javascript">
  $(document).ready(function(){
	  feather.replace();
	  
	  $('#btOrder').on('click',function(){
 		  location.href="<c:url value='/living/add/addOrder.do?addNo=${map["addNo"]}&householdCode=${sessionScope.memVo.householdCode}'/>"; 
		  /* location.href="<c:url value='/living/add/addOrder.do?addNo=${map["addNo"]}'/>"; */
	  });
	  
	  
	  //스크롤 내리면 신청버튼 top에 fix
	  $(window).scroll(function() {
	      if(jQuery(window).scrollTop() >= jQuery("#divOrder").offset().top) {//-----------> 스크롤내려간경우
	    	 	 jQuery("#divOrder2").attr("style", "position:fixed;top:100px;width:18rem;");
	      }
	   	  else if((jQuery(window).scrollTop() < jQuery("#divOrder").offset().top)) {//-------------> 스크롤 안내려간경우
	    	 	 jQuery("#divOrder2").attr("style", "position:static;top:10px;width:18rem;");
	   	  }
	  });
	  
	 

	  
  });
  </script>


<!-- Bootstrap core JavaScript -->
<!-- 
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<%@ include file="../../mainInc/mainBottom.jsp"%>