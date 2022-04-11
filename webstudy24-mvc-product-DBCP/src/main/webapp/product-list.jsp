<%@page import="org.kosta.myproject.model.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
th, td {
	text-align: center;
}
</style>
<title>product-list</title>
</head>
<body>
	<%-- pt : padding top --%>
	<div class="container pt-4">
		<a href="index.jsp">Home</a><br>
		<br>
		<%
		@SuppressWarnings("unchecked")
		ArrayList<ProductVO> list = (ArrayList<ProductVO>) request.getAttribute("productList");
		%>
		<table class="table table-bordered table-hover">
			<thead>
				<tr class="bg-primary text-white">
					<th>ID</th>
					<th>NAME</th>
					<th>REGDATE</th>
				</tr>
			</thead>
			<tbody>
				<%--
				추가 구현 사항 : NAME 을 사용자 클릭하면 해당 상품의 상세 정보를 제공해야 한다 
								  NAME 에 링크를 제공 , query string을 이용해서 상품의 아이디를 전송 ->
								  FindProductByIdController 가 실행되어 상세정보를 findbyid-ok.jsp 에서 제공하면 된다 
		 --%>

				<%
				for (ProductVO vo : list) {
				%>
				<tr>
					<td><%=vo.getId()%></td>
					<td><a href="FindProductByIdController.do?productId=<%=vo.getId()%>"><%=vo.getName()%></a></td>
					<td><%=vo.getRegDate()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>





