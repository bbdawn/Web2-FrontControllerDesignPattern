<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController Design Pattern</title>
</head>
<body>
<h4>Web MVC + FrontController Design Pattern step6</h4>
command 정보를 url-pattern : *.do 스타일로 변경  -> FrontControllerServlet에서 구현 
<br><br>
<form action="FindCarByNoController.do" method="get">
<input type="number" name="carNo" placeholder="차번호" required="required">
<button type="submit">검색</button>
</form>
<br><br>
<form action="RegisterCarController.do" method="post">
<input type="text" name="carInfo" placeholder="차정보" required="required">
<button type="submit">등록</button>
</form>
<br><br>
<a href="FindAllCarListController.do">전체 차량 리스트</a>
<br><br>
<form action="UpdateCarController.do" method="post">
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
<form action="DeleteCarController.do" method="post">
<input type="number" name="carNo" placeholder="차번호" required="required">
<button type="submit">삭제</button>
</form>
<br><br>
<img src="images/frontcontroller-pattern-class-diagram2.png">
</body>
</html>






















