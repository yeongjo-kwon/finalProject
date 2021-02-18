<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/adminTop.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<style>
.page-item.active .page-link {
    background-color: #2FA599 !important;
    border-color: #2FA599 !important;
}
.page-item.active {
    border-radius: 0;
    background-color: #E5F9F0 !important;
    border-color: #82E3C8 !important;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/subinJs/bin-chart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
var context;
var data =${dataList};
var labels =${labelList};
var dataArr =[];
var labelArr =[];

$(function(){
	context = document.getElementById("carChart");
	carChart(context,data,labels);
	
	var table=$('#carTable').DataTable({
		ajax:{
			url:"<c:url value='/admin/adminLiving/adminCar/carTable.do'/>",
			type:"GET",
			dataSrc:''
		},
		columns:[ //NO 동 호 차량번호 특이사항 방문일
            {data:"CAR_REG_NO"},
            {data:"DONG", render:function(data){
            	if(data==null){
            		return "관리자";
            	}
            	return data+"동"
            }},
            {data:"HO", render:function(data){
            	if(data==null){
        			return "";
        		}
            	return data+"호"}},
            {data:"CAR_NUMBER"},
            {data:"NOTE"},
            {data:"REGDATE"}
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
               <h2 class="content-header-title float-left mb-0">차량 관리</h2>
               <div class="breadcrumb-wrapper">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item"><a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">Home</a></li>
                   <li class="breadcrumb-item acitve">방문 차량 조회</li>
                 </ol>
               </div>
             </div>
           </div>
         </div>
         
         
       </div>
       
       <div class="content-body">
	       <section>
			<div class="row">
			    <div class="col-12">
			      <div class="card">
			        <div class="card-header">
			          <h4 class="card-title d-flex">방문 차량 조회</h4>
			          <br>우리 아파트에 방문한 차량들을 조회합니다
			        </div>
			        
			        <div class="card-body mt-1" style="height: 200px;">
			         	<div class="p-2 chartjs-size-monitor" >
			               	<canvas id="carChart" class="line-area-chart-ex chartjs chartjs-render-monitor"></canvas>
			                  
		                </div>          
			        </div>
			      </div>
			    </div>
	
			  </div>
	       </section>
       
       		<section class="form-control-repeater">
			  <div class="row">
	
			    <div class="col-12">
			      <div class="card">
			      
			        <div class="card-body mt-1">
			         	<div class="p-2">
			               	<table class="table" id="carTable" style="text-align:center;">
			                    <thead> 
			                        <tr style="text-align: center;">
			                            <th style="width:5%;">NO</th>
			                            <th style="width:8%;">동</th>
			                            <th style="width:8%;">호</th>
			                            <th style="width:13%;">차량번호</th>
			                            <th style="width:20%;">특이사항</th>
			                            <th style="width:15%;">방문일</th>
			                        </tr>
			                    </thead>
			                  </table>
			                  
		                </div>          
			        </div>
			      </div>
			    </div>
	
			  </div>
			</section>
		
		
		</div>
		
	</div>
</div>
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../../adminInc/adminBottom.jsp" %>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
<!-- BEGIN: Page Vendor JS-->
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
<!-- END: Page Vendor JS-->
