<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../mainInc/mainTop.jsp" %>
  <!-- Custom styles for this template -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ynResources/notice-detail/modern-business.css">
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

</style>
    <!-- Header -->
  <header class="apt-bg-light py-5 mb-5">
    <div class="container h-50">
      <div class="row h-50 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 mt-5 mb-2">실내 골프 연습장</h1>
          <p class="lead mb-5 ">단지 내에서 언제든 사계정 상관없이 스윙과 퍼팅이 가능합니다.</p>
        </div>
      </div>
    </div>
  </header>
  
    <!-- Page Content -->
  <div class="container">

    <div class="row">
      <div class="col-md-8 mb-5">
        <h2>부가시설 이용 안내</h2>
        <hr>

        <p>우리 아파트 실내 골프 연습장은 25타석의 타격 연습장과 5타석의 스크린 스윙 연습기를 설치 하였으며, 
        <br>쾌적한 환경에서 우수한 강사진들의 성실과 열정으로 이용회원분들을 지도하고 있습니다.</p>
        <a class="apt-bg-primary text-white btn btn-lg" 
        href="<c:url value='/living/add/addOrder.do?addNo=${vo.addNo }'/>">시설 이용 신청 &raquo;</a>
      </div>
      <div class="col-md-4 mb-5">
        <h2>이용 문의</h2>
        <hr>
        <address>
          <strong>시설관리</strong>
          <br>3481 Melrose Place
          <br>Beverly Hills, CA 90210
          <br>
        </address>
        <address>
          <abbr title="Phone">P:</abbr>
          (123) 456-7890
          <br>
          <abbr title="Email">E:</abbr>
          <a href="mailto:#">name@example.com</a>
        </address>
      </div>
    </div>
    <!-- /.row -->




<!-- 여기부터 인기시설  -->

    <div class="row">
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="https://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque sequi doloribus.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="https://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque sequi doloribus totam ut praesentium aut.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="https://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->
    <!-- 여기까지 인기시설  -->

  </div>
  <!-- /.container -->
  
  
  
  
  

  <!-- Bootstrap core JavaScript --><!-- 
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
    
<%@ include file="../../mainInc/mainBottom.jsp" %>