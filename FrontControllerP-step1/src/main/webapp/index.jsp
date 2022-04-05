<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController Design Pattern</title>
</head>
<body>
<h4>Web MVC + FrontController Design Pattern step1</h4>
<%--
		index -- FrontControllerServlet -- DAO -- DB 
						|
						| forward 
						findcar-ok.jsp
						or
						findcar-fail.jsp 
 --%>
<form action="FrontControllerServlet" method="get">
<%-- FrontControllerServlet이 어떤 요청인지 알게 하기 위해 hidden으로 command 전송 --%>
<input type="hidden" name="command" value="findCarByNo">
<input type="number" name="carNo" placeholder="차번호" required="required">
<button type="submit">검색</button>
</form>
<br><br>
<%--
			index --- FrontControllerServlet -- DAO -- DB 
							|
							| redirect
						  registercar-result.jsp 	
 --%>
<form action="FrontControllerServlet" method="post">
<input type="hidden" name="command" value="registerCar">
<input type="text" name="carInfo" placeholder="차정보" required="required">
<button type="submit">등록</button>
</form>
</body>
</html>











