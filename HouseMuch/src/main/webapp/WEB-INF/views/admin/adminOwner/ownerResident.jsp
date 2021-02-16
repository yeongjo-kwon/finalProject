<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<!-- 
	입주민 등록 및 목록 조회
	엑셀 업로드 및 다운로드
	- 동에 따라 호가 달라짐 (ajax)
-->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/subinJs/form-repeater-bin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/subinJs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		//ajax로 insert (upload)
		
		$('#hMembName').focus();
		
		$('#dong').change(function(){
			$(this).parent().parent().next().find('#ho').html("<option value='0'>호</option>");
			
			if($(this).val()!=0){
				var me=this;
				$.ajax({
					url:"<c:url value='/admin/adminOwner/hoList.do'/>",
					type:"get",
					data:"dong="+$(this).val(),
					dataType:"json",
					success:function(res){
						if(res.length>0){
							var str="<option value='0'>호</option>";
							$.each(res, function(idx, item){
								str+="<option value='"+item+"'>"+item+"호</option>";
							});
							$(me).parent().parent().next().find('#ho').html(str);
						}
					},
					error:function(xhr, status, error){
						alert("error : "+error);
					}
				});
			}
		});
			
		var table=$('#residentTable').DataTable({
			ajax:{
				url:"<c:url value='/admin/adminOwner/residentTable.do'/>",
				type:"GET",
				dataSrc:''
			},
			columns:[
                {data:"hMemberNo"},
                {data:"householdCode"},
                {data:"dong", render:function(data){return data+"동"}},
                {data:"ho", render:function(data){return data+"호"}},
                {data:"hMembName"},
                {data:"birth", render:function(data){
                    return moment(data).format('YYYY-MM-DD')}},
                {data:"relation"}
			],
			language: {
		        paginate: {
		            previous: '&nbsp;',
		            next: '&nbsp;'
		        }
		    }
		}); 
		
		$('#chkPwdFrm').submit(function(){
			if($('#chkPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				event.preventDefault();
			}
		});
		
		$('form[name=repeatFrm]').submit(function(){	
			$('#beforeIsValid').val($('#isValid').val());

			if($('#dong').val()=="0"){
				alert('동을 선택해주세요');
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;
			}else if($('#ho').val()=="0"){
				alert('호를 선택해주세요');
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;
			}else if($('#hMembName').val().length<=0){
				alert('이름을 입력해주세요');
				$(this).find('#hMembName').focus();
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;
			}else if($('#birth').val().length<=0){
				alert('생년월일을 입력해주세요');
				$(this).find('#birth').focus();
				$('#isValid').val(Number($('#isValid').val())+1);
				return false;				
			}
		});
		
/* 		삭제 할려다가 포기함 ㅎㅎ
		//체크박스 전체선택_페이지가 바뀌어도 전체선택은 풀리지 않음
	    $('#select-all').on('click', function(){
	        var rows = table.rows({ 'search': 'applied' }).nodes();
	        $('input[type="checkbox"]', rows).prop('checked', this.checked);
	     });

		$('#del').click( function () {
			//체크박스의 - 부모 tr의 - 1번째 td의 값
			var len=$('#residentTable').find('input[type="checkbox"]:checked').length;
			alert(len);
			
			if(len==0){
				alert('삭제 대상이 없습니다.');
				return false;
			}else{
				if(confirm('정말 삭제하시겠습니까?')){	//hMemberNoArr[]
			        table.row('.selected').remove().draw( false );
				}
			}
			
		}); */
 	   
	});
	
	function checkFileType(filePath){
		var fileFormat=filePath.split(".");
		
		if(fileFormat.indexOf("xls")>-1||fileFormat.indexOf("xlsx")>-1){
			return true;
		}else{
			return false;
		}
	}
	
	
	function check(){
		var file=$("#excelFile").val();
		
		if(file==""||file==null){
			alert('파일을 선택해주세요.');
			return false;
		}else if(!checkFileType(file)){
			alert('엑셀 파일만 업로드 가능합니다.');
			return false;
		}
		
		if(confirm("업로드하시겠습니까?")){
			$('#excelUploadForm').submit();
			$.ajax({	//잘 들어가졌고 에러도 안나는데 왜 자꾸 error가 뜨는거지 ??? ?_? 이해불가 ... 
				type:"POST",
				url:"<c:url value='/admin/adminOwner/excelUploadAjax.do'/>",
				data:{"excelFile":file},
				processData: false,
				contentType: false,
				success:function(data){
					alert('업로드 완료');
				},
				error:function(xhr, status, error){
					alert('error! : ' + error);
				}
			});
			
		}
		
	}
	
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
               <h2 class="content-header-title float-left mb-0">입주민 관리</h2>
               <div class="breadcrumb-wrapper">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item"><a href="<c:url value='admin/adminOwner/adminOwnerMain.do'/>">Home</a></li>
                   <li class="breadcrumb-item">아파트 관리</li>
                   <li class="breadcrumb-item active">입주민 관리</li>
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
		          <h4 class="card-title">입주민 추가 등록</h4>
		          <br>세대원을 추가 등록 할 수 있습니다.
		        </div>
		        <div class="card-body">
		          <form action="<c:url value='/admin/adminOwner/ownerResReg.do'/>" class="invoice-repeater-bin" method="post" name="repeatFrm" id="repeatFrm">
		            <div data-repeater-list="invoice">
		              <div data-repeater-item>
		                <div class="row d-flex align-items-end">
		                
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="dong">동</label>
				              <select class="select form-control form-control-lg" name="dong" id="dong" aria-describedby="dong">
				                <option value="0">동</option>
				                <c:forEach var="dong" items="${dongList}">
									<option value="${dong}">${dong}동</option>	                
				                </c:forEach>
				              </select>
		                      
		                    </div>
		                  </div>

		                  <div class="col-md-2 col-12">
		                    <div class="form-group">		                      
				              <label for="ho">호</label>
				              <select class="select form-control form-control-lg" id="ho" name="ho" aria-describedby="ho">
				                <option value="0">호</option>
				              </select>
		                    </div>
		                  </div>               
		                  
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="hMembName">이름</label>
		                      <input type="text" class="form-control" id="hMembName" aria-describedby="hMembName" name="hMembName" />
		                    </div>
		                  </div>
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="birth">생년월일</label>
		                      <input type="text" class="form-control date-mask" id="birth" aria-describedby="birth" name="birth" placeholder="ex)2000-01-01"/>
		                    </div>
		                  </div>
		                  <div class="col-md-2 col-12">
		                    <div class="form-group">
		                      <label for="relation">세대주 와의 관계</label><br>
		                      <select class="form-control" id="relation" aria-describedby="relation" name="relation">
		                      	<option value="본인">본인</option> 
						    	<option value="부모">부모</option>
						    	<option value="배우자">배우자</option>
						    	<option value="자녀">자녀</option>
		                      </select>
		                      
		                    </div>
		                  </div>
		
		                  
		
		                  <div class="col-md-2 col-12 mb-50">
		                    <div class="form-group">
		                      <button class="btn btn-outline-danger text-nowrap px-1" style="float:right; margin-bottom: 5px;" data-repeater-delete type="button">
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
		                  <span>추가</span>
		                </button>
		              </div>
		              
		              <div class="col-md-4 col-6 d-flex" style="float:right; text-align: right; align-self: flex-end; justify-content: flex-end">
		              	<input type="submit" id="regSubmit" class="btn btn-primary" style="float:right;" value="등록">
		              </div>
		              
		            </div>
		            
		          </form>
		          
		        </div>
		      </div>
		    </div>
		    <!-- /Invoice repeater -->
		  </div>
		</section>
		
	
        <div class="content-body">
               <!-- Ajax Sourced Server-side -->
        	<section id="residentTable_section">
            	<div class="row">
                	<div class="col-12">
                    	<div class="card">
                            <div class="card-header border-bottom">
                                <h4 class="card-title">입주민 조회</h4>
                                <div>
		                        	<input type="button" class="btn btn-primary" value="전체 삭제" data-toggle="modal" data-target="#delPwd">
		                        	<input type="button" class="btn btn-primary" value="업로드" data-toggle="modal" data-target="#uploadFrm">
                            	</div>
                            </div>
                            <div class="residentTable card p-2">
                            	<table class="residentTable table" id="residentTable" style="text-align:center;">
	                                <thead>
	                                    <tr style="text-align: center;">
	                                        <th style="width:5%;">NO</th>
	                                        <th style="width:20%;">세대코드</th>
	                                        <th style="width:10%;">동</th>
	                                        <th style="width:10%;">호</th>
	                                        <th style="width:10%;">이름</th>
	                                        <th style="width:15%;">생년월일</th>
	                                        <th style="width:15%;">세대주 관계</th>
	                                    </tr>
	                                </thead>
                               </table>
                             </div>
                         </div>
                     </div>
                 </div>
             </section>
		</div>

        <!--/ Ajax Sourced Server-side -->
			
			<!-- Modal   -->
			<div class="demo-inline-spacing col-6">
	            <div class="form-modal-ex">
	                
	                <!-- Modal -->
	                <div class="modal fade text-left" id="uploadFrm" tabindex="-1" role="modal" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered" role="document">
	                        <div class="modal-content">
	                            <div class="modal-header">
	                                <h4 class="modal-title" id="myModalLabel33">데이터 업로드</h4>
	                                <i data-feather="help-circle" class="font-medium-3 text-muted cursor-pointer" data-toggle="modal" data-target="#howUpload" ></i>
	                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                    <span aria-hidden="true">&times;</span>
	                                </button>
	                            </div>
	                            <form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action="<c:url value='/admin/adminOwner/excelUploadAjax.do'/>">
	                                <div class="modal-body">
	                                    <label for="excelFile" class="btn btn-primary">파일 찾기</label>
	                                    <input type="file" id="excelFile" name="excelFile" hidden="hidden" onchange="javascript:document.getElementById('file_route').value=this.value">
	                                    <input type="text" id="file_route" readonly style="width:300px;height:38px;border:hidden;border-bottom-style:inset;">
	                                </div>
	                                <div class="modal-footer">
	                                    <input type="button" onclick="check()" class="btn btn-primary" data-dismiss="modal" value="업로드">
	                                </div>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	                
	                <!-- Modal #howUpload -->
	                <div class="modal fade text-left" id="howUpload" tabindex="-1" role="dialog" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
	                        <div class="modal-content">
	                            <div class="modal-header">
	                                <h4 class="modal-title" id="myModalLabel44"></h4>
	                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                    <span aria-hidden="true">&times;</span>
	                                </button>
	                            </div>
	                            	<div class="modal-body">
	                                	<p><img src="<c:url value='/resources/aptAdmin_images/helpUploadforRes.png'/>" alt="help"></p>
	                                </div>
	                                
	                                <div class="modal-footer">
	                                </div>
	                            
	                        </div>
	                    </div>
	                </div>

	                <!-- Modal #delPwd -->
	                <div class="modal fade text-left" id="delPwd" tabindex="-1" role="dialog" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered" role="document">
	                        <div class="modal-content">
	                            <div class="modal-header">
	                                <h4 class="modal-title" id="myModalLabel24">삭제</h4>
	                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                    <span aria-hidden="true">&times;</span>
	                                </button>
	                            </div>
	                            <form id="chkPwdFrm" name="chkPwdFrm" method="post" action="<c:url value='/admin/adminOwner/chkPwdforDel.do'/>">
	                                <div class="modal-body">
	                                    <p>데이터를 삭제하면 기존에 가입한 회원들의 정보도 사라집니다.<br>삭제를 원하신다면 비밀번호를 입력해주세요.</p>
	                                    <input type="password" name="pwd" id="chkPwd" class="form-control" />
	                                </div>
	                                <div class="modal-footer">
	                                    <input type="submit" class="btn btn-primary" value="삭제">
	                                </div>
	                            </form>
	                            <input type="hidden" id="beforeIsValid" value="0">
		         				<input type="hidden" id="isValid" value="0">
	                        </div>
	                    </div>
	                </div>
	                
	                
	            </div>	
	
	
			</div>		
	
		</div>
	</div>
</div>
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
<!-- BEGIN: Page Vendor JS-->
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
<!-- END: Page Vendor JS-->
    
