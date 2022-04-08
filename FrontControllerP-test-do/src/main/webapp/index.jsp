<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>client 요청방식 *.do 단위테스트</title>
</head>
<body>
<h4>client 요청방식 *.do 단위테스트</h4>
<%--
		.do 로 마치는 url-pattern으로 요청하면 FrontControllerServlet 이 처리
 --%>
<form action="RegisterCarController.do">
	<button type="submit">등록</button>
</form>
<br><br>
<a href="FindCarController.do">검색</a>
</body>
</html>