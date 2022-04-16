<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl forEach begin end</title>
</head>
<body>
<%-- 1부터 5까지 표현  --%>
<c:forEach begin="1" end="5" var="page">
	${page}&nbsp;&nbsp;
</c:forEach>
<br><br>
<%
		//컨트롤러에서 공유했다고 가정 
		request.setAttribute("startPage", 11);// 페이지 그룹의 페이지 시작번호 
		request.setAttribute("endPage", 15);// 페이지 그룹의 페이지 마지막번호 
		request.setAttribute("nowPage", 13);// 현재 페이지 
%>
<%--  현재페이지는 링크를 부여하지 않고 나머지 페이지는 링크를 부여해본다   --%>
<c:forEach begin="${startPage}" end="${endPage}" var="page">
	<c:choose>
		<c:when test="${page==nowPage}">
			${page} &nbsp;&nbsp;
		</c:when>
		<c:otherwise>
		<a href="">${page}</a> &nbsp;&nbsp;
		</c:otherwise>
	</c:choose>
	
</c:forEach>
</body>
</html>






















