<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_check.jsp</title>
</head>
<body>
<%
	//session에서 값을 읽어서 없다면 로그인하세요! 라는 페이지 띄우게
	//이름 안겹치게 이 페이지에서는 l_userid로
	String l_userid=(String)session.getAttribute("userid");
	if(l_userid==null || l_userid.isEmpty()){	%>
		<script type="text/javascript">
			alert('먼저 로그인하세요!');
			/* login으로 가는 location.href의 contextpath는 절대참조로 보내준다 */
			location.href=
				"<%=request.getContextPath()%>/login/login.jsp";
		</script>
<%		
		return;
	}

%>
</body>
</html>