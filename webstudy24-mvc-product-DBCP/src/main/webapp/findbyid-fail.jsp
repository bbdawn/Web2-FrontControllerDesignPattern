<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findbyid-fail.jsp</title>
</head>
<body>
<script type="text/javascript">
	// 1 아이디에 대한 상품정보가 존재하지 않습니다 와 같이 나오게 한다 
	alert("<%=request.getParameter("productId")%>아이디에 대한 상품정보가 존재하지 않습니다");
	location.href="index.jsp";
</script>
</body>
</html>