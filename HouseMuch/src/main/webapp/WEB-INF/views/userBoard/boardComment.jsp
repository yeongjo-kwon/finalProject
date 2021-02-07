<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<style type="text/css">
div#commDiv {
	border: 1px solid lightgray;
	margin: 20px 0 0 0;
}

.commList {
	text-align: left;
	padding: 25px;
}

.form-group .commList .commentInfo a {
	color: black;
}
</style>

<!-- 댓글 목록 -->
<div class="form-group" id="commDiv">
	<div class="commList"></div>
	<!-- 댓글 입력 -->
	<div id="comments">
		<!-- hidden주는 폼 -->
		<form name="hiddenForm">
			<input type="hidden" value="${param.commNo}" id="commNo"> 
			<input type="hidden" value="${sessionMemberNo}" id="sessionMemberNo"> 
			<input type="hidden" value="${authMap['AUTH_LEVEL']}" id="authLevel"> 
		</form>
		<!-- 진짜 폼 -->
		<form name="commentForm" id="commentForm">
			<input type="hidden" value="${param.memberNo}" name="memberNo"> 
			<input type="hidden" value="${param.boardNo}" name="boardNo">
			<input type="text" class="form-control" name="commContent" rows="3"
				id="commContent" data-rule="required" style="overflow: auto;"
				data-msg="Please write something for us"
				placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요.">
			<div class="validate"></div>
			<!-- 등록 버튼 -->
			<div class="text-center">
				<button type="submit" id="btSubmit">등록</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	//댓글 등록
	$(function(){
		commentList();
		
		$('#btSubmit').click(function(){
			if($('#commContent').val()==0){
				alert('댓글을 입력하세요.');
				$('#commContent').focus();
				event.preventDefault();
				return false;
			}
			
			$.ajax({
				url:"<c:url value='/userBoard/commentWrite.do'/>",
				data:{
					memberNo:$('#memberNo').val(),
					boardNo:$('#boardNo').val(),
					commContent:$('#commContent').val()
				},
				dataType:"json",
				type:"post",
				success:function(res){
					commentList();
					$('#commContent').val("");	
				},
				error:function(xhr,status,error){
					alert("error="+error);
				}
			});
			event.preventDefault();
		});
		
	}); //function끝
	
		
	//댓글 목록
	function commentList(){
		$.ajax({
			url:"<c:url value='/userBoard/commentList.do'/>",
			type:"get",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			data:{boardNo:$('#boardNo').val()},
			success:function(res){
				var result="";
				$.each(res,function(idx,item){
					result+= '<div class="commentInfo">'+'<span style="font-weight:bold;">'+item.MEMBER_NAME+'</span> '+
					'<span> '+item.COMM_REGDATE+'</span>';
					
					if(item.MEMBER_NO == $('#sessionMemberNo').val() || $('#authLevel').val() != 1){
						result+= '<a href="#" onclick="commentEdit('+item.COMM_NO+',\''+item.COMM_CONTENT+'\')"> 수정 </a>';
						result+= '<a href="#" onclick="commentDelete('+item.COMM_NO+')"> 삭제 </a> </div>';
					}
					
					result+= '<div class="commentContent'+item.COMM_NO+'"> <p style="white-space: pre;">'+item.COMM_CONTENT +'</p>';
					result+= '</div></div>';
				});
		   		$('.commList').html(result);
			},
			error:function(xhr,status,error){
				alert("error!!! = "+error);
			}
		});
	}
	
	//댓글 수정 - input 폼으로 변경
	function commentEdit(commNo,commContent){
		var result="";
		
		result+= '<div class="input-group">';
		result+= '<textarea class="form-control" id="editTa" name="content_'+commNo+'">'+commContent+'</textarea>';
		result+= '<span class="input-group-btn"><button class="btn btn-default" id="btCommEdit" type="button" onclick="commentEditProc('+commNo+');">수정</button> </span>';
		result+= '</div>';
	    
	    $('.commentContent'+commNo).html(result);
	}
	
	//댓글 수정
	function commentEditProc(commNo){
		if($('#editTa').val()==0){
			alert('댓글을 입력하세요.');
			$('#editTa').focus();
			event.preventDefault();
			return false;
		}
		
		var editContent=$('[name=content_'+commNo+']').val();
		
		$.ajax({
			url:"<c:url value='/userBoard/commentEdit.do'/>",
			type:"post",
			data:{
				commContent:editContent,
				commNo:commNo
			},
			success:function(res){
				if(res==1) commentList(commNo);
			},
			error:function(xhr,status,error){
				alert("error!!! : "+ error);
			}
		});
	}
	
	//댓글 삭제
	function commentDelete(commNo){
		$.ajax({
			url:"<c:url value='/userBoard/commentDelete.do'/>",
			data:{
				commNo:commNo,
			},
			type:"post",
			success:function(res){
				if(confirm('댓글을 삭제하시겠습니까?')){
					alert('댓글이 삭제되었습니다.');
					commentList(commNo);
				}else{
					event.preventDefault();
				}
			},
			error:function(xhr,status,error){
				alert("error!! : "+ error);
			}
		});
		
		
	}
	
</script>