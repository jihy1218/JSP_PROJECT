<%@page import="dto.Member"%>
<%@page import="dao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Member logininfo = (Member)session.getAttribute("login");

	int m_no1 =	logininfo.getM_no();
	
	int m_no2 = Integer.parseInt(request.getParameter("m_no"));
	
	int f_no = FriendDao.getFriendDao().getf_no(m_no1, m_no2);
	
	boolean result = FriendDao.getFriendDao().deletefriende(f_no);
	if(result){
		out.print(1);
	}else{
		out.print(2);
	}
	
%>