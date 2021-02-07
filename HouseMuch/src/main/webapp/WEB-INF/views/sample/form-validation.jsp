<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../user/dashinc/usertop.jsp" %>
    
	<!-- START : Content -->
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Form Validation</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">Forms</a>
                                    </li>
                                    <li class="breadcrumb-item active">Form Validation
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
                <!-- Validation -->
                <section class="bs-validation">
                    <div class="row">
                        <!-- Bootstrap Validation -->
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Bootstrap Validation</h4>
                                </div>
                                <div class="card-body">
                                    <form class="needs-validation" novalidate>
                                        <div class="form-group">
                                            <label class="form-label" for="basic-addon-name">Name</label>

                                            <input type="text" id="basic-addon-name" class="form-control" placeholder="Name" aria-label="Name" aria-describedby="basic-addon-name" required />
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Please enter your name.</div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="basic-default-email1">Email</label>
                                            <input type="email" id="basic-default-email1" class="form-control" placeholder="john.doe@email.com" aria-label="john.doe@email.com" required />
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Please enter a valid email</div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="basic-default-password1">Password</label>
                                            <input type="password" id="basic-default-password1" class="form-control" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" required />
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Please enter your password.</div>
                                        </div>
                                        <div class="form-group">
                                            <label for="select-country1">Country</label>
                                            <select class="form-control" id="select-country1" required>
                                                <option value="">Select Country</option>
                                                <option value="usa">USA</option>
                                                <option value="uk">UK</option>
                                                <option value="france">France</option>
                                                <option value="australia">Australia</option>
                                                <option value="spain">Spain</option>
                                            </select>
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Please select your country</div>
                                        </div>
                                        <div class="form-group">
                                            <label for="dob-bootstrap-val">DOB</label>
                                            <input type="text" class="form-control flatpickr-validation flatpickr" id="dob-bootstrap-val" required />
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Please Enter Your DOB</div>
                                        </div>
                                        <div class="form-group">
                                            <label for="customFile1">Profile pic</label>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="customFile1" required />
                                                <label class="custom-file-label" for="customFile1">Choose profile pic</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="d-block">Gender</label>
                                            <div class="custom-control custom-radio my-50">
                                                <input type="radio" id="validationRadio3" name="validationRadioBootstrap" class="custom-control-input" required />
                                                <label class="custom-control-label" for="validationRadio3">Male</label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="validationRadio4" name="validationRadioBootstrap" class="custom-control-input" required />
                                                <label class="custom-control-label" for="validationRadio4">Female</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="d-block" for="validationBioBootstrap">Bio</label>
                                            <textarea class="form-control" id="validationBioBootstrap" name="validationBioBootstrap" rows="3" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="validationCheckBootstrap" required />
                                                <label class="custom-control-label" for="validationCheckBootstrap">Agree to our terms and conditions</label>
                                                <div class="invalid-feedback">You must agree before submitting.</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /Bootstrap Validation -->

                        <!-- jQuery Validation -->
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">jQuery Validation</h4>
                                </div>
                                <div class="card-body">
                                    <form id="jquery-val-form" method="post">
                                        <div class="form-group">
                                            <label class="form-label" for="basic-default-name">Name</label>
                                            <input type="text" class="form-control" id="basic-default-name" name="basic-default-name" placeholder="John Doe" />
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="basic-default-email">Email</label>
                                            <input type="text" id="basic-default-email" name="basic-default-email" class="form-control" placeholder="john.doe@email.com" />
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="basic-default-password">Password</label>
                                            <input type="password" id="basic-default-password" name="basic-default-password" class="form-control" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" />
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="confirm-password">Confirm Password</label>
                                            <input type="password" id="confirm-password" name="confirm-password" class="form-control" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" />
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="dob">DOB</label>
                                            <input type="text" class="form-control" name="dob" id="dob" />
                                        </div>
                                        <div class="form-group">
                                            <label for="select-country">Country</label>
                                            <select class="form-control select2" id="select-country" name="select-country">
                                                <option value="">Select Country</option>
                                                <option value="usa">USA</option>
                                                <option value="uk">UK</option>
                                                <option value="france">France</option>
                                                <option value="australia">Australia</option>
                                                <option value="spain">Spain</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Profile pic</label>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="customFile" name="customFile" />
                                                <label class="custom-file-label" for="customFile">Choose profile pic</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="d-block">Gender</label>
                                            <div class="custom-control custom-radio my-50">
                                                <input type="radio" id="validationRadiojq1" name="validationRadiojq" class="custom-control-input" />
                                                <label class="custom-control-label" for="validationRadiojq1">Male</label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="validationRadiojq2" name="validationRadiojq" class="custom-control-input" />
                                                <label class="custom-control-label" for="validationRadiojq2">Female</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="d-block" for="validationBio">Bio</label>
                                            <textarea class="form-control" id="validationBio" name="validationBiojq" rows="3"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="validationCheck" name="validationCheck" />
                                                <label class="custom-control-label" for="validationCheck">Agree to our terms and conditions</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-primary" name="submit" value="Submit">Submit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /jQuery Validation -->
                    </div>
                </section>
                <!-- /Validation -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

	
    
<%@ include file="../user/dashinc/userbottom.jsp" %>
