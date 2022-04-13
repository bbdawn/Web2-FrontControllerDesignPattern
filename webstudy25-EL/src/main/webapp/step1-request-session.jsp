<%@page import="model.FoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		// 컨트롤러에서 정보를 공유했다고 가정 
		FoodVO vo=new FoodVO("치킨",10000);
		request.setAttribute("fvo", vo);
		session.setAttribute("foodVO", new FoodVO("피자",15000));
		// request와 session에 동일한 name으로 value를 저장하고 테스트 해본다 
		request.setAttribute("test", new FoodVO("맥주",1000));
		session.setAttribute("test", new FoodVO("소주",500));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL로 request,session에 있는 정보 표현</title>
</head>
<body>
<h4>EL로 request,session에 있는 정보 표현</h4>
1. 기존 scriptlet으로 표현 <br>
<% 
		FoodVO fvo=(FoodVO)request.getAttribute("fvo");
		FoodVO fvo2=(FoodVO)session.getAttribute("foodVO");
%>
	음식명 : <%=fvo.getName() %>    &nbsp;&nbsp;&nbsp; 가격 : <%=fvo.getPrice() %> <br>
	음식명 : <%=fvo2.getName() %>    &nbsp;&nbsp;&nbsp; 가격 : <%=fvo2.getPrice() %> <br>
<br><br>	
2. EL 로 표현 <br>
음식명 : ${requestScope.fvo.name}  &nbsp;&nbsp;&nbsp; 가격 : ${requestScope.fvo.price} <br>
<%-- 아래와 같이 scope 는 생략가능 --%>
음식명 : ${fvo.name}  &nbsp;&nbsp;&nbsp; 가격 : ${fvo.price} <br>
<%-- 세션에 저장된 foodVO 정보를 출력  --%>
음식명 : ${sessionScope.foodVO.name}  &nbsp;&nbsp;&nbsp; 가격 : ${sessionScope.foodVO.price} <br>
음식명 : ${foodVO.name}  &nbsp;&nbsp;&nbsp; 가격 : ${foodVO.price} <br>
<br><br>
3. 동일한 name의 정보를 request와 session 에 저장되었을 때 EL로 출력해보기 <br>
<%-- 
		requestScope , sessionScope를 생략하고 출력해본다
		scope를 생략하고 출력했을 경우에는  request < session < application 의 순서로 출력된다 
		아래의 경우에는 request 영역에 있는 정보가 출력됨 	
 --%>
${test.name} ${test.price} <br>
<%-- sessionScope를 지정하면 세션에 있는 test 정보를 출력할 수 있다  --%>
${sessionScope.test.name} ${sessionScope.test.price} <br>
</body>
</html>







