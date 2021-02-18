<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript">
	$(function(){
		payListInqAjax();
		
		$('#customSwitch10').change(function(){
			$('input[name=currentPage]').val(1);
			if($('#notPaid').val()=="Y"){
				$('#notPaid').val("N");
			}else if($('#notPaid').val()=="N"){
				$('#notPaid').val("Y");
			}
			
			payListInqAjax();
		});
		
		$('#btPayListSearch').click(function(){
			$('input[name=currentPage]').val(1);
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
						if(idx==(res.length-1)){
							var firstPage=item.pagingInfo.firstPage;
							var currentPage=item.pagingInfo.currentPage;
							var totalPage=item.pagingInfo.totalPage;
							var lastPage=item.pagingInfo.lastPage;
							
							var pageStr="";
							if(firstPage>1){
								pageStr+='<li class="page-item prev"><a class="page-link" href="#" onclick="pageFunc('+(firstPage-1)+')"></a></li>'
							}
							
							for(var i=firstPage; i<=lastPage; i++){
								if(i==currentPage){
									pageStr+='<li class="page-item active"><a class="page-link" href="javascript:void(0);" style="background-color:#2FA599;">'+i+'</a></li>';
								}else{
									pageStr+='<li class="page-item"><a href="#" class="page-link" onclick="pageFunc('+i+')">'+i+'</a>';
								}
							}
							
							if(lastPage<totalPage){
								pageStr+='<li class="page-item next"><a class="page-link" href="#" onclick="pageFunc('+(lastPage-1)+')"></a></li>';
							}
							
							$('#ulPaging').html(pageStr);
						}else{
							if(res.length==0){
								str+="<tr><td colspan='6'>납부내역이 존재하지 않습니다.</td></tr>";
							}else{
								str+="<tr><td>"+item.MNGCOST_LIST_NO+"</td>";
								str+="<td>"+formatDate(item.MNGCOST_CLAIMDATE)+"</td>";
								str+="<td>"+item.DONG+"</td>";
								str+="<td>"+item.HO+"</td>";
								str+="<td class='text-right'>"+numFormat(item.MNGCOST_TOTAL_PRICE)+"원</td>";
								str+="<td>"+formatDate(item.MNGCOST_LIMITDATE)+"</td> <td>";
								if(item.MNGCOST_PAYDATE==null){
									str+="<div class='avatar pull-up my-0'>";
									str+="<a href='#' onclick='sendMailAjax(\""+item.HOUSEHOLD_CODE+"\",\""+item.MNGCOST_CLAIMDATE+"\",\""+item.MNGCOST_TOTAL_PRICE+"\",\""+item.MNGCOST_LIMITDATE+"\", this)' class='btn btn-warning'>미납</a></div>";
								}else{
									str+=formatDate(item.MNGCOST_PAYDATE);
								}
								str+="</td></tr>";
							}
						}
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
	
	//날짜 포맷(타임스탬프 변환)
	function formatTimestamp(date) {
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
	
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		payListInqAjax();
	}
	
	function sendMailAjax(householdCode, mngcostClaimdate, mngcostTotalPrice, mngcostLimitdate, sendRowEl){
		sendRowEl.setAttribute("class", "btn disabledButton");
		$.ajax({
			url:"<c:url value='/email/sendPressPayment.do'/>",
			type:"post",
			data:{
				householdCode:householdCode,
				mngcostClaimdate:formatTimestamp(Number(mngcostClaimdate)),
				mngcostTotalPrice:mngcostTotalPrice,
				mngcostLimitdate:formatDate(Number(mngcostLimitdate))
			},
			dataType:"text",
			success:function(res){
				alert(res);
			},
			error:function(xhr, status, error){
				alert("error : "+error);
			}
		});
	}
</script>
<style>
	.page-item.active {
	    border-radius: 0;
	    background-color: #E5F9F0;
	    border-color: #82E3C8;
	}
	
	.disabledButton{
	    display: inline-block;
		border-color: #82868B !important; 
		background-color: #82868B !important;
		color: #FFFFFF !important;
		user-select: none;
		border: 1px solid transparent;
	    padding: 0.786rem 1.5rem;
	    font-size: 1rem;
	    line-height: 1;
	    border-radius: 0.358rem;
	    pointer-events: none;
	    cursor: default;
	}
	.disabledButton:hover{
		color: #FFFFFF;
	}
</style>
	<!-- BEGIN: Content-->
	<div class="app-content content ">
     <div class="content-overlay"></div>
     <div class="header-navbar-shadow"></div>
     <br>
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
                   <li class="breadcrumb-item">납입내역 관리</li>
                   <li class="breadcrumb-item active">
                   	<a href="<c:url value='/admin/adminMngcost/adminPaymentListInquiry.do'/>">납입내역 조회</a>
                   </li>
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
	            	<input type="hidden" name="currentPage" value="1">
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
					  <col style="width:20%;" />
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
				<div class="divPage">
					<nav aria-label="Page navigation">
						<!-- 페이징 리스트가 올 자리 -->
						<ul class="pagination justify-content-center mt-2" id="ulPaging"></ul>
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
