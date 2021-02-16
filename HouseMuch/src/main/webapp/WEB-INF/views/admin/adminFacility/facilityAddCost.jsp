<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/subinJs/form-repeater-bin.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){

	}
	
</script>


	<!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
     
     <div class="content-wrapper">
       <div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">보수 업체 추가 비용</h2>
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">추가 비용 관리</li>
						</ol>
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
		          <h4 class="card-title">보수 비용 추가 등록</h4>
		          <br>
		        </div>
		        <div class="card-body">
		          <form class="invoice-repeater-bin">
		            <div data-repeater-list="invoice">
		              <div data-repeater-item>
		                <div class="row d-flex align-items-end">
		                
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                    	<label for="mngCompName">관리 업체</label>
								<select class="select2 form-control form-control-lg" id="mngCompName" name="mngCompName">
								  <option value="0">관리 업체</option>
								  <option value="mngCompNo">mngCompName</option>				                
								</select>
		                    </div>
		                  </div>
              
		                  <div class="col-md-4 col-12">
		                    <div class="form-group">
		                    	<label for="mngCompInfo">정보</label>
		                      	<input type="text" class="form-control" id="mngCompInfo" aria-describedby="mngCompInfo" name="mngCompInfo" />
		                    </div>
		                  </div>
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="mngCompAdd">추가 요금</label>
		                      <input type="number" class="form-control" id="mngCompAdd" aria-describedby="mngCompAdd" name="mngCompAdd" placeholder="원" style="text-align:right;"/>
		                    </div>
		                  </div>
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="relation">수리 날짜</label><br>
		                      <input type="text" class="form-control" id="mngCompAddDate" aria-describedby="mngCompAddDate" name="mngCompAddDate" placeholder="YYYY-MM-DD"/>
		                    </div>
		                  </div>
		
		                  
		
		                  <div class="col-md-2 col-12 mb-50">
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
		              	<input type="submit" id="regSubmit" class="btn btn-primary" style="float:right;" value="등록">
		              </div>
		              
		            </div>
		            
		          </form>
		          
		        </div>
		      </div>
		    </div>
		    <!-- /Invoice repeater -->
		  </div>
		</section>
		
	
        <div class="content-body">
               <!-- Ajax Sourced Server-side -->
        	<section id="residentTable_section">
            	<div class="row">
                	<div class="col-12">
                    	<div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-title">추가 비용 내역 조회</h4>
                                <h6>미승인건 :()건</h6>
                            </div>
                            <div class="card p-2">
                            	<table class="table" style="text-align:center;">
	                                <thead>
	                                    <tr style="text-align: center;">
	                                        <th style="width:5%;">NO</th>
	                                        <th style="width:20%;">업체명</th>
	                                        <th style="width:10%;">상세내용</th>
	                                        <th style="width:10%;">추가비용</th>
	                                        <th style="width:10%;">날짜</th>
	                                        <th style="width:10%;">청구 유무</th>
	                                        <th style="width:10%;">&nbsp;</th>
	                                    </tr>
	                                </thead>
                               </table>
                               
                             </div>
                         </div>
                     </div>
                 </div>
             </section>
		</div>

        <!-- table -->
			
	
		</div>
	</div>
</div>
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
<!-- BEGIN: Page Vendor JS-->
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
<!-- END: Page Vendor JS-->
    
