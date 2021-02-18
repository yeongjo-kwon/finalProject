<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../mainInc/mainTop.jsp" %>
      <!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/ynResources/css/shop-homepage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/ynResources/css/shop-homepage.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
 integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
 <script src="https://unpkg.com/feather-icons"></script><!-- 아이콘리소스 -->
 <!-- 부가시설 목록 뷰 script -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
var index=0;
function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

function addCtgNum(i){                    
	//console.log(i);
	index=i;
}   
//시설 분류 클릭하면 리스트 업데이트되게 처리
$(function(){
	console.log("index= " +index );
	$('#addCtg a').click(function(){
		var CtgName = $(this).text();
		console.log("선택한카테고리 분류명은 "+CtgName);//특화시설
		$(this).attr('class','list-group-item a-index');//bg컬러변경
		
	 	var CtgNo = index;
		console.log("선택한카테고리 번호는"+CtgNo);  //1
		
		//선택한 분류명에 해당되는 리스트 불러오게 파라미터 넘김
		$('input[name=searchCondition]').val('ADD_CTG_NAME');
		$('#submitKeyword').val(CtgName);
		var Ctg = $('#addCtgNo').val(CtgNo);
		console.log($('#addCtgNo').val());
		
		//어차피 검색후에는 1페이지부터 시작할꺼니까
		pageFunc(1);  
	});
	
	
/* 	$('.page-link').on('click',function(){
		$('input[name=currentPage]').val(curPage);
		var sbmCondition = $('input[name=searchCondition]').val();
		var sbmKeyword = $('input[name=searchKeyword]').val();
		var ctgNo = $('input[name=addCtgNo]').val();
		
		
		//null일경우 넣어주기
		if(sbmCondition==null){
			console.log(sbmCondition+"없음");
			$(this).val('');
		}else if(sbmKeyword==null){
			console.log(sbmKeyword+"없음");
			$(this).val('');
		}else if(ctgNo==null){
			console.log(ctgNo+"없음");
			$(this).val(0);
		}
		
	});
	 */
	
	
});
</script>
 <!-- 부가시설 목록 뷰 script : 끝 -->
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

.btn-light:hover{
	background-color:#F2FBDD;
	border-color: #E2F7BC;
	color: #22550E;
}
.btn-light{
	background-color:#ffffff;
	border-color: #5c9f24;
}

.a-index{
	background-color:#5c9f24;
	border-color: #5c9f24;
	color: #ffffff;
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

.btn-point{
	background-color: #f69532;
	border-color: #f69532 !important; 
	color: #ffffff !important;
}
.btn-point:hover{
	background-color: rgba(246,149,50,0.2);
	border-color: #f69532 !important;
	color: #f69532 !important;
	font-weight: bold;
}
.text-point{
	color: #ffffff !important;
}
.text-point:hover{
	color: #f69532 !important;
	font-weight: bold;
}

#imgcard img{
    height: 10rem;
	object-fit: cover;
}
</style>
<div class="clearfix" style="height:100px"></div>
<div class="yiWrapper" style="width:100%; min-height:700px; margin: 0 auto;">

   <!-- Page Content -->
  <div class="container">
  <div style="width:100%; min-height:100px;" class="row">
	
	<div class="col col-lg-9">
		<h3 class="mb-10 apt-text-dark" style="font-size: 1.8em;">생활의 자부심을 높여주는 더 특별한 부가시설</h3>
		<small style="color:#666">입주민의 활기찬 생활을 위한 건강시설부터 다양한 생활편의시설까지 일상이 특별해지는 특권을 누려보세요.</small>
	</div>
	<div class="col col-lg-3 p-0 text-right">
		<div class="btn btn-point text-point p-3">
          <a href="<c:url value='/living/add/addOrderList.do?householdCode=${sessionScope.memVo.householdCode}'/>" 
         class="text-point" style="vertical-align: center; line-height: 2;">우리집 신청내역 확인&nbsp;<i data-feather="chevron-right"></i></a>
        </div>
	</div>
  </div>
<hr>

    <div class="row">
      <div class="col-lg-9">
<!-- searchKeyword  searchCondition 보내는 frmSearch 시작 -->     
                <!-- 검색어, 검색조건 넘기는 frmPage -->
                <form name="frmPage" 
                method="post" action='<c:url value="/living/add/addFacilityList.do"/>'>
							<input type="hidden" name="currentPage" id="thisPage"> 
							<input type="hidden" name="searchCondition" value="${param.searchCondition}" >
							<input type="hidden" name="searchKeyword"	value="${param.searchKeyword}" id="submitKeyword">
							<input type="hidden" name="addCtgNo"	value="${param.addCtgNo}" id="addCtgNo">
			</form>
<!-- searchKeyword searchCondition 보내는 frmSearch 끝 -->
<!-- 오른쪽섹션인 col-9안에서 검색바랑 파라미터 넘기는거 일단 넣음//끝 -->



<!-- 시설카드 div : 시작   class="row"  -->
        <div class="row mt-10" id="addInfoList">
<!-- 시설카드 반복구간 : 시작 class="col-lg-4 col-md-6 mb-4"  -->
			<c:if test="${empty list }">
					<p>등록된 부가시설이 없습니다</p>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list}">

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100" id="imgcard">
								<a href="#">
								<%--  <img class="img-fluid card-img-top" src="<c:url value='/living/add/attachImage.do'/>" 
								 alt="시설썸네일" width="550"/> --%>
								 <c:if test="${vo.addinfoImgOriginalFilename=='thumbnail-default.svg' }">
								 	<img class="img-fluid card-img-top" alt="등록된 이미지가 없습니다"
								 	src="${pageContext.request.contextPath}/resources/aptAdmin_images/thumbnail-default.svg" />
								 </c:if>
								 <c:if test="${vo.addinfoImgOriginalFilename!='thumbnail-default.svg'}">
								 	<img class="img-fluid card-img-top embed-responsive-item" alt="${vo.addName}" 
								 	src="${pageContext.request.contextPath}/resources/aptAdmin_images/add_thumbnail/${vo.addinfoImgOriginalFilename}" />
								 </c:if>
                                	</a>
									<div class="card-body">
									
									<h4 class="apt-text-dark mb-3">
									 <b>${vo.addName }</b></h4>
									
									<div class="text-right mt-5">
										<c:if test="${vo.addPrice!=0}">
											<h5>월  <fmt:formatNumber pattern="###,###,###" value="${vo.addPrice}"/>원</h5>
										</c:if>
										<c:if test="${vo.addPrice==0}">
											<h5>무료이용</h5>
										</c:if>
										
										<c:if test="${vo.addPrice!=0}">
											<p class="card-text">현재 이용자 수 : ${vo.orderCnt }</p>
										</c:if>
									</div>	
								</div>

								<div class="btn-group card-footer text-center p-0" role="group">
									<c:choose>
										<c:when test="${vo.addPrice==0}">
											<a href="<c:url value='/living/add/addFacilityDetail.do?addNo=${vo.addNo }'/>" 
												class="btn btn-primary btn-wishlist">
		                                    <span class="add-to-cart">상세 정보</span></a>
										</c:when>
										<c:otherwise>
											<a href="<c:url value='/living/add/addOrder.do?addNo=${vo.addNo }&householdCode=${sessionScope.memVo.householdCode}'/>" 
												class="btn btn-light btn-wishlist">
			                                    <span class="add-to-cart">이용 신청</span>
			                                </a>
			                                <a href="<c:url value='/living/add/addFacilityDetail.do?addNo=${vo.addNo }'/>" 
			                                	class="btn btn-primary btn-wishlist">
			                                    <span class="add-to-cart">상세 정보</span>
		                                	</a>
										</c:otherwise>									
									</c:choose>	
								</div>
							</div>
						</div>
						
					</c:forEach>
				</c:if>		
						<!-- 시설 카드1개 : 끝  -->
<!-- 시설카드 반복구간 : 끝  -->

					
			</div>
        <!-- 시설카드 div : 끝   class="row" -->
<!-- 페이저 시작-->
  			<section id="ecommerce-pagination">
                        <div class="row">
                            <div class="col-sm-12">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center mt-2">
                                       <!-- 이전블럭으로(이전페이지) -->
										<c:if test="${pager.firstPage>1 }">
											<li class="page-item">
											<a class="btn-light page-link" href="#" onclick="pageFunc(${pager.firstPage-1})" 
													aria-label="Previous">
											 	<span aria-hidden="true">&laquo;</span>
											</a>
											</li>
										</c:if>


								<!-- 블록 시작 : [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pager.firstPage}" end="${pager.lastPage}">
									<c:if test="${i==pager.currentPage }">
										<li class="page-item">
										<span style="color: #5c9f24; font-weight: bold" class="btn-light:hover page-link">
												${i}</span></li>
									</c:if>
									<c:if test="${i!=pager.currentPage }">
										<li class="page-item"><a href="#"
											onclick="pageFunc(${i})" class="page-link"> ${i}</a></li>
									</c:if>
								</c:forEach>
								<!-- 블록 끝 : [1][2][3][4][5][6][7][8][9][10] -->

								<!-- 다음블럭으로(다음페이지) -->

								<c:if test="${pager.lastPage < pager.totalPage }">
									<li class="page-item"><a class="btn-light page-link" href="#"
										onclick="pageFunc(${pager.lastPage+1})" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </section>

<!-- 페이저 끝-->



      </div>
      <!-- /.col-lg-9 -->

      <div class="col-lg-3 pt-0">
        <div class="list-group" name="addCtg" id="addCtg">
         <a href="<c:url value='/living/add/addFacilityList.do'/>" class="list-group-item" onclick="pageFunc(1)">전체보기</a>
          <a href="javascript:void(0);" class="list-group-item" onclick="addCtgNum(1)" data-value="1">특화시설</a>
          <a href="javascript:void(0);" class="list-group-item" onclick="addCtgNum(2)" data-value="2">교육시설</a>
          <a href="javascript:void(0);" class="list-group-item" onclick="addCtgNum(3)" data-value="3">문화시설</a>
          <a href="javascript:void(0);" class="list-group-item" onclick="addCtgNum(4)" data-value="4">스포츠시설</a>
          <a href="javascript:void(0);" class="list-group-item" onclick="addCtgNum(5)" data-value="5">편의시설</a>
        </div>
<br>
        <div class="list-group">
     
          <a href="<c:url value='/living/add/addOrderList.do?householdCode=${sessionScope.memVo.householdCode}'/>" 
          class="list-group-item text-center" ><i data-feather="user-check"></i>&nbsp;이용중인 시설</a>
		        <!-- 이용중인 시설 목록 -->
		    	   <div class="card card-body">
		        <c:if test="${!empty orderList }">
		         	<c:forEach var="orderVo" items="${orderList}">
		    	      	<p id="orderList">${orderVo.addName }</p>
		         	</c:forEach>
		        </c:if>
		        <c:if test="${empty orderList }">
		    	      	<p id="emptyOrder" class="text-center">이용중인 시설이 없습니다.</p>
		        </c:if>
    	  </div>
        </div>

      </div>
      <!-- /.col-lg-3 -->


    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

	</div><!-- yiWrapper -->
<div class="clearfix"></div>
  <script type="text/javascript">
  feather.replace();
  </script>
  <!-- Bootstrap core JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<%@ include file="../../mainInc/mainBottom.jsp" %>