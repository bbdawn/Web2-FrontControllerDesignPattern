<%@page import="model.TestVO"%>
<%@page import="model.FoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model 에 EL로 접근 테스트</title>
</head>
<body>
<%
		//컨트롤러에서 공유했다고 가정 
		request.setAttribute("food", new FoodVO("팟타이",7000));
		request.setAttribute("tvo", new TestVO());
%>
<%-- FoodVO 객체의 getName() , getPrice() 가 실행되어 출력 --%>
${food.name} ${food.price}  <br><br>
<%-- TestVO에 EL로 접근해 메서드를 테스트해본다 --%>
${tvo.info} ${tvo.money*2} 
<%-- 아래 코드는 error, 이유는 get과 is 계열 메서드만 접근 가능 --%>
<%-- ${tvo.message} --%>
${tvo.nextGroup}
</body>
</html>








