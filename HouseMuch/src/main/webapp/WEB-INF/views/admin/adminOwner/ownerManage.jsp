<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<!-- 소유주의 관리자 관리 화면 
	관리자 등록버튼 누를시 바로 ajax 동기화 시켜서 아래에 현황에 보이게끔
	아직 코드만 발급하고 멤버 등록 안할시 미등록 출력
	관리자 목록 엑셀 출력
-->

	<!-- BEGIN: Content-->
	<div class="app-content content ">
     <div class="content-overlay"></div>
     <div class="header-navbar-shadow"></div>
     
     <div class="content-wrapper">
       <div class="content-header row">
         <div class="content-header-left col-md-9 col-12 mb-2">
           <div class="row breadcrumbs-top">
             <div class="col-12">
               <h2 class="content-header-title float-left mb-0">관리자 관리</h2>
               <div class="breadcrumb-wrapper">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item"><a href="<c:url value='admin/adminOwner/adminOwnerMain.do'/>">Home</a></li>
                   <li class="breadcrumb-item">아파트 관리</li>
                   <li class="breadcrumb-item active">관리자 관리</li>
                 </ol>
               </div>
             </div>
           </div>
         </div>
         
         
       </div>
       
       <div class="content-body">
       	<section class="form-control-repeater">
		  <div class="row">
		    <!-- Invoice repeater -->
		    <div class="col-12">
		      <div class="card">
		        <div class="card-header">
		          <h4 class="card-title">관리자 등록</h4>
		        </div>
		        <div class="card-body">
		          <form action="<c:url value='/admin/adminOwner/ownerMngReg.do'/>"
		          		class="invoice-repeater" method="post" name="repeatFrm" id="repeatFrm">
		            <div data-repeater-list="invoice">
		              <div data-repeater-item>
		                <div class="row d-flex align-items-end">
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="authCode">권한</label>
		                      
		                      <select class="form-control" id="mngcostMCtgNo"
		                      		aria-describedby="authCode" name="authCode">
		                      	<option value="0">권한</option>
		                      	
		                      	<!-- forEach . value에는 auth_code, 보여지는건엔 authName-->
						    	<option value="authCode1">회계 관리자</option>
						    	<option value="authCode2">시설 관리자</option>
						    	<option value="authCode3">행정 관리자</option>
						    	<!-- /forEach -->
						    	
		                      </select>
		                      
		                    </div>
		                  </div>
		                  
		                  
		                  <div class="col-md-6 col-12">
		                    <div class="form-group">
		                      <label for="householdCode">코드키 발급</label>
		                      <input type="text" class="form-control" id="mngcostContent"
		                      	aria-describedby="householdCode" placeholder="HOUSEMUCH001" name="householdCode" />
		                    </div>
		                  </div>
		
		                  
		
		                  <div class="col-md-4 col-12 mb-50">
		                    <div class="form-group">
		                      <button class="btn btn-outline-danger text-nowrap px-1" style="float:right; margin-bottom: 5px;" data-repeater-delete type="button">
		                        <i data-feather="x" class="mr-25"></i>
		                        <span>삭제</span>
		                      </button>
		                    </div>
		                  </div>
		                  
		                </div>
		                <hr />
		              </div>
		            </div>
		            <div class="row">
		              <div class="col-md-8 col-6">
		                <button class="btn btn-icon btn-outline-primary" type="button" data-repeater-create>
		                  <i data-feather="plus" class="mr-25"></i>
		                  <span>추가</span>
		                </button>
		              </div>
		              
		              <div class="col-md-4 col-6 d-flex" style="float:right; text-align: right; align-self: flex-end; justify-content: flex-end">
		                 <div class="form-group mr-2 mb-0" style="align-self: flex-end;">
		                   <label for="staticprice">해당 코드로 가입시 관리자 권한이 주어집니다</label>
		                 </div>
		             
		              	<input type="submit" class="btn btn-primary" style="float:right;" value="등록">
		              </div>
		              
		            </div>
		            
		          </form>
		          
		        </div>
		      </div>
		    </div>
		    <!-- /Invoice repeater -->
		  </div>
		</section>
		
		<div class="row match-height">
	        <!-- Company Table Card -->
	        <div class="col-lg-12 col-12">
	            <div class="card card-company-table">
		            <div class="card-header">
			          <h4 class="card-title">관리자 조회</h4>
			        </div>
	                <div class="card-body p-0">
	                    <div class="table-responsive">
	                        <table class="table">
	                            <thead>
	                                <tr>
	                                    <th style="width:5%">No</th>
	                                    <th style="width:15%">권한</th>
	                                    <th style="width:10%">이름</th>
	                                    <th style="width:10%">아이디</th>
	                                    <th style="width:15%">이메일</th>  
	                                    <th style="width:10%">세대코드</th>  
	                                    <th style="width:5%">비고</th>  
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td>
	                                        <div class="d-flex align-items-center">
	                                            <div>
	                                                <div>3</div>
	                                            </div>
	                                        </div>
	                                    </td>
	                                    
	                                    <td>
	                                        <div class="d-flex align-items-center">
	                                            <span>시설 관리자</span>
	                                        </div>
	                                    </td>
	                                    
	                                    <td class="text-nowrap">
	                                        <div class="d-flex flex-column">
	                                            <span class=" mb-25">이름이</span>
	                                        </div>
	                                    </td>
	                                    <td>dkdlelwlfhd</td>
	                                    <td>
	                                        <div class="d-flex align-items-center">
	                                            <span class="mr-1">email@email.com</span>
	                                        </div>
	                                    </td>
	                                    <td>tpeozhemdlqslek12</td>
										<td>
											<div class="dropdown">
												<button type="button" class="btn btn-sm dropdown-toggle hide-arrow" data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" data-toggle="modal" data-target="#editForm" >
														<i data-feather="edit-2" class="mr-50"></i> 
														<span>수정</span>
													</a> <a class="dropdown-item" onclick="return confirm('해당 관리자 를 삭제하시겠습니까 ?');"
														href="<c:url value='#'/>">
														<i data-feather="trash" class="mr-50"></i> <span>삭제</span>
													</a>
												</div>
											</div>
										</td>
	                                </tr>
	                                
	                                
	                            </tbody>
	                        </table>
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!--/ Company Table Card -->
			
			<!-- Modal - 수정  -->
			<div class="demo-inline-spacing col-6">
	            <div class="form-modal-ex">
	                
	                <!-- Modal -->
	                <div class="modal fade text-left" id="editForm" tabindex="-1" role="modal" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered" role="document">
	                        <div class="modal-content">
	                            <div class="modal-header">
	                                <h4 class="modal-title" id="myModalLabel33">관리자 수정</h4>
	                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                    <span aria-hidden="true">&times;</span>
	                                </button>
	                            </div>
	                            <form action="#">
	                                <div class="modal-body">
	                                    <label>이름 </label>
	                                    <div class="form-group">
	                                        <span id="memberName">관리자 이름</span>
	                                        <input type="hidden" value="" name="memberName">
	                                    </div>
	
	                                    <label>권한 </label>
	                                    <div class="form-group">
	                                        <select class="form-control col-6" aria-describedby="authCode" name="authCode">
					                      	<option value="0">권한</option>
					                      	
					                      	<!-- forEach . value에는 auth_code, 보여지는건엔 authName-->
									    	<option value="authCode1">회계 관리자</option>
									    	<option value="authCode2">시설 관리자</option>
									    	<option value="authCode3">행정 관리자</option>
									    	<!-- /forEach -->
									    	
					                      </select>
					                      
	                                    </div>
	                                </div>
	                                <div class="modal-footer">
	                                    <button type="button" class="btn btn-primary" data-dismiss="modal">수정</button>
	                                </div>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	                
	                
	            </div>	
	
	
	    </div>		
		
       </div>
       </div>
     </div>
	</div>
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
    
