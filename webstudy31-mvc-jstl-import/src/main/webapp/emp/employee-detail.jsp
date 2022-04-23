<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  <h4>상세사원정보</h4>          
  <table class="table table-bordered table-hover">
    <thead>
      <tr class="bg-primary text-white">
        <th>사원번호</th>
        <th>사원명</th>
        <th>월급</th>
        <th>부서번호</th>
        <th>부서명</th>
        <th>근무지</th>
        <th>부서TEL</th>
      </tr>
    </thead>
    <tbody>
    	<tr>
    		<td>${emp.empno}</td>
    		<td>${emp.ename}</td>
    		<td>${emp.sal}</td>
    		<td>${emp.departmentVO.deptno}</td>
    		<td>${emp.departmentVO.dname}</td>
    		<td>${emp.departmentVO.loc}</td>
    		<td>${emp.departmentVO.tel}</td>
    	</tr>
  </table>









