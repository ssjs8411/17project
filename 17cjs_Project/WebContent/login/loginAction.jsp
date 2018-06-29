<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "project.Driverdb.Driverdb"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euckr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Driverdb dbcon = new Driverdb();
	conn = dbcon.dbconn();
	
	pstmt = conn.prepareStatement("select * from user where user_id=? AND user_pw=?");
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		session.setAttribute("s_id", rs.getString("user_id"));
		session.setAttribute("s_name", rs.getString("user_name"));
		session.setAttribute("s_level", rs.getString("user_level"));
		
		response.sendRedirect(request.getContextPath() + "/main.jsp");
	}else{
		response.sendRedirect(request.getContextPath() + "/main.jsp");
	}
%>