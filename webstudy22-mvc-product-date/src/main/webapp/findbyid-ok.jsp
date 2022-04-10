<%@page import="org.kosta.myproject.model.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findbyid-ok.jsp</title>
</head>
<body>
<%
	ProductVO vo=(ProductVO)request.getAttribute("product");
%>
상품 검색결과 <br><br>
아이디 : <%=vo.getId() %>   <br>
상품명 : <%=vo.getName() %>  <br>
제조사 : <%=vo.getMaker() %>  <br>
가격 :    <%=vo.getPrice() %> <br>
등록일시 : <%=vo.getRegDate() %>              
</body>
</html>