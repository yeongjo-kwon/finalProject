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
	console.log(i);
	index=i;
}   
//시설 분류 클릭하면 리스트 업데이트되게 처리
$(function(){
	
	console.log('index= ' +index );
	$('#addCtg a').click(function(){
		var CtgName = $(this).text();
		console.log("선택한카테고리 분류명은 "+CtgName);
		$(this).attr('class','list-group-item a-index');//bg컬러변경
		
		var CtgNo = index;
		console.log("선택한카테고리 번호는"+CtgNo); 
		
		$.ajax({
			url: "<c:url value='/living/add/addInfoCategoryList.do'/>",
			type:'get',
			dataType:'json',
			data:
				"addCtgName="+$(this).text()+"&addCtgNo="+CtgNo
			,error:function(xhr, status,error){
				alert("에러"+error);
			},success:function(result){
				//리스트 객체로 받아오기 serializeArray
					if(result.length>0){
						var str="";
						//each돌려서 각각 
						$.each(result,function(){
							str += "번호 - "+result.addNo+"<br>";
							str += "분류번호 - "+result.addCtgNo+"<br>";
							str += "분류명 - "+result.addCtgName+"<br>";
							str += "이름 - "+result.addName+"<br>";
							str += "가격 - "+result.addPrice+"<br>";
							str += "이용자 수 - "+result.orderCnt+"<br>";
						});
						
					$('#divResult').html(str);
					}
					
			}
		}); 

});
	
		
	
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
	color: #ffffff;
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

</style>
<div class="clearfix" style="height:100px"></div>
<div class="yiWrapper" style="width:100%; min-height:700px; margin: 0 auto;">

   <!-- Page Content -->
  <div class="container">
  <div style="width:100%; min-height:100px;">
<h3 class="mb-10 apt-text-dark" style="font-size: 1.8em;">생활의 자부심을 높여주는 더 특별한 부가시설</h3>
<small style="color:#666">입주민의 활기찬 생활을 위한 건강시설부터 다양한 생활편의시설까지 일상이 특별해지는 특권을 누려보세요.</small>
  </div>
<hr>

    <div class="row">
      <div class="col-lg-9">
<!-- 오른쪽섹션인 col-9안에서 검색바랑 파라미터 넘기는거 일단 넣음 -->
<!-- searchKeyword , searchCondition 보내는 frmSearch 시작 -->     
                <!-- 검색어, 검색조건 넘기는 frmPage -->
                <form name="frmPage">
								<input type="hidden" name="currentPage"> 
							<input type="hidden" name="searchCondition" value="${param.searchCondition }" >
							<input type="hidden" name="searchKeyword"	value="${param.searchKeyword }" >
								
								
                    <!-- E-commerce Search Bar Starts : 부가시설 목록에서 검색-->
                    <section id="ecommerce-searchbar" class="ecommerce-searchbar pt-2 pb-5">
                        <div class="row mt-1">
                            <div class="col-sm-6">
                                <div class="input-group input-group-merge navbar-right">
                                    <input type="text" class="form-control search-product  p-1" id="shop-search" placeholder="부가시설을 검색하세요" 
                                    aria-label="Search..." aria-describedby="shop-search" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword}"/>
                                    <div class="input-group-append">
                                   <button class="btn btn-secondary" aria-hidden="true" style="padding-bottom:6px;"><i data-feather="search"></i></button> 
                                   </div>
                                </div>
                            </div>
                            <div class="col-sm-6"></div><!-- 검색창정렬용 -->
                        </div>
                    </section>
                    <!-- E-commerce Search Bar Ends : 부가시설 목록에서 검색 끝-->
			</form>
<!-- searchKeyword , searchCondition 보내는 frmSearch 끝 -->
<!-- 오른쪽섹션인 col-9안에서 검색바랑 파라미터 넘기는거 일단 넣음//끝 -->



<!-- 시설카드 div : 시작   class="row"  -->
        <div class="row mt-10" id="addInfoList">
	<div id="divResult"></div>
<!-- 시설카드 반복구간 : 시작 class="col-lg-4 col-md-6 mb-4"  -->
			<!-- 	<c:if test="${empty list }">
					<p>등록된 부가시설이 없습니다</p>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list}">

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#">
								 <img class="img-fluid card-img-top" 
                                	src="${pageContext.request.contextPath}/resources/aptAdmin_images/thumbnail-default.svg" 
                                	alt="시설썸네일" /></a>
									<div class="card-body">
									
									<h4 class="card-title">
									<a class="text-body" 
									    href="<c:url value='/admin/adminLiving/adminAdd/adminAddEdit.do?addNo=${vo.addNo }'/>">${vo.addName }</a></h4>
									
									
									<h5>월  ${vo.addPrice}원</h5>
									
									<p class="card-text">현재 이용자 수 : ${vo.orderCnt }</p>
								</div>

								<div class="btn-group card-footer text-center p-0" role="group">
									<a href="<c:url value='/living/add/addOrder.do?addNo=${vo.addNo }'/>" class="btn btn-light btn-wishlist">
	                                    <span class="add-to-cart">이용 신청</span>
	                                </a>
	                                <a href="<c:url value='/living/add/addFacilityDetail.do?addNo=${vo.addNo }'/>" class="btn btn-primary btn-wishlist">
	                                    <span class="add-to-cart">상세 정보</span>
                                </a>
								</div>
							</div>
						</div>
						
					</c:forEach>
				</c:if>		-->
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
										<li class="page-item"><span
											style="color: #5c9f24; font-weight: bold" class="btn-light:hover page-link">
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
          <a href="javascript:void(0);" class="list-group-item" onclick="javascript:addCtgNum(1)">특화시설</a>
          <a href="javascript:void(0);" class="list-group-item" onclick="javascript:addCtgNum(2)">교육시설</a>
          <a href="javascript:void(0);" class="list-group-item" onclick="javascript:addCtgNum(3)">문화시설</a>
          <a href="javascript:void(0);" class="list-group-item" onclick="javascript:addCtgNum(4)">스포츠시설</a>
          <a href="javascript:void(0);" class="list-group-item" onclick="javascript:addCtgNum(5)">편의시설</a>
        </div>
<br>
        <div class="list-group">
          <a href="#" class="list-group-item">우리집 이용시설 보기</a>
          <%-- <a href="<c:url value='/living/add/applicationAdd.do'/>" class="list-group-item">신청화면(작업용)</a> --%>
        </div>

      </div>
      <!-- /.col-lg-3 -->


    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

	</div><!-- yiWrapper -->
<div class="clearfix"></div>
  <script>
  feather.replace();
  </script>
  <!-- Bootstrap core JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<%--   <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/ynResources/main.js"></script> --%>
      
<%@ include file="../../mainInc/mainBottom.jsp" %>