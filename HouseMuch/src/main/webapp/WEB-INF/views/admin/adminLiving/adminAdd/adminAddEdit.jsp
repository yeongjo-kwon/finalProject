<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/adminTop.jsp" %>
	<!-- START : Content -->


    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">부가시설 수정</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">행정관지메인</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">부가시설 관리</a>
                                    </li>
                                    <li class="breadcrumb-item active">부가시설 수정</li>
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
                <!-- Blog Edit -->
                <div class="blog-edit-wrapper">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="media">
                                        <div class="avatar mr-75">
                                            <img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-9.jpg" width="38" height="38" alt="Avatar" />
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mb-25">행정관리자</h6>
                                            <p class="card-text">오늘 날짜 2021-01-20</p>
                                        </div>
                                    </div>
                                    <!-- Form -->
                                    <form action="javascript:;" class="mt-2">
                                        <div class="row">
                                            <div class="col-md-6 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="blog-edit-title">부가시설 명</label>
                                                    <input type="text" id="blog-edit-title" class="form-control" value="" placeholder="부가시설 명을 입력하세요"/>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="blog-edit-status">시설 분류</label>
                                                    <select id="blog-edit-status" class="form-control">
                                                        <option value="특화시설">특화시설</option>
                                                        <option value="교육시설">교육시설</option>
                                                        <option value="교육시설">문화시설</option>
                                                        <option value="교육시설">스포트시설</option>
                                                        <option value="교육시설">편의시설(무료)</option>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            
                                            <!-- 여기다 -->
                                            
                                            
                                            <div class="col-md-6 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="blog-edit-slug">위치정보</label>
                                                    <input type="text" id="blog-edit-slug" class="form-control" value="" placeholder="위치정보를 입력하세요" />
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6 col-12">
                                                <div class="form-group mb-2">
                                                    <label for="blog-edit-category">업체정보</label>
                                                    <select class="form-control" id="blog-edit-category">
                                                        <option value="업체1" selected>업체1</option>
                                                        <option value="업체1" selected>업체1</option>
                                                        <option value="업체1" selected>업체1</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group mb-2">
                                                    <label>상세 설명</label>
                                                    <div id="blog-editor-wrapper">
                                                        <div id="blog-editor-container">
                                                            <div class="editor">
                                                                <p>
                                                                    Cupcake ipsum dolor sit. Amet dessert donut candy chocolate bar cotton dessert candy
                                                                    chocolate. Candy muffin danish. Macaroon brownie jelly beans marzipan cheesecake oat cake.
                                                                    Carrot cake macaroon chocolate cake. Jelly brownie jelly. Marzipan pie sweet roll.
                                                                </p>
                                                                <p><br /></p>
                                                                <p>
                                                                    Liquorice drag챕e cake chupa chups pie cotton candy jujubes bear claw sesame snaps. Fruitcake
                                                                    chupa chups chocolate bonbon lemon drops croissant caramels lemon drops. Candy jelly cake
                                                                    marshmallow jelly beans drag챕e macaroon. Gummies sugar plum fruitcake. Candy canes candy
                                                                    cupcake caramels cotton candy jujubes fruitcake.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-2">
                                                <div class="border rounded p-2">
                                                    <h4 class="mb-1">Featured Image</h4>
                                                    <div class="media flex-column flex-md-row">
                                                        <img src="${pageContext.request.contextPath}/resources/app-assets/images/slider/03.jpg" id="blog-feature-image" class="rounded mr-2 mb-1 mb-md-0" width="170" height="110" alt="Blog Featured Image" />
                                                        <div class="media-body">
                                                            <h5 class="mb-0">Main image:</h5>
                                                            <small class="text-muted">Required image resolution 800x400, image size 10mb.</small>
                                                            <p class="my-50">
                                                                <a href="javascript:void(0);" id="blog-image-text">C:\fakepath\banner.jpg</a>
                                                            </p>
                                                            <div class="d-inline-block">
                                                                <div class="form-group mb-0">
                                                                    <div class="custom-file">
                                                                        <input type="file" class="custom-file-input" id="blogCustomFile" accept="image/*" />
                                                                        <label class="custom-file-label" for="blogCustomFile">Choose file</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6" style="text-align: center;">
                                                <button type="submit" class="btn btn-primary mr-1 col-3" style="width:50%;">수정 완료</button>
                                                <button type="reset" class="btn btn-outline-secondary col-3" style="width:50%;">취소</button>
                                            </div>
                                        </div>
                                    </form>
                                    <!--/ Form -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Blog Edit -->

            </div>
        </div>
    </div>
    <!-- END: Content-->



<%@ include file="../../adminInc/adminBottom.jsp" %>