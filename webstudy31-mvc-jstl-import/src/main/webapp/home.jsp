<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- home에서 필요한 컨텐트만 정의하면 된다. 나머지는 layout.jsp에서 구성한다 --%>
<h4>WebMVC 사원관리 : jstl c import study</h4>
현재 사원수 ${totalEmpCount} 명 <br><br>
<a href="EmployeeListController.do">전체사원리스트</a><br><br>
<a href="EmployeeCountGroupByDeptController.do">부서별 사원수</a><br><br>
<a href="FindEmployeeFormController.do">사원검색폼</a>

















