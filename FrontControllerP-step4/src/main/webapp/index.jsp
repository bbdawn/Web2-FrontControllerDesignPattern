<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController Design Pattern</title>
</head>
<body>
<h4>Web MVC + FrontController Design Pattern step4</h4>
HandlerMapping 추가하여 개별 컨트롤러 객체 생성을 전담시킴 <br>
: FrontControllerServlet 과 개별 컨트롤러와의 결합도를 낮춘다 
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
<a href="FrontControllerServlet?command=findAllCarList">전체 차량 리스트</a>
<br><br>
<%--
		index --- FrontControllerServlet --- HandlerMapping --- Controller -------------- MockDAO --- DB 
													                       |
													                       UpdateCarController		  updateCar() 
							|  redirect 
					 updatecar-result.jsp 
					 
		구현 단계			 
		DAO 의 updateCar() -> UpdateCarController -> HandlerMapping의 create 코드 추가 -> updatecar-result.jsp 			 
					 								                       	
 --%>
<form action="FrontControllerServlet" method="post">
<input type="hidden" name="command" value="updateCar">
<input type="text" name="carInfo" placeholder="차정보" required="required">
<button type="submit">수정하기</button>
</form>
<br><br>
<img src="frontcontroller-pattern-class-diagram.png">
</body>
</html>






















