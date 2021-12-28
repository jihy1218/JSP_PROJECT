<%@page import="dao.BoardDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Board"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//String folderpath = request.getSession().getServletContext().getRealPath("carrot/upload");
	//MultipartRequest multi = new MultipartRequest(request, folderpath, 1024*1024*10,"UTF-8", new DefaultFileRenamePolicy());
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String contents = request.getParameter("content");
	
	//title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?", "");
	//contents = contents.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
	// String file = multi.getFilesystemName("file");
	
	int m_no = Integer.parseInt(request.getParameter("m_no"));
	
	
	Board board = new Board(title, contents, m_no);

	boolean result = BoardDao.getboardDao().boardwrite(board);
	if(result){
	response.sendRedirect("../view/board/boardlist.jsp");
	} else {
		response.sendRedirect("../view/board/boardwrite.jsp");
	}
%>