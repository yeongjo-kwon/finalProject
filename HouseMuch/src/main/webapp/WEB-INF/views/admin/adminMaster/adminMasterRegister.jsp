<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/adminMasterTop.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$('#MasterApt').addClass('active');
	
	$(function(){
		$('#btnZipcode').click(function(){
			open("<c:url value='/admin/adminMaster/zipcode.do'/>", "chk",
			"width=750, height=550, left=0, top=0, location=yes, resizable=yes");
		});
		
		$('#aptFrm').submit(function(){
			if($('#aptName').val().length<1){
				$('#er1').html("아파트 명을 입력해주세요!");
				$('#aptName').focus();
				event.preventDefault();
			}else if($('#zipcodeSeq').val().length<1){
				$('#er2').html("주소를 입력해주세요!");
				$('#btnZipcode').focus();
				event.preventDefault();
			}else if($('#totalHousehold').val().length<1){
				$('#er3').html("총 세대 수 를 입력해주세요!");
				$('#totalHousehold').focus();
				event.preventDefault();	
			}
			
		});
	});
	
</script>
    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
			<div class="content m-1">
				<h2 style="display:inline;">아파트 등록하기</h2>
			</div>
        <div class="content-wrapper ml-1 mr-1">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- Dashboard Ecommerce Starts -->
                <section id="dashboard-ecommerce">
                    
                    <div class="row match-height mt-1 align-center" >
                        
                        <!-- Developer Meetup Card -->
                        <div class="col-lg-10 col-md-6 col-12">
                            <div class="card card-developer-meetup">
                            
                            	<div class="card-body">
                                    <form class="form form-horizontal" name="aptFrm" method="post" id="aptFrm">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-sm-3 ">
                                                        <span style="font-size: 18px;">아파트 명</span>
                                                        <br><span id="er1" style="color:red;"></span>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <input type="text" id="aptName" class="form-control" name="aptName" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-sm-3">
                                                        <span style="font-size: 18px;">우편번호</span>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <input type="text" class="form-control" name="zipcodeSeq" id="zipcodeSeq" readonly/>
                                                    </div>
	                                                <div class="form-group row ml-5">
		                                                <button type="button" class="btn btn-primary mr-1" id="btnZipcode">우편번호 찾기</button>
	                                                </div>
                                                </div>
                                            </div>
                                            
                                           
                                            
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-sm-3 ">
                                                        <span style="font-size: 18px;">주소</span>
                                                        <br><span id="er2" style="color:red;"></span>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="address" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-sm-3">
                                                        <span style="font-size: 18px;">상세주소</span>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="addressDetail" />
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-sm-3">
                                                        <span style="font-size: 18px;">총 세대 수</span>
                                                        <br><span id="er3" style="color:red;"></span>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <input type="number" class="form-control" name="totalHousehold" id="totalHousehold" />
                                                    </div>
	                                                <div class="col-sm-9 offset-sm-3 mt-2">
		                                                <button type="submit" id="regBtn" class="btn btn-primary mr-1">등록</button>
		                                            </div>
                                                </div>
                                            </div>
                                            
                                            
                                            
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                            
                        <!--/  Card -->

  
                    </div>
                </section>
                <!-- Dashboard Ecommerce ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

<%@ include file="inc/adminMasterBottom.jsp" %> 