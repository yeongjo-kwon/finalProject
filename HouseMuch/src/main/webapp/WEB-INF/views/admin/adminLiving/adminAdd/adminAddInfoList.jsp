<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/adminTop.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

   <!-- START : Content -->
<script type="text/javascript">

$(function(){
	$('#addCtg').click(function(){
			console.log($('#addCtg option:selected').text());//시설분류명
			console.log($('#addCtg option:selected').val());//분류번호
			
			var addCtgName = $('#addCtg option:selected').text();
			var addCtgNo =  $('#addCtg option:selected').val();
		if(addCtgNo != 0 && addCtgName.length>0 ){
			$('input[name=searchCondition]').val("ADD_CTG_NAME");
			$('input[name=searchKeyword]').val(addCtgName);
		console.log($('input[name=searchKeyword]').val());//검색어읽어옴
			pageFunc(1);
		}
	}); 
	
	$('#btSearch').on('click',function(){
		console.log($('#searchBox').val());//검색어읽어옴
		var search = $('#searchBox').val();
		if(search.length>0){
			//$('input[name=searchCondition]').val("ADD_NAME");
			$('input[name=searchCondition]').val("ADD_NAME");
			$('input[name=searchKeyword]').val(search);
		console.log($('input[name=searchKeyword]').val());//검색어읽어옴
			pageFunc(1);
		}
	});
	
	
	 $('.addinfoOut').click(function(){
		 var outvalue=$(this).val();
		 console.log(outvalue);

		if(confirm('운영중단 시점부터 이용신청 접수가 불가능합니다. 운영중단하시겠습니까?')){
			console.log("삭제한다");	
			location.href="<c:url value='/admin/adminLiving/adminAdd/adminAddDel.do?addNo="+outvalue+"'/>";
		}else{
			console.log("삭제안한다");	
			event.preventDefault();
		}
	}); 
});

  
function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}



</script>

<style type="text/css">
#imgcard img{
    height: 15rem;
	object-fit: cover;
}
</style>
<!-- 컨텐츠시작 -->
<!-- searchKeyword , searchCondition 보내는 frmSearch 시작 -->     
                <!-- 검색어, 검색조건 넘기는 frmPage -->
                <form name="frmPage" method="post" 
					  action='<c:url value="/admin/adminLiving/adminAdd/adminAddInfoList.do"/>'>
				<!-- hidden -->
					<input type="hidden" name="currentPage"> 
					<input type="hidden" name="searchCondition" value="">
					<input type="hidden" name="searchKeyword"	value="">
				<!-- hidden 끝-->
								
    <div class="app-content content ecommerce-application">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">부가시설 목록</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<c:url value='/admin/adminLiving/adminLiving.do'/>">행정관리 메인</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="<c:url value='/admin/adminLiving/adminAdd/adminAddInfoList.do'/>">부가시설 목록</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">부가시설 목록</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                    <div class="form-group breadcrumb-right">
                        <div class="dropdown">
        		
    						<a href="<c:url value='/admin/adminLiving/adminAdd/adminAddDelList.do'/>">
	                            <button class="btn-icon btn btn-outline-danger bg-white btn-round btn-sm dropdown-toggle" type="button" 
	                            style="vertical-align: center;line-height:1">
	                            <i data-feather="list"></i>&nbsp;운영 중단 시설</button>
    						</a>
                             
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            
            <!-- content-body지우고 전체너비로 들어감 -->
            
            <div class="content-detached">
                <div class="content-body">
                
                

								
                    <!-- E-commerce Content Section Starts : 부가시설 분류선택 -->
                    <section id="ecommerce-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="ecommerce-header-items">
                                    <div class="result-toggler">
                                        <button class="navbar-toggler shop-sidebar-toggler" type="button" data-toggle="collapse">
                                            <span class="navbar-toggler-icon d-block d-lg-none"><i data-feather="menu"></i></span>
                                        </button>
                                       
                                    </div>
                                    
                                
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- E-commerce Content Section Starts : 부가시설 분류선택  -->

                    <!-- background Overlay when sidebar is shown  starts-->
                    <div class="body-content-overlay"></div>
                    <!-- background Overlay when sidebar is shown  ends-->

                    <!-- E-commerce Search Bar Starts : 부가시설 목록에서 검색-->
                    <section id="ecommerce-searchbar" class="ecommerce-searchbar">
                            <div class="row mt-1 p-1">
                                <div class="col col-sm-4 p-0">
                                 <!-- 검색결과 개수 안내-->
                                        <div class="search-results">
	                                        <c:if test="${!empty param.searchKeyword }">
	                                       		<p class="col align-right font-lg" style="font-size: 1.2em;line-height: 2" >검색결과 : ${param.searchKeyword},  ${pager.totalRecord } 건</p>
	                                        </c:if>
                                        </div>
                                </div>
                                <div class="col col-sm-3 p-0">
                                		<!-- 시설분류 드롭다운 시작 -->
                                    <div class="breadcrumb-right">
                                        <div class="dropdown-sort select-size-lg">
                                            <select class="btn select-size-lg btn-outline-primary ml-2" id="addCtg" style="width: 85%"> 
                                            <!-- data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" -->
                                            	<c:if test="${empty addCtgList}">
                                            		<option class="dropdown-menu active-sorting p-0" value="0">시설 분류별 보기</option>
                                            	</c:if>
                                            	<c:if test="${!empty addCtgList}">
                                            		<c:forEach var="ctg" items="${addCtgList}">
                                            			<option class="dropdown-menu active-sorting p-0" value="0" selected="selected">시설 분류별 보기</option>
	                                            		<option class="dropdown-items" value="${ctg.addCtgNo}">${ctg.addCtgName}</option>
                                            		</c:forEach>
                                            	</c:if>

                                            </select>
                                        </div>
                                    </div>
								<!-- 시설분류 드롭다운  끝 -->
                                </div>
                            
                                <div class="col input-group input-group-merge col-sm-5 p-0">
                                    <input type="text" class="form-control search-product" id="searchBox" placeholder="부가시설명으로 검색하세요" 
                                    title="검색어 입력" value=""/>
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="btSearch">
                                        <i data-feather="search"></i></span>
                                    </div>
                                </div>
                            </div>
                    </section>
                    <!-- E-commerce Search Bar Ends : 부가시설 목록에서 검색 끝-->
			</form>
<!-- searchKeyword , searchCondition 보내는 frmSearch 끝 -->


                    <!-- E-commerce Products Starts -->
                    <section id="ecommerce-products" class="grid-view">
		                  <c:if test="${empty list }">
		                  	<p>등록된 부가시설이 없습니다</p>
		                  </c:if>
<c:if test="${!empty list }">
  <c:forEach var="vo" items="${list}">
                  
                  
                        <!-- 시설카드 : 시작 -->
                        <div class="card ecommerce-card">
                            
                            <!-- 썸네일 -->
                            <div class="item-img text-center p-0 position-relative" id="imgcard" >
                            	<span class="badge rounded-pill bg-primary text-white position-absolute end-0 mt-1 ml-1 p-1 fw-lighter float-end" >
                            	${vo.addCtgName}</span>
                                <a href="app-ecommerce-details.html">
                            <c:if test="${vo.addinfoImgOriginalFilename == 'thumbnail-default.svg'}">
                                <img class="img-fluid card-img-top" alt="등록된 이미지가 없습니다"
                                src="${pageContext.request.contextPath}/resources/aptAdmin_images/thumbnail-default.svg"/></a>
                            </c:if>    
                            <c:if test="${vo.addinfoImgOriginalFilename != 'thumbnail-default.svg' }">
                                
                                <img class="img-fluid card-img-top" 
                                src="${pageContext.request.contextPath}/resources/aptAdmin_images/add_thumbnail/${vo.addinfoImgOriginalFilename}" 
                                alt="${vo.addName}" />
                            </c:if>
                            </div>
                            
                            <div class="card-body">
                            <!-- 요금줄 -->
                                <h3 class="card-text"><b>${vo.addName}</b></h3>
                                <!-- 등록일 -->
                                <h3 class="card-text item-description mb-2">
                                	등록일 : <fmt:formatDate value="${vo.addRegdate}" pattern="yyyy-MM-dd"/>
                                </h3>
                                <div class="item-wrapper">
                                    <div class="item-rating">
                                <!-- 현재 이용자 수 -->
                                <p class="card-text">현재 이용자 수 : ${vo.orderCnt }</p>
                                    
                                    </div>
                             
                                    <div>
                                        <div class="item-cost">
                                            <h6 class="item-price">월  ${vo.addPrice}원</h6>
                                        </div>
                                    </div>
                                </div>
                             
                                
                            </div>
                            <div class="item-options text-center">

                                <a href="<c:url value='/admin/adminLiving/adminAdd/adminAddResidence.do?addNo=${vo.addNo }'/>" class="btn btn-light btn-wishlist">
                                    <span class="add-to-cart">이용자 내역 조회</span>
                                </a>
                                <button type="button" class="btn btn-danger addinfoOut" value="${vo.addNo }" style="border-radius: 0">운영 중단</button>
                                <a href="<c:url value='/admin/adminLiving/adminAdd/adminAddEdit.do?addNo=${vo.addNo }'/>" class="btn btn-primary btn-wishlist">
                                    <span class="add-to-cart">상세정보 수정</span>
                                </a>
                            </div>
                        </div>
                        <!-- 시설카드 : 끝 -->
	</c:forEach>
</c:if><!-- 부가시설리스트 반복 끝 -->


                    </section>
                    <!-- E-commerce Products Ends -->

                    <!-- E-commerce Pagination Starts -->
                    <section id="ecommerce-pagination">
                        <div class="row">
                            <div class="col-sm-12">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center mt-2">
                                       <!-- 이전블럭으로(이전페이지) -->
								<c:if test="${pager.firstPage>1 }">
									<li class="page-item"><a class="page-link" href="#"
										onclick="pageFunc(${pager.firstPage-1})" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<!-- 블록 시작 : [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pager.firstPage}"
									end="${pager.lastPage}">
									<c:if test="${i==pager.currentPage }">
										<li class="page-item"><span
											style="color: blue; font-weight: bold" class="page-link">
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
									<li class="page-item"><a class="page-link" href="#"
										onclick="pageFunc(${pager.lastPage+1})" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </section>
                    <!-- E-commerce Pagination Ends -->

      
    <!-- END: Content-->
    <div class="clearfix"></div>

<%@ include file="../../adminInc/adminBottom.jsp" %>