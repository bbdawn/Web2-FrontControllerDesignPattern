<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 리스트</title>
</head>
<body>
	<%
	@SuppressWarnings("unchecked")
	ArrayList<String> carList = (ArrayList<String>) request.getAttribute("carList");
	for (int i = 0; i < carList.size(); i++) {
	%>
		<%=i+1 %>  <%=carList.get(i) %><br>
	<%
	}
	%>
</body>
</html>











