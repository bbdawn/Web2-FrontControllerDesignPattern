<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정결과</title>
</head>
<body>
<c:import url="header.jsp"/>
<h4>회원정보가 수정되었습니다</h4>
아이디 : ${sessionScope.mvo.id}   <br>
패스워드 : ${sessionScope.mvo.password}  <br>
이름 : ${sessionScope.mvo.name} <br>
주소 :${sessionScope.mvo.address} <br>
생년월일 :  ${sessionScope.mvo.birthday} <br>
</body>
</html>















