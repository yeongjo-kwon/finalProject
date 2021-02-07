<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/adminMasterTop.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$('#MasterMsg').addClass('active');
	
	$(function(){
		if($('#msgIdx').val()!=null){
			ajaxShowVo();
		}
	});
	
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
   
	function ajaxShowVo(){
		$.ajax({
			url:"<c:url value='/admin/adminMaster/msgDetail.do'/>",
			type:"get",
			data:"idx="+$('#msgIdx').val(),
			dataType:"json",
			success:function(res){
				var str="";
				str+="<strong>아파트 명</strong> :" + res.fromAptName + "<br><hr>";
				str+="<strong>신청자</strong> :" + res.fromName + "<br><hr>";
				str+="<strong>연락처</strong> :" + phoneFormatter(res.fromHp) + "<br><hr>";
				str+="<strong>이메일</strong> :" + res.fromEmail + "<br><hr>";
				str+="<strong>날짜</strong> :" + formatDate(res.regdate) + "<br><hr>";
				str+="<strong>문의사항</strong> <br><hr> " + res.fromDetail;
			
				$('#msgDetail').html(str);
				$('#msgDel').html('<a href="<c:url value="/admin/adminMaster/delMsg.do?idx='+res.idx+'"/>">[삭제]</a>');
			},
			error:function(xhr, status, error){
				$('#msgDetail').html("");
				//alert("error : "+error);
			}
		});
	}
	
	function sendIdx(idx, obj){
		$('#msgIdx').val(idx);
		$(obj).removeAttr("style");
		$(obj).parent().children().css("background","");
		$(obj).css("background", "#E2FBFE");
		ajaxShowVo();
	}
	//날짜 포맷
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();
	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join('-');
	};
	
	//핸드폰 번호 포맷
	function phoneFormatter(num, type) {
		   var formatNum = '';
		   try{
		      if (num.length == 11) {
		         if (type == 0) {
		            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
		         } else {
		            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		         }
		      } else if (num.length == 8) {
		         formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
		      } else {
		         if (num.indexOf('02') == 0) {
		            if (type == 0) {
		               formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
		            } else {
		               formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
		            }
		         } else {
		            if (type == 0) {
		               formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
		            } else {
		               formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
		            }
		         }
		      }
		   } catch(e) {
		      formatNum = num;
		      console.log(e);
		   }
		   return formatNum;
		}


</script>
    <!-- BEGIN: Content-->
    <form action="<c:url value='/admin/adminMaster/adminMasterMsg.do'/>" name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchCondition" value="${param.searchCondition }">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	</form>
	
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
			<div class="content m-1">
				<h2 style="display:inline;">아파트 신청 내역 조회</h2>
				<input type="hidden" id="msgIdx" name="idx" value="${param.idx }">
			</div>
        <div class="content-wrapper ml-1 mr-1">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- 쪽지함 리스트  -->
                <section id="dashboard-ecommerce">
                    
                    <div class="row match-height mt-1" style="height: 70vh">
                        <!-- Company Table Card -->
                        <div class="col-lg-8 col-12">
                            <div class="card card-company-table">
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                           <colgroup>
										      <col style="width:10%;" />
										      <col style="width:20%;" />
										      <col style="width:20%;" />
										      <col style="width:20%;" />
										   </colgroup>
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="background-color: #d2faff;">NO</th>
                                                    <th scope="col" style="background-color: #d2faff;">아파트 이름</th>
                                                    <th scope="col" style="background-color: #d2faff;">신청자</th>
                                                    <th scope="col" style="background-color: #d2faff;">신청일</th>                                                    
                                                </tr>
                                            </thead>
                                            <tbody style="text-align: center;">
                                            <!-- 반복  -->
                                            <c:if test="${empty msgList }">
                                            	<tr><td colspan="4"> 확인 할 쪽지를 선택해주세요 </td></tr>
                                            </c:if>
                                            
                                            <c:if test="${!empty msgList }">
                                            	<c:forEach var="msgVo" items="${msgList }">
	                                            	<tr onclick="sendIdx('${msgVo.idx}', this)" style="
	                                            		 <c:if test="${msgVo.flag=='N' }">font-weight:bold;</c:if>
	                                            		<c:if test="${msgVo.idx==param.idx }">background-color:#E2FBFE;</c:if>"
	                                            	>
	                                            		<td>
		                                            		<div class="d-flex align-items-center">
	                                                        	<span class="msgIdx">${msgVo.idx }</span>
	                                                        </div>
	                                                    </td>
	                                                    <td>
		                                            		<div class="d-flex align-items-center">
	                                                        	<span>${msgVo.fromAptName }</span>
	                                                        </div>
	                                                    </td>
	                                                    <td>
		                                            		<div class="d-flex align-items-center">
	                                                        	<span>${msgVo.fromName }</span>
	                                                        </div>
	                                                    </td>
	                                                    <td>
		                                            		<div class="d-flex align-items-center">
	                                                        	<span><fmt:formatDate value="${msgVo.regdate }" pattern="yyyy-MM-dd"/></span>
	                                                        </div>
	                                            		</td>
	                                            		
	                                            	</tr>                                            	
                                            	</c:forEach>
                                            </c:if>
 
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="divPage">
									   <!-- 페이지 번호 추가 -->
									   <!-- 이전 블럭으로 이동 -->
									   <nav aria-label="Page navigation">
										   <ul class="pagination justify-content-center mt-2">
										   <c:if test="${pagingInfo.firstPage>1}">
										 	  <li class="page-item prev"><a class="page-link" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"></a></li>
										   </c:if>
										   
										   <!-- [1][2][3][4][5][6][7][8][9][10] -->
										   <c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
										      	<c:if test="${i==pagingInfo.currentPage}">
											    	<li class="page-item active"><a class="page-link" href="javascript:void(0);"> ${i}</a> </li>
												</c:if>
										     	<c:if test="${pagingInfo.currentPage!=i}">
										     		<li class="page-item">
										 			<a href="#" class="page-link" onclick="pageFunc(${i})" >
										 				${i}</a>
											      	</li>
										     	 </c:if>
										   </c:forEach>
										   <!-- 다음 블럭으로 이동 -->
										   <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
										 	<li class="page-item next"><a class="page-link" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"></a></li>
										   </c:if>
										   <!--  페이지 번호 끝 -->
										   </ul>
									   </nav>
									</div>
									<!-- search -->
									<div class="mt-2 mb-2 d-flex align-items-center justify-content-center" style="text-align: center">
								      <form name="frmSearch" method="post" action="<c:url value='/admin/adminMaster/adminMasterMsg.do'/>" style="display:flex;">
								        <div class="invoice_status ml-sm-2 row mr-2">
								        <select name="searchCondition" class="form-control ml-50 mr-2 text-capitalize" style="width:150px;">
								
								          <option value="from_apt_name"
								               <c:if test="${'from_apt_name'==param.searchCondition}">
								                  selected="selected"
								              </c:if>
								            >아파트 명</option>
								            <option value="from_name"
								               <c:if test="${'from_name'==param.searchCondition}">
								                  selected="selected"
								              </c:if>
								            >신청자</option>
								            
								        </select> 
								        </div>
								        
								        <div class="dataTables_filter row mr-2">  
									    <input class="form-control row d-flex" type="text" name="searchKeyword" title="검색어 입력" style="width:200px;"
									           value="${param.searchKeyword}">   
									    </div>
									    <button class="btn btn-icon rounded-circle btn-outline-primary waves-effect" type="submit" >
									    <svg xmlns="http://www.w3.org/2000/svg" class="feather feather-search" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="14" height="14"><circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" /></svg>
									    </button>
								       </form>
									</div>
									<!-- /search -->
									
                                </div>
                          </div>
						    
                        </div>
                        <!--/ 쪽지함 리스트 -->

                        <!-- 메세지 리스트 Card -->
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card card-developer-meetup">

                                <div class="card-body" id="msgDetail">
                                	
                                </div>
                                <div class="mb-1" id="msgDel" style="text-align: center;">
                                	
                                </div>
                            </div>
                        </div>
                        <!--/메세지 리스트 Card -->

  
                    </div>
                </section>
                <!-- Dashboard Ecommerce ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

<%@ include file="inc/adminMasterBottom.jsp" %> 