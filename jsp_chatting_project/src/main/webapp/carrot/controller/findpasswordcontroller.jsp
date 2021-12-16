<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	out.print(id); 
	out.print(email); 
	
	Member.sendmail(email, "123");
	out.print("회원님의 메일로 비밀번호를 전송했습니다!"); 

%>