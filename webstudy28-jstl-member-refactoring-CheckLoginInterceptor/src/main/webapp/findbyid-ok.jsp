<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findbyid-ok</title>
</head>
<body>
<c:import url="header.jsp"/>
검색결과 <br><br>
아이디 : ${memberVO.id}  <br>
이름 : ${memberVO.name}   <br>
주소 : ${memberVO.address}   <br>
생일 : ${memberVO.birthday}   <br>
가입일시 : ${memberVO.regdate}
</body>
</html>