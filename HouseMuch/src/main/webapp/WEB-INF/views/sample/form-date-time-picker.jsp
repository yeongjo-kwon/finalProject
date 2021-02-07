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
                            <h2 class="content-header-title float-left mb-0">Date &amp; Time Picker</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">Form Elements</a>
                                    </li>
                                    <li class="breadcrumb-item active">Date &amp; Time Picker
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
                <!-- Flatpickr Starts -->
                <section id="flatpickr">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Flatpickr</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label for="fp-default">Default</label>
                                    <input type="text" id="fp-default" class="form-control flatpickr-basic" placeholder="YYYY-MM-DD" />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="fp-time">Time picker</label>
                                    <input type="text" id="fp-time" class="form-control flatpickr-time text-left" placeholder="HH:MM" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label for="fp-date-time">Date & TIme</label>
                                    <input type="text" id="fp-date-time" class="form-control flatpickr-date-time" placeholder="YYYY-MM-DD HH:MM" />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="fp-multiple">Multiple Dates</label>
                                    <input type="text" id="fp-multiple" class="form-control flatpickr-multiple" placeholder="YYYY-MM-DD" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label for="fp-range">Range</label>
                                    <input type="text" id="fp-range" class="form-control flatpickr-range" placeholder="YYYY-MM-DD to YYYY-MM-DD" />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="fp-human-friendly">Human Friendly</label>
                                    <input type="text" id="fp-human-friendly" class="form-control flatpickr-human-friendly" placeholder="October 14, 2020" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label>Disabled Range</label>
                                    <input type="text" class="form-control flatpickr-disabled-range" placeholder="YYYY-MM-DD" />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Inline</label>
                                    <input type="text" class="form-control flatpickr-inline" placeholder="YYYY-MM-DD" />
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Flatpickr Ends-->

                <!-- Pick-A-Date Picker start -->
                <section id="pick-a-date">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Pick a date</h4>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                The basic setup requires targetting an <code>input</code> element and invoking the picker.
                            </p>

                            <div class="row">
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pd-default">Default</label>
                                    <input type="text" id="pd-default" class="form-control pickadate" placeholder="18 June, 2020" />
                                </div>
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pd-format">Format Date Picker</label>
                                    <input type="text" id="pd-format" class="form-control format-picker" placeholder="18 June, 2020" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pd-minmax">Min-Max Date Range</label>
                                    <input type="text" id="pd-minmax" class="form-control pickadate-limits" placeholder="18 June, 2020" />
                                </div>
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pd-minmax">Translation</label>
                                    <input type="text" class="form-control pickadate-translations" placeholder="18 June, 2020" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pd-short-string">Pick-a-date with short string</label>
                                    <input type="text" id="pd-short-string" class="form-control pickadate-short-string" placeholder="18 June, 2020" />
                                </div>
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pd-firstday">Change First Weekday</label>
                                    <input type="text" id="pd-firstday" class="form-control pickadate-firstday" placeholder="18 June, 2020" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pd-months-year">Select Month & Year</label>
                                    <input type="text" id="pd-months-year" class="form-control pickadate-months-year" placeholder="18 June, 2020" />
                                </div>
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pd-disable">Disabled Dates & Weeks</label>
                                    <input type="text" id="pd-disable" class="form-control pickadate-disable" placeholder="18 June, 2020" />
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Pick-A-Date Picker end -->

                <!-- Pick-A-Time Picker start -->
                <section id="pick-a-time">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Pick a time</h4>
                        </div>
                        <div class="card-body">
                            <p class="card-text">The mobile-friendly, responsive, and lightweight jQuery time input picker.</p>

                            <div class="row">
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pt-default">Default</label>
                                    <input type="text" id="pt-default" class="form-control pickatime" placeholder="8:00 AM" />
                                </div>
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pt-format">Change Formats</label>
                                    <input type="text" id="pt-format" class="form-control pickatime-format" placeholder="Time selected: 12.30 a.m." />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pt-formatlabel">Format with Label</label>
                                    <input type="text" id="pt-formatlabel" class="form-control pickatime-formatlabel" placeholder="8:00 AM" />
                                </div>
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pt-intervals">Intervals</label>
                                    <input type="text" id="pt-intervals" class="form-control pickatime-intervals" placeholder="8:00 AM" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pt-disable">Disable set of Time</label>
                                    <input type="text" id="pt-disable" class="form-control pickatime-disable" placeholder="8:00 AM" />
                                </div>
                                <div class="col-12 col-md-6 form-group">
                                    <label for="pt-min-max">Minimum and maximum time range</label>
                                    <input type="text" id="pt-min-max" class="form-control pickatime-min-max" placeholder="8:00 AM" />
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Pick-A-Time Picker end -->

            </div>
        </div>
    </div>
    <!-- END: Content-->




    
<%@ include file="../user/dashinc/userbottom.jsp" %>
