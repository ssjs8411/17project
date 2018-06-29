<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	session.invalidate();
	response.sendRedirect(request.getContextPath() + "/main.jsp");
%>