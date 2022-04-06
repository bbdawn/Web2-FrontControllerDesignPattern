<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController Design Pattern</title>
</head>
<body>
<h4>Web MVC + FrontController Design Pattern step3</h4>
Controller interface 계층구조 형성을 통해 다형성 지원하도록 설계 
<br><br>
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
<br><br>
<%-- query string 방식으로 command 를 전송  --%>
<%--
		index.jsp ---command=findAllCarList ---  FrontControllerServlet
														doDispatch(){
															FindAllCarListController 객체 생성  -----  FindAllCarListController 구현  --- Model -- DB 
															
															execute() 실행
															forward 응답 
														}

 --%>
<a href="FrontControllerServlet?command=findAllCarList">전체 차량 리스트</a>
</body>
</html>






















