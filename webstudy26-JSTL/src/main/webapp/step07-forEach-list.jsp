<%@page import="java.util.HashMap"%>
<%@page import="model.PersonVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl forEach ArrayList</title>
</head>
<body>
<%    //컨트롤러에서 저장했다고 가정
		ArrayList<PersonVO> list=new ArrayList<PersonVO>();
		list.add(new PersonVO("아이유",30));
		list.add(new PersonVO("이강인",24));
		list.add(new PersonVO("강하늘",36));
		request.setAttribute("personList", list);
%>
<%--
		items : request or session or ServletContext(application) 에 저장된 배열 또는 컬렉션 ( list or map .. ) 
		var : 개별 요소를 저장할 변수 , 변수명은 개발자가 임의로 지정  
		varStatus :  index 는 0부터 시작 , count 는 1부터 시작 , 변수명은 개발자가 임의로 지정
 --%>
<c:forEach items="${personList}" var="p" varStatus="order">
${order.count}.   ${p.name} ${p.age} <br>
</c:forEach>
<%--
	controller에서 list 내부에 map을 저장해서 공유했다고 가정
 --%>
 <%
 	ArrayList<HashMap<String,String>> list2=new ArrayList<HashMap<String,String>>();
 	HashMap<String,String> map1=new HashMap<String,String>();
 	map1.put("a","맛점");
 	HashMap<String,String> map2=new HashMap<String,String>();
 	map2.put("a","불금");
 	list2.add(map1);
 	list2.add(map2);
 	request.setAttribute("list2",list2);
 %>
 <br><br>
 <c:forEach items="${list2 }" var="m">
 	${m.a };
 </c:forEach>
</body>
</html>









