<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
		String folderpath ="C:/Users/minwook/git/JSP_PROJECT/jsp_chatting_project/src/main/webapp/carrot/upload";
		String path = request.getSession().getServletContext().getRealPath("website/upload");
		
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		MultipartRequest multi = new MultipartRequest( request ,  folderpath , 
		1024*1024*10 ,"UTF-8" , policy );

		request.setCharacterEncoding("utf-8");
		
		String file = multi.getFilesystemName("file");
		
		System.out.print(file);

%>    