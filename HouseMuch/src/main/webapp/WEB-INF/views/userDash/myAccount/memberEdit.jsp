<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../user/dashinc/usertop.jsp"%>

<style type="text/css">
.nav-pills .nav-link.active{
	background-color: #7DB249;
}
.nav-pills .nav-link.active, .nav-pills .show > .nav-link{
	background-color: #7DB249;
}
.btn-bin{
	background-color: #7DB249 !important;
	border-color: #7DB249 !important;
	color:white;
}
</style>

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
                                            <!-- header media -->
                                            <div class="media">
                                                <a href="javascript:void(0);" class="mr-25">
                                                    <img src="${pageContext.request.contextPath}/resources/user_images/${memVo.memberImgFilename }" id="account-upload-img" class="rounded mr-50" alt="profile image" height="80" width="80" />
                                                </a>
                                                <!-- upload and reset button -->
                                                <div class="media-body mt-75 ml-1">
                                                    <label for="account-upload" class="btn btn-sm btn-bin mb-75 mr-75">이미지 변경</label>
                                                    <input type="file" id="account-upload" hidden accept="image/*" />
                                                    <p>이미지는 JPG, GIF 또는 PNG만 업로드 해주세요.</p>
                                                </div>
                                                <!--/ upload and reset button -->
                                            </div>
                                            <!--/ header media -->

                                            <!-- form -->
                                            <form class="validate-form mt-2">
                                                <div class="row">
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="id">아이디</label>
                                                            <input type="text" class="form-control" id="id" name="id" value="${memVo.id }" style="border: aliceblue; background-color: white;" readonly />             
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="name">이름</label>
                                                            <input type="text" class="form-control" id="name" name="name" value="${memVo.memberName }" />
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="email">이메일</label>
                                                            <input type="text" class="form-control" id="email" name="email" value="${memVo.email }" style="border: aliceblue; background-color: white;" readonly />             
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="house">세대 정보</label>
                                                            <c:if test="${hVo.authCode != 'RESIDENT'}"> <br><span style="font-size:18px; color: #7DB249;">관리자</span> </c:if>
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
                                                        <button type="submit" class="btn btn-bin mt-2 mr-1">수정</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <!--/ form -->
                                        </div>
                                        <!--/ general tab -->

                                        <!-- change password -->
                                        <div class="tab-pane fade" id="account-vertical-password" role="tabpanel" aria-labelledby="account-pill-password" aria-expanded="false">
                                            <!-- form -->
                                            <form class="validate-form">
                                                <div class="row">
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="account-old-password">현재 비밀번호</label>
                                                            <div class="input-group form-password-toggle input-group-merge">
                                                                <input type="password" class="form-control" id="nowPwd" name="now" placeholder="현재 비밀번호" />
                                                                <div class="input-group-append">
                                                                    <div class="input-group-text cursor-pointer">
                                                                        <i data-feather="eye"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="account-new-password">새 비밀번호</label>
                                                            <div class="input-group form-password-toggle input-group-merge">
                                                                <input type="password" id="newPwd" name="pwd" class="form-control" placeholder="새 비밀번호" />
                                                                <div class="input-group-append">
                                                                    <div class="input-group-text cursor-pointer">
                                                                        <i data-feather="eye"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="account-retype-new-password">새 비밀번호 확인</label>
                                                            <div class="input-group form-password-toggle input-group-merge">
                                                                <input type="password" class="form-control" id="newPwd2" name="confirm-pwd" placeholder="새 비밀번호" />
                                                                <div class="input-group-append">
                                                                    <div class="input-group-text cursor-pointer"><i data-feather="eye"></i></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <button type="submit" class="btn btn-bin mr-1 mt-1">비밀번호 변경</button>
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
                                                    	<b>사용하고 계신 아이디(<span style="color:#7DB249;">${memVo.id }</span>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</b><br>
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
                                                   		탈퇴 후에는 아이디 <span style="color:#7DB249;">${memVo.id }</span> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br>
														게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
                                                   	</p>
                                                   	
                                                   </div>
                                                   
                                                   <div class="col-12 custom-control custom-checkbox ml-1">
                                                   	<input type="checkbox" class="custom-control-input" id="admit"> 
                                                   	<label class="custom-control-label" for="admit"><b>안내 사항을 모두 확인하였으며, 이에 동의합니다.</b></label>
                                                   </div>
                                                   
                                                   
                                                   <div class="col-12">
                                                       <button type="button" class="btn btn-bin mt-1 mr-1">확인</button>
                                                   </div>
                                               </div>
                                            
                                            <!--/ Info -->
                                        </div>
                                        <!--/ information -->

                                        

                                       
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

<%@ include file="../../user/dashinc/userbottom.jsp"%>