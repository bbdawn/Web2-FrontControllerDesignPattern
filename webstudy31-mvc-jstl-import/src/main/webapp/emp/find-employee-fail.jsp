<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find fail</title>
</head>
<body>
<script type="text/javascript">
	alert("${param.empno} 사원번호에 해당하는 사원이 없습니다!");
	//alert 후 다시 사원검색폼으로 이동시킨다 
//	location.href="find-employee-form.jsp";// main ui , layout.jsp 가 동작되지 않음 
	location.href="FindEmployeeFormController.do";
</script>
</body>
</html>











