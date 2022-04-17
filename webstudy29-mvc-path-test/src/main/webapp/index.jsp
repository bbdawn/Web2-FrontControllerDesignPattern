<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mvc path test</title>
</head>
<body>      
Web MVC 구조 상에서 경로 연습 <br>
   -form action 경로 처리 <br>
   -Controller -> View 로 제어 이동시  forward 와 redirect 경로 처리<br>
   <br><br>
   <a href="${pageContext.request.contextPath}/member/find-form.jsp">member find-form</a><br>
   <a href="${pageContext.request.contextPath}/member/search/find-form2.jsp">member search find-form2</a><br>
   <a href="${pageContext.request.contextPath}/member/register-form.jsp">member register-form</a><br>
   <a href="${pageContext.request.contextPath}/product/find-form.jsp">product find-form</a><br>
</body>
</html>















