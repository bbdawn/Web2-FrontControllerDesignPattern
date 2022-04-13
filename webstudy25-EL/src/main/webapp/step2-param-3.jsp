<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL param test 3</title>
</head>
<body>
<%-- EL은 별도의 형변환없이 연산가능( 자동형변환 )  --%>
이름 : ${param.userName}  나이 : ${param.userAge+10}
</body>
</html>