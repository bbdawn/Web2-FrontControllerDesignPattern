<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
</head>
<body>
<%-- 
			가입일시는 시스템에서 자동으로 insert 한다 

		index -- FrontControllerServlet -- HandlerMapping -- RegisterMemberController -- MemberDAO
						|
						| redirect																	   register(MemberVO) 
						register-result.jsp
 --%>
<form method="post" action="RegisterMemberController.do" onsubmit="return checkForm()">
<%-- 
		아이디 중복확인 
		register-form	--- FrontControllerServlet -- HandlerMapping -- CheckIdController -- MemberDAO
									|
									forward 
									checkid-ok.jsp 사용가능 (popup)
									or
									checkid-fail.jsp 사용불가 (popup)
		
		아이디 중복확인 여부를 저장하기 위한 hidden 
		아이디 중복확인해서 사용 가능한 아이디이면 flag에 인증받은 id 정보를 팝업인 checkid-ok.jsp 에서 할당한다 
 --%>
<input type="hidden" id="flag" value="">
<input type="text" name="id" id="id" placeholder="아이디" required="required"><button type="button" onclick="checkId()">중복확인</button><br>
<input type="password" name="password" placeholder="패스워드" required="required"><br>
<input type="text" name="name" placeholder="이름" required="required"><br>
<input type="text" name="address" placeholder="주소" required="required"><br>
<%-- date type이 placeholder가 적용안되므로 포커스가 갈때 type을 text에서 date로 변경  --%>
<input type="text" name="birthday" required="required" placeholder="생년월일" onfocus="(this.type='date')"><br>
<button type="submit">회원가입</button>
</form>
<script type="text/javascript">
	function checkForm() {
		if(document.getElementById("flag").value!=document.getElementById("id").value){
			alert("아이디 중복확인하세요!");
			return false;
		}
	}
	function checkId() {
		let mid=document.getElementById("id").value;
		if(mid==""){
			alert("아이디를 입력하세요");
		}else{
			window.open("CheckIdController.do?id="+mid,"mypopup","width=300,height=200,top=150,left=500");
		}
	}
</script>
</body>
</html>













