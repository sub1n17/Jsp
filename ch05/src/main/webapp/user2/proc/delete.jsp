<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

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
		
		
		String sql = "DELETE FROM `User2` WHERE userid=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, userid);
		
		psmt.executeUpdate();
		
		
		conn.close();
		psmt.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch05/user2/list.jsp");
%>