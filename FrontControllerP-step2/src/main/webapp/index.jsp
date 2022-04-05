<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController Design Pattern</title>
</head>
<body>
<h4>Web MVC + FrontController Design Pattern step2</h4>
step2 : 개별 컨트롤러 로직을 별도의 클래스 (FindNoCarByController, RegisterCarController)에 담당하도록 설계를 변경 <br><br>
<form action="FrontControllerServlet" method="get">
<%-- FrontControllerServlet이 어떤 요청인지 알게 하기 위해 hidden으로 command 전송 --%>
<input type="hidden" name="command" value="findCarByNo">
<input type="number" name="carNo" placeholder="차번호" required="required">
<button type="submit">검색</button>
</form>
<br><br>
<form action="FrontControllerServlet" method="post">
<input type="hidden" name="command" value="registerCar">
<input type="text" name="carInfo" placeholder="차정보" required="required">
<button type="submit">등록</button>
</form>
</body>
</html>











