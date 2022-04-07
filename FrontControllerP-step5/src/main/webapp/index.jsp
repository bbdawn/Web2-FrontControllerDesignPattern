<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController Design Pattern</title>
</head>
<body>
<h4>Web MVC + FrontController Design Pattern step5</h4>
HandlerMapping : 컨트롤러 객체를 동적으로 생성 (코드 추가없이 자동 생성) -> unit test -> web application에 적용 
<br><br>
<form action="FrontControllerServlet" method="get">
<%-- FrontControllerServlet이 어떤 요청인지 알게 하기 위해 hidden으로 command 전송 --%>
<input type="hidden" name="command" value="FindCarByNoController">
<input type="number" name="carNo" placeholder="차번호" required="required">
<button type="submit">검색</button>
</form>
<br><br>
<form action="FrontControllerServlet" method="post">
<input type="hidden" name="command" value="RegisterCarController">
<input type="text" name="carInfo" placeholder="차정보" required="required">
<button type="submit">등록</button>
</form>
<br><br>
<a href="FrontControllerServlet?command=FindAllCarListController">전체 차량 리스트</a>
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
<input type="hidden" name="command" value="UpdateCarController">
<input type="text" name="carInfo" placeholder="차정보" required="required">
<button type="submit">수정하기</button>
</form>
<br><br>
<%--
		index --- FrontControllerServlet --- HandlerMapping --- Controller --------- MockDAO
																			|
																		 DeleteCarController	   deleteCar(carNo)
								| redirect
							deletecar-result.jsp 											 
 --%>
<form action="FrontControllerServlet" method="post">
<input type="hidden" name="command" value="DeleteCarController">
<input type="number" name="carNo" placeholder="차번호" required="required">
<button type="submit">삭제</button>
</form>
<br><br>
<img src="frontcontroller-pattern-class-diagram2.png">
</body>
</html>






















