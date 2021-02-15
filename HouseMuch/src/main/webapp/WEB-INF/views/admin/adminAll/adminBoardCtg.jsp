<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<style type="text/css">
.table-responsive {
	text-align: center;
}

.row .col-12 .card  .center-block {
	display: table;
}

</style>

<script type="text/javascript">
	$(function(){
		$('#btSubmit').click(function(){
			if($('#validationTooltip01').val()==0){
				alert('카테고리명을 입력하세요.');
				event.preventDefault();
				$('#validationTooltip01').focus();
			}
		});
		
		$('#chkAll').click(function(){
			//만약에 최상단 체크박스가 체크되면
			if($(this).prop("checked")){
				$('input[name=chk]').prop("checked",true); //전체 선택
			}else{ //아니면
				$('input[name=chk]').prop("checked",false); //전체 해제
			}
		});
		
		$('#btSearchSubmit').click(function(){
			if($('#searchKeyword').val()==0){
				alert('검색어를 입력하세요.');
				event.preventDefault();
				$('#searchKeyword').focus();
			}
		});
		
		$('button[name=editBtn]').on('click',function(){
			var editNo=$(this).next().val(); //boardCtgNo
			var editName=$(this).next().next().val(); //boardCtgName
			
			$('#editNo').val(editNo);
			$('#editName').val(editName);
		});
	});
	
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	//카테고리 삭제
	function delFunc(boardCtgNo){
		if(confirm('카테고리를 삭제하시겠습니까?')){
			location.href
				="<c:url value='/admin/adminAll/adminBoardCtgDelete.do'/>?boardCtgNo="+boardCtgNo;
		}else{
			event.preventDefault();
		}
	}
	
</script>

<form action="<c:url value='/admin/adminAll/adminBoardCtg.do'/>"
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"> 
	<input type="hidden" name="searchCondition" value="${param.searchCondition }"> 
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>
<!-- 여기부터 -->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container p-0">

		<!-- 여기까지 box로 감싸는 기본틀 : 밑에 div맡출 것-->

		<!-- Table head options start -->
		<div class="content-header row">
			<!-- 첫번째 div -->
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">카테고리 등록 및 조회</h2>
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="<c:url value='/admin/adminAll/adminAllMain.do'/>">입주민 관리
									메인</a></li>
							<li class="breadcrumb-item"><a
								href="<c:url value='/admin/adminAll/adminBoardCtg.do'/>">
									게시판 카테고리 관리</a></li>
							<li class="breadcrumb-item active">카테고리 등록 및 조회</li>
						</ol>
					</div>
				</div>
			</div>
		</div>

		<!-- 카드 시작 -->
		<div class="row" id="table-head">
			<div class="col-12">
				<div class="card" style="align: right">
					<div class="col-sm-12 mt-1">
						<h4 class="card-title">카테고리 등록</h4>
					</div>
					<div class="card-body p-0">
						<!--  <p class="card-text">
                              Similar to tables and dark tables, use the modifier classes
                              <code class="highlighter-rouge">.thead-dark</code> to make
                              <code class="highlighter-rouge">&lt;thead&gt;</code>s appear dark.
                        </p> -->
						<div class="col-sm-12 mb-1 p-0">
							<!-- 기본 Select -->
							<div class="col-md-6 col-12 mb-1">
								<div class="col-12">
									<form class="needs-validation" novalidate method="post"
										action="<c:url value='/admin/adminAll/adminBoardCtgInsert.do'/>">
										<div class="input-group">
											<input type="text" class="form-control" name="boardCtgName"
												id="validationTooltip01" placeholder="카테고리명을 입력하세요."
												value="${param.boardCtgName }" required />
											<div class="input-group-prepend">
												<button class="btn btn-primary" id="btSubmit" type="submit">등록</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="col-md-6 col-12 mt-1">
								<h4 class="card-title">카테고리 조회</h4>
							</div>
							<!-- 여기가 검색창 -->
							<div class="col-md-6 col-12 mb-1">
								<div class="col-12">
									<form class="needs-validation" novalidate method="post"
										action="<c:url value='/admin/adminAll/adminBoardCtg.do'/>">
										<div class="input-group">
											<input type="text" class="form-control"
												value="${param.searchKeyword }" id="searchKeyword"
												name="searchKeyword" placeholder="검색어를 입력하세요"
												aria-label="Amount" />
											<div class="input-group-prepend">
												<button class="btn btn-outline-primary" id="btSearchSubmit"
													type="submit">
													<i data-feather="search" style="box-sizing: border-box;"></i>
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- 여기다 검색창 : 끝 -->
					<!-- 테이블시작 -->

					<div class="table-responsive">
						<table class="table">
							<thead class="thead-dark"
								style="background-color: #0E515F; color: #fff; font-size: 1.2em; font-weight: 200;">
								<tr>
									<th><input type="checkbox" id="chkAll" /></th>
									<th class="font-medium-1 text-center">번호</th>
									<th class="font-medium-1 text-center">카테고리 이름</th>
									<th class="font-medium-1 text-center">분류</th>
								</tr>
							</thead>
							<tbody class="ctgTbody">
								<c:if test="${empty ctgList }">
									<tr>
										<td colspan="4">등록된 카테고리가 없습니다.</td>
									</tr>
								</c:if>
								<!-- 레코드반복시작 -->
								<c:if test="${!empty ctgList }">
									<c:forEach var="vo" items="${ctgList }">
										<tr>
											<td><input type="checkbox" name="chk" id="chk" /></td>
											<td><span class="font-weight-bold"></span>
												${vo.boardCtgNo }</td>
											<td>
												<!--<span class="badge badge-pill badge-light-primary mr-1">Active</span> -->
												${vo.boardCtgName }
											</td>
											<!-- 포인트다 여기서 수정/삭제 가능 -->
											<td>
												<div class="dropdown">
													<button type="button" name="editBtn"
														class="btn btn-sm dropdown-toggle hide-arrow"
														data-toggle="dropdown">
														<i data-feather="more-vertical"></i>
													</button>
													<input type="hidden" value="${vo.boardCtgNo }" id="boardCtgNo">
													<input type="hidden" value="${vo.boardCtgName }" id="boardCtgName">
													<div class="dropdown-menu">
														<a class="dropdown-item" data-toggle="modal" data-target="#editForm"> <i
															data-feather="edit-2" class="mr-50"></i> <span>수정</span>
														</a> <a class="dropdown-item" href="javascript:void(0);" onclick="delFunc(${vo.boardCtgNo})">
															<i data-feather="trash" class="mr-50"></i> <span>삭제</span>
														</a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<!-- 레코드반복 -->
							</tbody>
						</table>
					</div>
					<!-- 테이블 끝 -->

					<!-- 페이저-->
					<!-- 이전 블럭으로 이동 -->
					<div class="center-block" style="clear: both; margin: 0 auto;">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center mt-2">
								<c:if test="${pagingInfo.firstPage>1 }">
									<li class="page-item prev"><a class="page-link" href="#"
										onclick="pageFunc(${pagingInfo.firstPage-1})"></a></li>
								</c:if>
								<!-- [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pagingInfo.firstPage }"
									end="${pagingInfo.lastPage }">
									<c:if test="${i==pagingInfo.currentPage }">
										<li class="page-item active"><a class="page-link"
											href="javascript:void(0);" style="background-color: #2FA599;">
												${i}</a></li>
									</c:if>
									<c:if test="${i!=pagingInfo.currentPage }">
										<li class="page-item"><a href="#" class="page-link"
											onclick="pageFunc(${i})">${i }</a>
									</c:if>
								</c:forEach>
								<!-- 다음 블럭으로 이동 -->
								<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
									<li class="page-item next"><a class="page-link" href="#"
										onclick="pageFunc(${pagingInfo.lastPage+1})"></a></li>
								</c:if>
							</ul>
						</nav>
					</div>
					<!-- 페이저-->

					<!-- Table head options end -->
				</div>
				<!-- content-wrapper -->
				
				<!-- Modal - 수정  -->
				<div class="demo-inline-spacing col-6">
			    	<div class="form-modal-ex">
			        	<!-- Modal Start -->
		                <div class="modal fade text-left" id="editForm" tabindex="-1" role="modal" aria-hidden="true">
		                    <div class="modal-dialog modal-dialog-centered" role="document">
		                        <div class="modal-content">
		                            <div class="modal-header">
		                                <h4 class="modal-title" id="myModalLabel33">카테고리 수정</h4>
		                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                    <span aria-hidden="true">&times;</span>
		                                </button>
		                            </div>
		                            
		                            <form action="<c:url value='/admin/adminAll/adminBoardCtgEdit.do'/>" method="post">
		                                <div class="modal-body">
		                                    <div class="form-group">
		                                    	<input type="hidden" name="boardCtgNo" id="editNo">
		                                    	<input type="text" class="form-control" name="boardCtgName"
													id="editName" placeholder="수정할 카테고리명을 입력하세요." required />   
		                                    </div>
		                                </div>
		                                <div class="modal-footer">
		                                    <input type="submit" class="btn btn-primary" value="수정">
		                                </div>
		                            </form>
		                        </div>
		                    </div>
		                </div>
		                <!-- Modal End -->
			      	 </div>	
			  	  </div>	
			  	  <!-- 모달 수정 끝 -->
			</div>
			<!-- content-wrapper -->
		</div>
		<!-- content-wrapper -->
	</div>
	<!-- content-wrapper -->
</div>
<!-- app-content content -->

<%@ include file="../adminInc/adminBottom.jsp"%>