<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btOrder').addClass('disableButton');
		
		$('#flatpickr select.form-control').change(function(){
			if($('#selectDate').val().length>0){
				ajaxAdminInquiry();
			}else{
				alert("날짜를 입력하세요");
				$(this).val(0);
				location.href="#selectDate";
			}
			
			if($(this).attr("id")=="mngcostMCtgNo"){
				$(this).parent().parent().find('#mngcostSCtgNo').html("<option value='0'>관리비 소분류</option>");
				if($(this).val()!=0){
					ajaxCtgSetting($(this));
				}
			}
		});
		
		$('div.modal-body select[name=mngcostMCtgNo]').change(function(){
			$(this).parent().parent().find('#mngcostSCtgNo').html("<option value='0'>관리비 소분류</option>");
			if($(this).val()!=0){
				ajaxCtgSetting($(this));
			}
		});
		
		$('#selectDate').change(function(){
			$('#mngcostMCtgNo').val(0);
			var seDate=$(this).val().split(' to ');
			$('#startdate').val(seDate[0]);
			$('#enddate').val(seDate[1]);
			if($('#startdate').val().length>0){
				ajaxAdminInquiry();
				$('#btOrder').removeClass('disableButton');
				$('#btOrder').prop("disabled", false);
			}
			$(this).focus();
		});
		
		$('#selectDate').blur(function(){
			if($(this).val().length==0){
				$('#startdate').val("");
				$('#btOrder').addClass('disableButton');
				$('#btOrder').prop("disabled", true);
			}
		});
		
		$('#btMngcostOrder').click(function(){
			var d=new Date();
			year = d.getFullYear(),
			month = '' + (d.getMonth() + 1);
		    if (month.length < 2) month = '0' + month;
		    
			currMonth=[year, month, '01'].join('-');
			if(currMonth<=$('#enddate').val()){
				alert('현재 달('+month+'월)과 그 이후의 달은 아직 청구할 수 없습니다.');
				return false;
			}else{
				$('#OrderByDate').submit();
			}
		});
		
		$('#btMngcostDel').click(function(){
			var len=$('#mngcostFrm').find('input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 내역이 선택되지 않았습니다.');
				return false;
			}else{
				if(confirm('선택하신 내역(들)을 삭제하시겠습니까?')){
					$('#mngcostFrm').prop('action', '<c:url value="/admin/adminMngcost/adminMngcostDelMulti.do"/>');
					$('#mngcostFrm').submit();
				}
			}
		});
		
		$('#btEditModal').click(function(){
			var len=$('#mngcostFrm').find('input[type=checkbox]:checked').length;
			if(len<=0){
				alert('수정할 내역이 선택되지 않았습니다.');
				return false;
			}else if(len>1){
				alert('수정은 한 번에 한 내역만 가능합니다. 한 가지만 선택해주세요.');
				checkall(false);
				return false;
			}else{
				var editEl=$('#mngcostFrm').find('input[type=checkbox]:checked');
				$.ajax({
					url:"<c:url value='/admin/adminMngcost/showMngcostEditInfo.do'/>",
					type:"get",
					data:"mngcostNo="+$(editEl).val(),
					dataType:"json",
					success:function(res){
						if(!res){
							return false;	
						}else{
							$('div.modal-body').find('#mngcostMCtgNo').val(res.mngcostMCtgNo);
							ajaxCtgSetting($('div.modal-body').find('#mngcostMCtgNo'));
							
							$('div.modal-body').find('#mngcostContent').val(res.mngcostContent);
							$('div.modal-body').find('#mngcostPrice').val(res.mngcostPrice);
							$('div.modal-body').find('#mngcostNo').val(res.mngcostNo);
							$('div.modal-body').find('#mngcostUsedate').val(formatDate(res.mngcostUsedate));
							
							$('div.modal-body').find('#mngcostSCtgNo').val(res.mngcostSCtgNo);
							//모달이 뜨면서 초기화 됨 일단 세팅
						}
					},
					error:function(xhr, status, error){
						alert("error : "+error);
					}
				});
			}
		});
		
		$('#btMngcostEditOk').click(function(){
			if(confirm('작성하신 내용으로 수정하시겠습니까?')){
				if($('div.modal-body').find('#mngcostMCtgNo').val()==0 || $('div.modal-body').find('#mngcostSCtgNo').val()==0){
					alert("분류명 재선택이 필요합니다.");
					return false;
				}else {
					$('form[name=mngcostInfoEditFrm]').submit();
				}
			}
		});
	});
	
	//체크박스 전체 선택/해제
	function checkall(bool){
		$('#mngcostFrm').find('input[type="checkbox"]').each(function(){
			$(this).prop("checked", bool);
		});
	}
	
	//날짜 포맷
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
<style type="text/css">
  	.disableButton{
  		background: silver !important;
  		border: silver solid 1px !important;
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
	               <h2 class="content-header-title float-left mb-0">지출내역 정보</h2>
	               <div class="breadcrumb-wrapper">
	                 <ol class="breadcrumb">
	                   <li class="breadcrumb-item">
	                   	<a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">Home</a>
	                   </li>
	                   <li class="breadcrumb-item">지출내역 관리</li>
	                   <li class="breadcrumb-item active">
	                   	<a href="<c:url value='/admin/adminMngcost/adminMngcostInquiry.do'/>">지출내역 정보</a>
	                   </li>
	                 </ol>
	               </div>
	             </div>
	           </div>
	         </div>
			</div>
			<form id="OrderByDate" action="<c:url value='/admin/adminMngcost/adminMngcostInqToOrder.do'/>" method="post">
				<input type="hidden" id="startdate" name="startdate">
	      		<input type="hidden" id="enddate" name="enddate">
      		</form>
	      	<section id="flatpickr" class="col-12">
			  <div class="card">
			    <div class="card-header">
			      <h4 class="card-title"><i data-feather='search'></i> 검색조건</h4>
			    </div>
			    <div class="card-body">
			      <div class="row">
			        <div class="col-md-6 form-group">
			          <label for="fp-range">조회 기간</label>
			          <input type="text" id="selectDate" class="form-control flatpickr-range"
			            placeholder="조회 기간을 선택하세요"/>
			        </div>
			      </div>
			    </div>
			    <div class="col-md-8 col-12 mb-4 float-right" style="margin-bottom:10px !important">
		      		<div class="col-md-6 col-6 mb-2 float-right">
					    <select class="form-control" id="mngcostSCtgNo" name="mngcostSCtgNo">
					    	<option value="0">관리비 소분류</option>
					    </select>
				    </div>
			    	<div class="col-md-6 col-6 mb-2 float-right">
					    <select class="form-control" id="mngcostMCtgNo" name="mngcostMCtgNo">
					        <option value="0">관리비 대분류</option>
					    	<c:forEach var="mngcostMainCtgVo" items="${mngcostMainCtgList}">
					    		<option value="${mngcostMainCtgVo.mngcostMCtgNo}">
					    			${mngcostMainCtgVo.mngcostMCtgName}</option>
					    	</c:forEach>
					    </select>
			   		</div>
		      	</div>
			  </div>
			</section>
      		
	      	<section class="col-12">
	      		  <a class="badge badge-dark" href="javascript:checkall(true)">전체 선택</a>
	      		  <a class="badge badge-light-dark" href="javascript:checkall(false)">전체 해제</a>
	      		  
	      		  <button id="btMngcostDel" class="btn btn-danger float-right" style="margin:10px">삭제</button>
	      		  
		      	  <!-- Button trigger modal -->
	              <button type="button" class="btn btn-warning float-right" style="margin:10px"
	              	data-toggle="modal" data-target="#inlineForm" id="btEditModal">수정</button>
	              <!-- Modal -->
	              <div class="modal fade text-left" id="inlineForm" tabindex="-1"
	                	role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
	                <div class="modal-dialog modal-dialog-centered" role="document">
	                  <div class="modal-content">
	                    <div class="modal-header">
	                      <h4 class="modal-title" id="myModalLabel33">지출내역 수정하기</h4>
	                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                      </button>
	                    </div>
	                    <form name="mngcostInfoEditFrm" action="<c:url value='/admin/adminMngcost/adminMngcostInfoEdit.do'/>"
	                    	method="post">
	                      <div class="modal-body">
	                      	<div class="col-md-6 col-6 mb-2 float-left">
							    <select class="form-control" id="mngcostMCtgNo" name="mngcostMCtgNo">
							        <option value="0">관리비 대분류</option>
							    	<c:forEach var="mngcostMainCtgVo" items="${mngcostMainCtgList}">
							    		<option value="${mngcostMainCtgVo.mngcostMCtgNo}">
							    			${mngcostMainCtgVo.mngcostMCtgName}</option>
							    	</c:forEach>
							    </select>
					   		</div>
	                      	<div class="col-md-6 col-6 mb-2 float-left">
							    <select class="form-control" id="mngcostSCtgNo" name="mngcostSCtgNo">
							    	<option value="0">관리비 소분류</option>
							    </select>
						    </div>
					    	
	                        <label>지출내용</label>
	                        <div class="form-group">
	                          <input type="text" placeholder="수정할 지출내용을 입력하세요"
	                          	id="mngcostContent" name="mngcostContent" class="form-control" />
	                        </div>
	                        <label>지출금액</label>
	                        <div class="form-group">
	                          <input type="number" placeholder="수정할 지출금액을 입력하세요"
	                          	id="mngcostPrice" name="mngcostPrice" class="form-control" />
	                        </div>
	                        <input type="hidden" id="mngcostNo" name="mngcostNo">
	                        <input type="hidden" id="mngcostUsedate" name="mngcostUsedate">
	                      </div>
	                      <div class="modal-footer">
	                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btMngcostEditOk">수정하기</button>
	                      </div>
	                    </form>
	                  </div>
	                </div>
	              </div>
              
				<div class="col-md-12 float-left" style="background-color:#ffffff; padding:0;
						margin-right:20px; box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
					<form action="" id="mngcostFrm">
					    <table class="table table-striped" id="mngcostInfoTable"  style="margin-bottom:0;">
						    <colgroup>
								<col style="width:5%;" />
								<col style="width:50%;" />
								<col style="width:20%;min-width:50px;" />
								<col style="width:25%;min-width:50px;" />
							</colgroup>
						    <thead>
						       	<tr>
							        <th scope="col">#</th>
							        <th scope="col">지출내용</th>
							        <th scope="col">지출금액</th>
							        <th scope="col">지출일자</th>
						       	</tr>
						    </thead>
						    <tbody>
						    	<!-- 조회결과가 올 자리 -->
						    	<c:forEach var="mngcostInfoVo" items="${mngcostInfoList}">
						    	<tr>
						    		<th scope='row'>
						    			<input type="checkbox" name="mngcostNoArray[]"
											value="${mngcostInfoVo.mngcostNo}">
						    		</th>
									<td>${mngcostInfoVo.mngcostContent}</td>
									<td><fmt:formatNumber value="${mngcostInfoVo.mngcostPrice}"
										pattern="#,###"/>원</td>
									<td><fmt:formatDate value="${mngcostInfoVo.mngcostUsedate}"
										pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>
								</c:forEach>
						    </tbody>
						</table>
					</form>
				</div>
				<div class="clearfix"></div>
				<div class="col-lg-12 col-md-12 mb-1 mb-lg-0" style="padding: 0">
					<button type="button" class="btn btn-primary btn-block" style="margin: 20px 0;"
						id="btOrder" data-toggle="modal" data-target="#xSmall" disabled="disabled">관리비 청구하기</button>
						
					<div class="modal fade text-left" id="xSmall" tabindex="-1"
		                	role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
		            	<div class="modal-dialog modal-dialog-centered modal-xs" role="document">
		                  <div class="modal-content">
		                    <div class="modal-header">
		                      <h4 class="modal-title" id="myModalLabel20">관리비 청구</h4>
		                      <button type="button" class="close"
		                      		data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true">&times;</span>
		                      </button>
		                    </div>
		                    <div class="modal-body">
		                    	<p><br>
		                    		<b>조회한 달의 관리비를 청구하시겠습니까?</b><br><br>
		                    	 	<span>조회한 기간이 포함 된 해당월의  관리비를 공동 청구합니다</span>
		                    	</p>
		                    	<div class="alert alert-warning" role="alert">
		                        <div class="alert-body">
		                          <span class="font-weight-bolder">주의!</span>
		                          <span style="font-size: 0.9em">말일이 지나야 당월의 청구가 가능합니다</span>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="modal-footer">
		                      <button type="button" class="btn btn-primary" data-dismiss="modal"
		                      	id="btMngcostOrder">확인</button>
		                    </div>
		                  </div>
		                </div>
		     		</div>
		     	</div>
			</section>
		</div>
	</div>
	<!-- END: 대시보드 박스 -->

<section></section>
<section></section>
<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp" %>