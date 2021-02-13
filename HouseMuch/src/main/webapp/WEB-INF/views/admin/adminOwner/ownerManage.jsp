<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/subinJs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){		
		
		$('#repeatFrm').submit(function(){
			if($('#authCode').val()=="0"){
				alert('관리자 권한을 선택해주세요!');
				return false;
			}
		});
		//editName editCode
		$('button[name=editbtn]').on('click',(function(){
			var editCode=$(this).next().val();
			var authCode=$(this).next().next().val();
			
			$('#editCode').val(editCode);
			$('#editAuth').val(authCode);
		}));
		
	});

</script>

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
				              <select class="select form-control form-control-lg" name="authCode" id="authCode" aria-describedby="authCode">
				                <option value="0">권한</option>
				                <c:forEach var="auth" items="${authList}">
									<option value="${auth.authCode}">${auth.authName}</option>	                
				                </c:forEach>
				              </select>
		                    </div>
		                  </div>
		                  
		                  <div class="col-md-6 col-12">
		                    <div class="form-group">
		                      <label for="householdCode">코드키 발급</label>
		                      <input type="text" class="form-control" id="householdCode"
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
		                   <label for="staticguide">해당 코드로 가입시 관리자 권한이 주어집니다</label>
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
	                        <table class="table" id="table">
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
	                            	<c:if test="${empty adList }">
	                            		<tr><td colspan="7">관리자를 추가해주세요</td></tr>
	                            	</c:if>
	                            	<c:if test="${!empty adList }">
		                            	<c:forEach var="adVo" items="${adList }">
		                            
			                                <tr>
			                                    <td>
			                                        <div class="d-flex align-items-center" style="text-align: center;">
			                                            <div>
			                                                <div>
				                                                <c:if test="${empty adVo.memberNo }">
				                                                	<span>&nbsp;</span>
				                                                </c:if>
				                                                <c:if test="${!empty adVo.memberNo }">
				                                                	${adVo.memberNo}
				                                                </c:if>
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </td>
			                                    
			                                    <td>
			                                        <div class="d-flex align-items-center">
			                                            <span>${adVo.authName }</span>
			                                        </div>
			                                    </td>
			                                    
			                                    <td class="text-nowrap">
			                                        <div class="d-flex flex-column">
		                                                <c:if test="${empty adVo.memberName }">
		                                                	<span class=" mb-25">미등록</span>
		                                                </c:if>
		                                                <c:if test="${!empty adVo.memberName }">
		                                                	<span class=" mb-25">${adVo.memberName }</span>
		                                                </c:if>			                                        	
			                                        </div>
			                                    </td>
			                                    
			                                    <td>
				                                    <c:if test="${empty adVo.id }">
	                                                	미등록
	                                                </c:if>
	                                                <c:if test="${!empty adVo.id }">
	                                                	<span>${adVo.id }</span>
	                                                </c:if>	
			                                    </td>
			                                    
			                                    <td>
			                                        <div class="d-flex align-items-center">                    
					                                    <c:if test="${empty adVo.email }">
		                                                	<span class="mr-1">미등록</span>
		                                                </c:if>
		                                                <c:if test="${!empty adVo.email }">
		                                                	<span class="mr-1">${adVo.email}</span>
		                                                </c:if>		
	                                                </div>		                                        
			                                    </td>
			                                    
			                                    <td>
			                                    	<span>${adVo.householdCode}</span>
			                                    </td>
			                                    
												<td>
													<div class="dropdown">
														<button type="button" class="btn btn-sm dropdown-toggle hide-arrow" data-toggle="dropdown" id="edit" name="editbtn">
															<i data-feather="more-vertical"></i>
														</button>
														<input type="hidden" value="${adVo.householdCode }" id="householdCode">
														<input type="hidden" value="${adVo.authCode}" id="authCode">
														<div class="dropdown-menu">
															<a class="dropdown-item" data-toggle="modal" data-target="#editForm">
																<i data-feather="edit-2" class="mr-50"></i> 
																<span>수정</span>
															</a> <a class="dropdown-item" onclick="return confirm('해당 관리자 를 삭제하시겠습니까 ? 관리자 정보가 전부 사라집니다.');"
																href="<c:url value='/admin/adminOwner/ownerManageDel.do?householdCode=${adVo.householdCode }'/>">
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
	                                <h4 class="modal-title" id="myModalLabel33">관리자 권한 수정</h4>
	                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                    <span aria-hidden="true">&times;</span>
	                                </button>
	                            </div>
	                            
	                            <form action="<c:url value='/admin/adminOwner/ownerManageEdit.do'/>" method="post">
	                                <div class="modal-body">
	
	                                    <label>권한 </label>
	                                    <div class="form-group">
	                                        <select class="form-control col-6" aria-describedby="authCode" name="authCode" id="editAuth">
					                      	<option value="0">권한</option>
							                <c:forEach var="auth" items="${authList}">
												<option value="${auth.authCode}">${auth.authName}</option>	                
							                </c:forEach>
					                      </select>
					                      <input type="hidden" name="householdCode" id="editCode">
	                                    </div>
	                                </div>
	                                <div class="modal-footer">
	                                    <input type="submit" class="btn btn-primary" value="수정">
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
    
