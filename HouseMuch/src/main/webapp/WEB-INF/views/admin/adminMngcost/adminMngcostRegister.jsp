<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript">
	$(function(){
		$('#mngcostPrice').focus();
		
		$('#mngcostMCtgNo').change(function(){
			$(this).parent().parent().next().find('#mngcostSCtgNo').html("<option value='0'>관리비 소분류</option>");
			if($(this).val()!=0){
				//호출된 태그 변수처리
				var me=this;
				//관리비 카테고리 세팅 
		 		$.ajax({
					url:"<c:url value='/mngcost/showSubCtg.do'/>",
					type:"get",
					data:"mngcostMCtgNo="+$(this).val(),
					dataType:"json",
					success:function(res){
						if(res.length>0){
							var str="<option value='0'>관리비 소분류</option>";
							$.each(res, function(idx, item){
								str+="<option value='"+item.mngcostSCtgNo
									+"'>"+item.mngcostSCtgName+"</option>";
							});
							$(me).parent().parent().next().find('#mngcostSCtgNo').html(str);
						}
					},
					error:function(xhr, status, error){
						alert("error : "+error);
					}
				});
			}
		});
		
		var pr=0;
		$('#mngcostPrice').focus(function(){
			pr=Number($(this).val());
		});
		$('#mngcostPrice').blur(function(){
			tot=Number($('#totalPay').html())-pr;
			$('#totalPay').html(tot+Number($(this).val()));
		});
		
		$('form[name=repeatFrm]').submit(function(){
			$('#beforeIsValid').val($('#isValid').val());
			
			if($('#mngcostMCtgNo').val()=="0"){
				alert('대분류가 선택되지 않았습니다.');
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;
			}else if($('#mngcostSCtgNo').val()=="0"){
				alert('소분류가 선택되지 않았습니다.');
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;
			}else if($('#mngcostPrice').val().length<=0){
				alert('지출 금액이 입력되지 않았습니다.');
				$(this).find('#mngcostPrice').focus();
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;
			}else if($('#mngcostContent').val().length<=0){
				$(this).find('#mngcostContent').val("내용 없음");
			}
		});
		
		$('select[name=mngcostSCtgNo]').change(function(){
			if($(this).val()==39){
				if(confirm('세대전기료 등록은 별도의 폼에서 입력이 가능합니다.\r\n진행하던 지출내역 등록을 중지하고,\r\n세대전기료 등록화면으로 이동하시겠습니까?')){
					location.href="<c:url value='/admin/adminMngcost/adminElectricChargeRegister.do'/>";
				}
				
				$(this).val(0);
			}
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
               <h2 class="content-header-title float-left mb-0">지출내역 등록</h2>
               <div class="breadcrumb-wrapper">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item">
                   	<a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">Home</a>
                   </li>
                   <li class="breadcrumb-item">지출내역 관리</li>
                   <li class="breadcrumb-item active">
                   	<a href="<c:url value='/admin/adminMngcost/adminMngcostRegister.do'/>">지출내역 등록</a>
                   </li>
                 </ol>
               </div>
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
		          <h4 class="card-title">지출 정보</h4>
		        </div>
		        <div class="card-body">
		          <form action="<c:url value='/admin/adminMngcost/adminMngcostRegisterOk.do'/>"
		          		class="invoice-repeater" method="post" name="repeatFrm" id="repeatFrm">
		            <div data-repeater-list="invoice">
		              <div data-repeater-item>
		                <div class="row d-flex align-items-end">
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="mngcostMCtgNo">대분류</label>
		                      <select class="form-control" id="mngcostMCtgNo"
		                      		aria-describedby="mngcostMCtgNo" name="mngcostMCtgNo">
		                      	<option value="0">관리비 대분류</option>
						    	<c:forEach var="mngcostMainCtgVo" items="${mngcostMainCtgList}">
						    		<option value="${mngcostMainCtgVo.mngcostMCtgNo}">
						    			${mngcostMainCtgVo.mngcostMCtgName}</option>
						    	</c:forEach>
		                      </select>
		                    </div>
		                  </div>
		                  <div class="col-md-2 col-12" id="testyong">
		                    <div class="form-group">
		                      <label for="mngcostContent">소분류</label>
		                      <select class="form-control" id="mngcostSCtgNo"
		                      		aria-describedby="mngcostContent" name="mngcostSCtgNo">
						    	<option value="0">관리비 소분류</option>
		                      </select>
		                    </div>
		                  </div>
		                  <div class="col-md-4 col-12">
		                    <div class="form-group">
		                      <label for="mngcostContent">지출 내용</label>
		                      <input type="text" class="form-control" id="mngcostContent"
		                      	aria-describedby="mngcostContent" placeholder="내용" name="mngcostContent" />
		                    </div>
		                  </div>
		
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="mngcostPrice">지출 금액</label>
		                      <input type="number" class="form-control" id="mngcostPrice"
		                        aria-describedby="mngcostPrice" placeholder="0" name="mngcostPrice"/>
		                    </div>
		                  </div>
		
		                  <div class="col-md-1 col-12 mb-50">
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
		              <div class="col-md-8 col-6">
		                <button class="btn btn-icon btn-outline-primary" type="button" data-repeater-create>
		                  <i data-feather="plus" class="mr-25"></i>
		                  <span>추가하기</span>
		                </button>
		              </div>
		              <div class="col-md-2 col-3">
		                 <div class="form-group">
		                   <label for="staticprice">총 지출액</label><br>￦
		                   <span id="totalPay">0</span>
		                 </div>
		              </div>
		              <div class="col-md-2 col-3">
		              	<input type="submit" class="btn btn-primary" value="등록">
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
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
    
    

