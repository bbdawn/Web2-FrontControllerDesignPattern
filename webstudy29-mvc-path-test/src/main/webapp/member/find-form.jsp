<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member find form</title>
</head>
<body>
<img alt="아이유" src="../images/iu.jpg" width="100">
<%-- 아래의 el 을 실행하면 현재 웹어플리케이션 경로 (컨텍스트경로)가 출력 --%>
${pageContext.request.contextPath}
<img alt="아이유" src="${pageContext.request.contextPath}/images/iu.jpg" width="100">
<hr>
<%--
			member/find-form  -- FrontControllerServlet -- HandlerMapping -- FindMemberController 
											|
										    | forward	
									  member/find-result.jsp 
 --%>

<form action="${pageContext.request.contextPath}/FindMemberController.do">
<input type="text" name="id" placeholder="아이디" required="required">
<button type="submit">회원검색</button>
</form>
</body>
</html>













