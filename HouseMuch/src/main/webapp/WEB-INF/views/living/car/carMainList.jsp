<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty cList }">
<tr><td>등록된 차량이 없습니다.</td></tr>
</c:if>
<c:if test="${!empty cList }">
	<c:forEach var="cVo" items="${cList }" begin="1" end="5">
	<tr>
		<td>
			<c:if test="${cVo.isVisitor=='N' }">[등록]</c:if>
			<c:if test="${cVo.isVisitor=='Y' }">[방문]</c:if>		
		</td>
		<td>
			${cVo.carNumber }  
		</td>
	</tr>
	</c:forEach>
</c:if>
