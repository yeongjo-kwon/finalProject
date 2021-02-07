<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<!-- 
	입주민 등록 및 목록 조회
	엑셀 업로드 및 다운로드
	- 동에 따라 호가 달라짐 (ajax)
-->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/subinJs.js"></script>
<script type="text/javascript">
	function checkFileType(filePath){
		var fileFormat=filePath.split(".");
		
		if(fileFormat.indexOf("xls")>-1||fileFormat.indexOf("xlsx")>-1){
			return true;
		}else{
			return false;
		}
	}
	
	
	function check(){
		var file=$("#excelFile").val();
		
		if(file==""||file==null){
			alert('파일을 선택해주세요.');
			return false;
		}else if(!checkFileType(file)){
			alert('엑셀 파일만 업로드 가능합니다.');
			return false;
		}
		
		if(confirm("업로드하시겠습니까?")){
			$('#excelUploadForm').submit();
			$.ajax({
				type:"POST",
				url:"<c:url value='/admin/adminOwner/excelUploadAjax.do'/>",
				data:{"excelFile":file},
				processData: false,
				contentType: false,
				success:function(data){
					alert('업로드 완료');
				},
				error:function(xhr, status, error){
					alert('error! : ' + error);
				}
			});
			
		}
		
	}
	
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
               <h2 class="content-header-title float-left mb-0">입주민 관리</h2>
               <div class="breadcrumb-wrapper">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item"><a href="<c:url value='admin/adminOwner/adminOwnerMain.do'/>">Home</a></li>
                   <li class="breadcrumb-item">아파트 관리</li>
                   <li class="breadcrumb-item active">입주민 관리</li>
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
		          <h4 class="card-title">입주민 추가 등록</h4>
		          <br>세대원을 추가 등록 할 수 있습니다.
		        </div>
		        <div class="card-body">
		          <form action="<c:url value='/admin/adminOwner/ownerMngReg.do'/>"
		          		class="invoice-repeater" method="post" name="repeatFrm" id="repeatFrm">
		            <div data-repeater-list="invoice">
		              <div data-repeater-item>
		                <div class="row d-flex align-items-end">
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="authCode">동</label>
		                      
		                      <select class="form-control" id="mngcostMCtgNo"
		                      		aria-describedby="dong" name="dong">
		                      	<option value="0">동</option>
		                      	
		                      	<!-- forEach . dong -->
						    	<option value="A">A동</option>
						    	<option value="B">B동</option>
						    	<option value="C">C동</option>
						    	<!-- /forEach -->
						    	
		                      </select>
		                      
		                    </div>
		                  </div>

		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="authCode">호</label>
		                      
		                      <select class="form-control" id="mngcostMCtgNo"
		                      		aria-describedby="ho" name="ho">
		                      	<option value="0">호수</option>
		                      	
		                      	<!-- forEach . ho -->
						    	<option value="101">101호</option>
						    	<option value="102">102호</option>
						    	<option value="201">201호</option>
						    	<!-- /forEach -->
						    	
		                      </select>
		                      
		                    </div>
		                  </div>
		                  
		                  
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="hMembName">이름</label>
		                      <input type="text" class="form-control" id="hMembName" aria-describedby="hMembName" name="hMembName" />
		                    </div>
		                  </div>
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="hMembName">생일</label>
		                      <input type="text" class="form-control" id="birth" aria-describedby="birth" name="birth" placeholder="ex)20000101"/>
		                    </div>
		                  </div>
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="relation">세대주 와의 관계</label><br>
		                      
		                      <select class="form-control" id="relation"
		                      		aria-describedby="relation" name="relation">
		                      	<option value="본인">본인</option>
		                     
						    	<option value="부모">부모</option>
						    	<option value="배우자">배우자</option>
						    	<option value="자녀">자녀</option>
						    	
						    	
		                      </select>
		                      
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
		
	
        <div class="content-body">
               <!-- Ajax Sourced Server-side -->
        	<section id="residentTable">
            	<div class="row">
                	<div class="col-12">
                    	<div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-title">입주민 조회</h4>
		                        <input type="button" class="btn btn-primary" value="업로드" data-toggle="modal" data-target="#uploadFrm">
                            </div>
                            <div class="residentTable card">
                            	<table class="residentTable datatables-ajax table">
	                                <thead>
	                                    <tr style="text-align: center;">
	                                        <th style="width:5%;">NO</th>
	                                        <th style="width:15%;">세대코드</th>
	                                        <th style="width:5%;">동</th>
	                                        <th style="width:5%;">호</th>
	                                        <th style="width:10%;">이름</th>
	                                        <th style="width:15%;">생년월일</th>
	                                        <th style="width:10%;">세대주 관계</th>
	                                        <th>비고</th>
	                                    </tr>
	                                </thead>
                               </table>
                             </div>
                         </div>
                     </div>
                 </div>
             </section>
		</div>

        <!--/ Ajax Sourced Server-side -->
			
			<!-- Modal   -->
			<div class="demo-inline-spacing col-6">
	            <div class="form-modal-ex">
	                
	                <!-- Modal -->
	                <div class="modal fade text-left" id="uploadFrm" tabindex="-1" role="modal" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered" role="document">
	                        <div class="modal-content">
	                            <div class="modal-header">
	                                <h4 class="modal-title" id="myModalLabel33">데이터 업로드</h4>
	                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                    <span aria-hidden="true">&times;</span>
	                                </button>
	                            </div>
	                            <form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action="<c:url value='/admin/adminOwner/excelUploadAjax.do'/>">
	                                <div class="modal-body">
	                                    <label for="excelFile" class="btn btn-primary">파일 찾기</label>
	                                    <input type="file" id="excelFile" name="excelFile" hidden="hidden" onchange="javascript:document.getElementById('file_route').value=this.value">
	                                    <input type="text" id="file_route" readonly style="width:300px;height:38px;border:hidden;border-bottom-style:inset;">
	                                </div>
	                                <div class="modal-footer">
	                                    <input type="button" onclick="check()" class="btn btn-primary" data-dismiss="modal" value="업로드">
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
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
<!-- BEGIN: Page Vendor JS-->
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
<!-- END: Page Vendor JS-->
    
