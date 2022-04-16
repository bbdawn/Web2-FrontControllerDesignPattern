<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- jstl 을 사용하기 위한 선언부 --%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl if</title>
</head>
<body>
<c:if test="true">
	jstl if문 실행 0 
</c:if>
<c:if test="false">
	jstl if문 실행 x
</c:if>
<br><br>
<a href="step01-2-if.jsp?userName=아이유&userAge=30">step01-2-if.jsp에서 확인</a>
</body>
</html>





