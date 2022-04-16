<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step06-forEach-result</title>
</head>
<body>
	1. 기존 스크립틀릿 방식으로 처리 : 
	<%
	// 체크박스 폼에서 전송하면 동일한 name으로 여러개의 value가 넘어오므로 request.getParameterValues() : String[] 을 이용한다 
	String ma[] = request.getParameterValues("menu");
	for (int i = 0; i < ma.length; i++) {
%>
		<%=ma[i] %>
	<%
	}
	%>
	<br>
	<br> 2. EL, JSTL 방식으로 처리 : 
	<%-- 
			EL 에서 파라미터 처리 :  ${param.name} 
					 동일한 name으로 여러개의 value가 전달되는 파라미터 처리 : ${paramValues.name}  -> 배열 
	 --%>	
	<c:forEach items="${paramValues.menu}" var="m">
		${m}
	</c:forEach>
</body>
</html>









