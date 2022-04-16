<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step01-2-if.jsp</title>
</head>
<body>
사용자명 : ${param.userName}    <br>
나이 : ${param.userAge} <br>
<%-- 나이가 19세 초과하면 성인이라고 출력한다  --%>
<c:if test="${param.userAge>19}">
	성인
</c:if>
<br>
<%-- 나이가 19세 초과하고 이름이 아이유이면 성인 아이유라고 출력한다 --%>
<c:if test="${param.userAge>19&&param.userName=='아이유'}">
	성인 ${param.userName}
</c:if>
</body>
</html>










