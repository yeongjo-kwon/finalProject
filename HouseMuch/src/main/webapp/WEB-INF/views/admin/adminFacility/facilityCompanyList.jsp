<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<style>
.btn-primary {
    border-color: #0E515F !important;
    background-color: #0E515F !important;
    color: #FFFFFF !important;
}
.page-item.active .page-link {
    background-color: #0E515F !important;
    border-color: #0E515F !important;
}
.page-item.disabled .page-link {
    pointer-events: none !important;
    cursor: auto !important;
    background-color: #0e515f1f !important;
    border-color: #0e515f1f !important;
}
.page-item.active {
    border-radius: 0;
    background-color: #0e515f1f !important;
    border-color: #0e515f1f !important;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){

	var table=$('#companyTable').DataTable({
		ajax:{
			url:"<c:url value='/admin/adminFacility/facilityTable.do'/>",
			type:"GET",
			dataSrc:''
		},
		columns:[ //번호 분류명 상호명 계약금액 계약일 부가시설 수정/삭제
            {data:"contractNo"},
            {data:"mngCompCtgName"},
            {data:"mngCompName"},
            {data:"contractPrice"},
            {data:"contractDate", render:function(data){
                return moment(data).format('YYYY-MM-DD');}},
            {data:"isAddFacility" },
            {data : "", render: function(data,type,row){ 
            	var str="<div class='dropdown'>";
            	str+="<button type='button' class='btn btn-sm dropdown-toggle hide-arrow' data-toggle='dropdown'><span>▼</span></button>";
				str+="<div class='dropdown-menu'>";
				str+="<a class='dropdown-item' href='<c:url value='/admin/adminFacility/facilityCompanyDetail.do?contractNo="+row.contractNo+"'/>'><span>상세보기</span></a>";
				str+="<a class='dropdown-item' href='<c:url value='/admin/adminFacility/facilityCompanyEdit.do?contractNo="+row.contractNo+"'/>'><span>수정</span></a>";
				str+="<a class='dropdown-item' href='<c:url value='/admin/adminFacility/contractDel.do?contractNo="+row.contractNo+"'/>'><span>삭제</span></a>";	
				str+="</div></div>";
            	return str; 
            }}
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



<!-- 여기부터 -->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	
	<div class="content-body">
	
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">보수 업체 계약 내역</h2>
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb ">
							<li class="breadcrumb"><a href="#" style="color:gray;">보수 비용 내역 조회</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		
  		<!-- BEGIN: Content-->
    	<section id="companyList">
			<div class="row">
		    
			    <div class="col-12">
			      <div class="card">
			        <%-- <div class="card-header pb-0 pr-0">
						<div class=" p-0 col-12 m-1">
			        		
			        		<div style="text-align: right; float:right;" class="col-md-9">
				        		<div class="col-md-2 col-2" style="display: inline-block;">
									<div class="form-group">
										<select class="form-control" name="mngCompCtgNo" id="mngCompCtgNo">
											<option value="0">분류</option>
											<c:forEach var="ctgVo" items="${ctgList }">
												<option value="${ctgVo.mngCompCtgNo }">${ctgVo.mngCompCtgName }</option>
											</c:forEach>
										</select>
									</div>
								</div> 
								
								<div class="col-md-3 col-3" style="display: inline-block;">
									<div class="input-group">
										<input type="text" class="form-control" name="mngCompName"/>
									</div>
								</div>       	
			        		</div>
	
						</div>
						
					</div> --%>
					  
					<!-- 테이블시작 -->
					<div class="companyTable table-responsive p-1 table-hover">
						<table class="companyTable table " id="companyTable" style="text-align:center;">
							<thead class="thead-dark">
								<tr>
									<th class="font-medium-1 text-center" style="width:5%;">번호</th>
									<th class="font-medium-1 text-center" style="width:5%;">분류</th>
									<th class="font-medium-1 text-center" style="width:15%;">상호명</th>
									<th class="font-medium-1 text-center" style="width:10%;">계약 금액</th>
									<th class="font-medium-1 text-center" style="width:10%;">계약일</th>
									<th class="font-medium-1 text-center" style="width:7%;">부가시설</th>
									<th class="font-medium-1 text-center" style="width:7%;">&nbsp;</th>
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

<%@ include file="../adminInc/adminBottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>