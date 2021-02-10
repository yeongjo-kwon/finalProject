<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript">
	$(function(){
		payListInqAjax();
		
		$('#customSwitch10').change(function(){
			if($('#notPaid').val()=="Y"){
				$('#notPaid').val("N");
			}else if($('#notPaid').val()=="N"){
				$('#notPaid').val("Y");
			}
			
			payListInqAjax();
		});
		
		$('#btPayListSearch').click(function(){
			payListInqAjax();
		});
	});
	
	function payListInqAjax(){
		$.ajax({
			url:"<c:url value='/admin/adminMngcost/amdinPayListInq.do'/>",
			type:"post",
			data:$('#frmPayListInq').serialize(),
			dataType:"json",
			success:function(res){
				if(res.length>0){
					var str="";
					$.each(res, function(idx, item){
						str+="<tr><td>"+item.MNGCOST_LIST_NO+"</td>";
						str+="<td>"+formatDate(item.MNGCOST_CLAIMDATE)+"</td>";
						str+="<td>"+item.DONG+"</td>";
						str+="<td>"+item.HO+"</td>";
						str+="<td class='text-right'>"+numFormat(item.MNGCOST_TOTAL_PRICE)+"원</td>";
						str+="<td>"+formatDate(item.MNGCOST_LIMITDATE)+"</td> <td>";
						if(item.MNGCOST_PAYDATE==null){
							str+="<div class='avatar pull-up my-0'><a href='#' class='btn btn-warning'>미납</a></div>";
						}else{
							str+=formatDate(item.MNGCOST_PAYDATE);
						}
						str+="</td></tr>";
					});
					
					$('#tbPayList').html(str);
				}
			},
			error:function(xhr, status, error){
				alert("error : "+error)
			}
		});
	};
	
	function formatDate(date) {
	    var d = new Date(date),
	        year = d.getFullYear(),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate();
	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;
		
	    return [year, month, day].join('-');
	};
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
               <h2 class="content-header-title float-left mb-0">납입내역 조회</h2>
               <div class="breadcrumb-wrapper">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item">
                   	<a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">Home</a>
                   </li>
                   <li class="breadcrumb-item"><a href="#">납입내역 관리</a></li>
                   <li class="breadcrumb-item active">납입내역 조회</li>
                 </ol>
               </div>
             </div>
           </div>
         </div>
         <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
           <div class="form-group breadcrumb-right">
           </div>
         </div>
       </div>
       <!-- Table head options start -->
		<div class="row" id="table-head">
		  <div class="col-12">
		    <div class="card">
		      <div class="card-header">
		        <h4 class="card-title">납부현황</h4>
		      </div>
		      <div class="card-body">
		        <p class="card-text">
		        	세대별 납부현황을 조회할 수 있습니다
		        </p>
		        <div></div>
		        <div class="custom-control custom-switch custom-switch-primary float-right">미납내역만 보기&nbsp;
	              <input type="checkbox" class="custom-control-input" id="customSwitch10" checked />
	              <label class="custom-control-label" for="customSwitch10">
	                <span class="switch-icon-left"><i data-feather="check"></i></span>
	                <span class="switch-icon-right"><i data-feather="x"></i></span>
	              </label>
	            </div>
	            
	            <form action="#" id="frmPayListInq" method="post">
		            <div class="col-md-12 mb-1 row">
			            <div class="col-5">
		            	  <label>동</label>
			              <select class="select2 form-control form-control-lg" name="dong" id="dong">
			                <option value="0">동수를 입력하세요</option>
			                <c:forEach var="dong" items="${dongList}">
								<option value="${dong}">${dong}동</option>	                
			                </c:forEach>
			              </select>
			            </div>
			            <div class="col-5">
			              <label>호</label>
			              <select class="select2 form-control form-control-lg" name="ho" id="ho">
			                <option value="0">호수를 입력하세요</option>
			                <c:forEach var="ho" items="${hoList}">
								<option value="${ho}">${ho}호</option>	                
			                </c:forEach>
			              </select>
			            </div>
			            <div class="col-2" style="margin-top:22px">
			            	<a class="btn btn-outline-primary" id="btPayListSearch">
			            		<i data-feather='search'></i>
			            	</a>
			            </div>
			            <!-- 편의상 authCode에 담는 미납내역필터유무 -->
			            <input type="hidden" name="authCode" id="notPaid" value="Y">
		            </div>
	            </form>
		      </div>
		      <div class="table-responsive">
		        <table class="table text-center">
			      <colgroup>
					  <col style="width:5%;" />
					  <col style="width:10%;" />
					  <col style="width:5%;" />
					  <col style="width:5%;" />
					  <col style="width:25%;" />
					  <col style="width:10%;" />
					  <col style="width:10%;" />
				  </colgroup>
		          <thead class="thead-light">
		            <tr>
		              <th>#</th>
		              <th>청구일</th>
		              <th>동</th>
		              <th>호</th>
		              <th>청구 금액</th>
		              <th>납부 기한</th>
		              <th>납부일</th>
		            </tr>
		          </thead>
		          <tbody id="tbPayList">
		            <!-- 조회 결과 -->
		          </tbody>
		        </table>
		        <!-- 페이저-->
				<!-- 이전 블럭으로 이동 -->
				<div class="center-block" style="clear: both; margin: 0 auto;">
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center mt-2">
							<c:if test="${pagingInfo.firstPage>1}">
								<li class="page-item prev"><a class="page-link" href="#"
									onclick="pageFunc(${pagingInfo.firstPage-1})"></a></li>
							</c:if>
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagingInfo.firstPage}"
									end="${pagingInfo.lastPage}">
								<c:if test="${i==pagingInfo.currentPage}">
									<li class="page-item active"><a class="page-link"
										href="javascript:void(0);" style="background-color: #2FA599;">
											${i}</a></li>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage}">
									<li class="page-item"><a href="#" class="page-link"
										onclick="pageFunc(${i})">${i}</a>
								</c:if>
							</c:forEach>
							<!-- 다음 블럭으로 이동 -->
							<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
								<li class="page-item next"><a class="page-link" href="#"
									onclick="pageFunc(${pagingInfo.lastPage+1})"></a></li>
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- 페이저-->
		      </div>
		    </div>
		  </div>
		</div>
	   <!-- Table head options end -->
     </div>
	</div>
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp"%>
