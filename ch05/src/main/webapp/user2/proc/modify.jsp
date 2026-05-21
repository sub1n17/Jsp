<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String addr = request.getParameter("addr");

	//데이터베이스 작업
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "sub1n17";
	String pass = "1234";
	
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "UPDATE `User2` SET name=?, birth=?, addr=? WHERE userid=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, name);
		psmt.setString(2, birth);
		psmt.setString(3, addr);
		psmt.setString(4, userid);
		
		psmt.executeUpdate();
		
		conn.close();
		psmt.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch05/user2/list.jsp");
	
	
%>