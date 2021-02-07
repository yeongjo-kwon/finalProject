<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yeongjoJs/yjInquiryAjax.js"></script>
<script type="text/javascript">
	$(function(){
		$('select[name="dong"]').change(function(){
			alert($(this).val());
			$.ajax({
				url:"<c:url value='/admin/adminMngcost/showHoList.do'/>",
				type:"get",
				data:"dong="+$(this).val(),
				dataType:"json",
				success:function(res){
					if(res.length>0){
						var str="<option value='0'>호수를 입력하세요</option>";
						$.each(res, function(idx, item){
							str+="<option value='"+item.ho+"'>"+item.ho+"호</option>";
						});
						$('select[name=ho]').html(str);
					}
				},
				error:function(xhr, status, error){
					alert("error : "+error);
				}
			});
		});
		
		$('#customSwitch10').click(function(){
		});
	});
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
               <h2 class="content-header-title float-left mb-0">납입내역 조회</h2>
               <div class="breadcrumb-wrapper">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item">
                   	<a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">Home</a>
                   </li>
                   <li class="breadcrumb-item"><a href="#">납입내역 관리</a></li>
                   <li class="breadcrumb-item active">납입내역 조회</li>
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
       <!-- Table head options start -->
		<div class="row" id="table-head">
		  <div class="col-12">
		    <div class="card">
		      <div class="card-header">
		        <h4 class="card-title">납부현황</h4>
		      </div>
		      <div class="card-body">
		        <p class="card-text">
		        	세대별 납부현황을 조회할 수 있습니다
		        </p>
		        <div class="custom-control custom-switch custom-switch-primary float-right">미납내역만 보기&nbsp;
	              <input type="checkbox" class="custom-control-input" id="customSwitch10" checked />
	              <label class="custom-control-label" for="customSwitch10">
	                <span class="switch-icon-left"><i data-feather="check"></i></span>
	                <span class="switch-icon-right"><i data-feather="x"></i></span>
	              </label>
	            </div>
	            <div class="col-md-12 mb-1 row">
	            <div class="col-6">
            	  <label>동</label>
	              <select class="select2 form-control form-control-lg" name="dong" id="dong">
	                <option value="0">동수를 입력하세요</option>
	                <c:forEach var="dong" items="${dongList}">
						<option value="${dong}">${dong}동</option>	                
	                </c:forEach>
	              </select>
	            </div>
	              
	            <div class="col-6">
	              <label>호</label>
	              <select class="select2 form-control form-control-lg" name="ho">
	                <option value="0">호수를 입력하세요</option>
	              </select>
	            </div>
	            </div>
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
		              <td>
		                <span class="font-weight-bold">Angular Project</span>
		              </td>
		              <td>Peter Charls</td>
		              <td>
		                <div class="avatar-group">
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Lilian Nenez"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-5.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Alberto Glotzbach"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-6.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Alberto Glotzbach"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-7.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                </div>
		              </td>
		              <td><span class="badge badge-pill badge-light-primary mr-1">Active</span></td>
		              <td>
		                <div class="dropdown">
		                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow" data-toggle="dropdown">
		                    <i data-feather="more-vertical"></i>
		                  </button>
		                  <div class="dropdown-menu">
		                    <a class="dropdown-item" href="javascript:void(0);">
		                      <i data-feather="edit-2" class="mr-50"></i>
		                      <span>Edit</span>
		                    </a>
		                    <a class="dropdown-item" href="javascript:void(0);">
		                      <i data-feather="trash" class="mr-50"></i>
		                      <span>Delete</span>
		                    </a>
		                  </div>
		                </div>
		              </td>
		            </tr>
		            <tr>
		              <td>
		                <img
		                  src="../../../app-assets/images/icons/react.svg"
		                  class="mr-75"
		                  height="20"
		                  width="20"
		                  alt="React"
		                />
		                <span class="font-weight-bold">React Project</span>
		              </td>
		              <td>Ronald Frest</td>
		              <td>
		                <div class="avatar-group">
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Lilian Nenez"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-5.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Alberto Glotzbach"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-6.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Alberto Glotzbach"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-7.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                </div>
		              </td>
		              <td><span class="badge badge-pill badge-light-success mr-1">Completed</span></td>
		              <td>
		                <div class="dropdown">
		                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow" data-toggle="dropdown">
		                    <i data-feather="more-vertical"></i>
		                  </button>
		                  <div class="dropdown-menu">
		                    <a class="dropdown-item" href="javascript:void(0);">
		                      <i data-feather="edit-2" class="mr-50"></i>
		                      <span>Edit</span>
		                    </a>
		                    <a class="dropdown-item" href="javascript:void(0);">
		                      <i data-feather="trash" class="mr-50"></i>
		                      <span>Delete</span>
		                    </a>
		                  </div>
		                </div>
		              </td>
		            </tr>
		            <tr>
		              <td>
		                <img
		                  src="../../../app-assets/images/icons/vuejs.svg"
		                  class="mr-75"
		                  height="20"
		                  width="20"
		                  alt="Vuejs"
		                />
		                <span class="font-weight-bold">Vuejs Project</span>
		              </td>
		              <td>Jack Obes</td>
		              <td>
		                <div class="avatar-group">
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Lilian Nenez"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-5.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Alberto Glotzbach"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-6.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Alberto Glotzbach"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-7.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                </div>
		              </td>
		              <td><span class="badge badge-pill badge-light-info mr-1">Scheduled</span></td>
		              <td>
		                <div class="dropdown">
		                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow" data-toggle="dropdown">
		                    <i data-feather="more-vertical"></i>
		                  </button>
		                  <div class="dropdown-menu">
		                    <a class="dropdown-item" href="javascript:void(0);">
		                      <i data-feather="edit-2" class="mr-50"></i>
		                      <span>Edit</span>
		                    </a>
		                    <a class="dropdown-item" href="javascript:void(0);">
		                      <i data-feather="trash" class="mr-50"></i>
		                      <span>Delete</span>
		                    </a>
		                  </div>
		                </div>
		              </td>
		            </tr>
		            <tr>
		              <td>
		                <img
		                  src="../../../app-assets/images/icons/bootstrap.svg"
		                  class="mr-75"
		                  height="20"
		                  width="20"
		                  alt="Bootstrap"
		                />
		                <span class="font-weight-bold">Bootstrap Project</span>
		              </td>
		              <td>Jerry Milton</td>
		              <td>
		                <div class="avatar-group">
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Lilian Nenez"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-5.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Alberto Glotzbach"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-6.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                  <div
		                    data-toggle="tooltip"
		                    data-popup="tooltip-custom"
		                    data-placement="top"
		                    title=""
		                    class="avatar pull-up my-0"
		                    data-original-title="Alberto Glotzbach"
		                  >
		                    <img
		                      src="../../../app-assets/images/portrait/small/avatar-s-7.jpg"
		                      alt="Avatar"
		                      height="26"
		                      width="26"
		                    />
		                  </div>
		                </div>
		              </td>
		              <td><span class="badge badge-pill badge-light-warning mr-1">Pending</span></td>
		              <td>
		                <div class="dropdown">
		                  <button type="button" class="btn btn-sm dropdown-toggle hide-arrow" data-toggle="dropdown">
		                    <i data-feather="more-vertical"></i>
		                  </button>
		                  <div class="dropdown-menu">
		                    <a class="dropdown-item" href="javascript:void(0);">
		                      <i data-feather="edit-2" class="mr-50"></i>
		                      <span>Edit</span>
		                    </a>
		                    <a class="dropdown-item" href="javascript:void(0);">
		                      <i data-feather="trash" class="mr-50"></i>
		                      <span>Delete</span>
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
	<!-- END: Content-->

<!-- ======= End About Section ======= -->
<%@ include file="../adminInc/adminBottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
    
    

