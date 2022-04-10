<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webmvc product date</title>
</head>
<body>
<h4>Web MVC + FrontController Pattern 상에서 date 형 연습 예제 </h4>
<%--
			index -- FrontControllerServlet -- HandlerMapping -- FindProductByIdController -- ProductDAO
																										  findProductById(String id) : ProductVO
							| forward 
						존재하면  findbyid-ok.jsp 에서 상품정보 보여준다
						or
						존재하지 않으면 findbyid-fail.jsp에서 alert으로 상품이 존재하지 않습니다 후 index.jsp로 보낸다 			
						
			개발순서
			sql  -  DAO - Controller - View 																				  
 --%>
 <form action="FindProductByIdController.do" method="get">
 <input type="number" name="productId" placeholder="상품아이디" required="required">
 <button type="submit">검색</button>
 </form>
 <br><br>
 <%--
 			index -- FrontControllerServlet -- HandlerMapping -- RegisterProductController -- ProductDAO
 																										  register(ProductVO) 
 							| redirect
 						register-product-result.jsp 																				  
  --%>
 <form action="RegisterProductController.do" method="post">
 <input type="text" name="name" placeholder="상품명" required="required"><br>
 <input type="text" name="maker" placeholder="제조사" required="required"><br>
 <input type="number" name="price" placeholder="가격" min="1" required="required"><br>
 <button type="submit">등록</button>
 </form>
 <br><br>
 <%--
 			index -- FrontControllerServlet -- HandlerMapping -- FindAllProductListController -- ProductDAO
 							|																				findAllProductList() : ArrayList<ProductVO>
 							|  forward 
 						product-list.jsp	:  상품아이디 , 상품명 , 등록연월일 ( 2022.04.07 ) -> 아이디 내림차순으로 리스트 제공
 						
  --%>
 <a href="FindAllProductListController.do">전체상품리스트</a>
</body>
</html>



















