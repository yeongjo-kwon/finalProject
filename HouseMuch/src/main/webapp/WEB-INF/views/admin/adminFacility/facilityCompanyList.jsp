<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<style>
.btn-primary {
    border-color: #0E515F !important;
    background-color: #0E515F !important;
    color: #FFFFFF !important;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	
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
			        <div class="card-header pb-0 pr-0">
						<div class=" p-0 col-12 m-0">
			        		<a href="<c:url value='/admin/adminFacility/facilityCompanyReg.do'/>"><button type="button" class="btn btn-primary">추가</button></a>
			        		
			        		<div style="text-align: right; float:right;" class="col-md-9">
				        		<div class="col-md-2 col-2" style="display: inline-block;">
									<div class="form-group">
										<select class="form-control">
											<option value="">분류</option>
											<option value="">관리</option>
											<option value="">경비</option>
										</select>
									</div>
								</div>
								
								<div class="col-md-3 col-3" style="display: inline-block;">
									<div class="input-group">
										<input type="text" class="form-control"/>
									</div>
								</div>       	
			        		</div>
	
						</div>
						
					</div>
					  
					<!-- 테이블시작 -->
					<div class="table-responsive">
						<table class="table table-hover-animation ">
							<thead class="thead-dark">
								<tr>
									<th class="font-medium-1 text-center" style="width:5%;">번호</th>
									<th class="font-medium-1 text-center" style="width:10%;">분류</th>
									<th class="font-medium-1 text-center" style="width:15%;">상호명</th>
									<th class="font-medium-1 text-center" style="width:10%;">계약일</th>
									<th class="font-medium-1 text-center" style="width:5%;">부가시설</th>
									<th class="font-medium-1 text-center" style="width:7%;">&nbsp;</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<!-- foreach -->
										<tr class="text-center">
											<td><span class="font-weight-bold">1</span></td>
											<td>분류명</td>
											<td>업체상호명</td>
											<td>ㄱㅖ약날짜</td>
											<td>N</td>
											<td>
												<div class="dropdown">
													<button type="button"
														class="btn btn-sm dropdown-toggle hide-arrow"
														data-toggle="dropdown">
														<i data-feather="more-vertical"></i>
													</button>
													<div class="dropdown-menu">
														<a class="dropdown-item">
															<i data-feather="edit-2" class="mr-50"></i><span>수정</span></a>
														<a class="dropdown-item">
															<i data-feather="trash" class="mr-50"></i><span>삭제</span></a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><span class="font-weight-bold">1</span></td>
											<td>분류명</td>
											<td>업체상호명</td>
											<td>ㄱㅖ약날짜</td>
											<td> Y</td>
											<td>
												<div class="dropdown">
													<button type="button"
														class="btn btn-sm dropdown-toggle hide-arrow"
														data-toggle="dropdown">
														<i data-feather="more-vertical"></i>
													</button>
													<div class="dropdown-menu">
														<a class="dropdown-item">
															<i data-feather="edit-2" class="mr-50"></i><span>수정</span></a>
														<a class="dropdown-item">
															<i data-feather="trash" class="mr-50"></i><span>삭제</span></a>
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
		    
			</div>
		</section>
		
		
		
	</div>
</div>


<%@ include file="../adminInc/adminBottom.jsp"%>