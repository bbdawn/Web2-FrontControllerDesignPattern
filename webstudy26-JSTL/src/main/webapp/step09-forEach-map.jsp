<%@page import="java.util.Iterator"%>
<%@page import="model.PersonVO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl forEach map</title>
</head>
<body>
<%
		// 컨트롤러에서 세션에 map을 저장하여 공유했다고 가정 
		LinkedHashMap<String,PersonVO> map=new LinkedHashMap<String,PersonVO>();
		map.put("a", new PersonVO("손흥민",30));
		map.put("b", new PersonVO("이강인",24));
		map.put("c", new PersonVO("아이유",30));
		session.setAttribute("personMap", map);
%>
1. 기존 스크립틀릿으로 map의 key value 출력하기 
<br>
<%
	// session에서 map을 리턴받는다 
	@SuppressWarnings("unchecked")
	LinkedHashMap<String,PersonVO> pm=(LinkedHashMap<String,PersonVO>)session.getAttribute("personMap");	
	// key들의 정보를 Iterator 타입으로 리턴받는다 
	Iterator<String> it=pm.keySet().iterator();
	while(it.hasNext()){ //요소가 있을 때까지 true를 반환 
		String key=it.next(); // 다음 요소를 리턴한다 
%>
		key : <%=key %> value: <%=pm.get(key).getName() %> <%=pm.get(key).getAge() %> <br>
<%} %>
<br><br>
2. jstl forEach 로 map의 key value 출력하기 <br>
<c:forEach items="${sessionScope.personMap}"  var="person">
	key : ${person.key}  value : ${person.value.name}  ${person.value.age} <br>
</c:forEach>
</body>
</html>









