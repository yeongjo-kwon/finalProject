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
	//List 출력하는 ajax
	listAddCost();
	
	//insert 하는 ajax 
	$('#addFrm').submit(function(){
		if($('#mngCompNo').val()==0){
			alert('관리 업체를 선택해주세요');
			event.preventDefault();
			return false;
		}else if($('#costContent').val().length<1){
			alert('세부 수리 사항을 입력해주세요');
			event.preventDefault();
			return false;
		}else if($('#costPrice').val().length<1){
			alert('청구 할 비용을 입력해주세요');
			event.preventDefault();
			return false;
		}
		
		$.ajax({
			url:"<c:url value='/admin/adminFacility/addCost.do'/>",
			type:"post",
			data:$(this).serializeArray(),
			dataType:"json",
			success:function(res){
				if(res>0){
					alert('등록 되었습니다.');
				}
				$('#mngCompNo').val("0");
				$('#costContent').val('');
				$('#costPrice').val('');
				$('#costRegdate').val('');
				listAddCost(); //List 출력하는 함수 실행
			},
			error:function(xhr, status, error){
				alert("error! : " + error);
			}
		});
		
		event.preventDefault();
	});
	
	//승인된 내역 DataTable No 업체명 상세내용 추가비용 수리날짜 costNo mngCompName costContent costPrice costRegdate
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
	
	//수정 ajax 
	$('#editCost').submit(function(){
		if($('#editMngCompNo').val()==0){
			alert('관리 업체를 선택해주세요');
			event.preventDefault();
			return false;
		}else if($('#editCostContent').val().length<1){
			alert('세부 수리 사항을 입력해주세요');
			event.preventDefault();
			return false;
		}else if($('#editCostPrice').val().length<1){
			alert('청구 할 비용을 입력해주세요');
			event.preventDefault();
			return false;
		}
		
		$.ajax({
			url:"<c:url value='/admin/adminFacility/addCostUpdate.do'/>",
			type:"post",
			data:$(this).serializeArray(),
			dataType:"json",
			success:function(res){
				if(res>0){
					alert('수정 되었습니다.');
				}
				listAddCost(); //List 출력하는 함수 실행
			},
			error:function(xhr, status, error){
				alert("error! : " + error);
			}
		});
		$('#editForm').removeClass('show');
		body.removeClass('modal-show');
		
		event.preventDefault();
	});
	
});
//천단위 마다 콤마(,) 추가하는 함수 - 숫자
function addComma(value) {
  var num = ''+value;
  if (!num) return;
  // 문자열 길이가 3과 같거나 작은 경우 입력 값을 그대로 리턴
  if (num.length <= 3) {
    return num;
  }
  // 3단어씩 자를 반복 횟수 하기
  var count = Math.floor((num.length - 1) / 3);
  // 결과 값을 저정할 변수
  var result = "";
  // 문자 뒤쪽에서 3개를 자르며 콤마(,) 추가
  for (var i = 0; i < count; i++) {
    // 마지막 문자(length)위치 - 3 을 하여 마지막인덱스부터 세번째 문자열 인덱스값 구하기
    var length = num.length;
    var strCut = num.substr(length - 3, length);
    // 반복문을 통해 value 값은 뒤에서 부터 세자리씩 값이 리턴됨.
    // 입력값 뒷쪽에서 3개의 문자열을 잘라낸 나머지 값으로 입력값 갱신
    num = num.slice(0, length - 3);
    // 콤마(,) + 신규로 자른 문자열 + 기존 결과 값
    result = "," + strCut + result;
  }
  // 마지막으로 루프를 돌고 남아 있을 입력값(value)을 최종 결과 앞에 추가
  result = num + result;
  // 최종값 리턴
  return result;
}
//-costNo mngCompName costContent costPrice costRegdate
//미승인건
function listAddCost(){
	$.ajax({
		url:"<c:url value='/admin/adminFacility/listCostN.do'/>",
		type:"GET",
		dataType:"json",
		success:function(res){
			if(res.length>0){
				var str="";
				//No 업체명 상세내용 추가비용 수리날짜 비고
				$.each(res, function(idx, item){	
					str+="<tr><td>"+item.COST_NO+"</td>";
					str+="<td>"+item.MNG_COMP_NAME+"</td>"; //
					str+="<td>"+item.COST_CONTENT+"</td>";
					str+="<td>"+addComma(item.COST_PRICE)+" 원</td>";
					str+="<td>"+item.COST_REGDATE+"</td>";
					str+="<td><div class='dropdown'><button type='button' class='btn btn-sm dropdown-toggle hide-arrow' data-toggle='dropdown'>";
					str+="...</button>";
					str+="<div class='dropdown-menu'><a class='dropdown-item' data-toggle='modal' data-target='#editForm' onClick=editVal('"+item.COST_NO+"')>";
					str+="<span>수정</span></a>";
					str+="<a class='dropdown-item' onClick=del('"+item.COST_NO+"')><span>삭제</span></a>"
					str+="</div></div></td>"
					str+="</tr>";
				});
			}else{
				str="<tr><td colspan='6' style='text-align:center;'>데이터가 존재하지 않습니다.</td></tr>"
			}
			$('#noList').html(str);
			
		},
		error:function(xhr, status, error){
			alert("error! : " + error);
		}
	});
}
//삭제
function del(costNo){
	var costNo=costNo;
	$.ajax({
		url:"<c:url value='/admin/adminFacility/addCostDel.do'/>",
		type:"get",
		data:"costNo="+costNo,
		dataType:"json",
		success:function(res){
			if(res>0){
				alert('삭제 되었습니다.');
			}
			listAddCost(); //List 출력하는 함수 실행
		},
		error:function(xhr, status, error){
			alert("error! : " + error);
		}
	});
}

//수정 위해 costNo 값 입혀줌
function editVal(costNo){
	$('#editCostNo').val(costNo);
	var costNo=costNo;
	//editMngCompNo editCostContent editCostPrice editCostRegdate
	$.ajax({
		url:"<c:url value='/admin/adminFacility/addCostEditView.do'/>",
		type:"get",
		data:"costNo="+costNo,
		dataType:"json",
		success:function(res){
			$('#editMngCompNo').val(res.mngCompNo);
			$('#editCostContent').val(res.costContent);
			$('#editCostPrice').val(res.costPrice);
			$('#editCostRegdate').val(res.costRegdate);
		},
		error:function(xhr, status, error){
			alert("error! : " + error);
		}
	});

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
					<h2 class="content-header-title float-left mb-0">보수 비용 청구</h2>
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">추가 비용 관리</li>
						</ol>
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
		          <h4 class="card-title">보수 비용 추가 등록</h4>
		          <br>
		        </div>
		        <div class="card-body">
		          <form id="addFrm">
		            <div >
		              <div>
		                <div class="row d-flex align-items-end">
		                
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                    	<label for="mngCompName">관리 업체</label>
								<select class="select form-control" id="mngCompNo" name="mngCompNo">
									<option value="0">관리 업체</option>
									<c:forEach var="cVo" items="${cList }">
										<option value="${cVo.mngCompNo }">${cVo.mngCompName }</option>
									</c:forEach>			                
								</select>
		                    </div>
		                  </div>
              
		                  <div class="col-md-4 col-12">
		                    <div class="form-group">
		                    	<label for="costContent">정보</label>
		                      	<input type="text" class="form-control" id="costContent" aria-describedby="costContent" name="costContent" />
		                    </div>
		                  </div> 
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="costPrice">추가 요금</label>
		                      <input type="number" class="form-control" id="costPrice" aria-describedby="costPrice" name="costPrice" placeholder="원" style="text-align:right;"/>
		                    </div>
		                  </div>
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="costRegdate">수리 날짜</label><br>
		                      <input type="text" class="form-control flatpickr-basic flatpickr-input" id="costRegdate" aria-describedby="costRegdate" name="costRegdate" placeholder="YYYY-MM-DD"
		                      	readonly="readonly"/>
		                    </div>
		                  </div>
		
		                  <div class="col-md-2 col-12 mb-50">
		                    <div class="form-group">
		                      <button class="btn btn-outline-danger text-nowrap px-1" style="float:right; margin-bottom: 5px;" type="reset">
		                        <i class="mr-25"></i>
		                        <span>초기화</span>
		                      </button>
		                    </div>
		                  </div>
		                  
		                </div>
		                <hr />
		              </div>
		            </div>
		            <div class="row">
		              <div class="col-md-12 col-6 d-flex" style="float:right; text-align: right; align-self: flex-end; justify-content: flex-end">
		              	<input type="submit" id="regSubmit" class="btn btn-primary" style="float:right;" value="등록">
		              </div>
		              
		            </div>
		            
		          </form>
		          
		        </div>
		      </div>
		    </div>
		    <!-- /AddCost -->
		  </div>
		</section>
		
	
        <div class="content-body">
               <!-- Ajax Sourced Server-side -->
        	<section id="residentTable_section">
            	<div class="row">
                	<div class="col-12">
                    	<div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-title">결제 요청 내역 조회</h4>
                            </div>
                            <div class="card p-2">
                            	<table class="table table-hover" style="text-align:center;">
	                                <thead id="noThead"> 
	                                    <tr style="text-align: center;">
	                                        <th style="width:5%;">NO</th>
	                                        <th style="width:10%;">업체명</th>
	                                        <th style="width:30%;">상세내용</th>
	                                        <th style="width:10%;">추가비용</th>
	                                        <th style="width:10%;">수리 날짜</th>
	                                        <th style="width:7%;">&nbsp;</th>
	                                    </tr>
	                                </thead>
	                                <tbody style="text-align:center;" id="noList">
	                                </tbody>
                               </table>
                               
                             </div>
                         </div>
                     </div>
                 </div>
             </section>
		</div>
		
		<!-- Modal   -->
		<div class="demo-inline-spacing col-6">
            <div class="form-modal-ex">
                
                <!-- Modal -->
                <div class="modal fade text-left" id="editForm" tabindex="-1" role="modal" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel33">계약 내역 수정</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form id="editCost"  >
                                <div class="modal-body">
                                	<div class="row d-flex align-items-end">
	                                    <input type="hidden" class="form-control" id="editCostNo" name="costNo">
	                                    
	                                    <div class="col-md-3 col-12">
			                    			<div class="form-group">
			                                    <select class="select form-control" id="editMngCompNo" name="mngCompNo">
													<option value="0">관리 업체</option>
													<c:forEach var="cVo" items="${cList }">
														<option value="${cVo.mngCompNo }">${cVo.mngCompName }</option>
													</c:forEach>			                
												</select>
											</div>
										</div>
										
										<div class="col-md-4 col-12">
			                    			<div class="form-group">
												<input type="text" class="form-control" id="editCostContent" name="costContent" />
											</div>
										</div>
										
										<div class="col-md-2 col-12">
			                    			<div class="form-group">
												<input type="number" class="form-control" id="editCostPrice"  name="costPrice" placeholder="원" style="text-align:right;"/>
											</div>
										</div>
										
										<div class="col-md-3 col-12">
			                    			<div class="form-group">
												<input type="text" class="form-control flatpickr-basic flatpickr-input" id="editCostRegdate" aria-describedby="costRegdate" name="costRegdate" placeholder="YYYY-MM-DD"
					                      			readonly="readonly"/>
			                      			</div>
			                      		</div>
		                      		</div>	
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-primary" value="수정">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>        
            </div>	
		</div>	

        <!-- table승인건 -->
		<div class="content-body">
               <!-- Ajax Sourced Server-side -->
        	<section id="residentTable_section">
            	<div class="row">
                	<div class="col-12">
                    	<div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-title">결제 승인 내역 조회</h4>
                                <h6>해당 담당자가 결제 승인 한 내역을 조회 해드립니다.</h6>
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
    
