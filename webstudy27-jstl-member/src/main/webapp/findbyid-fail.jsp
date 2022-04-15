<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findbyid-fail</title>
</head>
<body>
<%-- alert으로 사용자가 입력한 아이디가 출력되도록 el로 처리한다
		javaking 아이디에 대한 회원정보가 존재하지 않습니다 
 --%>
<script type="text/javascript">	
	alert("${param.id} 아이디에 대한 회원정보가 존재하지 않습니다");
	location.href="index.jsp";
</script>
</body>
</html>




