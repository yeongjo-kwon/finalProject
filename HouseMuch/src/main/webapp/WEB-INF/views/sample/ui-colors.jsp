<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../user/dashinc/usertop.jsp" %>
    
    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Colors</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">UI</a>
                                    </li>
                                    <li class="breadcrumb-item active">Colors
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
                <!-- Background color start -->
                <section id="backcolor">
                    <div class="row">
                        <div class="col-12">
                            <div class="card background-color">
                                <div class="card-header">
                                    <h4 class="card-title">Default Colors</h4>
                                </div>
                                <div class="card-body">
                                    <div class="alert alert-primary" role="alert">
                                        <div class="alert-body">
                                            For more color classes options please read the
                                            <a href="https://pixinvent.com/demo/vuexy-html-bootstrap-admin-template/documentation/documentation-colors.html" target="_blank" class="alert-link">documentation.</a>
                                        </div>
                                    </div>
                                    <p class="card-text mb-0">We have a series of colors that are used by default. They include:</p>
                                    <ul class="colors-list list-unstyled mb-0">
                                        <li><i data-feather="chevrons-right"></i>Primary</li>
                                        <li><i data-feather="chevrons-right"></i>Secondary</li>
                                        <li><i data-feather="chevrons-right"></i>Success</li>
                                        <li><i data-feather="chevrons-right"></i>Warning</li>
                                        <li><i data-feather="chevrons-right"></i>Danger</li>
                                        <li><i data-feather="chevrons-right"></i>Info</li>
                                    </ul>
                                    <p class="card-text">
                                        For each color, we think has its functionality in the application as alerts of errors <b>(danger)</b>,
                                        warnings to the user <b>(warning)</b>, communications of approval <b>(success)</b>, or main color of the
                                        application <b>(primary)</b>.
                                    </p>

                                    <div class="d-flex justify-content-start flex-wrap">
                                        <div class="text-center bg-primary colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>primary</span>
                                        </div>
                                        <div class="text-center bg-secondary colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>secondary</span>
                                        </div>
                                        <div class="text-center bg-success colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>success</span>
                                        </div>
                                        <div class="text-center bg-warning colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>warning</span>
                                        </div>
                                        <div class="text-center bg-danger colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>danger</span>
                                        </div>
                                        <div class="text-center bg-info colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center my-1 ml-50 shadow">
                                            <span>info</span>
                                        </div>
                                    </div>
                                    <h6 class="mt-1">Lighten Variant</h6>
                                    <p class="mb-0">
                                        Use <code>.bg-{color}.bg-lighten-{1 | 2 | 3 | 4 | 5}</code> classes for lighten background color.
                                    </p>
                                    <div class="d-flex justify-content-start flex-wrap">
                                        <div class="text-center bg-primary bg-lighten-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>lighten-2</span>
                                        </div>
                                        <div class="text-center bg-secondary bg-lighten-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>lighten-2</span>
                                        </div>
                                        <div class="text-center bg-success bg-lighten-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>lighten-2</span>
                                        </div>
                                        <div class="text-center bg-warning bg-lighten-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>lighten-2</span>
                                        </div>
                                        <div class="text-center bg-danger bg-lighten-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>lighten-2</span>
                                        </div>
                                        <div class="text-center bg-info bg-lighten-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center my-1 ml-50 shadow">
                                            <span>lighten-2</span>
                                        </div>
                                    </div>
                                    <h6 class="mt-1">Darken Variant</h6>
                                    <p class="mb-0">
                                        Use <code>.bg-{color}.bg-darken-{1 | 2 | 3 | 4}</code> classes for darken background color.
                                    </p>
                                    <div class="d-flex justify-content-start flex-wrap">
                                        <div class="text-center bg-primary bg-darken-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>darken-2</span>
                                        </div>
                                        <div class="text-center bg-secondary bg-darken-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>darken-2</span>
                                        </div>
                                        <div class="text-center bg-success bg-darken-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>darken-2</span>
                                        </div>
                                        <div class="text-center bg-warning bg-darken-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>darken-2</span>
                                        </div>
                                        <div class="text-center bg-danger bg-darken-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>darken-2</span>
                                        </div>
                                        <div class="text-center bg-info bg-darken-2 colors-container rounded text-white width-100 height-100 d-flex align-items-center justify-content-center my-1 ml-50 shadow">
                                            <span>darken-2</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Background color end -->

                <!-- Gradient color start -->
                <section id="backcolor-gradient">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Gradient Colors</h4>
                                </div>
                                <div class="card-body">
                                    <p class="card-text mb-0">We have make gradient color based on our default color:</p>
                                    <ul class="colors-list list-unstyled mb-0">
                                        <li><i data-feather="chevrons-right"></i>bg-gradient-primary</li>
                                        <li><i data-feather="chevrons-right"></i>bg-gradient-secondary</li>
                                        <li><i data-feather="chevrons-right"></i>bg-gradient-success</li>
                                        <li><i data-feather="chevrons-right"></i>bg-gradient-warning</li>
                                        <li><i data-feather="chevrons-right"></i>bg-gradient-danger</li>
                                        <li><i data-feather="chevrons-right"></i>bg-gradient-info</li>
                                    </ul>
                                    <p class="card-text">
                                        For each color, we think has its functionality in the application as alerts of errors <b>(danger)</b>,
                                        warnings to the user <b>(warning)</b>, communications of approval <b>(success)</b>, or main color of the
                                        application <b>(primary)</b>.
                                    </p>

                                    <div class="d-flex justify-content-start flex-wrap">
                                        <div class="text-center colors-container bg-gradient-primary rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>primary gradient</span>
                                        </div>
                                        <div class="text-center colors-container bg-gradient-secondary rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>secondary gradient</span>
                                        </div>
                                        <div class="text-center colors-container bg-gradient-success rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>success gradient</span>
                                        </div>
                                        <div class="text-center colors-container bg-gradient-warning rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>warning gradient</span>
                                        </div>
                                        <div class="text-center colors-container bg-gradient-danger rounded text-white width-100 height-100 d-flex align-items-center justify-content-center mr-1 ml-50 my-1 shadow">
                                            <span>danger gradient</span>
                                        </div>
                                        <div class="text-center colors-container bg-gradient-info rounded text-white width-100 height-100 d-flex align-items-center justify-content-center my-1 ml-50 shadow px-1">
                                            <span>info gradient</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Gradient color end -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

    
<%@ include file="../user/dashinc/userbottom.jsp" %>
