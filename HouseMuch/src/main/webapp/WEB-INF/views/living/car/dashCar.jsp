<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../user/dashinc/usertop.jsp"%>
<style>
.page-item.active .page-link {
    background-color: #7DB249 !important;
    border-color: #7DB249 !important;
}
.page-item.active {
    border-radius: 0;
    background-color: #E5F9F0 !important;
    border-color: #82E3C8 !important;
}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">
<script type="text/javascript">
$(function(){ 
	//carInfoN NO 차량번호 특이사항
	var tableN=$('#carInfoN').DataTable({
		ajax:{
			url:"<c:url value='/living/car/carListN.do'/>",
			type:"GET",
			dataSrc:''
		},
		columns:[
            {data:"carRegNo"},
            {data:"carNumber"},
            {data:"note"}
		],
		language: {
	        emptyTable: "데이터가 존재하지 않습니다",
	        lengthMenu: "페이지당 _MENU_ 개씩 보기",
	        info: "현재 _START_ - _END_ / _TOTAL_건",
	        infoEmpty: "데이터가 존재하지 않습니다",
	        infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
	        search: "검색",
	        zeroRecords: "일치하는 데이터가 없습니다.",
	        loadingRecords: "로딩중...",
	        processing:     "잠시만 기다려 주세요...",
	        paginate: {
	            previous: '&nbsp;',
	            next: '&nbsp;'
	        }
	    }
	});
	var tableY=$('#carInfoY').DataTable({
		ajax:{
			url:"<c:url value='/living/car/carListY.do'/>",
			type:"GET",
			dataSrc:''
		},
		columns:[
            {data:"carRegNo"},
            {data:"carNumber"},
            {data:"note"},
            {data:"regdate"},
            {data:"orderdate"}
		],
		language: {
	        emptyTable: "데이터가 존재하지 않습니다",
	        lengthMenu: "페이지당 _MENU_ 개씩 보기",
	        info: "현재 _START_ - _END_ / _TOTAL_건",
	        infoEmpty: "데이터가 존재하지 않습니다",
	        infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
	        search: "검색",
	        zeroRecords: "일치하는 데이터가 없습니다.",
	        loadingRecords: "로딩중...",
	        processing:     "잠시만 기다려 주세요...",
	        paginate: {
	            previous: '&nbsp;',
	            next: '&nbsp;'
	        }
	    }
	}); 
	//regdate
	$('#regDiv').css('visibility', 'hidden');

	$('#isVisitorYDiv').click(function(){
		$('#regDiv').css('visibility', 'visible');
	});
	$('#isVisitorNDiv').click(function(){
		$('#regDiv').css('visibility', 'hidden');
	});
	
	// chkCar
	$('#regFrm').submit(function(){
		if($('#carNumber').val().length<1){
			alert('차 번호를 확인해주세요');
			$('#carNumber').focus();
			event.preventDefault();
			return false;
		}
		
		$.ajax({
			url:"<c:url value='/living/car/carInsert.do'/>",
			type:"post",
			data:$(this).serializeArray(),
			dataType:"json",
			success:function(res){
				if(res>0){
					alert('등록 되었습니다.');
				}
				$('#carNumber').val('');
				$('#note').val('');
				$('#regdate').val('');
				location.reload();
			},
			error:function(xhr, status, error){
				alert("error! : " + error);
			}
		});
		
		event.preventDefault();
	});
	
	

});

/*
function listCarInfoN(){	//내 차량
	$.ajax({
		url:"",
		type:"GET",
		dataType:"json",
		success:function(res){
			if(res.length>0){
				var str="";
				$.each(res, function(idx, item){	
					str+="<tr><td>"+item.carRegNo+"</td>";
					str+="<td>"+item.carNumber+"</td>";
					str+="<td>"+item.note+"</td>";
					str+="<td>"+item.orderdate+"</td>";
					str+="<td>"+visit(item.isVisitor)+"</td>";
				});
				$('#carInfoN').html(str);
			}
			
		},
		error:function(xhr, status, error){
			alert("error! : " + error);
		}
	});
}
function listCarInfoY(){	//방문 차량
	$.ajax({
		url:"<c:url value='/living/car/carListY.do'/>",
		type:"GET",
		dataType:"json",
		success:function(res){
			if(res.length>0){
				var str="";
				$.each(res, function(idx, item){	
					str+="<tr><td>"+item.carRegNo+"</td>";
					str+="<td>"+item.carNumber+"</td>";
					str+="<td>"+item.note+"</td>";
					str+="<td>"+item.orderdate+"</td>";
					str+="<td>"+visit(item.isVisitor)+"</td>";
				});
				$('#carInfoY').html(str);
			}
			
		},
		error:function(xhr, status, error){
			alert("error! : " + error);
		}
	});
}
*/
</script>


	<!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
     
     <div class="content-wrapper">
       <div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">내 차량 관리</h2>
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">차량 등록 및 조회</li>
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
		          <h4 class="card-title">차량 등록</h4>
		          <br>
		        </div>
		        <div class="card-body">
		          <form id="regFrm">
	        	<div class="row">
					<div class="col-xl-2 col-md-6 col-12 mb-1">
			        	<div class="form-group">
			        		<label for="carNumber">차량 번호</label>
			            	<input type="text" class="form-control col-12" id="carNumber" name="carNumber">
			            </div>
			        </div>
                    <div class="col-xl-4 col-md-6 col-12 mb-1">
                    	<div class="form-group">
                    		<label for="note">특이사항</label>
							<input type="text" class="form-control col-12" id="note" name="note">									
                         </div> 
                     </div>
			         <div class="col-xl-2 col-md-6 col-12 mb-1">
			         	<div class="form-group">
			            	<div class="mb-1">방문 차량 여부</div>
			            	<div class="custom-control custom-radio d-inline" id="isVisitorNDiv">
								<input type="radio" class="custom-control-input" name="isVisitor" id="isVisitorN" value="N">	
				            	<label for="isVisitorN" class="custom-control-label">세대 차량</label>
			            	</div>
			            	<div class="custom-control custom-radio d-inline ml-1" id="isVisitorYDiv">
			            		<input type="radio" class="custom-control-input" name="isVisitor" id="isVisitorY" value="Y">									
				            	<label for="isVisitorY" class="custom-control-label">방문 차량</label>
			            	</div>									
			            </div>
			        </div>
			        <div class="col-xl-3 col-md-6 col-12">
				        <div class="form-group" id="regDiv">
				        	<label for="regdate">방문 날짜</label>
			            	<input type="text" class="form-control flatpickr-basic flatpickr-input" id="regdate" aria-describedby="regdate" name="regdate" placeholder="YYYY-MM-DD"
                               readonly="readonly"/>
			            </div>
			        </div>

					<div class="col-xl-11 col-md-6 col-12">
					    <div class="form-group" style="text-align:right;">
					        <input type="submit" class="btn btn-primary btn-sm right"  value="등록" id="submit">
					        <button type="reset" class="btn btn-outline-danger text-nowrap px-1"><i class="mr-25"></i>초기화</button>
					    </div>
					</div>
					
					</div>
		            
		          </form>
		          
		        </div>
		      </div>
		    </div>
		    <!-- /AddCost -->
		  </div>
		</section>
		
		<div class="row match-height mt-2">
        <div class="content-body col-xl-6">
               <!-- Ajax Sourced Server-side -->
        	<section id="residentTable_section">
            	<div>
                	<div class="col-12">
                    	<div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-title">내 차량 조회</h4>
                            </div>
                            <div class="card p-2">
                            	<table class="table" style="text-align:center;" id="carInfoN">
	                                <thead> 
	                                    <tr style="text-align: center;">
	                                        <th style="width:5%;">NO</th>
	                                        <th style="width:10%;">차량번호</th>
	                                        <th style="width:20%;">특이사항</th>
	                                    </tr> 
	                                </thead>
                               </table>
                               
                             </div>
                         </div>
                     </div>
                 </div>
             </section>
		</div>

        <!-- table승인건 -->
		<div class="content-body col-xl-6 ">
               <!-- Ajax Sourced Server-side -->
        	<section id="residentTable_section">
            	<div>
                	<div class="col-12">
                    	<div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-title">방문 차량 조회</h4>
                                <h6>해당 세대에 방문한 차량들을 조회 해드립니다</h6>
                            </div>
                            <div class="card p-2">
                            	<table class="table" style="text-align:center;" id="carInfoY">
	                                <thead>
	                                    <tr style="text-align: center;">
	                                        <th style="width:3%;">NO</th>
	                                        <th style="width:10%;">차량번호</th>
	                                        <th style="width:20%;">특이사항</th>
	                                        <th style="width:15%;">방문날짜</th>
	                                        <th style="width:15%;">등록날짜</th>
	                                    </tr> 
	                                </thead>
                               </table>
                               
                             </div>
                         </div>
                     </div>
                 </div>
             </section>
		</div>	
		</div>
		</div>
	</div>
</div>
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../../user/dashinc/userbottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
<!-- BEGIN: Page Vendor JS -->
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>


<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
<!-- END: Page Vendor JS-->
    

