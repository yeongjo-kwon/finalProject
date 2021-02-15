<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.divNotice {
	width: 310px
}

.divNotice div table {
	width: 300px
}

.divNotice div span {
	padding: 0 0 0 160px;
}

.divNotice div .img1 {
	width: 310px;
	height: 6px
}
table {
  border-collapse: separate;
  border-spacing: 0 10px;
}
</style>
<div class="divNotice">

	<div>
		<!-- 공지사항 -->
		<table>
			<tbody>
				<c:if test="${empty noticeList }">
					<tr class="align_center">
						<td>최근 공지사항이 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty noticeList }">
					<c:forEach var="map" items="${noticeList }">
					<!-- 반복시작 -->
						<tr style="margin-bottom:50px;">
							<td>
								<a href="<c:url value="/living/noti/noticeDetail.do?noticeNo=${map['NOTICE_NO']}"/>" style="color:black;">
								<img src="${pageContext.request.contextPath }/resources/aptUser_images/dot.JPG">[ ${map['N_CTG_NAME']} ]
								${map['NOTICE_TITLE'] }
								</a>
							</td>
						</tr>
					<!-- 반복 끝 -->
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
	
	