<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../user/dashinc/usertop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>


<script type="text/javascript">


var addOut = function(addNo,addOrderListNo){
	if(confirm('해지할 경우 다음 달 부터 재 신청 가능합니다. 시설 이용을 해지하시겠습니까?')){
			location.href="<c:url value='/living/add/addOut.do?addNo="+addNo+"&addOrderListNo="+addOrderListNo+"'/>";
	}else{
		event.preventDefault();
	}
}
	
</script>
<style>
.apt-bg-primary{
	background-color:#5c9f24; 
}

.btn{
	background-color:#5c9f24;
	border-color: #5c9f24;
}
.btn:hover{
	background-color:#326717;
	border-color: #326717;
}
.apt-bg-primary{
	background-color:#5c9f24; 
}
.apt-bg-secondary{
	background-color:#f6f6f6; 
}
.apt-bg-light{
	background-color:#F2FBDD; 
}
.apt-bg-dark{
	background-color:#22550E; 
}

.apt-text-primary{
	color:#5c9f24; 
}
.apt-text-secandary{
	color:#666666; 
}
.apt-text-third{
	color:#F2FBDD; 
}
.apt-text-dark{
	color:#22550E; 
}

.btn{
	background-color:#5c9f24;
	border-color: #5c9f24;
}
.btn:hover{
	background-color:#326717;
	border-color: #326717;
}

.btn-light:hover{
	background-color:#F2FBDD;
	border-color: #E2F7BC;
	color: #22550E;
}
.btn-light{
	background-color:#ffffff;
	border-color: #5c9f24;
}

.a-index{
	background-color:#5c9f24;
	border-color: #5c9f24;
	color: #ffffff;
}

.btn-out{
	background-color: #ffffff;
	border-color: #FF7063 !important; 
	color: #FF7063;
}
.btn-out:hover{
	background-color: #FF7063;
	border-color: #FF7063 !important;
	color: #ffffff;
}


</style>
<!-- 박스 레이아웃 -->
  <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper container p-0">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mt-1 mb-0 align-middle">우리집 이용 시설</h2>
                            
                        </div>
                </div>
                <!-- 이거없으면 헤더사라짐  -->
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                     <div class="form-group breadcrumb-right">
                    <div  class="btn btn-round p-1" style="background-color: #fff;">
                   			<a href="<c:url value='/living/add/addFacilityList.do'/>">
								<span class="align-middle" style="color: #999">부가시설 목록으로</span>
                   			</a>
                    </div> 
                    
                    </div>
                </div>
            </div>

      
					<!-- 세대정보 테이블시작 -->
					
					<div class="table-responsive table-hover bg-white">
						<table class="table table-hover">
							
							<colgroup>
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 15%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
							</colgroup>
							
							<thead class="apt-bg-light thead-dark"
								style="color: #fff; font-size: 1.2em; font-weight: 200;border-radius:4px 4px 0 0;">
								<tr>
									<th class="font-medium-1 text-center">세대코드</th>
									<th class="font-medium-1 text-center">회원번호</th>
									<th class="font-medium-1 text-center">회원명</th>
									<th class="font-medium-1 text-center">회원ID</th>
									<th class="font-medium-1 text-center">이메일</th>
									<th class="font-medium-1 text-center">탈퇴여부</th>
								</tr>
							</thead>
							<tbody>

					 			<!-- 리스트 없으면 list.size()==0 -->
								<c:if test="${empty famList}">
									<tr>
										<td colspan="6"><span class="text-center" >세대원이 없습니다</span></td>
									</tr>
								</c:if> 


								<!-- 레코드반복시작 -->
								<c:if test="${!empty famList }">
									<c:forEach var="fam" items="${famList}">
										<tr class="famInfo">
											<!-- 세대코드 -->
											<td class="text-center" name="householdCode" id="householdCode">${fam.householdCode}</td>
											
										
											<!-- 회원번호 -->
											<td class="text-center" name="memberNo">${fam.memberNo}</td>

											<!-- 회원명 -->
											<td class="text-center" name="memberName">${fam.memberName}</td>

											<!-- 회원ID -->
											<td class="text-center" >${fam.id}</td>

											<!-- 이메일 -->
											<td class="text-center">${fam.email}</td>

											<!-- 상태 -->
											<c:choose>
												<c:when test="${fam.outdate==null}">
													<td class="text-center">사이트이용중</td>
												</c:when>
												<c:otherwise>
													<td class="text-center">탈퇴한 회원</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:if>


								<!--  리스트 반복 끝 -->


							</tbody>
						</table>
					</div>
					<!-- 세대정보 테이블 끝 -->
      
      			<div class="bg-white form-group ">
      
     			 <div class="form-group breadcrumb-right apt-bg-secondary pt-1 pb-1" style="min-height: 100px;">
	     			
	     			
	     			 <div class="row">
	     				<div class="col text-left text-bottom align-text-bottom pt-3 ml-1">
	     				
	     				<div class="row text-left text-bottom align-text-bottom"><span class="text-danger align-text-bottom" style="vertical-align: bottom;">
						<i data-feather="info"></i>&nbsp;이용 신청 익월 관리비에 이용료가 청구되며, 해지신청한 당월 말일까지 시설 이용이 가능합니다.</span></div>
	     				</div>
	     			 	<div class="col text-right pt-1">
	     			 	
		                    <div  class="btn btn-round p-1 text-right" style="background-color: #fff;"  id="btExcel">
		                   			<a href="<c:url value='/living/add/orderListExcel.do'/>">
		                   			<img alt="" src="${pageContext.request.contextPath}/resources/aptUser_images/Excel_download_icon.svg">
										<span class="align-middle" style="color: #999">엑셀다운로드</span>
		                   			</a>
		                    </div>
	     			 	</div>
	     			 </div>
       
					<!-- 전체 신청내역 테이블시작 -->
					<div class="table-responsive table-hover bg-white mt-1" id="familyOrder">
						<table class="table table-bordered ">
							
							<colgroup>
								<col style="width: 10%;" />
								<col style="width: 20%;" />
								<col style="width: 15%;" />
								<col style="width: 15%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
							</colgroup>
							
							<thead class="thead-dark"
								style="background-color: #0E515F; color: #fff; font-size: 1.2em; font-weight: 200;border-radius:4px 4px 0 0;">
								<tr class="table-hover">
									<th class="font-medium-1 text-center">신청 번호</th>
									<th class="font-medium-1 text-center">시설명</th>
									<th class="font-medium-1 text-center">신청일</th>
									<th class="font-medium-1 text-center">월 이용료</th>
									<th class="font-medium-1 text-center">납부 횟수</th>
									<th class="font-medium-1 text-center">신청자</th>
									<th class="font-medium-1 text-center">해지일자</th>
								</tr>
							</thead>
							<tbody class="table-hover">

								<!-- 리스트 없으면 list.size()==0 -->
								<c:if test="${empty orderList}">
									<tr>
										<td colspan="7"><span class="text-center" id="emptyList">이용중인 시설이 없습니다.</span></td>
									</tr>
								</c:if> 


								<!-- 레코드반복시작 -->
								<c:if test="${!empty orderList }">
									<c:forEach var="vo" items="${orderList}">
										<tr onclick="">
											<!-- 신청 번호 -->
											<td class="text-center">
												<span class="font-weight-bold">${vo.addOrderListNo}</span>
											</td>

											<!-- 시설명 -->
											<td class="text-center" ><a href="<c:url value='/living/add/addFacilityDetail.do?addNo=${vo.addNo }'/>"></a>
											${vo.addName }</td>

											<!-- 신청일-->
											<td class="text-center">
											<fmt:formatDate pattern="YYYY-MM-dd" value="${vo.addOrderdate}"/>
											</td>
											
											<!-- 이용요금 -->
											<td class="text-center">
											<fmt:formatNumber pattern="###,###,###" value="${vo.addPrice}"/></td>

											<!-- 총납부횟수 -->
											<td cass="text-center pl-10">${vo.addChargeCnt }</td>
											
											<!-- 신청자-->
											<td class="text-center">${vo.memberName }</td>

											<!-- 해지일자 -->
										<c:choose>
											<c:when test="${vo.addOutdate==null }">
												<td class="text-center">
													<button class="btn btn-out" onclick="addOut(${vo.addNo},${vo.addOrderListNo})">이용 해지</button> 
												</td>
											</c:when>
											<c:otherwise>
												<td class="text-center">
												<fmt:formatDate value="${vo.addOutdate }" pattern="yyyy-MM-dd"/>
												</td>
											</c:otherwise>				
										</c:choose>
										</tr>
									</c:forEach>
								</c:if>


								<!-- 반복 끝 -->
								


							</tbody>
						</table>
					</div>
					<!-- 테이블 끝 -->
					</div><!-- 테이블bg -->
					
					
				<!-- content-wrapper -->
			</div>
			<!-- content-wrapper -->
		</div>
		<!-- content-wrapper -->
	</div>
	<!-- content-wrapper -->
</div>
<!-- app-content content -->
<div class="clearfix" style="height:100px"></div>
<%@ include file="../../user/dashinc/userbottom.jsp"%>