<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adminInc/adminTop.jsp"%>

<style>

</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/SmartEditor2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script type="text/javascript">
$(function(){
	var contractDate=moment('${cVo.contractDate }').format('YYYY년 MM월 DD일');
	$('#contractDate').html(contractDate);
	
	var doc = new jsPDF();
	var specialElementHandlers = {
	    '#editor': function(element, renderer) {
	        return true;
	    }
	}
	
	$('#savePdfBtn').click(function() {
	    html2canvas($("#printContent"), {
	        onrendered : function(canvas) {
	            // 한글깨짐현상때문에 jpeg->jspdf 전환
	            var imgData = canvas.toDataURL('image/png');
	            var pageWidth = 210;
	            var pageHeight = pageWidth * 1.414;
	            var imgWidth = pageWidth - 20;
	            var imgHeight = $('#printContent').height() * imgWidth / $('#printContent').width();
	            var doc = new jsPDF('p','mm',[pageHeight, pageWidth]);
	            doc.addImage(imgData, 'PNG', 10, 10, imgWidth, imgHeight);
	            doc.save('계약세부사항.pdf');
	        }
	    });
	});
	
});
var fnPrint = function() {
	document.body.innerHTML = printContent.innerHTML;
	window.print();
};

</script>



<!-- 여기부터 -->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	
	<div class="content-body">
	
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="col-12">
					<h2 class="content-header-title float-left mb-0">보수 업체 계약 내역</h2>
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb ">
							<li class="breadcrumb"><a href="#" style="color:gray;">보수 업체 계약 상세보기</a></li>
						</ol>
					</div>
				</div>
				
			</div>
		</div>
		
		
        <!-- Basic Inputs start -->
       	<section id="basic-input">
           	<div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                           	<div class="row" id="printContent">

                                <div class="col-xl-12 col-md-6 col-12 mb-1">
                                    <div class="form-group">
                                    	<h2>
	                                        <span>[${cVo.mngCompCtgName }]</span>
	 										<span>${cVo.mngCompName }</span>
 										</h2>
                                    </div>
                                </div>
      							<hr>
                                <div class="col-xl-3 col-md-6 col-12 mb-1">
                                    <div class="form-group">
                                        <span class="col-form-label-lg">전화번호</span>
                                        <span>${cVo.mngCompTel }</span>
                                    </div>
                                </div>
                                
                                <div class="col-xl-3 col-md-6 col-12">
                                    <div class="form-group">
                                        <span class="col-form-label-lg">계약금액</span>
                                        <span><fmt:formatNumber value="${cVo.contractPrice }" pattern="#,###" />원</span>
                                    </div>
                                </div>
                                
                                <div class="col-xl-3 col-md-6 col-12">
                                	<div class="form-group">
										<span class="col-form-label-lg">부가시설 관리 여부</span>
	                                	<c:if test="${cVo.isAddFacility == 'Y' }"><span>활성화</span></c:if>
	                                	<c:if test="${cVo.isAddFacility == 'N' }"><span>비활성화</span></c:if>    
                                	</div>                            	
                                </div>
                                
                                <div class="col-xl-3 col-md-6 col-12">
                                    <div class="form-group">
                                        <span class="col-form-label-lg">계약일</span>
                                        <span id="contractDate"></span>
                                        
                                    </div>
                                </div>

                                <div class="col-xl-12 col-md-12 col-12">
                                    <div class="form-group" style="overflow: auto; border-color: gray;">
                                       ${cVo.contractContent }
                                    </div>
                                </div>

                           	</div>
                           	<div id="editor"></div> <!-- jspdf에서 특별한 작업을 중간에 추가할때 사용 -->
                       	 	<div class="col-xl-12 col-md-6 col-12">
                                <div class="form-group" style="text-align:center;">
                                    <input type="button" class="btn btn-primary center" onClick="location.href='<c:url value="/admin/adminFacility/facilityCompanyEdit.do?contractNo=${cVo.contractNo }"/>'" value="수정">
                                    <input type="button" class="btn btn-primary center" onClick="location.href='<c:url value="/admin/adminFacility/contractDel.do?contractNo=${cVo.contractNo }"/>'" id="delBtn" value="삭제">
                                	<input type="button" class="btn btn-flat-primary waves-effect float-right" style="float:right;" value="pdf" id="savePdfBtn" >
                                	<input type="button" class="btn btn-flat-primary waves-effect float-right" style="float:right;" value="인쇄" onClick="fnPrint()">
                                </div>
                            </div>
                        	
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                	<div class="card">
                        <div class="card-body">
                        	<h2>계약 업체 목록</h2>
                        	<div class="list-group">
                        		<c:forEach var="vo" items="${cList }">
                        			<c:if test="${vo.contractNo == cVo.contractNo }">
                        				<a class="list-group-item active">[${vo.mngCompCtgName }]${vo.mngCompName } </a>
                        			</c:if>
                        			<c:if test="${vo.contractNo != cVo.contractNo }">
		                        		<a class="list-group-item list-group-item-action" href="<c:url value='/admin/adminFacility/facilityCompanyDetail.do?contractNo=${vo.contractNo }'/>">
		                        			[${vo.mngCompCtgName }]${vo.mngCompName } 	
		                        		</a>
	                        		</c:if>
                        		</c:forEach>
                        		
                        	</div>
                        </div>
                	</div>
                </div>
                
            </div>
        </section>
        <!-- Basic Inputs end -->		

	</div>
</div>


<%@ include file="../adminInc/adminBottom.jsp"%>