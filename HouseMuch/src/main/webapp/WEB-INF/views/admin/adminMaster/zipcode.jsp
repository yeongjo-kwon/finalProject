<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Open+Sans:ital,wght@0,400;0,600;0,700;0,800;1,400;1,600;1,700;1,800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100;1,300;1,400;1,500&display=swap" rel="stylesheet">
<style type="text/css">
a { text-decoration:none } 
.form-control {
  display : block;
  width : 80%;

  font-size : 1rem;
  font-weight : 400;
  line-height : 1.45;
  color : #6E6B7B;
  background-color : #FFFFFF;
  background-clip : padding-box;
  border : 1px solid #D8D6DE;
  border-radius : 0.357rem;
  -webkit-transition : border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
          transition : border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.search-box {
    position: relative;
    width: 100%;
    height: 70px;
    border: 7px solid #5c9f24;
}
.apt-search-input {
    float: left;
    width: 80%;
    height: 100%;
    padding: 20px;
    font-size: 18px;
    border: 0;
    border-radius: 0px;
    outline: 0;
}
.search-icon {
    float: left;
    width: 5%;
    padding: 0px 13px 35px 30px;
    width: auto;
    height: auto;
}
.apt-search-btn {
    float: right;
    width: 10%;
    height: 100%;
    background: #5c9f24;
    color: #ffffff;
    font-size: 24px;
    line-height: inherit;
    border: 0;
    outline: 0;
    padding-top: 3px;
}
#divZip table{
	text-align:center;
	margin: auto;
	width: 100%;
	margin-bottom: 10px;
}
#divPage{
	text-align:center;
}

.table-hover tbody tr:hover {
  color : #6E6B7B;
  background-color : #F6F6F9;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/subinJs.js'/>"></script>
<script type="text/javascript">
	var totalCount=0;
	
	$(function(){
		$('#dong').focus();
		
		$('#submit').click(function(){
  			if($('#dong').val().length<1){
  				alert('지역명을 입력하세요');
  				$('#dong').focus();
				return false;
  			}
  			
  			$.send(1);

  			event.preventDefault();
  		 });
     });
     
	$.send=function(curPage){
		$('#currentPage').val(curPage);
		
		$.ajax({
			url:"<c:url value='/admin/adminMaster/zipcodeAjax.do'/>",
			type:"post",
			data:$('#frmZip').serializeArray(),
			dataType:"xml",
			success:function(xmlStr){
				totalCount=$(xmlStr).find('totalCount').html(); 
				var errorCode=$(xmlStr).find('errorCode').text();
				var errorMessage=$(xmlStr).find('errorMessage').text();
				
				if(errorCode!=0){ //0이 아니면 에러
					alert(errorMessage);
				}else{ 
					if(xmlStr!=null){
						$.makeList(xmlStr);
						$.pageMake();
					}
				}
			},
			error:function(xhr, status, error){
				alert("error! : " + error);
			}
		});
	}	
	
	$.makeList=function(xmlStr){
		if(totalCount==0){
			$('#divCount').html("");
			$('#divZip').html("<p style='text-align:center'>조회되는 내용이 없습니다.</p>");
			return; 
		}
		
		$('#divCount').html("<p>검색 결과 : <b>"+totalCount+"</b>건</p>");
		
		var str="<table class='table table-hover' style='border-collapse:collapse'>";

		$(xmlStr).find('juso').each(function(idx, item){
			var roadAddr = $(this).find("roadAddr").text();
			var zipNo = $(this).find("zipNo").text();
			
			str+="<tr>";
			str+="<td>"+zipNo+"</td>";
			str+="<td><a href='#' onclick='set(\""+zipNo+"\",\""+roadAddr+"\")'>"+roadAddr+"</a></td>";			
			str+="</tr>";
		}); 
		
		str+="</table>";
		
		$('#divZip').html(str+"<hr>");
	}
	
	$.pageMake=function(){
		var blockSize=10;

		pagination($('#currentPage').val(),$('#countPerPage').val(),
			blockSize,totalCount);

		
		var str="";
	    if(firstPage>1){	//이전 블럭
	 	  	str+="<a href='#' onclick='$.send("+(firstPage-1)+")'>";
			str+="<img src='<c:url value='/resources/aptAdmin_images/first.JPG'/>'></a>";	
	    }
		
		//[1][2][3][4][5][6][7][8][9][10]
		for(var i=firstPage; i<=lastPage;i++){
			if(i==currentPage){
				str+="<span style='color:blue; font-weight:bold;'>"+i+"</span>";
			}else{
				str+="<a href='#' onclick='$.send("+i+")'>"+i+"</a>&nbsp;";
			}
		}
	    
	    //다음 블럭으로 이동  
		if(lastPage<totalPage){
			str+="<a href='#' onclick='$.send("+(lastPage+1)+")'>";
			str+="<img src='<c:url value='/resources/aptAdmin_images/last.JPG'/>'></a>";
		}
		
		$('#divPage').html(str);
	}
	
  	function set(zipcode,address){
        $(opener.document).find('input[name=zipcodeSeq]').val(zipcode);
        $(opener.document).find('input[name=address]').val(address);
        self.close();
     }


</script>   
</head>
<body>
	<h2>주소 찾기</h2>
	<hr>
	
	<form name="frmZipcode" id="frmZip" method="post"> <!-- ajax로 보낼거니까 action 삭제 -->
		<input type="hidden" name="currentPage" id="currentPage" value="1"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
		<input type="hidden" name="countPerPage" id="countPerPage" value="6"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) --> 
		<input type="hidden" name="confmKey" id="confmKey"value="U01TX0FVVEgyMDE3MTIxODE3Mzc0MTEwNzU1Njg="/><!-- 요청 변수 설정 (승인키) -->		

		<div class="form-control form-control-lg search-box" style="width: 614px;margin-left: 5px;">
			<span class="search-icon" style="background-color: white;padding-bottom: 0px;padding-left: 5px;padding-right: 0px;border-bottom-width: 5px;margin-bottom: 0px;margin-left: 5px;margin-top: 2px;">
				<img src="/apt/resources/user/assets/img/searchIcon_green.png" width="32px;" style=" margin-right: 10px;padding-top: 15px;">
			</span>
			<input type="text" name="searchKeyword" class="apt-search-input" placeholder="예)서초동 아리빌딩, 강남대로 47길, 서초동 13-79" id="dong"
				style="width: 440px;margin-top: 0px; padding:0px;">
			<input type="submit" id="submit" value="검색" class="apt-search-btn" style="width: 62px; padding-bottom: 8px;float: right; cursor: pointer;">
		</div>
	
	</form>
   
   <div id="divCount"></div>
   <div id="divZip" style="margin-bottom: 10px;"></div>
   <div id="divPage"></div>
   
   
		
</body>
</html>