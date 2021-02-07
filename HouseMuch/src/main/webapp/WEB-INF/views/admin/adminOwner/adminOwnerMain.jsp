<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<!-- 소유주 메인
	: 차트 관리 / 부가시설이용자 관리 / 캘린더 크기 조절
		모든거 다 ajax처리해야함
 -->

    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- Dashboard Ecommerce Starts -->
                <section id="dashboard-ecommerce">
                    <div class="row match-height">
                        <!-- Medal Card -->
                        <div class="col-xl-4 col-md-6 col-12">
                            <div class="card card-congratulation-medal">
                                <div class="card-body">
                                    <h5>이번달 아파트 총 관리비</h5>
                                    <h3 class="mb-75 mt-2 pt-50">
                                        <a href="javascript:void(0);">100000원</a>
                                    </h3>
                                    <p>
                                    	지난달 : 10000원 <br>
                                    	평균 : 232332원
                                    </p>
                                    <button type="button" class="btn btn-primary" style="float:right;">상세보기</button>
                                </div>
                            </div>
                        </div>
                        <!--/ 관리비 Card -->

                        <!-- Statistics Card -->
                        <div class="col-xl-8 col-md-6 col-12">
                            <div class="card card-statistics">
                                <div class="card-header">
                                    <h4 class="card-title">아파트 현황</h4>
                                    <div class="d-flex align-items-center">
                                        <p class="card-text font-small-2 mr-25 mb-0">2021.02 (월까지 표시)</p>
                                    </div>
                                </div>
                                <div class="card-body statistics-body">
                                    <div class="row">
                                        <div class="col-xl-3 col-sm-6 col-12 mb-2 mb-xl-0">
                                            <div class="media">
                                                <div class="avatar bg-light-info mr-2">
                                                    <div class="avatar-content">
                                                        <i data-feather="user" class="avatar-icon"></i>
                                                    </div>
                                                </div>
                                                <div class="media-body my-auto">
                                                    <h4 class="font-weight-bolder mb-0">300세대</h4>
                                                    <p class="card-text font-small-3 mb-0">총 입주 세대</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-sm-6 col-12 mb-2 mb-sm-0">
                                            <div class="media">
                                                <div class="avatar bg-light-danger mr-2">
                                                    <div class="avatar-content">
                                                        <i data-feather="box" class="avatar-icon"></i>
                                                    </div>
                                                </div>
                                                <div class="media-body my-auto">
                                                    <h4 class="font-weight-bolder mb-0">100건</h4>
                                                    <p class="card-text font-small-3 mb-0">건의사항</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-sm-6 col-12">
                                            <div class="media">
                                                <div class="avatar bg-light-success mr-2">
                                                    <div class="avatar-content">
                                                        <i data-feather="dollar-sign" class="avatar-icon"></i>
                                                    </div>
                                                </div>
                                                <div class="media-body my-auto">
                                                    <h4 class="font-weight-bolder mb-0">100원</h4>
                                                    <p class="card-text font-small-3 mb-0">유지보수 추가 비용</p>
                                                </div>
                                            </div>
                                        </div>
 
                                        <div class="col-xl-3 col-sm-6 col-12 mb-2 mb-xl-0">
                                            <div class="media">
                                                <div class="avatar bg-light-primary mr-2">
                                                    <div class="avatar-content">
                                                        <i data-feather="trending-up" class="avatar-icon"></i>
                                                    </div>
                                                </div>
                                                
                                                <div class="media-body my-auto">
                                                    <h4 class="font-weight-bolder mb-0">1건</h4> <!--  -->
                                                    <p class="card-text font-small-3 mb-0">부가시설 신규 이용자 수</p>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Statistics Card -->
                    </div>
 
                    <div class="row match-height">
                        <!-- Company Table Card -->
                        <div class="col-lg-8 col-12">
                            <div class="card card-company-table">
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>시설명</th>
                                                    <th>이용 입주민 수</th>
                                                    <th>이용료</th>
                                                    <th>비고</th>  
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <div>
                                                                <div class="font-weight-bolder">3</div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <span>헬스장</span>
                                                        </div>
                                                    </td>
                                                    
                                                    <td class="text-nowrap">
                                                        <div class="d-flex flex-column">
                                                            <span class="font-weight-bolder mb-25">20명</span>
                                                        </div>
                                                    </td>
                                                    <td>5000</td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <span class="font-weight-bolder mr-1">-5</span>
                                                            <i data-feather="trending-down" class="text-danger font-medium-1"></i>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <div>
                                                                <div class="font-weight-bolder">2</div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <span>독서실</span>
                                                        </div>
                                                    </td>
                                                    <td class="text-nowrap">
                                                        <div class="d-flex flex-column">
                                                            <span class="font-weight-bolder mb-25">25명</span>
                                                        </div>
                                                    </td>
                                                    <td>5000</td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <span class="font-weight-bolder mr-1">+5</span>
                                                            <i data-feather="trending-up" class="text-success font-medium-1"></i>
                                                        </div>
                                                    </td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Company Table Card -->


                        <!-- Goal Overview Card -->
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h4 class="card-title">부가시설 이용현황</h4>
                                    <i data-feather="help-circle" class="font-medium-3 text-muted cursor-pointer"></i>
                                </div>
                                <div class="card-body p-0">
                                    <div id="goal-overview-radial-bar-chart" class="my-2"></div>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <!--/ Goal Overview Card -->

                    </div>
                    
					<div class="row match-height">
                        <!-- 관리비 현황 Card -->
                        <div class="col-lg-6 col-6">
                            <div class="card card-revenue-budget">
                                <div class="mx-0">
                                    <div class="col-12 p-2">
                                        <div class="d-sm-flex justify-content-between align-items-center mb-3">
                                            <h4 class="card-title mb-50 mb-sm-0">관리비 이용 현황</h4>
                                            <div class="d-flex align-items-center">
                                                <div class="d-flex align-items-center mr-2">
                                                    <span class="bullet bullet-primary font-small-3 mr-50 cursor-pointer"></span>
                                                    <span>지출</span>
                                                </div>
                                               
                                            </div>
                                        </div>
                                        
                                        <div id="revenue-report-chart"></div> <!-- 여기가 차트인듯 -->
                                    
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                        <!--/ Revenue Report Card -->
                        
                        <!-- cal -->
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="card">
                                
                                <div class="card-body p-0">
                               <!-- Calendar -->
		                            <div class="col position-relative">
		                                <div class="card shadow-none border-0 mb-0 rounded-0">
		                                    <div class="card-body pb-2">
		                                        <div id="calendar"></div>
		                                    </div>
		                                </div>
		                            </div>
                                    
                                    
                                </div>
                            </div>
                        </div>                        
                        
                    </div>
                    
                </section>
                <!-- Dashboard Ecommerce ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

<%@ include file="../adminInc/adminBottom.jsp" %>