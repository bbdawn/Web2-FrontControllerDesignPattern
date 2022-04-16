<%@page import="model.PersonVO"%>
<%@page import="java.util.ArrayList"%>
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
<title>step08-forEach-choose</title>
</head>
<body>
<%    //컨트롤러에서 저장했다고 가정 
		ArrayList<PersonVO> list=new ArrayList<PersonVO>();
		list.add(new PersonVO("아이유",30));
		list.add(new PersonVO("이강인",14));
		list.add(new PersonVO("강하늘",36));
		request.setAttribute("personList", list);
%>
<%-- 연령대 : 19세 이상이면 성인, 19세 미만이면 미성년 --%>
<div class="container">
  <p>JSTL forEach , choose ~ when ~ otherwise 연습</p>            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>연령대</th>
        <th>이름</th>
        <th>나이</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${personList}" var="person">
      <tr>
        <td>
        	<c:choose>
        		<c:when test="${person.age>=19}">성인</c:when>
        		<c:otherwise>미성년</c:otherwise>
        	</c:choose>
        </td>
        <td>${person.name}</td>
        <td>${person.age}</td>
      </tr>
      </c:forEach>     
    </tbody>
  </table>
</div>

</body>
</html>










