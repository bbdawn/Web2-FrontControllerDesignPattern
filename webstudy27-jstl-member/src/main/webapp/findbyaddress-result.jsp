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
<title>주소로 회원검색 결과</title>
</head>
<body>
<div class="container">
<c:import url="header.jsp"/>
  <h4>${sessionScope.mvo.name}님  ${param.address}에 사는 회원명단</h4>           
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>생년월일
        </th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${memberList}" var="member">
      <tr>
        <td>${member.id}</td>
        <td>${member.name}</td>
        <td>${member.birthday}</td>
      </tr>  
     </c:forEach>   
    </tbody>
  </table>
</div>
</body>
</html>



