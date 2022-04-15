<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정폼</title>
</head>
<body>
<c:import url="header.jsp"/>
<h4>회원정보수정</h4>
<%--
		update-form.jsp -- FrontControllerServlet -- HandlerMapping -- UpdateMemberController -- MemberDAO
									|
									|																			  update(MemberVO) 
									update-result.jsp : redirect 
 --%>
<form action="UpdateMemberController.do" method="post">
	<input type="text" name="id" value="${sessionScope.mvo.id}" readonly="readonly"><br>
	<input type="password" name="password" value="${sessionScope.mvo.password}" required="required"><br>
	<input type="text" name="name" value="${sessionScope.mvo.name}" required="required"><br>
	<input type="text" name="address" value="${sessionScope.mvo.address}" required="required"><br>
	<input type="date" name="birthday" value="${sessionScope.mvo.birthday}" required="required"><br>
	<button type="submit">수정하기</button>
</form>
</body>
</html>










