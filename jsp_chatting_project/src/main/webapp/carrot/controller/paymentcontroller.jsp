<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member logininfo = (Member)session.getAttribute("login");
	int m_no = logininfo.getM_no();
	// 세션에서 받아온 m_grade 가 1이면 결제 가능 else이면 이미 결제한 사람
	MemberDao.getmMemberDao().gradeupdate(m_no);
	out.print("1");
 
%>