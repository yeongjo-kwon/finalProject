<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript">
	$(function(){
		$('#UCostAmount').keyup(function(){
			//전기요금 계산 (주택용 전력(저압))
			var amount=$(this).val();
			var price=0;
			
			//누진제 적용
			if(amount<=200){
				price=910+(amount*93.3);
			}else if(amount<=400){
				price=1600+(200*93.3)+((amount-200)*187.9);
			}else{
				price=7300+(200*93.3)+(200*187.9)+((amount-400)*280.6);
			}
			
			//부가세 + 전력기금 추가 (+10원 절삭)
			price+=price*0.137;
			$('#UCostPrice').val(Math.round(price/10)*10);
		});
		
		$('#repeatFrm').submit(function(){
			$('#beforeIsValid').val($('#isValid').val());
			
			if($('#householdCode').val()=="0"){
				alert('세대가 선택되지 않았습니다.');
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;
			}else if($('#dupCheckCount').val()!="0"){
				alert('중복된 세대코드가 존재합니다.');
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;
			}else if($('#UCostAmount').val().length<=0){
				alert('전기 사용량이 입력되지 않았습니다.');
				$('#UCostAmount').focus();
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;
			}
		});
		
		$('#householdCode').change(function(){
			ajaxElecChrgDupCheck($(this));
		});
	});
</script>
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
               <h2 class="content-header-title float-left mb-0">세대전기료 등록</h2>
               <div class="breadcrumb-wrapper">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item">
                   	<a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">Home</a>
                   </li>
                   <li class="breadcrumb-item">관리비 관리</li>
                   <li class="breadcrumb-item active">
                   	<a href="<c:url value='/admin/adminMngcost/adminElectricChargeRegister.do'/>">세대전기료 등록</a>
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
       <div class="content-body">
       	<section class="form-control-repeater">
		  <div class="row">
		    <!-- Invoice repeater -->
		    <div class="col-12">
		      <div class="card">
		        <div class="card-header">
		          <h4 class="card-title">전기료 정보</h4>
				  <div id="iconInfo" style="display:none">
					  <span style="color:red;">
						<i data-feather='x-circle'></i>
					  </span> 이미 등록 된 세대 &nbsp;
					  <span style="color:orange;">
						<i data-feather='x-circle'></i>
					  </span> 중복 선택 된 세대
				  </div>
				</div>
		        <div class="card-body">
		          <form action="<c:url value='/admin/adminMngcost/adminElectricChargeRegister.do'/>"
		          		class="invoice-repeater2" method="post" name="repeatFrm" id="repeatFrm">
		            <div data-repeater-list="invoice">
		              <div data-repeater-item>
		                <div class="row d-flex align-items-end">
		                  <div class="col-md-3 col-12">
		                    <div class="form-group">
		                      <label for="householdCode">세대
		                      	<span id="cautionIcon" style="color:red; display:none;">
		                      		<i data-feather='x-circle'></i>
		                      	</span>
		                      	<span id="warnIcon" style="color:orange; display:none;">
		                      		<i data-feather='x-circle'></i>
		                      	</span>
		                      </label>
		                      <select class="form-control" id="householdCode"
		                      		aria-describedby="householdCode" name="householdCode">
		                      	<option value="0">세대 상세주소</option>
						    	<c:forEach var="householdInfoVo" items="${householdInfoList}">
						    		<option value="${householdInfoVo.householdCode}">
						    			${householdInfoVo.dong}동 ${householdInfoVo.ho}호</option>
						    	</c:forEach>
		                      </select>
		                      <input type="hidden" id="dupFlag" value="N">
		                    </div>
		                  </div>
		                  <div class="col-md-3 col-12">
		                    <div class="form-group">
		                      <label for="UCostAmount">사용량 (kWh)</label>
		                      <input type="number" class="form-control" id="UCostAmount"
		                      	aria-describedby="UCostAmount" placeholder="사용량 입력" name="UCostAmount" />
		                    </div>
		                  </div>
		
		                  <div class="col-md-4 col-12">
		                    <div class="form-group">
		                      <label for="UCostPrice">청구금액 (원)</label>
		                      <input type="number" class="form-control" id="UCostPrice"
		                        aria-describedby="UCostPrice" placeholder="0" name="UCostPrice"
		                        style="border:0; background:white; box-shadow:none;" readonly/>
		                    </div>
		                  </div>
		
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <button class="btn btn-outline-danger text-nowrap px-1" data-repeater-delete type="button">
		                        <i data-feather="x" class="mr-25"></i>
		                        <span>삭제</span>
		                      </button>
		                    </div>
		                  </div>
		                </div>
		                <hr />
		              </div>
		            </div>
		            <div class="row">
		              <div class="col-md-10 col-7">
		                <button class="btn btn-icon btn-outline-primary" type="button" data-repeater-create>
		                  <i data-feather="plus" class="mr-25"></i>
		                  <span>추가하기</span>
		                </button>
		              </div>
		              <div class="col-md-2 col-5">
		              	<input type="submit" id="submitElecReg" class="btn btn-outline-primary" value="등록">
		              	<input type="hidden" id="dupCheckCount" value="0">
		              </div>
		            </div>
		          </form>
		          <input type="hidden" id="beforeIsValid" value="0">
		          <input type="hidden" id="isValid" value="0">
		        </div>
		      </div>
		    </div>
		    <!-- /Invoice repeater -->
		  </div>
		</section>
       </div>
     </div>
	</div>
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjFormRepeater.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
