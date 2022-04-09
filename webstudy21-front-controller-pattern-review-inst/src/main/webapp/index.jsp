<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController Design Pattern review</title>
</head>
<body>
<h4>FrontController Design Pattern review</h4>
<%--
		고객이 존재하면 find-ok.jsp 에서 고객정보를 제공하고
		존재하지 않으면 find-fail.jsp 로 응답하도록 
		FindCustomerController 를 구현한다 
 --%>
<form method="get" action="FindCustomerController.do">
<input type="text" name="customerId" placeholder="고객아이디" required="required">
<button type="submit">검색</button>
</form>
<br><br>
<%--
		 index - FrontControllerServlet - HandlerMapping - FindAllCustomerListController - MockDAO 
		 			|
		 			| forward
		 			find-list.jsp 
 --%>
<a href="FindAllCustomerListController.do">고객리스트</a>
<br><br>
<%--
		 index - FrontControllerServlet - HandlerMapping - RegisterCustomerController - MockDAO 
		 			|																				register(customerInfo)
		 			| redirect
		 			register-result.jsp 
 --%>
<form method="post" action="RegisterCustomerController.do">
<input type="text" name="customerInfo" placeholder="고객정보"  required="required">
<button type="submit">등록</button>
</form>
<br><br>
<img alt="webmvc" src="images/frontcontroller-pattern-class-diagram2.png">
</body>
</html>













