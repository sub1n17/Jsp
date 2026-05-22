<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	String userid = request.getParameter("userid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");

	// -------------------
	// 데이터베이스 작업
	// -------------------
	
	//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	//String user = "sub1n17";
	//String pass = "1234";
	
	try {
		// 1) 드라이버 로드 (생략 가능)
		//Class.forName("com.mysql.cj.jdbc.Driver");

		// 2) 데이터베이스 접속
		//Connection conn = DriverManager.getConnection(host, user, pass);

		// -----------------
		// *** DBCP 방식 ***
		// -----------------
		Context initctx = new InitialContext();
		Context ctx = (Context) initctx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		
		// 3) SQL 실행 객체 생성
		String  sql = "UPDATE `User3` SET ";
		sql+= "name=?,";
		sql+= "birth=?,";
		sql+= "hp=?,";
		sql+= "addr=? ";
		sql+= "WHERE userid=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, birth);
		psmt.setString(4, hp);
		psmt.setString(5, userid);

		// 4) SQL 실행
		psmt.executeUpdate();

		// 5) 결과셋 처리 (select일 경우)

		// 6) 데이터베이스 종료
		psmt.close();
		conn.close();


	} catch(Exception e) {
		e.printStackTrace();
	}
	
	
	// 목록 이동
	response.sendRedirect("/ch05/user3/list.jsp?modify=success");
	


%>