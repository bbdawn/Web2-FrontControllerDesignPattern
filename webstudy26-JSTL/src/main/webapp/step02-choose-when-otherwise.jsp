<%@page import="model.FoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step02-choose-when-otherwise.jsp</title>
</head>
<body>
<%
		//컨트롤러에서 정보를 공유했다고 가정 
		request.setAttribute("fvo", new FoodVO("짜장면",7000));
%>
JSTL 다중조건 ( if ~ else if ~ else ) : choose , when , otherwise  <br><br>
<c:choose>
	<c:when test="${fvo.name=='짜장면'}">
		중국음식 ${fvo.name} ${fvo.price}
	</c:when>
	<c:when test="${fvo.name=='팟타이'}">
		태국음식 ${fvo.name} ${fvo.price}
	</c:when>
	<c:otherwise>
		else 구문 : 해당사항 없음 
	</c:otherwise>
</c:choose>
</body>
</html>









