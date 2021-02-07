<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/adminMasterTop.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$('#MasterApt').addClass('active');

	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	function ajaxCode(){
		$.ajax({
			url:"<c:url value='/admin/adminMaster/ajaxCode.do'/>",
			type:"get",
			data:"aptNo="+$('#findCode').val(),
			success:function(res){
				$('#codeSpan').html("해당 아파트 소유주의 세대키 :" + res);
			},
			error:function(xhr, status, error){
				alert(error);
			}
		});
	}
	
	function sendAptNo(idx, obj){
		$('#findCode').val(idx);
		$(obj).parent().children().css("background","");
		$(obj).css("background", "#D3D3D3");
		ajaxCode();
	}
	
	$(function(){
		$('#excel').click(function(){
			location.href="<c:url value='/admin/adminMaster/excelDown.do'/>"
		});
	});
</script>
    <!-- BEGIN: Content-->
    <form name="frmPage" method="post" id="frmPage">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchCondition" value="${param.searchCondition }">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	</form>
	<input type="hidden" id="findCode">
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
			<div class="content m-1">
				<h2 style="display:inline;">HOUSEMUCH 이용중인 아파트 목록</h2>
				<br><span>소유주가 아직 등록하지 않은 아파트까지 조회합니다.</span>
				<span>(총 : ${pagingInfo.totalRecord }건)</span>
				<button class="btn btn-icon rounded-circle btn-outline-primary waves-effect" id="excel" style="float: right;">
					EXCEL
				</button>
			</div>
        <div class="content-wrapper ml-1 mr-1">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- Dashboard Ecommerce Starts -->
                <section id="dashboard-ecommerce">
                    
                    <div class="row match-height mt-1" style="height: 70vh">
                        <!-- Company Table Card -->
                        <div class="col-lg-12 col-12">
                            <div class="card card-company-table">
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table table-hover" style="text-align: center;">
                                            <thead>
                                                <tr style="font-size: 15px;">
                                                    <th style="width:5%">NO</th>
                                                    <th style="width:15%">아파트 이름</th>
                                                    <th style="width:40%">상세 주소</th>
                                                    <th style="width:10%">소유주</th>
                                                    <th style="width:20%;">연락처</th>
                                                    <th style="width:5%">세대</th>
                                                    <th style="width:5%">비고</th>
                                                </tr>
                                            </thead>
                                            <tbody>          
	                                            <c:if test="${empty aptList }">
	                                            	<tr>
	                                            		<td colspan="5"> 등록된 아파트가 없습니다.</td>
	                                            	</tr>
	                                            </c:if>
	                                            
	                                            <c:if test="${!empty aptList }">
	                                            	<c:forEach var="map" items="${aptList }">
		                                            	<tr onclick="sendAptNo('${map['APT_NO'] }', this)">
		                                            		<td>${map['APT_NO'] }</td>
		                                            		<td>${map['APT_NAME'] }</td>
		                                            		<td>${map['ADDRESS'] }&nbsp;${map['ADDRESS_DETAIL'] }</td>
		                                            		<c:if test="${empty map['MEMBER_NAME'] }">
		                                            			<td colspan="2">등록 대기 중</td>
		                                            		</c:if>
		                                            		<c:if test="${!empty map['MEMBER_NAME'] }">
		                                            			<td>${map['MEMBER_NAME'] }</td>
			                                            		<td style="text-align: left;">
			                                            			<c:if test="${!empty map['EMAIL'] }">${map['EMAIL'] }</c:if>
			                                            			<c:if test="${!empty map['HP1'] }"><br> ${map['HP1'] }-${map['HP2'] }-${map['HP3'] }</c:if>
			                                            		</td>
		                                            		</c:if>
		                                            		<td>${map['TOTAL_HOUSEHOLD'] }</td>
		                                            		
															<td>
																<div class="dropdown">
																	<button type="button"
																		class="btn btn-sm dropdown-toggle hide-arrow"
																		data-toggle="dropdown">
																		<i data-feather="more-vertical"></i>
																	</button>
																	<div class="dropdown-menu">
																		<a class="dropdown-item"
																			href="<c:url value='/admin/adminMaster/adminAptEdit.do?aptNo=${map["APT_NO"] }'/>">
																			<i data-feather="edit-2" class="mr-50"></i> 
																			<span>수정</span>
																		</a> <a class="dropdown-item" onclick="return confirm('해당 아파트를 삭제하시겠습니까 ?');"
																			href="<c:url value='/admin/adminMaster/adminAptDel.do?aptNo=${map["APT_NO"] }'/>">
																			<i data-feather="trash" class="mr-50"></i> <span>삭제</span>
																		</a>
																	</div>
																</div>
															</td>		                                            	
		                                            	
		                                            	</tr>                                            	
	                                            	</c:forEach>
	                                            </c:if>
                                            	
                                            	
                                            </tbody>
                                        </table>
                                        <div id="AptCode" style="text-align: left; color:blue;" class="mb-0 mt-1 d-flex ml-1">
			                        		<span id="codeSpan"> </span>
			                        	</div>
                                    </div>
                                    <div class="divPage">
									   <!-- 페이지 번호 추가 -->
									   <!-- 이전 블럭으로 이동 -->
									   <nav aria-label="Page navigation">
										   <ul class="pagination justify-content-center mt-2">
										   <c:if test="${pagingInfo.firstPage>1}">
										 	  <li class="page-item prev"><a class="page-link" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"></a></li>
										   </c:if>
										   
										   <!-- [1][2][3][4][5][6][7][8][9][10] -->
										   <c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
										      	<c:if test="${i==pagingInfo.currentPage}">
											    	<li class="page-item active"><a class="page-link" href="javascript:void(0);"> ${i}</a> </li>
												</c:if>
										     	<c:if test="${pagingInfo.currentPage!=i}">
										     		<li class="page-item">
										 			<a href="#" class="page-link" onclick="pageFunc(${i})" >
										 				${i}</a>
											      	</li>
										     	 </c:if>
										   </c:forEach>
										   <!-- 다음 블럭으로 이동 -->
										   <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
										 	<li class="page-item next"><a class="page-link" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"></a></li>
										   </c:if>
										   <!--  페이지 번호 끝 -->
										   </ul>
									   </nav>
									</div>
									<!-- search -->
									<div class="mt-2 mb-2 d-flex align-items-center justify-content-center" style="text-align: center">
								      <form name="frmSearch" method="post" action="<c:url value='/admin/adminMaster/adminMasterApt.do'/>" style="display:flex;">
								       
								        <div class="invoice_status ml-sm-2 row mr-2">
									        <select name="searchCondition" class="form-control ml-50 mr-2 text-capitalize" style="width:150px;">
									
									          <option value="apt_name"
									               <c:if test="${'apt_name'==param.searchCondition}">
									                  selected="selected"
									              </c:if>
									            >아파트 명</option>
									            <option value="member_name"
									               <c:if test="${'member_name'==param.searchCondition}">
									                  selected="selected"
									              </c:if>
									            >소유주</option>
									            
									        </select> 
								        </div>
								        
								        <div class="dataTables_filter row mr-2">  
									    <input class="form-control row d-flex" type="text" name="searchKeyword" title="검색어 입력" style="width:200px;" id="searchApt" value="${param.searchKeyword }">   
									    </div>
									    
									    <button class="btn btn-icon rounded-circle btn-outline-primary waves-effect" type="submit" id="submit">
									    <svg xmlns="http://www.w3.org/2000/svg" class="feather feather-search" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="14" height="14"><circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" /></svg>
									    </button>
								       </form>
									</div>
									<!-- /search -->
                                </div>
	                        	
                            </div>
                        </div>
                        <!--/ Company Table Card -->

           
                    </div>
                </section>
                <!-- Dashboard Ecommerce ends -->

            </div>
        </div>
    </div>
   
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-light" style="background-color: black; color: white; margin-top: 100px;">
        <p class="clearfix mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2020<a class="ml-25" href="https://1.envato.market/pixinvent_portfolio" target="_blank">Pixinvent</a><span class="d-none d-sm-inline-block">, All rights Reserved</span></span><span class="float-md-right d-none d-md-block">Thanks to 수빈 영조 이나 한희<i data-feather="heart"></i></span></p>
    </footer>
    <button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
    <!-- END: Footer-->


    <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/charts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/extensions/toastr.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/pages/dashboard-ecommerce.js"></script>
    <!-- END: Page JS-->
    <script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        })
    </script>
</body>
<!-- END: Body-->

</html>