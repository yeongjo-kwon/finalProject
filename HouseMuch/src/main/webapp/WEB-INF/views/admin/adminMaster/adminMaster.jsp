<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/adminMasterTop.jsp" %>

<!-- 
	사이트운영진만 접근 가능 모든 기능 구현 완료
 -->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$('#MasterHome').addClass('active');
	
	$(function(){
		var d = new Date();
		
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
		
		var year = d.getFullYear();
		var month = (d.getMonth())+1;
		var day = d.getDate();
		
		$('#week').html(week[d.getDay()]);
		$('#day').html(day);
		
	});
</script>
    <!-- BEGIN: Content-->

	
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper ml-1 mr-1">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- Dashboard Ecommerce Starts -->
                <section id="dashboard-ecommerce">
                    
                    <div class="row match-height mt-1" style="height: 70vh">
                        <!-- Company Table Card -->
                        <div class="col-lg-8 col-12">
                        	<span> <a href="<c:url value='/admin/adminMaster/adminMasterApt.do'/>">이용중인 아파트 목록</a> : 11건만 노출됩니다. </span>
                            <div class="card card-company-table">
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table ">
                                            <thead>
                                                <tr style="font-size: 15px;">
                                                    <th>NO</th>
                                                    <th>아파트 이름</th>
                                                    <th>소유주</th>
                                                    <th>상세 주소</th>
                                                    <th>총 세대 수</th>
                                                </tr>
                                            </thead>
                                            <tbody>          
	                                            <c:if test="${empty aptList }">
	                                            	<tr>
	                                            		<td colspan="5"> 등록된 아파트가 없습니다.</td>
	                                            	</tr>
	                                            </c:if>
	                                            
	                                            <c:if test="${!empty aptList }">
	                                            	<c:forEach var="map" items="${aptList }" end="11">
		                                            	<tr>
		                                            		<td>${map['APT_NO'] }</td>
		                                            		<td>${map['APT_NAME'] }</td>
		                                            		<td>
			                                            		<c:if test="${empty map['MEMBER_NAME'] }">미등록</c:if>
			                                            		<c:if test="${!empty map['MEMBER_NAME'] }">${map['MEMBER_NAME'] }</c:if>		                                            		
		                                            		</td>
		                                            		<td>${map['ADDRESS'] }&nbsp;${map['ADDRESS_DETAIL'] }</td>
		                                            		<td>${map['TOTAL_HOUSEHOLD'] }</td>
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

                        <!-- Developer Meetup Card -->
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card card-developer-meetup">
                                <div class="meetup-img-wrapper rounded-top text-center">
                                    <img src="${pageContext.request.contextPath}/resources/app-assets/images/illustration/email.svg" alt="Meeting Pic" height="170" />
                                </div>
                                <div class="card-body">
                                    <div class="meetup-header d-flex align-items-center">
                                        <div class="meetup-day">
                                            <h6 class="mb-0"><span id="week"></span></h6>
                                            <h3 class="mb-0"><span id="day"></span></h3>
                                        </div>
                                        <div class="my-auto">
                                            <h4 class="card-title mb-25">신청 사항 확인</h4>
                                            <p class="card-text mb-0">확인하지 않은 메세지 
                                            	<a href="<c:url value='/admin/adminMaster/adminMasterMsg.do'/>" style="font-weight: bold;">${msgCnt }</a>
                                            	건이 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                    <c:if test="${empty msgNList }">
	                                    <div class="media">
	                                        <div class="media-body" style="text-align: center;">
	                                            	조회하지 않은 쪽지가 없습니다.
	                                        </div>
	                                    </div>
                                    </c:if>
                                    <c:if test="${!empty msgNList }">
                                    	<c:forEach var="msgN" items="${msgNList }">
		                                    <div class="media mb-2">
		                                        <div class="media-body">
		                                        	<a href="<c:url value='/admin/adminMaster/adminMasterMsg.do?idx=${msgN.idx }'/>">
		                                            <h6 class="mb-0"><fmt:formatDate value="${msgN.regdate }" pattern="E, MM dd, yyyy" /></h6>
		                                            <small>아파트 명 : ${msgN.fromAptName } </small>
		                                            </a>
		                                        </div>
		                                    </div>
                                    	
                                    	</c:forEach>
                                    	<a href="<c:url value='/admin/adminMaster/adminMasterMsg.do'/>"> More.. </a>
                                    </c:if>
                 
                                </div>
                            </div>
                        </div>
                        <!--/ Developer Meetup Card -->

  
                    </div>
                </section>
                <!-- Dashboard Ecommerce ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

<%@ include file="inc/adminMasterBottom.jsp" %> 