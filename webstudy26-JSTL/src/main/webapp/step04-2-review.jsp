<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step04-2-review</title>
</head>
<body>
${param.foodName} ${param.price} <br><br>
<%-- 만원이상이면 고가, 미만이면 저가 --%>
<c:choose>
	<c:when test="${param.price>=10000}">
		고가 ${param.foodName}
	</c:when>
	<c:otherwise>
		저가 ${param.foodName}
	</c:otherwise>
</c:choose>
</body>
</html>