<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step06 forEach form</title>
</head>
<body>
<%
		//컨트롤러에서 공유했다고 가정 
		String menu[]={"치킨","피자","샐러드"};
		request.setAttribute("menuArray", menu);
%>
<form action="step06-forEach-result.jsp" onsubmit="return checkForm()">
<c:forEach items="${menuArray}" var="m">
	<input type="checkbox" name="menu" value="${m}">${m} <br>	
</c:forEach>	
<button type="submit">주문</button>
</form>
<script type="text/javascript">
	function checkForm() {		
		let flag=false;
		let ma=document.getElementsByName("menu");
		//alert(ma.length);
		for(let i=0;i<ma.length;i++){
			if(ma[i].checked){// 사용자가 체크박스에 체크하면 true 
				flag=true;
				break;
			}
		}
		if(flag==false)
			alert("메뉴를 선택하세요");
		return flag;
	}
</script>
</body>
</html>








