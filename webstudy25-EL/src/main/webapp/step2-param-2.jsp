<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL param test 2</title>
</head>
<body>
1. 기존 scriptlet 방식으로 전달받는다  <br>
<%=request.getParameter("command") %> <%=request.getParameter("nick") %> <%=request.getParameter("age") %>
<br><br>
2. EL 방식으로 파라미터를 전달받는다 <br>
<%-- parameter 정보가 없을 경우 위의 scriptlet 방식은 null을 출력하는 데 반해 EL은 정보를 출력하지 않는다 --%>
${param.command} ${param.nick} ${param.age} 
<br><br>
<form action="step2-param-3.jsp">
<input type="text" name="userName" placeholder="이름" required="required"><br>
<input type="number" name="userAge" placeholder="나이" required="required" min="1"><br>
<button type="submit">전송</button>
</form>
</body>
</html>




















