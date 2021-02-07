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

        <div class="col-12" style="height: 50px;"></div>
   <!-- Page Content -->
  <div class="container pt-10">
    
    <!-- 공지제목부분  -->
    <div class="col-12 d-flex text-justify m-0">
        <div class="col-8 text-left p-0">
	    	<h1 class="font-lg mb-3 text-left d-inline mt-10">${vo.noticeTitle}</h1>
		</div>
		
		
			<!-- 달력으로  -->
	        <div class="col-4 p-0 row m-0 align-bottom mt-10">
			  <!-- 	<h5 class="col d-inline align-top"></h5>
			  	<h5 class="col d-inline align-bottom"></h5> -->
	        
		<!-- 일정공지라면 일정링크 나오게  -->		
		<c:if test="${vo.nCtgNo==1 && (empty vo.scdNo)}">
			  	<h5 class="font-medium text-right col align-bottom mt-3 mr-0 p-0" >
		    	    <span class="align-bottom" aria-hidden="true">
			  	일정 내용이 없습니다.
		    	    </span>
			  	</h5>
		</c:if>
		<c:if test="${vo.nCtgNo==1 && (!empty vo.scdNo)}">
			  	<h5 class="font-medium text-right col align-bottom mt-10 mr-0 p-0" >
		    	    <span class="align-text-bottom align-bottom" aria-hidden="true">
		    	    <a href="<c:url value='living/noti/aptScheduler.do?noticeNo=${vo.noticeNo }'/>">
					<!-- 달력아이콘CDN -->
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">
					  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>
					  <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
					</svg>	    	    		
					${vo.startDateStr} ~ ${vo.endDateStr}
					</a>
					</span>
			    </h5>
		</c:if>
	<!-- 일정공지라면 일정링크 나오게  -->		
	        </div>

    </div><!-- 제목 -->
    
    <!-- 작성자정보 부분 : -->
        <hr> 
    <div class="col-12 d-flex text-justify">
        <!-- 작성자 / 등록일 / 이메일  -->
        <div class="col-6 text-left p-0">
        	<!-- 에딧아이콘 CDN-->
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
			  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg>&nbsp;
        	${vo.memberName },&nbsp;
        	<span><fmt:formatDate value="${vo.noticeRegdate }" pattern="yyyy-MM-dd" /></span>
  		</div>
        
        <div class="col-6 text-right p-0">
        	<!-- 이메일아이콘 CDN -->
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  			<path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
			</svg>
        	생활 지원 센터&nbsp;&nbsp;<a href="#"><span aria-hidden="true"><i data feather="at-sign"></i> 
        	${memVo.email }</span>
        	</a>
  		</div>

    </div>
        <hr>
    <!-- 제목 끝 :여기까지 col-12-->

    
      <!-- 내용시작 -->
    <div class="row">
      <div class="col-lg-8">

        <!-- 공직Content -->
        <p class="lead font-medium" style="min-height: 400px;">${vo.noticeContent }</p>
		<hr>
       </div><!-- 내용끝 -->

 

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

        <!-- 첨부파일자리 -->
        <div class="card my-4">
          <h5 class="card-header"><i data-feather="glyphicon glyphicon-save-file"></i>첨부파일</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-12">
                <ul class="list-unstyled mb-0">
	               <c:if test="${!empty vo.noticeFilename }">
	                  <li>
	                    <a href="<c:url value='/living/noti/download.do?noticeNo=${param.noticeNo}&noticeFilename=${vo.noticeFilename }'/>">${fileInfo}</a>
	                  </li>
	               </c:if>
	               <c:if test="${empty vo.noticeFilename }">
	                  <li>
	                    <a href="#">첨부파일이 없습니다.</a>
	                  </li>
	               </c:if>   
                </ul>
              </div>
        <!-- 첨부파일자리 끝 -->
            <!--   <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                </ul>
              </div> -->
            </div>
          </div>
        </div>


      </div><!-- 사이드 -->

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