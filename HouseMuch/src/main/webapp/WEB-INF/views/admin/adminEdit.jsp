<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminInc/adminTop.jsp"%>

<style type="text/css">
.error{
	color:red;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/subinJs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	var emailCode="";
	
	$(function(){
		$("#chkMail").attr("disabled", true); //비활성화
		//email 중복체크는 ajax
		$('#modalEmail').blur(function(){
       		var email=$(this).val();
       		
       		if(email.length<1){
       			$('#erMail').html('필수 입력 사항 입니다');
   			}else{
   				if(!validate_email(email)){
   					$('#erMail').html('이메일 형식에 맞지 않습니다.');
       			}else{
       				$.ajax({
        				url:"<c:url value='/register/ajaxChkMail.do'/>",
        				type:"GET",
        				data:{email:email},
        				success:function(res){
        					var msg="", chkYn="";
        					if(res){	//사용 불가
        						msg="이미 등록된 이메일 입니다.";
        						chkYn="N";
        					}else{	//사용 가능
        						msg="사용 가능한 이메일 입니다.";
        						chkYn="Y";
        					}
        					
        					$('#emailChk').val(chkYn);
							if($('#emailChk').val()=="Y"){
								$('#erMail').css("color","#2FA599");
								$('#modalEmail').css("border-color","");
							}else{
								$('#erMail').css("color","red");									
								$('#modalEmail').css("border-color","red");
							}
							$('#erMail').html(msg);
        				},
        				error:function(xhr, status, error){
        					alert('error! : ' + error)
        				}
        			});	//ajax	
       			}
   			}
        		
        });		
		
		$('#chkBtn').click(function(){	//이메일 전송 및 인증 ajax
    		var email=$('#modalEmail').val();	//입력한 이메일
    		
    		if(validate_email(email) && email.length>=2){
    			if($('#emailChk').val()=="Y"){
	        		$.ajax({
	        			url:"<c:url value='/register/sendMail.do'/>",
	        			type:"GET",
	        			data:{email:email},
	        			success:function(data){
	        				$("#chkMail").attr("disabled", false); //활성화
	                		$('#chkMail').next().html('인증번호를 발송했습니다.<br> 인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.');
	                		emailCode = data;
	        			},
	    				error:function(xhr, status, error){
	    					alert('error! : ' + error)
	    				}
	        		});	//ajax
    			}else{
    				$('#modalEmail').focus();
    			}
			}else{
				$('#erMail').html('이메일 형식에 맞지 않습니다.');
			}
    		
    	});
		
		$('#chkMail').blur(function(){	//인증번호 입력란
    		var inputCode = $('#chkMail').val();	//사용자가 입력한 인증번호
    		if(inputCode==emailCode && inputCode!=null){
				$('#chkMail').next().css("color","#2FA599");
    			$('#chkMail').next().html("인증번호가 일치합니다.");
    			$('#chkEma').val('Y');
    		}else if(inputCode==null){
				$('#chkMail').next().css("color","red");
    			$('#chkMail').next().html("인증번호를 입력해주세요.");        			        			
    			$('#chkEma').val('N');
    		}else{
				$('#chkMail').next().css("color","red");
    			$('#chkMail').next().html("인증번호를 다시 확인해주세요.");        			
    			$('#chkEma').val('N');
    		}
    	});
		
		//email Modal에서 수정 버튼 눌렀을때
		$('#emailEditBtn').click(function(){
			if($('#chkEma').val()!='Y'){
				$('#modalEmail').focus();
				event.preventDefault();
			}else{
				var editEmail=$('#modalEmail').val();
				$('#email').val(editEmail);				
			}
		});
		
		$('#imageUpload').on('change',function(){
			readURL(this);
		});
		
		$('#reset').click(function(){
			$('#account-upload-img').attr('src', '${pageContext.request.contextPath}/resources/user_images/member-default.jpg');
			event.preventDefault();
		});
		
		//유효성
		$('#editFrm').submit(function(){
    		if($('#memberName').val().length<1){
   				$('#memberName').focus();
   				$('#memberName').next().html('필수 입력 사항 입니다.');
   				event.preventDefault();
   			}else if($('#email').val().length<1 || !validate_email($('#email').val())){	//이메일을 안적거나 정규식에 맞지 않은 경우
   				$('#email').focus();
   				event.preventDefault();
   			}
		});
		
		
		//Pwd
		$('#editPwd').submit(function(){
			if($('#nowPwd').val().length<1){
				$('#nowPwdCk').html('현재 비밀번호를 입력하세요');
				$('#nowPwd').css('border-color','red');
				$('#nowPwd').next().children().first().css('border-color','red');
				$('#nowPwd').focus();
				event.preventDefault();
			}else if($('#newPwd').val().length<1){
				$('#newPwdCk').html('새로운 비밀번호를 입력하세요');
				$('#newPwd').focus();
				$('#newPwd').css('border-color','red');
				$('#newPwd').next().children().first().css('border-color','red');
				event.preventDefault();
			}else if($('#newPwd').val()!=$('#newPwd2').val()){
				$('#newPwd2Ck').html('비밀번호가 일치해야 합니다.');
				$('#newPwd2').css('border-color','red');
				$('#newPwd2').next().children().first().css('border-color','red');
				$('#newPwd2').focus();
				event.preventDefault();
			}
		});
		
		//탈퇴
		$('#goModal').click(function(){
			if($('#admit').is(":checked") == false){
				alert('안내사항에 동의해야 다음 단계로 넘어갑니다');
				event.preventDefault();
				return false;
			}
		});
		
		$('#withdrawFrm').submit(function(){
			if($('#withdrawPwd').val().length<1){
				$('#withdrawPwd').next().html('비밀번호를 입력하세요');
				event.preventDefault();
				return false;
			}
		});
		
	});
	
	function readURL(input){
		if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
               $('#account-upload-img').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
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
                            <h2 class="content-header-title float-left mb-0">내 계정관리</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<c:url value='/userDash/userDashMain.do'/>">마이페이지</a>
                                    </li>
                                    <li class="breadcrumb-item">내 계정관리
                                    </li>
                                    <li class="breadcrumb-item active"> 회원정보 수정
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="content-body">
                <!-- account setting page -->
                <section id="page-account-settings">
                    <div class="row">
                        <!-- left menu section -->
                        <div class="col-md-3 mb-2 mb-md-0">
                            <ul class="nav nav-pills flex-column nav-left">
                                <!-- 내 정보 -->
                                <li class="nav-item">
                                    <a class="nav-link active" id="account-pill-general" data-toggle="pill" href="#account-vertical-general" aria-expanded="true">
                                        <i data-feather="user" class="font-medium-3 mr-1"></i>
                                        <span class="font-weight-bold">내 정보</span>
                                    </a>
                                </li>
                                <!-- 비밀번호 변경 -->
                                <li class="nav-item">
                                    <a class="nav-link" id="account-pill-password" data-toggle="pill" href="#account-vertical-password" aria-expanded="false">
                                        <i data-feather="lock" class="font-medium-3 mr-1"></i>
                                        <span class="font-weight-bold">비밀번호 변경</span>
                                    </a>
                                </li>
                                <!-- 회원탈퇴 -->
                                <li class="nav-item">
                                    <a class="nav-link" id="account-pill-info" data-toggle="pill" href="#account-vertical-info" aria-expanded="false">
                                        <i data-feather="info" class="font-medium-3 mr-1"></i>
                                        <span class="font-weight-bold">회원 탈퇴</span>
                                    </a>
                                </li>
                                
                            </ul>
                        </div>
                        <!--/ left menu section -->

                        <!-- right content section -->
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="tab-content">
                                        <!-- general tab -->
                                        <div role="tabpanel" class="tab-pane active" id="account-vertical-general" aria-labelledby="account-pill-general" aria-expanded="true">
                                            <!-- form -->
                                            <form class="validate-form mt-2" action="<c:url value='/userDash/myAccount/editFrm.do'/>" method="post" id="editFrm" enctype="multipart/form-data">
	                                            <!-- header media -->
	                                            <div class="media">
	                                                <a href="javascript:void(0);" class="mr-25">
	                                                    <img src="${pageContext.request.contextPath}/resources/user_images/${memVo.memberImgFilename }" id="account-upload-img" class="rounded mr-50" alt="profile image" height="80" width="80" />
	                                                </a>
	                                                <!-- upload and reset button -->
	                                                <div class="media-body mt-75 ml-1">
	                                                    <label for="imageUpload" class="btn btn-sm btn-primary mb-75 mr-75">이미지 변경</label>
	                                                    <input type="file" id="imageUpload" hidden accept="image/*" name="file"/>
	                                                    <button class="btn btn-sm btn-outline-secondary mb-75" type="button" id="reset">삭제</button>
	                                                    <p>이미지는 JPG, GIF 또는 PNG만 업로드 해주세요.</p>
	                                                </div>
	                                                <!--/ upload and reset button -->
	                                            </div>
	                                            <!--/ header media -->

                                            
                                                <div class="row">
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="id">아이디</label>
                                                            <input type="text" class="form-control" id="id" name="id" value="${memVo.id }" style="border: aliceblue; background-color: white;" readonly />             
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="memberName">이름</label>
                                                            <input type="text" class="form-control" id="memberName" name="memberName" value="${memVo.memberName }" />
                                                            <span class="error"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="email">이메일</label>
                                                            <div class="d-flex">
	                                                            <input type="text" class="form-control" id="email" name="email" value="${memVo.email }" style="border: aliceblue; background-color: white;width:200px;" readonly />             
	                                                        	<input type="button" class="btn btn-primary btn-sm ml-2" id="updateEmail" value="이메일 수정" data-toggle="modal" data-target="#emailEditFrm">
                                                        	</div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="house">세대 정보</label>
                                                            <c:if test="${hVo.authCode != 'RESIDENT'}"> <br><span style="font-size:18px; color: #2FA599;">관리자</span> </c:if>
                                                            <c:if test="${hVo.authCode == 'RESIDENT'}">
                                                            	<input type="text" class="form-control" id="house" name="house" value="${hVo.dong }동 ${hVo. ho}호" style="border: aliceblue; background-color: white;" readonly />             
                                                        	</c:if>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <div>연락처</div>
                                                            <div class="d-flex">
	                                                            <input type="text" class="form-control" id="hp1" name="hp1" value="${memVo.hp1 }" style="width:100px;"/>
	                                                            <span style="margin: 9px 4px 0px">-</span> 
	                                                            <input type="text" class="form-control" id="hp2" name="hp2" value="${memVo.hp2 }" style="width:100px;"/> 
	                                                            <span style="margin: 9px 4px 0px">-</span> 
	                                                            <input type="text" class="form-control" id="hp3" name="hp3" value="${memVo.hp3 }" style="width:100px;"/>
	                                                        </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-12">
                                                        <button type="submit" class="btn btn-primary mt-2 mr-1">수정</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <!--/ form -->
                                        </div>
                                        <!--/ general tab -->

                                        <!-- change password -->
                                        <div class="tab-pane fade" id="account-vertical-password" role="tabpanel" aria-labelledby="account-pill-password" aria-expanded="false">
                                            <!-- form -->
                                            <form class="validate-form" method="post" action="<c:url value='/userDash/myAccount/editPwd.do'/>" id="editPwd">
                                                <div class="row">
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="nowPwd">현재 비밀번호</label>
                                                            <div class="input-group form-password-toggle input-group-merge">
                                                                <input type="password" class="form-control" id="nowPwd" name="nowPwd" placeholder="현재 비밀번호" />
                                                                <div class="input-group-append">
                                                                    <div class="input-group-text cursor-pointer">
                                                                        <i data-feather="eye"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <span class="error" id="nowPwdCk"></span>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="newPwd">새 비밀번호</label>
                                                            <div class="input-group form-password-toggle input-group-merge">
                                                                <input type="password" id="newPwd" name="pwd" class="form-control" placeholder="새 비밀번호" />
                                                                
                                                                <div class="input-group-append">
                                                                    <div class="input-group-text cursor-pointer">
                                                                        <i data-feather="eye"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <span class="error" id="newPwdCk"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="newPwd2">새 비밀번호 확인</label>
                                                            <div class="input-group form-password-toggle input-group-merge">
                                                                <input type="password" class="form-control" id="newPwd2" name="confirm-pwd" placeholder="새 비밀번호" />
                                                                <div class="input-group-append">
                                                                    <div class="input-group-text cursor-pointer"><i data-feather="eye"></i></div>
                                                                </div>
                                                            </div>
                                                            <span class="error" id="newPwd2Ck"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <button type="submit" class="btn btn-primary mr-1 mt-1">비밀번호 변경</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <!--/ form -->
                                        </div>
                                        <!--/ change password -->

                                        <!-- information -->
                                        <div class="tab-pane fade" id="account-vertical-info" role="tabpanel" aria-labelledby="account-pill-info" aria-expanded="false">
                                            <!-- Info -->
                                            
                                               <div class="row">
                                                   <div class="col-12">
                                                       <h2>탈퇴 안내</h2>
                                                       <span>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</span><br>
                                                   	<p class="mt-2">
                                                    	<b>사용하고 계신 아이디(<span style="color:#2FA599;">${memVo.id }</span>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</b><br>
														<span style="color:#ff6000;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</span>하오니 신중하게 선택하시기 바랍니다.
                                                    </p>
                                                   	<p>
                                                    	탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.<br>
														HOUSEMUCH에 올린 모든 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.<br>
														삭제를 원하는 게시글이 있다면 <span style="color:#ff6000;"> 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</span><br>
														탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.<br>
                                                   	</p>
                                                   	
                                                   	<hr>
                                                   	<p style="color:#ff6000;">
                                                   		탈퇴 후에는 아이디 <span style="color:#2FA599;">${memVo.id }</span> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br>
														게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
                                                   	</p>
                                                   	
                                                   </div>
                                                   
                                                   <div class="col-12 custom-control custom-checkbox ml-1">
                                                   	<input type="checkbox" class="custom-control-input" id="admit"> 
                                                   	<label class="custom-control-label" for="admit"><b>안내 사항을 모두 확인하였으며, 이에 동의합니다.</b></label>
                                                   </div>
                                                   
                                                   
                                                   <div class="col-12">
                                                       <button type="button" class="btn btn-primary mt-1 mr-1" data-toggle="modal" data-target="#withdraw" id="goModal">확인</button>
                                                   </div>
                                               </div>
                                            
                                            <!--/ Info -->
                                        </div>
                                        <!--/ information-->
                                        
										<!-- Modal   -->
										<div class="demo-inline-spacing col-6">
								            <div class="form-modal-ex">
								                
								                <!-- Modal  #emailEditFrm -->
								                <div class="modal fade text-left" id="emailEditFrm" tabindex="-1" role="modal" aria-hidden="true">
								                    <div class="modal-dialog modal-dialog-centered" role="document">
								                        <div class="modal-content">
								                            <div class="modal-header">
								                                <h4 class="modal-title" id="myModalLabel33">이메일 수정</h4>
								                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                    <span aria-hidden="true">&times;</span>
								                                </button>
								                            </div>
								                            
							                                <div class="modal-body">
							                               		<input type="hidden" id="emailChk">
							                                    <input type="hidden" id="chkEma" >
							                                    <label for="modalEmail" style="font-size:18px;" class="mr-1 d-block">이메일</label>
							                                    <input type="text" id="modalEmail" value=${memVo.email }  class="form-control col-md-8 mr-1" style="display: inline-block;">
							                                    <input type="button" class="btn btn-primary" name="chkBtn" id="chkBtn" value="인증번호 받기" >
							                                    <span class="error d-block" style="color:red;" id="erMail"></span>
							                                    <div>
							                                    	<input type="hidden" id="codeChk">
																	<input type="tel" class="form-control col-md-8 mt-1" name="chkMail" id="chkMail" placeholder="인증번호 입력" tabindex="6">
																	<span class="error"></span>
							                                    </div>							                                
							                                </div>
							                                <div class="modal-footer">
							                                    <input type="button" class="btn btn-primary" data-dismiss="modal" value="수정" id="emailEditBtn">
							                                </div>

								                        </div>
								                    </div>
								                </div>
								                
												<!-- Modal  #withdraw -->
								                <div class="modal fade text-left" id="withdraw" tabindex="-1" role="modal" aria-hidden="true">
								                    <div class="modal-dialog modal-dialog-centered" role="document">
								                        <div class="modal-content">
								                            <div class="modal-header">
								                                <h4 class="modal-title" id="myModalLabel33">회원 탈퇴</h4>
								                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                    <span aria-hidden="true">&times;</span>
								                                </button>
								                            </div>
								                            <form action="<c:url value='/userDash/myAccount/withdraw.do'/>" method="post" id="withdrawFrm"> 
							                                <div class="modal-body">
							                                	<div>
							                                		정말 탈퇴하시겠습니까?
							                                		<br>탈퇴를 계속하실거라면 아래에 비밀번호를 입력해주세요.
							                                		<br><hr>
							                                	</div>
							                                    <label for="withdrawPwd" style="font-size:18px;" class="mr-1 d-block">비밀번호</label>
							                                    <input type="password" id="withdrawPwd" class="form-control" name="withdrawPwd">
							                                    <span class="error"></span>						                                
							                                </div>
							                                <div class="modal-footer">
							                                    <input type="button" class="btn btn-primary" value="탈퇴하기" id="withdrawBtn">
							                                </div>
							                                </form>
								                        </div>
								                    </div>
								                </div>  
								            </div>	
		
										</div>	
                              
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ right content section -->
                    </div>
                </section>
                <!-- / account setting page -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

<%@ include file="adminInc/adminBottom.jsp"%>