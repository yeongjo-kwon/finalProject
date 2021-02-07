<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../mainInc/mainTop.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">
$(function(){
	var form = $('#divForm');
	form.hide();//맨처음 로드되었을 때는   안나타나게
	
	
	$('#checkAgree').change(function(){
		if($('#checkAgree').is(':checked')){
			form.show();//체크박스 체크하면 나타나게
		}else{
			form.hide();//체크박스 체크하면 나타나게
			
		}
	}); 
	
	
	
	
});
</script>


<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2 class="mt-2" style="line-height: 2; vertical-align: middle;">부가시설 이용 신청</h2>
				<ol style="font-size:0.9em; line-height: 3;">
					<li><a href="<c:url value='/main/main.do'/>">Home</a></li>
					<li><a href="<c:url value='/living/add/addFacilityList.do'/>">부가시설 목록</a></li>
					<li><a href="<c:url value='/living/add/addFacilityDetail.do'/>">부가시설 상세정보</a></li>
					<li>부가시설 이용 신청</li>
				</ol>
			</div>
		</div>
	</section>
	<!-- End Breadcrumbs -->

</main>
<div class="clearfix mt-10" style="height:100px"></div>
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact" style="min-height:500px;vertical-align:center;">
      <div class="container" >

        <div class="section-title">
          <h2 id="title">이용약관 동의 및 신청</h2>
          <p>월 이용 요금은「부가시설 이용료」 항목으로 세대 관리비에 함께 청구됩니다. <br>이용 신청일 기준 익월 관리비 요금에 청구되며, 신청일 당일 해지한다 할지라도 신청일 기준 익월 관리비에 요금이 청구됩니다.</p>
        </div>

		<form mane="frmAgree" method="post" action="">
		 	<div class="row contact-info">
			<div class="form-check col-12 text-center">
			  <input class="form-check-input" type="checkbox" name="checkAgree" value="" id="checkAgree">
  			  <label class="form-check-label" for="checkContion">이용약관을 확인하였으며, 동의합니다.</label>
			</div>
			</div>
    	</form><!-- frmAgree -->


        <div class="form" id="divForm">
          <form id="frmOrder" name="frmOrder" action=" " method="post" role="form" class="php-email-form p-10" style="padding: 20px;">

				
				<div class="row contact-info rounded-lg " style="padding: 20px;background-color: #f6f6f6">
					
					
					<!-- 시설정보카드 -->
					<div class="col-md-6 border-right"  style="padding: 20px;">
					<h3 class="color-primary mb-6 mt-9">시설 정보</h3>
					<br>
						<p>시설이름</p>
						<p>월 10000원</p>
						<p>위치정보위치정보위치정보위치정보위치정보위치정보위치정보위치정보위치정보위치정보위치정보위치정보치정보위치정보위치정보위치정보위치정보위치정보치정보위치정보위치정보위치정보위치정보위치정보</p>
					</div>

					<!-- 입력란 -->
					<div class="col-md-6" style="padding: 20px;">
					<h3 class="color-primary mb-6 mt-9">신청 정보 입력</h3>
					<br>
					<div class="form-group">
						<!-- 이름, 이메일 입력  -->
						<div class="col-12 form-group">
							<input type="text" name="name" class="form-control" id="name"
								placeholder="이름을 입력하세요" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars">
							<div class="validate"></div>
						</div>
						<div class="col-12 form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="이메일을 입력하세요." data-rule="email"
								data-msg="Please enter a valid email">
							<div class="validate"></div>
						</div>
					</div>
					<!-- 세대코드입력 -->
					<div class="form-group">
						<div class="col-12 form-group">
							<input type="text" class="form-control" name="housholdCode"
								id="subject" placeholder="세대코드를 입력하세요" data-rule="minlen:4"
								data-msg="정확한 세대코드를 입력해주세요" />
							<div class="validate"></div>
						</div>
					</div>
					
					
					</div>
					

				</div>
				<div class="text-center"><button type="submit" class="col-md-4">신청 완료</button></div>
          </form>
        </div>

      </div>
    </section><!-- End Contact Section -->
    
</div>

<div class="clearfix" style="height:100px"></div>
<%@ include file="../../mainInc/mainBottom.jsp" %>