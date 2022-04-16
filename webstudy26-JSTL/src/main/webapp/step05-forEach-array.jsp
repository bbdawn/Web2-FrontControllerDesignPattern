<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step05 forEach array</title>
</head>
<body>
<%
	//컨트롤러가 공유했다고 가정 
	String friends[]={"손흥민","황희찬","이강인"};
	request.setAttribute("fa", friends);
%>
<%--
		jstl forEach : jstl loop 
		items : request or session 에 저장된 배열 또는 컬렉션 ( list, map .. ) 
		var : 개별 요소를 저장할 변수 
		varStatus : index 와 count 속성 
					 index는 0부터 시작 
					 count는 1부터 시작 
 --%>
<c:forEach items="${requestScope.fa}" var="friend" varStatus="order">
${friend}  , index : ${order.index}    , count: ${order.count}      <br>
</c:forEach>
</body>
</html>












