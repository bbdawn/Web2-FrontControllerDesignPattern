<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member search find form2</title>
</head>
<body bgcolor="yellow">
<%-- view 의 디렉토리 구조가 변경된다면 아래 방식으로 이미지가 나오지 않을수도 있다  --%>
<img alt="아이유" src="../images/iu.jpg">
<%-- 아래의 el 을 실행하면 현재 웹어플리케이션 경로 (컨텍스트경로)가 출력 --%>
${pageContext.request.contextPath}
<%-- 아래처럼 el을 이용해 프로젝트명을 기준으로 경로 설정을 하면 디렉토리 구조가 변경되어도 상관없다 --%>
<img alt="아이유" src="${pageContext.request.contextPath}/images/iu.jpg">
<hr>
<form action="${pageContext.request.contextPath}/FindMember2Controller.do">
<input type="text" name="id" placeholder="아이디" required="required">
<button type="submit">회원검색</button>
</form>
</body>
</html>













