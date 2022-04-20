<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--
		 jsp forward를 이용해 HomeController.do url 명시해서 FrontControllerServlet - HandlerMapping - HomeController 
		 가 실행되어 home.jsp 가 응답되도록 한다 
		 : 이렇게 처리하는 이유는 일반적인 첫화면의 대부분은 db의 정보를 조회해서 화면에 제공하기 때문이다 																
 --%>
 <jsp:forward page="HomeController.do"/>