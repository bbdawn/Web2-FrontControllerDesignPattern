<%@page import="model.PersonVO"%>
<%@page import="model.CarVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step10-set</title>
</head>
<body>
<%
	 // 컨트롤러에서 공유했다고 가정 
	 CarVO car=new CarVO("SM6",2000);
	 PersonVO person=new PersonVO("아이유",30,car);
	 session.setAttribute("pvo", person);
%>
<%-- 사람 이름과 자동차 모델명 el로 출력  --%>
이름 : ${sessionScope.pvo.name}  자동차 모델명 : ${sessionScope.pvo.carVO.model}
<br><br>
<%-- set을 이용해 carVO 객체를 car 변수에 저장해서 사용할 수 있다 --%>
<c:set value="${sessionScope.pvo.carVO}" var="car" />
모델명 : ${car.model}       가격 : ${car.price}
</body>
</html>










