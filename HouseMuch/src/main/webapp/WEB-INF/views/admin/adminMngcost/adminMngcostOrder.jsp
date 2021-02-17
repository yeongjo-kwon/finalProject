<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/ag-grid/ag-grid.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/ag-grid/ag-theme-material.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/plugins/tables/table-ag-grid.min.css">
    
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjAgGrid.js"></script>
<script type="text/javascript">
	$(function(){
		//현재 년월일
		var d=new Date();
		year = d.getFullYear(),
		month = '' + (d.getMonth() + 1);
		day = '' + d.getDate();
	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;
	    
		currDate=[year, month, day].join('-');
		
		
	 	//1달 전 년월
	 	var d2=new Date();
		d2.setMonth(d2.getMonth()-1);
		year2 = d2.getFullYear(),
		month2 = '' + (d2.getMonth()+1);
	    if (month2.length < 2) month2 = '0' + month2;
	
		agoMonth=[year2, month2].join('-');
		
		$('#btMngcostPayOrder').click(function(){
			if($('#startdate').val().length==0){
				alert("내역이 선택되지 않았습니다.");
			}else if($('#isorder').val()=="청구완료"){
				alert("이미 청구완료된 달입니다.");
			}else if($('#startdate').val() > agoMonth){
				alert("청구 불가능한 달입니다.");
			}else if($('#mngcostLimitdate').val().length==0){
				alert("납부기한을 선택해주세요.")
			}else if($('#mngcostLimitdate').val() <= currDate){
				alert("납부기한은 청구일 다음 날부터 선택 가능합니다")
			}else if($('#startdate').val() < agoMonth){
				if(confirm("청구 기한이 지난 내역입니다. 사용월 기준 다음 달 말일로 청구를 진행시겠습니까?")){
					uMonth=$('#startdate').val().split('-');
					var d3=new Date(uMonth[0], uMonth[1], 0);
					d3.setMonth(d3.getMonth()+1);
					$('#mngcostClaimdate').val(formatDate(d3));
					
					$('#frmMngcostPayOrder').submit();
				}
			}else{
				$('#mngcostClaimdate').val(formatDate(new Date()));
				$('#frmMngcostPayOrder').submit();
			}
		});
	});
	
	//inqVo에 담기 위한 타임스탬프용 날짜 포맷
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear(),
	    	hour = '' + d.getHours(),
	    	minute = '' + d.getMinutes(),
	    	second = '' + d.getSeconds();
	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;
	    if (hour.length < 2) hour = '0' + hour;
	    if (minute.length < 2) minute = '0' + minute;
	    if (second.length < 2) second = '0' + second;
		
	    return [year, month, day].join('-')+" "+[hour, minute, second].join(':');
	};
</script>
<!-- BEGIN: Content-->
    <div class="app-content content">
      <div class="content-overlay"></div>
      <div class="header-navbar-shadow"></div>
      <br>
      <div class="content-wrapper">
        <div class="content-header row">
          <div class="content-header-left col-md-9 col-12 mb-2">
            <div class="row breadcrumbs-top">
              <div class="col-12">
                <h2 class="content-header-title float-left mb-0">관리비 청구</h2>
                <div class="breadcrumb-wrapper">
                  <ol class="breadcrumb">
                   <li class="breadcrumb-item">
                   	<a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">Home</a>
                   </li>
                   <li class="breadcrumb-item">납입내역 관리</li>
                   <li class="breadcrumb-item active">
                   	<a href="<c:url value='/admin/adminMngcost/adminMngcostOrder.do'/>">관리비 청구</a>
                   </li>
                  </ol>
                </div>
              </div>
            </div>
          </div>
          <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
            <div class="form-group breadcrumb-right">
              <div class="dropdown">
                <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="grid"></i></button>
                <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="app-todo.html"><i class="mr-1" data-feather="check-square"></i><span class="align-middle">Todo</span></a><a class="dropdown-item" href="app-chat.html"><i class="mr-1" data-feather="message-square"></i><span class="align-middle">Chat</span></a><a class="dropdown-item" href="app-email.html"><i class="mr-1" data-feather="mail"></i><span class="align-middle">Email</span></a><a class="dropdown-item" href="app-calendar.html"><i class="mr-1" data-feather="calendar"></i><span class="align-middle">Calendar</span></a></div>
              </div>
            </div>
          </div>
        </div>
        <div class="content-body"><!-- Basic example section start -->
			<section id="basic-examples">
			<div class="col-sm-12 col-md-6 col-lg-7 col-xl-7 float-left">
			  <div class="card">
			    <div class="card-body">
			      <div class="row">
			        <div class="col-12">
			          <div class="ag-grid-btns d-flex justify-content-between flex-wrap mb-1">
			            <div class="dropdown sort-dropdown mb-1 mb-sm-0">
			              <button class="btn filter-btn dropdown-toggle border text-dark"
			                type="button" id="dropdownMenuButton6" data-toggle="dropdown"
			                aria-haspopup="true" aria-expanded="false" >1 - 20 of 500</button>
			              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton6">
			                <a class="dropdown-item" href="javascript:void(0);">20</a>
			                <a class="dropdown-item" href="javascript:void(0);">50</a>
			                <a class="dropdown-item" href="javascript:void(0);">100</a>
			                <a class="dropdown-item" href="javascript:void(0);">150</a>
			              </div>
			            </div>
			            <div class="ag-btns d-flex flex-wrap">
			              <input
			                type="text"
			                class="ag-grid-filter form-control w-50 mr-1 mb-1 mb-sm-0"
			                id="filter-text-box"
			                placeholder="검색어를 입력하세요"
			              />
			              <div class="btn-export">
			                <button class="btn btn-primary ag-grid-export-btn">엑셀로 내려받기</button>
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>
			      <div id="myGrid" class="aggrid ag-theme-material"></div>
			    </div>
			  </div>
			 </div> 
			  
			  <div class="col-sm-12 col-md-6 col-lg-5 col-xl-5 float-right">
				<!-- Invoice Actions -->
			      <div class="card">
			        <div class="card-body">
			          <h3>청구 정보</h3>
			          <br><br>
			          
			          <input type="hidden" name="isorder" id="isorder">
			          <form id="frmMngcostPayOrder" method="post" action="<c:url value='/admin/adminMngcost/adminMngcostOrder.do'/>" >
				          <input type="hidden" name="mngcostClaimdate" id="mngcostClaimdate">
				          <label>사용년월</label>
				          <input type="text" class="form-control" placeholder="사용년월 선택"
				          		name="startdate" id="startdate" value="${param.useMonth}" readOnly><br>
					      <label>납부기한</label>
		          		  <input type="text" class="form-control flatpickr-inline"
		          				name="mngcostLimitdate" id="mngcostLimitdate" placeholder="납부기한 선택" /><br>
	          		  </form>	
			          <button id="btMngcostPayOrder" class="btn btn-primary btn-block mb-75"
			          		data-toggle="modal" data-target="#send-invoice-sidebar">청구하기</button>
			          	
			          <!--<a class="btn btn-outline-secondary btn-block mb-75" href=""> 수정 </a>-->
			        </div>
			      </div>
			    <!-- /Invoice Actions -->
			</div>
    		<div class="clearfix"></div>
			</section>
			<!--/ Basic example section end -->
			
        </div>
      </div>
    </div>
    <!-- END: Content-->
<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp"%>





<!--<script src="${pageContext.request.contextPath}/resources/js/yjJs/table-ag-grid.js"></script>-->
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/ag-grid/ag-grid-community.min.noStyle.js"></script>
    