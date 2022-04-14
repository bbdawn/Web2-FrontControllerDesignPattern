<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkid-ok</title>
<script type="text/javascript">
// 본 창(register-form)의 flag 에 확인받은 아이디를 value로 할당한다 (아이디 중복확인 하지 않은 사용자는 가입되지 않도록 하기 위해)
  opener.document.getElementById("flag").value="${param.id}";
</script>
</head>
<body bgcolor="yellow">
${param.id} 아이디 사용가능 <br><br>
<button onclick="self.close()">확인</button>
</body>
</html>



