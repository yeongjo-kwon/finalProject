<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<style type="text/css">
div#answerDiv {
	border: 1px solid lightgray;
	margin: 20px 0 0 0;
}

.answerList {
	text-align: left;
	padding: 25px;
}

.form-group .answerList .answerInfo a {
	color: black;
}
</style>

<!-- 댓글 목록 -->
<div class="form-group" id="answerDiv">
	<div class="answerList"></div>
	<!-- 댓글 입력 -->
	<div class="form-group" id="comments">
		<!-- hidden주는 폼 -->
		<form name="hiddenForm">
			<input type="hidden" value="${param.answNo}" id="answNo"> 
			<input type="hidden" value="${sessionMemberNo}" id="sessionMemberNo"> 
			<input type="hidden" value="${authMap['AUTH_LEVEL']}" id="authLevel"> 
		</form>
		<!-- 진짜 폼 -->
		<form name="answerForm" id="answerForm">
			<input type="hidden" value="${map['MEMBER_NO']}" id="memberNo"> 
			<input type="hidden" value="${param.suggBoardNo}" id="suggBoardNo">
			<input type="text" class="form-control" name="answContent" rows="3"
				id="answContent" data-rule="required" style="overflow: auto;"
				data-msg="Please write something for us"
				placeholder="댓글은 관리자만 입력 가능합니다."
				<c:if test="${!empty map['answNo'] or authMap['AUTH_LEVEL'] eq 1 }">
				readonly="readonly"
			</c:if>></textarea>
			<div class="validate"></div>
			<!-- 등록 버튼 -->
			<div class="text-center">
				<button type="submit" id="btSubmit"
					<c:if test="${!empty map['answNo'] or authMap['AUTH_LEVEL'] eq 1 }">
					disabled="disabled"					
				</c:if>>등록</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	//댓글 등록
	$(function(){
		answerList();
		
		$('#btSubmit').click(function(){
			if($('#answContent').val()==0){
				alert('댓글을 입력하세요.');
				$('#answContent').focus();
				event.preventDefault();
				return false;
			}
			
			$.ajax({
				url:"<c:url value='/suggestBoard/answerInsert.do'/>",
				data:{
					memberNo:$('#memberNo').val(),
					suggBoardNo:$('#suggBoardNo').val(),
					answContent:$('#answContent').val()
				},
				dataType:"json",
				type:"post",
				success:function(res){
					answerList();
					$('#answContent').val("");	
					$('#btSubmit').attr('disabled',true);
				},
				error:function(xhr,status,error){
					alert("error="+error);
				}
			});
			event.preventDefault();
		});
		
	}); //function끝
	
		
	//댓글 목록
	function answerList(){
		$.ajax({
			url:"<c:url value='/suggestBoard/answerList.do'/>",
			type:"get",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			data:{suggBoardNo:$('#suggBoardNo').val()},
			success:function(res){
				var result="";
				result+= '<div class="answerInfo">'+'<span style="font-weight:bold;">'+res.memberName+'</span> '+
					'<span> '+res.answRegdate+'</span>';
					
				if($('#authLevel').val() != 1){
					result+= '<a href="#" onclick="answerEdit('+res.answNo+',\''+res.answContent+'\')"> 수정 </a>';
					result+= '<a href="#" onclick="answerDelete('+res.answNo+')"> 삭제 </a> </div>';
				}
				
				result+= '<div class="commentContent'+res.answNo+'"> <p style="white-space: pre;">'+res.answContent +'</p>';
				result+= '</div></div>';
		
		   		$('.answerList').html(result);
			}
		});
	}
	
	//댓글 수정 - input 폼으로 변경
	function answerEdit(answNo,answContent){
		var result="";
		
		result+= '<div class="input-group">';
		result+= '<textarea class="form-control" id="editTa" name="content_'+answNo+'">'+answContent+'</textarea>';
		//result+= '<input type="text" class="form-control" name="content_'+answNo+'" value="'+answContent+'"/>';
		result+= '<span class="input-group-btn"><button class="btn btn-default" id="btAnswEdit" type="button" onclick="answerEditProc('+answNo+');">수정</button> </span>';
		result+= '</div>';
	    
	    $('.commentContent'+answNo).html(result);
	}
	
	//댓글 수정
	function answerEditProc(answNo){
		if($('#editTa').val()==0){
			alert('댓글을 입력하세요.');
			$('#editTa').focus();
			event.preventDefault();
			return false;
		}
		
		var editContent=$('[name=content_'+answNo+']').val();
		
		$.ajax({
			url:"<c:url value='/suggestBoard/answerEdit.do'/>",
			type:"post",
			data:{
				answContent:editContent,
				answNo:answNo
			},
			success:function(res){
				if(res==1) answerList(answNo);
			},
			error:function(xhr,status,error){
				alert("error!!! : "+ error);
			}
		});
	}
	
	//댓글 삭제
	function answerDelete(answNo){
		$.ajax({
			url:"<c:url value='/suggestBoard/answerDelete.do'/>",
			data:{answNo:answNo},
			type:"post",
			success:function(res){
				if(confirm('댓글을 삭제하시겠습니까?')){
					alert('댓글이 삭제되었습니다.');
					answerList(answNo);
					$('#btSubmit').attr('disabled',false);
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