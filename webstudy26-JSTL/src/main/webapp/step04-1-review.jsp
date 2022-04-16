<%@page import="model.FoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
		//테스트를 위해 정보 저장 , 컨트롤러에서 공유했다고 가정 
		request.setAttribute("food", new FoodVO("치킨",10000));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL, JSTL 현재까지 한 것 Review</title>
</head>
<body>
<h4>EL , JSTL Review</h4>
음식명 : ${requestScope.food.name} ${food.name}   가격 : ${food.price} <br><br>
<c:if test="${food.price>=10000}">
	비쌈 ${food.name} ${food.price}
</c:if>
<%-- 위는 if 문 만 필요할 때 사용 , 아래는 if ~ else if ~ else 일때 사용  --%>
<br><br>
<c:choose>
	<c:when test="${food.name=='치킨'}">
		회식용 음식 
	</c:when>
	<c:when test="${food.name=='백반'}">
		식사용 음식 
	</c:when>
	<c:otherwise>
		else 역할 
	</c:otherwise>
</c:choose>
<br><br>
<a href="step04-2-review.jsp?foodName=${food.name}&price=${food.price}">step04-2로 이동</a>
</body>
</html>














