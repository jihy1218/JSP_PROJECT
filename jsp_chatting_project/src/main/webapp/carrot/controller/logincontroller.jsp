<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String m_id = request.getParameter("m_id");
	String m_password = request.getParameter("m_password");
	
	boolean result = MemberDao.getmMemberDao().login(m_id, m_password);
	
	if(result){
		Member memberinfo = MemberDao.getmMemberDao().getmemberinfo(m_id, m_password);
		session.setAttribute("login", memberinfo);
		out.print("1");
	} else {
		out.print("2");
	}
%>