<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
        <a href="FindEmployeeByNoController.do?empno=${emp.empno}">${emp.ename}</a>            
        </td>
        <td>${emp.departmentVO.dname}</td>
        <td>${emp.departmentVO.loc }</td>
      </tr>  
      </c:forEach>   
    </tbody>
  </table>



