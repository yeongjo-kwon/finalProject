<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/adminTop.jsp" %>
<!-- 여기부터 -->
   <div class="app-content content ">
        <div class="content-wrapper container p-0">

<!-- 여기까지 box로 감싸는 기본틀 : 밑에 div맡출 것-->

<!-- Table head options start -->



                <div class="row" id="table-head">
                    <div class="col-12">
                        <div class="card" style="align: right">
                            <div class="card-header">
                                <h4 class="card-title">부가시설 신청자 조회</h4>
                            </div>
                            <div class="card-body p-0">
             
						<div class="col-12 mb-1 p-0">
		                                  <!-- 기본 Select -->
										<div class="col-md-2 col-6 mb-1 float-left">
		                                    <div class="form-group">
		                                        <!-- <label for="basicSelect">분류</label> -->
		                                        <select class="form-control" id="basicSelect">
		                                            <option>특화시설</option>
		                                            <option>생활 행정 공지</option>
		                                            <option>관리비 회계 공지</option>
		                                            <option>아파트 일정</option>
		                                        </select>
		                                    </div>
		                                </div>
		                                  <!-- 기본 Select -->
		                                <!-- 여기다 검색창 -->
										<div class="col-md-4 col-6 mb-1 float-left">
		                                            <div class="input-group">
		                                               
		                                                <input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="Amount" />
		                                                 <div class="input-group-prepend">
		                                                    <button class="btn btn-outline-primary" type="button">
		                                                        <i data-feather="search" style="box-sizing:border-box;"></i>
		                                                    </button>
		                                                </div>
		                                            </div>
		                                 </div>
		                                
		                    	</div>
		             </div>
		                               <!-- 여기다 검색창 : 끝 -->
		                               
		                               
						<!-- 테이블시작 -->

                            <div class="table-responsive">
                                <table class="table">
                                    <thead class="thead-dark" style="background-color:#0E515F; color:#fff;font-size:1.2em;font-weight:200;">
                                        <tr>
                                            <th class="font-medium-1 text-center">번호</th>
                                            <th class="font-medium-1 text-center">분류</th>
                                            <th class="font-medium-1 text-center">제목</th>
                                            <th class="font-medium-1 text-center">날짜</th>
                                            <th class="font-medium-1 text-center">작성자</th>
                                            <th class="font-medium-1 text-center">첨부</th>
                                            <th class="font-medium-1 text-center">수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <!-- 레코드반복시작 -->
                                    <%-- <c:forEach var="" item=""> --%>
                                        <tr>
                                            <td>
                                                <span class="font-weight-bold">공지글번호</span>
                                            </td>
                                            <td>[글분류]</td>
                                          
                                            <td>
                                            	  여기있는 액티브쓸찌도 몰라서 주석처리함
                                            </td>
                                            <td>
<!--                                             <span class="badge badge-pill badge-light-primary mr-1">Active</span> -->
											날짜2020-10-10
                                            </td>
                                            <td>작성자김이나</td>
                                            <td>첨부파일아이콘</td>
                                            <!-- 포인트다 여기서 수정/삭제 가능 -->
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
                                       
                                       <%-- </c:forEach> --%>
                                       <!-- 레코드반복 -->
                                    </tbody>
                                </table>
                            </div>
                          <!-- 테이블 끝 -->
						<!-- 테이블시작 -->

                            <div class="table-responsive" style="margin-top:30px;">
                                <table class="table">
                                    <thead class="thead-dark" style="background-color:#0E515F; color:#fff;font-size:1.2em;font-weight:200;">
                                        <tr>
 										   <th class="font-medium-1 text-center">번호</th>
                                            <th class="font-medium-1 text-center">분류</th>
                                            <th class="font-medium-1 text-center">제목</th>
                                            <th class="font-medium-1 text-center">날짜</th>
                                            <th class="font-medium-1 text-center">작성자</th>
                                            <th class="font-medium-1 text-center">첨부</th>
                                            <th class="font-medium-1 text-center">액션</th>
                                            <th class="font-medium-1 text-center">분류</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <!-- 레코드반복시작 -->
                                    <%-- <c:forEach var="" item=""> --%>
                                        <tr>
                                            <td>
                                                <span class="font-weight-bold">공지글번호</span>
                                            </td>
                                            <td>[글분류]</td>
                                          
                                            <td>
                                            	  여기있는 액티브쓸찌도 몰라서 주석처리함
                                            </td>
                                            <td>
<!--                                             <span class="badge badge-pill badge-light-primary mr-1">Active</span> -->
											날짜2020-10-10
                                            </td>
                                            <td>작성자김이나</td>
                                            <td>첨부파일아이콘</td>
                                            <!-- 포인트다 여기서 수정/삭제 가능 -->
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
                                       
                                       <%-- </c:forEach> --%>
                                    <%-- <c:forEach var="" item=""> --%>
                                        <tr>
                                            <td>
                                                <span class="font-weight-bold">공지글번호</span>
                                            </td>
                                            <td>[글분류]</td>
                                          
                                            <td>
                                            	  여기있는 액티브쓸찌도 몰라서 주석처리함
                                            </td>
                                            <td>
<!--                                             <span class="badge badge-pill badge-light-primary mr-1">Active</span> -->
											날짜2020-10-10
                                            </td>
                                            <td>작성자김이나</td>
                                            <td>첨부파일아이콘</td>
                                            <!-- 포인트다 여기서 수정/삭제 가능 -->
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
                                       
                                       <%-- </c:forEach> --%>
                                    <%-- <c:forEach var="" item=""> --%>
                                        <tr>
                                            <td>
                                                <span class="font-weight-bold">공지글번호</span>
                                            </td>
                                            <td>[글분류]</td>
                                          
                                            <td>
                                            	  여기있는 액티브쓸찌도 몰라서 주석처리함
                                            </td>
                                            <td>
<!--                                             <span class="badge badge-pill badge-light-primary mr-1">Active</span> -->
											날짜2020-10-10
                                            </td>
                                            <td>작성자김이나</td>
                                            <td>첨부파일아이콘</td>
                                            <!-- 포인트다 여기서 수정/삭제 가능 -->
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
                                       
                                       <%-- </c:forEach> --%>
                                    <%-- <c:forEach var="" item=""> --%>
                                        <tr>
                                            <td>
                                                <span class="font-weight-bold">공지글번호</span>
                                            </td>
                                            <td>[글분류]</td>
                                          
                                            <td>
                                            	  여기있는 액티브쓸찌도 몰라서 주석처리함
                                            </td>
                                            <td>
<!--                                             <span class="badge badge-pill badge-light-primary mr-1">Active</span> -->
											날짜2020-10-10
                                            </td>
                                            <td>작성자김이나</td>
                                            <td>첨부파일아이콘</td>
                                            <!-- 포인트다 여기서 수정/삭제 가능 -->
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
                                       
                                       <%-- </c:forEach> --%>
                                       <!-- 레코드반복 -->
                                    </tbody>
                                </table>
                            </div>
                          <!-- 테이블 끝 -->
                            
                            
                            
                            <!-- 페이저-->
`			               <div class="center-block" style="clear:both; margin:0 auto;">
						  <nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
						  </div>
                            <!-- 페이저-->
                          
                <!-- Table head options end -->
</div><!-- content-wrapper -->
</div><!-- content-wrapper -->
</div><!-- content-wrapper -->
</div><!-- content-wrapper -->
</div><!-- app-content content -->
<%@ include file="../../adminInc/adminBottom.jsp" %>