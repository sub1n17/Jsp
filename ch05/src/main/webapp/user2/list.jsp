<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="sub1.User2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<User2> user2List = new ArrayList<>(); 

	// 데이터베이스 작업
	//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	//String user = "sub1n17";
	//String pass = "1234";
	
	//Class.forName("com.mysql.cj.jdbc.Driver");
	//Connection conn = DriverManager.getConnection(host, user, pass);
	
	// -----------------
	// *** DBCP 방식 ***
	// -----------------
	Context initctx = new InitialContext();
	Context ctx = (Context) initctx.lookup("java:comp/env");
	
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	
	String sql = "SELECT * FROM `User2`";
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);

	while(rs.next()) {
		User2 user2 = new User2();
		
		user2.setUserid(rs.getString(1));
		user2.setName(rs.getString(2));
		user2.setBirth(rs.getString(3));
		user2.setAddr(rs.getString(4));
		
		user2List.add(user2);
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2</title>
	</head>
	<body>
		<h3>User2 목록</h3>
		
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user2/register.jsp">등록</a>
		
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			
			<%
				for(User2 user2 : user2List) {
			%>
				<tr>
					<td><%= user2.getUserid() %></td>
					<td><%= user2.getName() %></td>
					<td><%= user2.getBirth() %></td>
					<td><%= user2.getAddr() %></td>
					<td>
						<a href="/ch05/user2/modify.jsp?userid=<%= user2.getUserid() %>">수정</a>
						<a href="/ch05/user2/proc/delete.jsp?userid=<%= user2.getUserid() %>">삭제</a>
					</td>
				</tr>
			<%
				}
			%>
		
		</table>
		
	</body>
</html>