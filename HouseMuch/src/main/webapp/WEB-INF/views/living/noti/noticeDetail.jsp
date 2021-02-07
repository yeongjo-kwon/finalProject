<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../mainInc/mainTop.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
   <script src="https://unpkg.com/feather-icons"></script><!-- 아이콘리소스 -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
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

<div class="clearfix" style="height:30px;background-color:#f6f6f6;position:sticky;"></div>
<div class="yiWrapper" style="width:100%; min-height:700px; margin: 0 auto;">

<main id="main" style="position:sticky">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs m-0 mb-10">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2 class="mt-2" style="line-height: 1; vertical-align: middle;">공지 상세보기</h2>
				<ol style="font-size:0.9em; line-height: 2;">
					<li><a href="<c:url value='/main/main.do'/>">Home</a></li>
					<li><a href="<c:url value='/living/noti/noticeList.do'/>">공지사항</a></li>
					<li>공지 상세 보기</li>
					
				</ol>
			</div>
		</div>
	</section>
	<!-- End Breadcrumbs -->

</main>



    <!-- <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Blog Home 2</li>
    </ol>
 -->
    
        <div class="col-12" style="height: 50px;"></div>
   <!-- Page Content -->
  <div class="container pt-10">
    
    <!-- 공지제목부분  -->
    <div class="col-12 d-flex text-justify m-0">
        <div class="col-8 text-left p-0">
	    	<h1 class="font-lg mb-3 text-left d-inline mt-10">2년차 하자보수 신청서 접수 안내</h1>
		</div>
		
		<!-- 달력으로  -->
        <div class="col-4 text-right p-0 row align-items-end m-0">
		  	<h5 class="col"></h5>
		  	<h5 class="col"></h5>
        
		  	<h5 class="font-medium text-right col" >
	    	    <span class="align-text-bottom" aria-hidden="true">
	    	    <a href="<c:url value='living/noti/aptScheduler.do?noticeNo='/>">
				<!-- 달력아이콘CDN -->
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">
				  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>
				  <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
				</svg>	    	    		
				2021-02-05 ~ 2021-02-25
				</a>
				</span>
		    </h5>
        </div>

    </div>
    
    <!-- 작성자정보 부분 -->
        <hr> 
    <div class="col-12 d-flex text-justify">
        <!-- 작성자 / 등록일 / 이메일  -->
        <div class="col-6 text-left p-0">
        	<!-- 에딧아이콘 CDN-->
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
			  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg>&nbsp;
        	행정 관리자,&nbsp;<span>2021-02-04 </span>
  		</div>
        
        <div class="col-6 text-right p-0">
        	<!-- 이메일아이콘 CDN -->
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  			<path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
			</svg>
        	생활 지원 센터&nbsp;&nbsp;<a href="#"><span aria-hidden="true"><i data feather="at-sign"></i> 
        	yinaofficeg@gmail.com</span>
        	</a>
  		</div>

    </div>
        <hr>

    
    <!-- 제목 끝 -->
    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Post Content -->
        <p class="lead font-medium">공동주택 관리법 시행령 제39조에 의거, 아래와 같이 하자보수 청구에 대하여
        <br>안내하오니 기일 엄수하여 전유부분에서 발행한 2년차 하자를 조사, 청구하여 주시기 바랍니다.</p>

        <p>		
        		1. 관련근거 : 공동주관리법 시행령 제39조 [담보책임의 종료] 제2항
			<br>2. 2년차 하자보수 청구기간 2021년 2월 27일 까지
			<br>3. 접수 기간 : 2021년 02월 05일 ~ 2021년 02월 25일 까지
			<br>4. 접수 처    : 행정관리실 
			<br>5. 접수 방법 : 하자보수 신청서와 개인정보 수집·이용 동의서 다운 받아 작성 후 
			<br>		      이메일첨부(공지게시판 참고)			
			<br>
			<br>※2년차 하자내용※ 
			<br>미장공사,  수장공사, 도장공사, 도배공사, 타일공사, 건물내부 석 공가, 옥내 가구 공사, 주방 가구 공사, 가전제품
			
			<br> 양식 : 공지게시판 다운로드 또는 생활지원센터 교부 신청
			<br> 임차세대는 구분소유자의 하자보수 청구권이 소멸되지 않도록  구분소유주에게 전달하고 하자보수신청를 제출하여주시기 바랍니다. 
			<br> (상호 협의 하에 제출)
			<br> 주요 내용 : 각 구분 세대 별 하자담보 책임기간 경과 후에는 2년차 하자에 대한 하자보수를 청구할 수 없음
			<br> 하자보수 청구방법 : 공지게시판에서 하자보수 신청서와 개인정보 수집·이용 동의서 다운 받아 작성 후 이메일첨부
			<br> 
		</p>
		
		
		
		
		
		
		
        <blockquote class="blockquote">
          <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
          <footer class="blockquote-footer">Someone famous in
            <cite title="Source Title">Source Title</cite>
          </footer>
        </blockquote>

        <hr>

        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
          </div>
        </div>

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

          </div>
        </div>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card mb-4">
          <h5 class="card-header">공지 검색</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="검색어를 입력하세요">
              <span class="inpug-group-append">
                <button class="btn btn-secondary" type="button"><i data-feather="search"></i></button>
              </span>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header"><i data-feather="glyphicon glyphicon-save-file"></i>첨부파일</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-12">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">하자보수 신청서 양식.xlsx</a>
                  </li>
                  <li>
                    <a href="#">개인정보 수집·이용 동의서.doc</a>
                  </li>
                </ul>
              </div>
            <!--   <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                </ul>
              </div> -->
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <!-- <div class="card my-4">
          <h5 class="card-header">Side Widget</h5>
          <div class="card-body">
            You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
          </div>
        </div> -->

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  
  </div><!-- class="yiWrapper d-flex" -->
  
  
  <script type="text/javascript">
  $(document).ready(function(){
	  feather.replace();
  });
  </script>
  <!-- Bootstrap core JavaScript --><!-- 
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<%@ include file="../../mainInc/mainBottom.jsp" %>