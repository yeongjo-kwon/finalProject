<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../user/dashinc/usertop.jsp"%>

<!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper">
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h2 class="content-header-title float-left mb-0">Bootstrap
							Tables</h2>
						<div class="breadcrumb-wrapper">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active">Table Bootstrap</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<div
				class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
				  <div class="form-group breadcrumb-right">
					<div class="dropdown">
						<button
							class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<i data-feather="grid"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="app-todo.html"><i class="mr-1"
								data-feather="check-square"></i><span class="align-middle">Todo</span></a><a
								class="dropdown-item" href="app-chat.html"><i class="mr-1"
								data-feather="message-square"></i><span class="align-middle">Chat</span></a><a
								class="dropdown-item" href="app-email.html"><i class="mr-1"
								data-feather="mail"></i><span class="align-middle">Email</span></a><a
								class="dropdown-item" href="app-calendar.html"><i
								class="mr-1" data-feather="calendar"></i><span
								class="align-middle">Calendar</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="content-body">
			<!-- Basic Tables start -->
			<div class="row" id="basic-table">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Table Basic</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Using the most basic table Leanne Grahamup, here’s how
								<code>.table</code>
								-based tables look in Bootstrap. You can use any example of
								below table for your table and it can be use with any type of
								bootstrap tables.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Basic Tables end -->

			<!-- Dark Tables start -->
			<div class="row" id="dark-table">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Dark Table</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								You can also invert the colors—with light text on dark
								backgrounds—with
								<code>.table-dark</code>
								class with
								<code>.table</code>
								class.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table table-dark">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm text-white dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm text-white dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm text-white dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm text-white dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Dark Tables end -->

			<!-- Table head options start -->
			<div class="row" id="table-head">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Table head options</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Similar to tables and dark tables, use the modifier classes
								<code class="highlighter-rouge">.thead-dark</code>
								to make
								<code class="highlighter-rouge">&lt;thead&gt;</code>
								s appear dark.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-body mt-2">
							<p class="card-text">
								Use the modifier class
								<code class="highlighter-rouge">.thead-light</code>
								to make
								<code class="highlighter-rouge">&lt;thead&gt;</code>
								s appear light.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Table head options end -->

			<!-- Striped rows start -->
			<div class="row" id="table-striped">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Striped rows</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Use
								<code class="highlighter-rouge">.table-striped</code>
								to add zebra-striping to any table row within the
								<code class="highlighter-rouge">&lt;tbody&gt;</code>
								. This styling doesn't work in IE8 and below as
								<code>:nth-child</code>
								CSS selector isn't supported.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Striped rows end -->

			<!-- Striped rows with inverse dark table start -->
			<div class="row" id="table-striped-dark">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Striped rows with inverse dark</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Use
								<code>.table-dark</code>
								with
								<code>.table-striped</code>
								to add zebra-striping to any inverse table row within the
								<code>&lt;tbody&gt;</code>
								. This styling doesn't work in IE8 and below as
								<code>:nth-child</code>
								CSS selector isn't supported.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table table-striped table-dark">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm text-white dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm text-white dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm text-white dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm text-white dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Striped rows with inverse dark table end -->

			<!-- Bordered table start -->
			<div class="row" id="table-bordered">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Bordered table</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Add
								<code>.table-bordered</code>
								for borders on all sides of the table and cells. For Inverse
								Dark Table, add
								<code>.table-dark</code>
								along with
								<code>.table-bordered</code>
								.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Bordered table end -->

			<!-- Borderless table start -->
			<div class="row" id="table-borderless">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Borderless Table</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Add
								<code>.table-borderless</code>
								for a table without borders. It can also be used on dark tables.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table table-borderless">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Borderless table end -->

			<!-- Hoverable rows start -->
			<div class="row" id="table-hover-row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Hoverable rows</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Add
								<code class="highlighter-rouge">.table-hover</code>
								to enable a hover state on table rows within a
								<code class="highlighter-rouge">&lt;tbody&gt;</code>
								.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Hoverable rows end -->

			<!-- Small Table start -->
			<div class="row" id="table-small">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Small Table</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Add
								<code class="highlighter-rouge">.table-sm</code>
								class with
								<code>.table</code>
								to display small size table.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table table-sm">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" alt="Angular" width="18" height="18" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" alt="React" width="18" height="18" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" alt="Vuejs" width="18" height="18" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" alt="Bootstrap" width="18" height="18" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="22" width="22" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Small Table end -->

			<!-- Contextual classes start -->
			<div class="row" id="table-contextual">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Contextual classes</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Use contextual classes to color table rows or individual cells.
								Read full documnetation <a
									href="https://getbootstrap.com/docs/4.3/content/tables/IDcontextual-classes"
									target="_blank">here.</a>
							</p>
						</div>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr class="table-default">
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/figma.svg"
											class="mr-75" height="20" width="20" alt="Figma" /> <span
											class="font-weight-bold">Figma Project</span></td>
										<td>Ronnie Shane</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr class="table-active">
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr class="table-primary">
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr class="table-secondary">
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-secondary mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr class="table-success">
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr class="table-danger">
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/figma.svg"
											class="mr-75" height="20" width="20" alt="Figma" /> <span
											class="font-weight-bold">Figma Project</span></td>
										<td>Janne Ale</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-danger mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr class="table-warning">
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Custom</span></td>
										<td>Ted Richer</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr class="table-info">
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Latest Bootstrap</span></td>
										<td>Perry Parker</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr class="table-light">
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular UI</span></td>
										<td>Ana Bell</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr class="table-dark">
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap UI</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-dark mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Contextual classes end -->

			<!-- Table without card start -->
			<div class="row" id="table-without-card">
				<div class="col-12 my-2">
					<h5 class="mb-1">Table without card</h5>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>Project</th>
									<th>Client</th>
									<th>Users</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><img
										src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
										class="mr-75" height="20" width="20" alt="Angular" /> <span
										class="font-weight-bold">Angular Project</span></td>
									<td>Peter Charls</td>
									<td>
										<div class="avatar-group">
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Lilian Nenez">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Alberto Glotzbach">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Alberto Glotzbach">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
										</div>
									</td>
									<td><span
										class="badge badge-pill badge-light-primary mr-1">Active</span></td>
									<td>
										<div class="dropdown">
											<button type="button"
												class="btn btn-sm dropdown-toggle hide-arrow"
												data-toggle="dropdown">
												<i data-feather="more-vertical"></i>
											</button>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="javascript:void(0);"> <i
													data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
												</a> <a class="dropdown-item" href="javascript:void(0);"> <i
													data-feather="trash" class="mr-50"></i> <span>Delete</span>
												</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
										class="mr-75" height="20" width="20" alt="React" /> <span
										class="font-weight-bold">React Project</span></td>
									<td>Ronald Frest</td>
									<td>
										<div class="avatar-group">
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Lilian Nenez">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Alberto Glotzbach">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Alberto Glotzbach">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
										</div>
									</td>
									<td><span
										class="badge badge-pill badge-light-success mr-1">Completed</span></td>
									<td>
										<div class="dropdown">
											<button type="button"
												class="btn btn-sm dropdown-toggle hide-arrow"
												data-toggle="dropdown">
												<i data-feather="more-vertical"></i>
											</button>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="javascript:void(0);"> <i
													data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
												</a> <a class="dropdown-item" href="javascript:void(0);"> <i
													data-feather="trash" class="mr-50"></i> <span>Delete</span>
												</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
										class="mr-75" height="20" width="20" alt="Vuejs" /> <span
										class="font-weight-bold">Vuejs Project</span></td>
									<td>Jack Obes</td>
									<td>
										<div class="avatar-group">
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Lilian Nenez">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Alberto Glotzbach">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Alberto Glotzbach">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
										</div>
									</td>
									<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
									<td>
										<div class="dropdown">
											<button type="button"
												class="btn btn-sm dropdown-toggle hide-arrow"
												data-toggle="dropdown">
												<i data-feather="more-vertical"></i>
											</button>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="javascript:void(0);"> <i
													data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
												</a> <a class="dropdown-item" href="javascript:void(0);"> <i
													data-feather="trash" class="mr-50"></i> <span>Delete</span>
												</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td><img
										src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
										class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
										class="font-weight-bold">Bootstrap Project</span></td>
									<td>Jerry Milton</td>
									<td>
										<div class="avatar-group">
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Lilian Nenez">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Alberto Glotzbach">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
											<div data-toggle="tooltip" data-popup="tooltip-custom"
												data-placement="top" title="" class="avatar pull-up my-0"
												data-original-title="Alberto Glotzbach">
												<img
													src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
													alt="Avatar" height="26" width="26" />
											</div>
										</div>
									</td>
									<td><span
										class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
									<td>
										<div class="dropdown">
											<button type="button"
												class="btn btn-sm dropdown-toggle hide-arrow"
												data-toggle="dropdown">
												<i data-feather="more-vertical"></i>
											</button>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="javascript:void(0);"> <i
													data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
												</a> <a class="dropdown-item" href="javascript:void(0);"> <i
													data-feather="trash" class="mr-50"></i> <span>Delete</span>
												</a>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Table without card End -->

			<!-- Responsive tables start -->
			<div class="row" id="table-responsive">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Responsive tables</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Responsive tables allow tables to be scrolled horizontally with
								ease. Make any table responsive across all viewports by adding
								<code class="highlighter-rouge">.table-responsive</code>
								class on
								<code class="highlighter-rouge">.table</code>
								. Or, pick a maximum breakpoint with which to have a responsive
								table up to by adding
								<code class="highlighter-rouge">
									.table-responsive{-sm|-md|-lg|-xl}</code>
								. Read full documentation <a
									href="https://getbootstrap.com/docs/4.3/content/tables/#responsive-tables"
									target="_blank">here.</a>
							</p>
							<div class="alert alert-info">
								<div class="alert-body">
									<h4 class="text-warning">Vertical clipping/truncation</h4>
									<p>
										Responsive tables make use of
										<code class="highlighter-rouge">overflow-y: hidden</code>
										, which clips off any content that goes beyond the bottom or
										top edges of the table. In particular, this can clip off
										dropdown menus and other third-party widgets.
									</p>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table mb-0">
								<thead>
									<tr>
										<th scope="col" class="text-nowrap">#</th>
										<th scope="col" class="text-nowrap">Heading 1</th>
										<th scope="col" class="text-nowrap">Heading 2</th>
										<th scope="col" class="text-nowrap">Heading 3</th>
										<th scope="col" class="text-nowrap">Heading 4</th>
										<th scope="col" class="text-nowrap">Heading 5</th>
										<th scope="col" class="text-nowrap">Heading 6</th>
										<th scope="col" class="text-nowrap">Heading 7</th>
										<th scope="col" class="text-nowrap">Heading 8</th>
										<th scope="col" class="text-nowrap">Heading 9</th>
										<th scope="col" class="text-nowrap">Heading 10</th>
										<th scope="col" class="text-nowrap">Heading 11</th>
										<th scope="col" class="text-nowrap">Heading 12</th>
										<th scope="col" class="text-nowrap">Heading 13</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-nowrap">1</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
										<td class="text-nowrap">Table cell</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
									</tr>
									<tr>
										<td>4</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
										<td>Table cell</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Responsive tables end -->

			<!-- Table Hover Animation start -->
			<div class="row" id="table-hover-animation">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Table Hover Animation</h4>
						</div>
						<div class="card-body">
							<p class="card-text">
								Add
								<code>.table-hover-animation</code>
								to enable a hover stat with animation on table rows within a
								<code class="highlighter-rouge">&lt;tbody&gt;</code>
								.
							</p>
						</div>
						<div class="table-responsive">
							<table class="table table-hover-animation">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/angular.svg"
											class="mr-75" height="20" width="20" alt="Angular" /> <span
											class="font-weight-bold">Angular Project</span></td>
										<td>Peter Charls</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-primary mr-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/react.svg"
											class="mr-75" height="20" width="20" alt="React" /> <span
											class="font-weight-bold">React Project</span></td>
										<td>Ronald Frest</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-success mr-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/vuejs.svg"
											class="mr-75" height="20" width="20" alt="Vuejs" /> <span
											class="font-weight-bold">Vuejs Project</span></td>
										<td>Jack Obes</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><img
											src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/icons/bootstrap.svg"
											class="mr-75" height="20" width="20" alt="Bootstrap" /> <span
											class="font-weight-bold">Bootstrap Project</span></td>
										<td>Jerry Milton</td>
										<td>
											<div class="avatar-group">
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Lilian Nenez">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-5.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-6.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
												<div data-toggle="tooltip" data-popup="tooltip-custom"
													data-placement="top" title="" class="avatar pull-up my-0"
													data-original-title="Alberto Glotzbach">
													<img
														src="${pageContext.request.contextPath}/resources/user/mydash/app-assets/images/portrait/small/avatar-s-7.jpg"
														alt="Avatar" height="26" width="26" />
												</div>
											</div>
										</td>
										<td><span
											class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-sm dropdown-toggle hide-arrow"
													data-toggle="dropdown">
													<i data-feather="more-vertical"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="edit-2" class="mr-50"></i> <span>Edit</span>
													</a> <a class="dropdown-item" href="javascript:void(0);"> <i
														data-feather="trash" class="mr-50"></i> <span>Delete</span>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Table head options end -->

		</div>
	</div>
</div>
<!-- END: Content-->


<!-- BEGIN: Customizer-->
<div class="customizer d-none d-md-block">
	<a
		class="customizer-toggle d-flex align-items-center justify-content-center"
		href="javascript:void(0);"><i class="spinner"
		data-feather="settings"></i></a>
	<div class="customizer-content">
		<!-- Customizer header -->
		<div class="customizer-header px-2 pt-1 pb-0 position-relative">
			<h4 class="mb-0">Theme Customizer</h4>
			<p class="m-0">Customize & Preview in Real Time</p>

			<a class="customizer-close" href="javascript:void(0);"><i
				data-feather="x"></i></a>
		</div>

		<hr />

		<!-- Styling & Text Direction -->
		<div class="customizer-styling-direction px-2">
			<p class="font-weight-bold">Skin</p>
			<div class="d-flex">
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="skinlight" name="skinradio"
						class="custom-control-input layout-name" checked data-layout="" />
					<label class="custom-control-label" for="skinlight">Light</label>
				</div>
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="skinbordered" name="skinradio"
						class="custom-control-input layout-name"
						data-layout="bordered-layout" /> <label
						class="custom-control-label" for="skinbordered">Bordered</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="skindark" name="skinradio"
						class="custom-control-input layout-name" data-layout="dark-layout" />
					<label class="custom-control-label" for="skindark">Dark</label>
				</div>
			</div>
		</div>

		<hr />

		<!-- Menu -->
		<div class="customizer-menu px-2">
			<div id="customizer-menu-collapsible" class="d-flex">
				<p class="font-weight-bold mr-auto m-0">Collapsible</p>
				<div class="custom-control custom-control-primary custom-switch">
					<input type="checkbox" class="custom-control-input"
						id="collapse-sidebar-switch" /> <label
						class="custom-control-label" for="collapse-sidebar-switch"></label>
				</div>
			</div>
		</div>
		<hr />

		<!-- Layout Width -->
		<div class="customizer-footer px-2">
			<p class="font-weight-bold">Layout Width</p>
			<div class="d-flex">
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="layout-width-full" name="layoutWidth"
						class="custom-control-input" checked /> <label
						class="custom-control-label" for="layout-width-full">Full
						Width</label>
				</div>
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="layout-width-boxed" name="layoutWidth"
						class="custom-control-input" /> <label
						class="custom-control-label" for="layout-width-boxed">Boxed</label>
				</div>
			</div>
		</div>
		<hr />

		<!-- Navbar -->
		<div class="customizer-navbar px-2">
			<div id="customizer-navbar-colors">
				<p class="font-weight-bold">Navbar Color</p>
				<ul class="list-inline unstyled-list">
					<li class="color-box bg-white border selected"
						data-navbar-default=""></li>
					<li class="color-box bg-primary" data-navbar-color="bg-primary"></li>
					<li class="color-box bg-secondary" data-navbar-color="bg-secondary"></li>
					<li class="color-box bg-success" data-navbar-color="bg-success"></li>
					<li class="color-box bg-danger" data-navbar-color="bg-danger"></li>
					<li class="color-box bg-info" data-navbar-color="bg-info"></li>
					<li class="color-box bg-warning" data-navbar-color="bg-warning"></li>
					<li class="color-box bg-dark" data-navbar-color="bg-dark"></li>
				</ul>
			</div>

			<p class="navbar-type-text font-weight-bold">Navbar Type</p>
			<div class="d-flex">
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="nav-type-floating" name="navType"
						class="custom-control-input" checked /> <label
						class="custom-control-label" for="nav-type-floating">Floating</label>
				</div>
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="nav-type-sticky" name="navType"
						class="custom-control-input" /> <label
						class="custom-control-label" for="nav-type-sticky">Sticky</label>
				</div>
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="nav-type-static" name="navType"
						class="custom-control-input" /> <label
						class="custom-control-label" for="nav-type-static">Static</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="nav-type-hidden" name="navType"
						class="custom-control-input" /> <label
						class="custom-control-label" for="nav-type-hidden">Hidden</label>
				</div>
			</div>
		</div>
		<hr />

		<!-- Footer -->
		<div class="customizer-footer px-2">
			<p class="font-weight-bold">Footer Type</p>
			<div class="d-flex">
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="footer-type-sticky" name="footerType"
						class="custom-control-input" /> <label
						class="custom-control-label" for="footer-type-sticky">Sticky</label>
				</div>
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="footer-type-static" name="footerType"
						class="custom-control-input" checked /> <label
						class="custom-control-label" for="footer-type-static">Static</label>
				</div>
				<div class="custom-control custom-radio mr-1">
					<input type="radio" id="footer-type-hidden" name="footerType"
						class="custom-control-input" /> <label
						class="custom-control-label" for="footer-type-hidden">Hidden</label>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- End: Customizer-->

<%@ include file="../user/dashinc/userbottom.jsp"%>