<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>home</title>
</head>
<body>
<div class="container">
<c:import url="header.jsp"/>
<h4>WebMVC 사원관리</h4>
현재 사원수 ${totalEmpCount} 명 <br><br>
<%--
		home -- FrontControllerServlet--HandlerMapping--EmployeeListController--EmployeeDAO
																					 		findAllEmployeeList():ArrayList<EmployeeVO>
						|
						| forward
					employee-list.jsp 에서 리스트 제공 																 		

 --%>
<a href="EmployeeListController.do">전체사원리스트</a><br><br>
<a href="EmployeeCountGroupByDeptController.do">부서별 사원수</a>
</div>
</body>
</html>

















