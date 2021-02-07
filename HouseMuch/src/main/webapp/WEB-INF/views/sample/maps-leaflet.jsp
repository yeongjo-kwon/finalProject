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
                            <h2 class="content-header-title float-left mb-0">Leaflet Maps</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">Maps</a>
                                    </li>
                                    <li class="breadcrumb-item active">Leaflet Maps
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
                <section class="maps-leaflet">
                    <div class="row">
                        <!-- Basic Starts -->
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h4 class="card-title">Basic Map</h4>
                                </div>
                                <div class="card-body">
                                    <div class="leaflet-map" id="basic-map"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /Basic Ends -->

                        <!-- Marker Circle & Polygon Starts -->
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h4 class="card-title">Marker Circle & Polygon</h4>
                                </div>
                                <div class="card-body">
                                    <div class="leaflet-map" id="shape-map"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /Marker Circle & Polygon Ends -->

                        <!-- Draggable Marker With Popup Starts -->
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h4 class="card-title">Draggable Marker With Popup</h4>
                                </div>
                                <div class="card-body">
                                    <div class="leaflet-map" id="drag-map"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /Draggable Marker With Popup Ends -->

                        <!-- User Location Starts -->
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h4 class="card-title">User Location</h4>
                                </div>
                                <div class="card-body">
                                    <div class="leaflet-map" id="user-location"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /User Location Ends -->

                        <!-- Custom Icons Starts -->
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h4 class="card-title">Custom Icons</h4>
                                </div>
                                <div class="card-body">
                                    <div class="leaflet-map" id="custom-icons"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /Custom Icons Ends -->

                        <!-- GeoJson Starts -->
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h4 class="card-title">GeoJson</h4>
                                </div>
                                <div class="card-body">
                                    <div class="leaflet-map" id="geojson"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /GeoJson Ends -->

                        <!-- Layer Control Starts -->
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Layer Control</h4>
                                </div>
                                <div class="card-body">
                                    <div class="leaflet-map" id="layer-control"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /Layer Control Ends -->
                    </div>
                </section>

            </div>
        </div>
    </div>

    <!-- END: Content-->
    
<%@ include file="../user/dashinc/userbottom.jsp" %>
