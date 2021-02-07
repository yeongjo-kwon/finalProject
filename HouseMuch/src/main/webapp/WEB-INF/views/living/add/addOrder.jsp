<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../mainInc/mainTop.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	var divInfo = $('#divInfo');
	divInfo.hide();//맨처음 로드되었을 때는   안나타나게
	
	
	$('#checkAgree').change(function(){
		if($('#checkAgree').is(':checked')){
			//$('input[type=checkbox]:checked').css('background-color','#5c9f24');
			divInfo.show();//체크박스 체크하면 나타나게
		}else{
		
			divInfo.hide();//체크박스 체크하면 나타나게
			
		}
	}); 
	
	
	
	
});
</script>
<style>
.apt-bg-primary{
	background-color:#5c9f24; 
}
.apt-bg-secondary{
	background-color:#f6f6f6; 
}
.apt-bg-light{
	background-color:#F2FBDD; 
}
.apt-bg-dark{
	background-color:#22550E; 
}

.apt-text-primary{
	color:#5c9f24; 
}
.apt-text-secandary{
	color:#666666; 
}
.apt-text-third{
	color:#F2FBDD; 
}
.apt-text-dark{
	color:#22550E; 
}

.btn{
	background-color:#5c9f24;
	border-color: #5c9f24;
}
.btn:hover{
	background-color:#326717;
	border-color: #326717;
}

.btn-light{
	background-color:#F2FBDD;
	border-color: #E2F7BC;
	color: #22550E;
}
.btn-light:hover{
	background-color:#ffffff;
	border-color: #5c9f24;
}

input[type=checkbox] {
  appearance: none;
  width:1rem;
  height: 1rem;
  border-radius:4%;
  border :1px solid #5c9f24;
  margin-right: 0.2rem;
  background-color:#ffffff;
}
input[type=checkbox]:checked {
  appearance: none;
  width: 0.9rem;
  height: 0.9rem;
  border-radius: 4%;
  border :1px solid #5c9f24;
  margin-right: 0.2rem;
  background-color:#5c9f24;
  
}
input[type=checkbox]:unchecked {
  appearance: none;
  width:1rem;
  height: 1rem;
  border-radius:4%;
  border :1px solid #5c9f24;
  margin-right: 0.2rem;
  background-color:#ffffff;
}



.form-check-input{
 	background-color:#ffffff;
}
.form-check-input:checked{
 	background-color:#ffffff;
	color:#5c9f24;
}
.form-check-input:unchecked{
 	background-color:#ffffff;
	color:#5c9f24;
}
</style>

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
          <h2 id="title">이용약관 동의 및 신청&nbsp;&nbsp;&nbsp;</h2>
          <p>월 이용 요금은「부가시설 이용료」 항목으로 세대 관리비에 함께 청구됩니다. <br>이용 신청일 기준 익월 관리비 요금에 청구되며, 신청일 당일 해지한다 할지라도 신청일 기준 익월 관리비에 요금이 청구됩니다.</p>
        </div>

		<form name="frmAgree" method="post" action="">
		 	<div class="row contact-info">
			<div class="form-check col-12 text-center">
			  <input class="form-check-input" type="checkbox" name="checkAgree" value="" id="checkAgree">
  			  <label class="form-check-label apt-text-primary ml-1" for="checkContion" style="font-size: 1.1em;">    &nbsp;이용약관을 확인하였으며, 동의합니다.</label>
			</div>
			</div>
    	</form><!-- frmAgree -->


        <div class="form" id="divInfo">
          <form id="frmOrder" name="frmOrder" action=" " method="post" role="form" class="php-email-form p-10" style="padding: 20px;">

				
				<div class="row contact-info rounded-lg " style="padding: 20px;background-color: #f6f6f6">
					
					
					<!-- 시설정보카드 -->
					<div class="col-md-6 border-right"  style="padding: 20px;">
					<h3 class="color-primary mb-6 mt-9">시설 정보</h3>
					<br>
						<p>우리아파트 실내골프장</p>
						<p>월 20000원</p><br>
						<p class="text-justify">실내 골프 연습장은 25타석의 타격 연습장과 5타석의 스크린 스윙 연습기를 설치 하였으며, 쾌적한 환경에서 우수한 강사진들의 성실과 열정으로 입주민 분들을 지도하고 있습니다.</p>
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
								data-msg="가입시 입력한 이름을 입력하세요">
							<div class="validate"></div>
						</div>
						<div class="col-12 form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="이메일을 입력하세요." data-rule="email"
								data-msg="가입시 입력한 이메일을 입력하세요">
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