<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty memVo.id }">
		<jsp:forward page="/main/index.do"></jsp:forward>
	</c:if>
	<c:if test="${!empty memVo.id }">
		<jsp:forward page="/main/main.do"></jsp:forward>		
	</c:if>
</body>
</html>