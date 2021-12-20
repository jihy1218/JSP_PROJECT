<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("UTF-8");	// 한글 인코딩
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String passwordconfirm = request.getParameter("passwordconfirm");
	String nickname = request.getParameter("nickname");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	Member member = new Member(id, nickname,password,name,email,phone,1,2,5);
	
	if(MemberDao.getmMemberDao().signup(member)){
		out.print("<script>alert('회원 가입 을 축하합니다');</script>");
		out.print("<script>location.href='../view/member/login.jsp';</script>");
	}else{
		out.print("<script>alert('회원 가입 실패');</script>");
		out.print("<script>location.href='../view/member/login.jsp';</script>");
	}
	

%>


