<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h4>회원관리( Web MVC, FrontController Pattern , DBCP , EL, JSTL ) + CheckLoginInterceptor 적용</h4>
	FrontControllerServlet 차원에서 CheckLoginInterceptor 를 이용해 <br>
	개별 컨트롤러에서 인증여부를 체크하지 않고 공통정책으로 처리해 <br>
	중복된 인증체크 작업을 피하고 효율적으로 구현할 있게 한다 <br><br>
	<%-- 
		아이디로 회원검색
		
		index.jsp  --- FrontControllerServlet -- HandlerMapping -- FindMemberByIdController -- MemberDAO	 -------- DataSourceManager 
							| forward																		  findMemberById(id) : MemberVO 
						findbyid-ok.jsp
						or
						findbyid-fail.jsp 	
 --%>
	<form action="FindMemberByIdController.do" method="get">
		<input type="text" name="id" placeholder="아이디" required="required">
		<button type="submit">검색</button>
	</form>
	<br>
	<br>
	<%-- 
 		비로그인 상태 ( session 에 mvo 인증정보가 존재하지 않는 상태 ) 에는 로그인 폼을 제공 
 		로그인 상태에서는 누구님 로그아웃링크 를 제공 
 		jstl choose when otherwise 를 이용해서 표현한다 
 		
 		index -- FrontControllerServlet -- HandlerMapping -- LoginController -- MemberDAO
 						|																	login(id,password) : MemberVO 
 						| redirect
 						로그인 성공시 : index로 ( 세션에 mvo 객체를 할당 )
 						로그인 실패시 : login-fail.jsp 에서 alert() 으로 로그인 실패 후 index로 																			
  --%>

	<c:choose>
		<c:when test="${sessionScope.mvo==null}">
			<form action="LoginController.do" method="post">
				<input type="text" name="id" placeholder="아이디" required="required"><br>
				<input type="password" name="password" placeholder="패스워드"
					required="required"><br>
				<button type="submit">로그인</button>
			</form>
			<br><br>
			<a href="register-form.jsp">회원가입</a>
			
		</c:when>
		<c:otherwise>
  	  ${sessionScope.mvo.name}님  
  	  <%-- 
  	  		get 요청방식으로 로그인 , 로그아웃 처리가 되는 것은 바람직하지 않다
  	        참고 ) spring security 에서는 로그인, 로그아웃 기능은 post 방식 요청만 가능하도록 설계되어 있다 
  	   --%>
  	   <%-- 아래는 get 요청방식으로 로그아웃하는 코드 --%>
  	  <%-- <a href="LogoutController.do">로그아웃</a> --%>
  	  <%-- 
  	  		 post방식으로 로그아웃하도록 구현한다 
  	  		 href="#" 링크 속성을 사용하지 않는다 
  	  --%>
  	  	<a href="#" onclick="logout()">로그아웃</a>
  	  	<form id="logoutForm" method="post" action="LogoutController.do"></form>
  	  	<script type="text/javascript">
  	  		function logout() {
				document.getElementById("logoutForm").submit();
			}
  	  	</script>
  	  	<br><br>
  	  	<%-- 
  	  	주소로 회원검색 
  	  	
  	  		 index --- FrontControllerServlet -- HandlerMapping -- FindMemberListByAddressController -- MemberDAO
  	  						| forward
  	  					 findbyaddress-result.jsp 																	findMemberListByAddress(address): ArrayList<MemberVO>		
  	  	--%>
  	  		<form action="FindMemberListByAddressController.do" method="get">
  	  		<input type="text" name="address" required="required" placeholder="주소">
  	  		<button type="submit">검색</button>
  	  		</form>  	
  	  		<br><br>
  	  		<%--
  	  				회원정보 수정폼 제공
  	  				index -- UpdateMemberFormController
  	  								|
  	  								| 로그인 상태이면
  	  								update-form.jsp  redirect 
  	  								or 
  	  								 비로그인 상태이면
  	  								index.jsp  redirect  
  	  								
  	  				바로 update-form.jsp로 이동하지 않는 이유는 로그인 해제 상태에서 링크를 클릭할 경우 
  	  				index.jsp로 리다이렉트를 하고 로그인 상태에서만 회원정보 수정폼을 제공하기 위해서 	
  	  				UpdateMemberFormController로 경로를 지정한다 		
  	  		 --%>
  	  		<a href="UpdateMemberFormController.do">회원정보수정</a>  	
		</c:otherwise>
	</c:choose>
</body>
</html>



























