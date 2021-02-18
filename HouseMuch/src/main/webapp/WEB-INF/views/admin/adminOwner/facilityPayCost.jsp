<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//승인완료 테이블
	var table=$('#yTable').DataTable({
		ajax:{
			url:"<c:url value='/admin/adminFacility/listCostY.do'/>",
			type:"GET",
			dataSrc:''
		},
		columns:[
            {data:"COST_NO"},
            {data:"MNG_COMP_NAME"},
            {data:"COST_CONTENT"},
            {data:"COST_PRICE", render:function(data){return addComma(data)+"원"}},
            {data:"COST_REGDATE"},
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
	
	//전체 선택, 해제
	$('#allChk').click(function(){
		if($(this).is(":checked")){
			$('.chk').prop("checked",true);
		}else{
			$('.chk').prop("checked",false);
		}
	});
	
	//한개라도 선택 해제 시 전체선택 체크박스도 해제
	$('.chk').click(function(){
		var is_checked = true;
	    
	    $(".table .chk").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });
	    
	    $("#allChk").prop("checked", is_checked);
	});
	
	//체크 변경 될 시
	$('#nTable input[type=checkbox]').change(function(){
		getTCPrice();
	});
	
	//tr 누를시
	$('#nTable #listTableRow').click(function(){
		bool=$(this).find('input[type=checkbox]').prop("checked");
		$(this).find('input[type=checkbox]').prop("checked", !bool);
		getTCPrice();
	});
	
	//결제버튼 누를시
	$('#pay').click(function(){
		var chkCount=0;
		$('#nTable tbody #chkCostNo:checked').each(function(){
			chkCount++;
		});
		
		if(chkCount<=0){
			alert("결제 할 내역이 선택되지 않았습니다. 내역을 선택해주세요.");
			return false;
		}
		$('form[name=frmPayIMP]').submit();
	});
	
});
function getTCPrice(){
	var tCPrice=0;
	$('#nTable tbody #chkCostNo:checked').each(function(){
		tCPrice+=Number($(this).next().val());
	});
	
	$('#totalPrice').html('총'+addComma(tCPrice)+'원');
	$('#payAmount').val(tCPrice);
}

//천단위 마다 콤마(,) 추가하는 함수 - 숫자
function addComma(value) {
  var num = ''+value;
  if (!num) return;
  if (num.length <= 3) {
    return num;
  }
  var count = Math.floor((num.length - 1) / 3);
  var result = "";
  for (var i = 0; i < count; i++) {
    var length = num.length;
    var strCut = num.substr(length - 3, length);
    num = num.slice(0, length - 3);
    result = "," + strCut + result;
  }
  result = num + result;
  return result;
}
</script>


	<!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
     
     <div class="content-wrapper">
       <div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">유지보수 추가 결제</h2>
					
				</div>
			</div>
		</div>
       
       <div class="content-body">

        <div class="content-body">
               <!-- Ajax Sourced Server-side -->
        	<section id="residentTable_section">
            	<div class="row">
                	<div class="col-12">
                    	<div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-title">결제 요청 내역</h4>
                                <div class="d-inline-flex">
                                	<button class="btn btn-primary" id="pay">결제</button>
                                </div>
                            </div>
                            <form action="<c:url value='/admin/adminOwner/payIMP.do'/>" method="post" name="frmPayIMP">
                            <div class="card p-2">
	                            <input type="hidden" name="apartVo.address" value="${apartVo.address}">
			        			<input type="hidden" name="apartVo.zipcodeSeq" value="${apartVo.zipcodeSeq}">
                            	<table class="table table-hover" style="text-align:center;" id="nTable">
	                                <thead id="noThead"> 
	                                    <tr style="text-align: center;">
	                                    	<th style="width:5%" ><input type="checkbox" id="allChk"></th>
	                                        <th style="width:5%;">NO</th>
	                                        <th style="width:10%;">업체명</th>
	                                        <th style="width:30%;">상세내용</th>
	                                        <th style="width:10%;">추가비용</th>
	                                        <th style="width:10%;">수리 날짜</th>
	                                    </tr>
	                                </thead>
	                                <tbody style="text-align:center;" id="noList">	                                	
					                    <c:if test="${empty list}">
							        		<tr>
							        			<th scope="row"></th>
							        			<td colspan="6">미승인 내역이 존재하지 않습니다.</td>
							        		</tr>
							        	</c:if>
							        	
							        	<c:if test="${!empty list}">
							        		<c:set var="k" value="0"/>
								        	<c:forEach var="map" items="${list}">
								        		<tr id="listTableRow">
								        			<td> 
								        				<input type="checkbox" name="addCostList[${k}].costNo" value="${map['COST_NO']}" class="chk" id="chkCostNo">
								        				<input type="text" hidden="hidden" value="${map['COST_PRICE'] }">
								        			</td>
								        			<td><span>${map['COST_NO'] }</span></td>
								        			<td><span>${map['MNG_COMP_NAME'] }</span></td>
								        			<td><span>${map['COST_CONTENT'] }</span></td>
								        			<td style="text-align:right;"><span><fmt:formatNumber value="${map['COST_PRICE'] }" pattern="#,###"/></span> 원</td>
								        			<td><span>${map['COST_REGDATE'] }</span></td>
								        		</tr>
									          	<c:set var="k" value="${k+1}"/>
								          	</c:forEach>
							          	</c:if>
	                                </tbody>
                               </table>
                               <div class="float-right mt-1">
	                               <span id="totalPrice" style="float:right; color:blue">총 0원</span>
	                               <input type="hidden" name="payAmount" id="payAmount">             
                               </div>
                             </div>
                             </form>
                         </div>
                     </div>
                 </div>
             </section>
		</div>

        <!-- table승인건 -->
		<div class="content-body">
               <!-- Ajax Sourced Server-side -->
        	<section id="residentTable_section">
            	<div class="row">
                	<div class="col-12">
                    	<div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-title">결제 완료 내역</h4>
                            </div>
                            <div class="card p-2">
                            	<table class="table" style="text-align:center;" id="yTable">
	                                <thead>
	                                    <tr style="text-align: center;">
	                                        <th style="width:5%;">NO</th>
	                                        <th style="width:20%;">업체명</th>
	                                        <th style="width:10%;">상세내용</th>
	                                        <th style="width:10%;">추가비용</th>
	                                        <th style="width:10%;">수리 날짜</th>
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
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
<!-- BEGIN: Page Vendor JS -->
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>

<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
<!-- END: Page Vendor JS-->
    
