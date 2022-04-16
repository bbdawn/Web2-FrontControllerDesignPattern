<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step03-1-choose-form.jsp</title>
</head>
<body>
<form action="step03-2-choose-result.jsp">
	<input type="text" name="userName" placeholder="이름" required="required"><br>
	<input type="number" name="userAge" placeholder="나이" required="required"><br>
	<button>전송</button>
</form>
<%--
			19세 초과하면 
			누구님 28세 성인입니다
			13세 초과하면
			누구님 14세 청소년입니다
			13세 이하이면
			누구님 어린이입니다 
 --%>
</body>
</html>







