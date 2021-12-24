<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int r_no = Integer.parseInt(request.getParameter("r_no"));
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	
	boolean result = BoardDao.getboardDao().re
%>