<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../mainInc/mainTop.jsp" %>    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/colors.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">

<style>
.custom-radio-bin .custom-control-label-bin::before {
  top : 0.1rem;
  margin:0;
}

.custom-checkbox.custom-control-bin, .custom-radio.custom-control-bin {
  padding-left : 1.8rem;
  margin:0;
}

.input-group .custom-checkbox-bin.custom-control-bin, .input-group
.custom-radio-bin.custom-control-bin {
  padding-left : 1.3rem;
  margin:0;
}

.custom-checkbox-bin .custom-control-input-bin, .custom-radio-bin .custom-control-input-bin {
  width : 1.285rem;
  height : 1.285rem;
  margin:0;
}

.custom-checkbox-bin .custom-control-label-bin, .custom-radio-bin .custom-control-label-bin {
  font-size : 1rem;
  position : static;
  margin:0;
}

.custom-checkbox-bin .custom-control-label-bin::before, .custom-checkbox-bin .custom-control-label-bin::after, .custom-radio-bin .custom-control-label-bin::before, .custom-radio-bin .custom-control-label-bin::after {
  width : 18px;
  height : 18px;
  left : 0;
  margin:0;
}

.custom-checkbox-bin .custom-control-input-bin:checked ~ .custom-control-label-bin::before, .custom-radio-bin .custom-control-input-bin:checked ~ .custom-control-label-bin::before {
  box-shadow : 0 2px 4px 0 rgba(115, 103, 240, 0.4) !important;
  margin:0;
}

.custom-checkbox-bin .custom-control-input:disabled ~ .custom-control-label::before, .custom-radio .custom-control-input:disabled ~ .custom-control-label-bin::before {
  border : none;
  box-shadow : none !important;
  margin:0;
}

.custom-checkbox-bin .custom-control-input-bin:focus ~ .custom-control-label-bin::before, .custom-radio-bin .custom-control-input-bin:focus ~ .custom-control-label-bin::before {
  border-color : none;
  box-shadow : 0 2px 4px 0 rgba(115, 103, 240, 0.4) !important;
  margin:0;
}

.custom-control-input-bin:not(:disabled):active ~ .custom-control-label-bin::before {
  background-color : #7367F0 !important;
  border-color : #7367F0 !important;
  margin:0;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	listCarInfo();
	
	//regdate
	$('#regDiv').css('visibility', 'hidden');

	$('#isVisitorYDiv').click(function(){
		$('#regDiv').css('visibility', 'visible');
	});
	$('#isVisitorNDiv').click(function(){
		$('#regDiv').css('visibility', 'hidden');
	});
	
	// chkCar
	$('#regFrm').submit(function(){
		if($('#carNumber').val().length<1){
			alert('차 번호를 확인해주세요');
			$('#carNumber').focus();
			event.preventDefault();
			return false;
		}
		
		$.ajax({
			url:"<c:url value='/living/car/carInsert.do'/>",
			type:"post",
			data:$(this).serializeArray(),
			dataType:"json",
			success:function(res){
				if(res>0){
					alert('등록 되었습니다.');
				}
				$('#carNumber').val('');
				$('#note').val('');
				$('#regdate').val('');
				listCarInfo();
			},
			error:function(xhr, status, error){
				alert("error! : " + error);
			}
		});
		
		event.preventDefault();
	});
	
	

});
function listCarInfo(){
	$.ajax({
		url:"<c:url value='/living/car/carListAll.do'/>",
		type:"GET",
		dataType:"json",
		success:function(res){
			if(res.length>0){
				var str="";
				$.each(res, function(idx, item){	
					str+="<tr><td>"+item.carRegNo+"</td>";
					str+="<td>"+item.carNumber+"</td>";
					str+="<td>"+item.note+"</td>";
					str+="<td>"+item.orderdate+"</td>";
					str+="<td>"+visit(item.isVisitor)+"</td>";
				});
			}else{
				str="<tr><td colspan='5' style='text-align:center;'>등록 되어있는 데이터가 없습니다.</td></tr>";
			}
			$('#carInfo').html(str);
			
		},
		error:function(xhr, status, error){
			alert("error! : " + error);
		}
	});
}

function visit(isVisitor){
	var is = isVisitor;
	if(is=='N'){
		is = '세대차량';
	}else if(is=='Y'){
		is = '방문차량';
	}
	return is;
}
</script>


<!-- ======= Start About Section ======= -->
<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs" style="margin-top:80px">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>차량 관리</h2>
				<ol>
					<li><a href="<c:url value='/main/index.do'/>">Home</a></li>
					<li>차량 관리</li>
				</ol>
			</div>
		</div>
	</section>
</main><!-- End #main -->

<section id="about">
<div class="container">
	<!-- START : 대시보드 박스 -->
	<input type="hidden" id="mngcostClaimdate">
    
	<div class="app-content content"><!-- 바꾸면 안됨 -->
	   	<div class="card-title">
	    	<h4 class="card-title"><i data-feather='list'></i>차량 등록</h4>
	    </div>
	    <br>
	    
	   	<div class="col-md-12 float-left" style="background-color:#ffffff;padding:0; margin-right:20px;margin-bottom:50px; box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
	      	<div class="card-body mb-1">
	        	<p class="card-text">
	          		차량 등록<br>
	          		<small>우리 세대의 차량과 세대를 방문할 차량을 등록 할 수 있습니다.</small>
	        	</p>
	        	<hr>
	        	<input type="hidden" id="chkCar">
	        	<form id="regFrm">
	        	<div class="row">
					<div class="col-xl-2 col-md-6 col-12 mb-1">
			        	<div class="form-group">
			        		<label for="carNumber">차량 번호</label>
			            	<input type="text" class="form-control col-12" id="carNumber" name="carNumber">
			            </div>
			        </div>
                    <div class="col-xl-4 col-md-6 col-12 mb-1">
                    	<div class="form-group">
                    		<label for="note">특이사항</label>
							<input type="text" class="form-control col-12" id="note" name="note">									
                         </div> 
                     </div>
			         <div class="col-xl-3 col-md-6 col-12 mb-1">
			         	<div class="form-group">
			            	<div class="mb-2">방문 차량 여부</div>
			            	<div class="custom-control-bin custom-radio-bin d-inline" id="isVisitorNDiv">
								<input type="radio" class="custom-control-input-bin" name="isVisitor" id="isVisitorN" value="N">	
				            	<label for="isVisitorN" class="custom-control-label-bin">세대 차량</label>
			            	</div>
			            	<div class="custom-control-bin custom-radio-bin d-inline ml-3" id="isVisitorYDiv">
			            		<input type="radio" class="custom-control-input-bin" name="isVisitor" id="isVisitorY" value="Y">									
				            	<label for="isVisitorY" class="custom-control-label-bin">방문 차량</label>
			            	</div>									
			            </div>
			        </div>
			        <div class="col-xl-3 col-md-6 col-12">
				        <div class="form-group" id="regDiv">
				        	<label for="regdate">방문 날짜</label>
							<input type="text" class="form-control" id="regdate" name="regdate" placeholder="YYYY-MM-DD">
			            </div>
			        </div>

					<div class="col-xl-12 col-md-6 col-12">
					    <div class="form-group" style="text-align:right;">
					        <input type="submit" class="btn btn-primary btn-sm right"  value="등록" id="submit">
					        <input type="reset" class="btn btn-danger btn-sm right"  value="초기화">
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
		<br>
		
	    <div class="card-body">
        	<h4 class="card-title float-left">차량 조회</h4>
      	</div>
      	
		<div class="col-md-12 float-left" style="background-color:#ffffff; padding:0;
				margin-right:20px;box-shadow : 0 3px 10px 0 rgba(34, 41, 47, 0.1);">
		    <table class="table table-striped" style="margin-bottom:0;">
			    <colgroup>
					<col style="width:5%;" />
					<col style="width:23%;min-width:20px;" />
					<col style="width:30%;" />
					<col style="width:10%;min-width:20px;" />
					<col style="width:10%;min-width:30px;" />
				</colgroup>
			    <thead>
			       	<tr>
				        <th scope="col">NO</th>
				        <th scope="col">차량 번호</th>
				        <th scope="col">특이사항</th>
				        <th scope="col">신청일자</th>
				        <th scope="col">비고</th>
			       	</tr>
			    </thead>
			    <tbody id="carInfo">
			 	</tbody>
			</table>
		</div>
	</div>
<!-- END: 대시보드 박스 -->
</div>

</section>

    
<div class="clearfix"></div>
<section></section>
<%@ include file="../../mainInc/mainBottom.jsp" %>
<!-- ======= End About Section ======= -->
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/responsive.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/vendors.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
