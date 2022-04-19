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
<title>사원리스트</title>
</head>
<body>
<div class="container">
<c:import url="header.jsp"/>
  <h4>사원명단</h4>  
         
  <table class="table table-bordered table-hover">
    <thead>
      <tr class="bg-primary text-white">
        <th>사원명</th>
        <th>부서명</th>
        <th>근무지</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${employeeList}" var="emp">
      <tr>
        <td>
        <%-- 사원명을 클릭하면 사원의 상세정보를 제공한다 이를 위해서 
        사원 링크에 사원번호를 query string 으로 명시해 서버에 전달해야 한다
        		employee-list.jsp --- F.C.S -- HM -- FindEmployeeByNoController -- EmployeeDAO 
        																							 findEmployeeByNo(empno) : EmployeeVO 
        			|
        		employee-detail.jsp 에서 상세사원정보를 제공 																					 
          --%>
        <a href="FindEmployeeByNoController.do?empno=${emp.empno}">${emp.ename}</a>            
        </td>
        <td>${emp.departmentVO.dname}</td>
        <td>${emp.departmentVO.loc }</td>
      </tr>  
      </c:forEach>   
    </tbody>
  </table>
</div>
</body>
</html>


