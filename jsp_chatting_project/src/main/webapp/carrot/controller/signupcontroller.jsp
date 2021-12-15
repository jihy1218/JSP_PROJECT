<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");	// 한글 인코딩
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String passwordconfirm = request.getParameter("passwordconfirm");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");




%>