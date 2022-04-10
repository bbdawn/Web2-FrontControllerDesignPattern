<%@page import="org.kosta.myproject.model.DataSourceManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   import="java.sql.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP Test</title>
</head>
<body>
<h4>Database Connection Pool Test</h4>
기존 방식의 db 컨넥션을 생성하고 소멸시키는 컨넥션 객체 : 
<%
		String dbUrl="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection con=DriverManager.getConnection(dbUrl,"scott","tiger");//컨넥션 생성한다 
%> 	<%=con.getClass() %>
<%
		con.close();  // 컨넥션 소멸시킨다 
%>
<br><br>
DBCP(DataSource) 를 이용해 컨넥션을 빌려오고 반납받는 방식의 컨넥션 객체 : 
<%
		DataSource dataSource=DataSourceManager.getInstance().getDataSource();
		Connection dbcpCon=dataSource.getConnection();//컨넥션을 컨넥션풀에서 빌려온다 
%>		<%=dbcpCon.getClass() %><%-- dbcp 컨넥션 객체 --%>
<%
	dbcpCon.close(); //컨넥션을 컨넥션풀로 반납한다 
%>
</body>
</html>











