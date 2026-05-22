<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="sub1.User2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	User2 user2 = null;

	String userid = request.getParameter("userid");

	//데이터베이스 작업
	//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	//String user = "sub1n17";
	//String pass = "1234";
	
	try {

		//Class.forName("com.mysql.cj.jdbc.Driver");
		//Connection conn = DriverManager.getConnection(host, user, pass);
		
		// -----------------
		// *** DBCP 방식 ***
		// -----------------
		Context initctx = new InitialContext();
		Context ctx = (Context) initctx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM `User2` WHERE userid=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, userid);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()) {
			user2 = new User2();
			user2.setUserid(rs.getString(1));
			user2.setName(rs.getString(2));
			user2.setBirth(rs.getString(3));
			user2.setAddr(rs.getString(4));
			
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2::수정</title>
	</head>
	<body>
		<h3>User2 수정</h3>
		
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user2/list.jsp">목록</a>
		
		<form action="/ch05/user2/proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" value="<%= user2.getUserid() %>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= user2.getName() %>"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" value="<%= user2.getBirth() %>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type=text name="addr" value="<%= user2.getAddr() %>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			
			</table>
		
		</form>
	
	</body>
</html>