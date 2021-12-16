<%@page import="dto.Note"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<br><br><br><br><br>
	<!-- 쪽지 리스트 페이지 -->
	<%
		//로그인 회원 번호		
		int m_no = 1;
		
		String pagenum = request.getParameter("pagenum");
		if(pagenum==null){
			pagenum="1";
		}
		
		int lastrow = NoteDao.getNoteDao().notecount();
		int listsize = 5;	
		
		int lastpage = 0;
		if(lastrow % listsize == 0 ){
			lastpage = lastrow / listsize;	
		}else{
			lastpage = lastrow / listsize+1;
		}
		
		int currentpage = Integer.parseInt(pagenum);
		int startrow = (currentpage-1)*listsize; 
		ArrayList<Note> noteList = NoteDao.getNoteDao().notelist(startrow, listsize ,m_no);
	%>
	<div class="container">
		<table class="table" style="max-width: 1000px; margin: 0 auto;">
			<tr>
				<th> No. </th> <th> 제목 </th> <th> 작성자 </th> <th> 작성일 </th> <th> 삭제 </th>
			</tr>
			<%for(Note note : noteList){%>
			<tr>	
				<td><%=note.getN_no() %></td>
				<td> <a href="noteview.jsp?n_no=<%=note.getN_no()%>"><%=note.getN_contents() %></a> </td>
				<td><%=note.getN_from() %></td>
				<td><%=note.getN_date() %></td>
				<td> <button class="btn-danger" onclick="notedelete(<%=note.getN_no()%>)">삭제</button> </td>	
			</tr>		
			<% }%>		
		
			
		</table>
		<div class="row">
			<div class="col-md-4 offset-4">
				<ul class="pagination">
					<%if(currentpage==1){ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=currentpage%>" class="page-link"> 이전 </a> </li>
					<%}else{ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=currentpage-1%>" class="page-link"> 이전 </a> </li>
					<%} %>
					<%for(int i = 1 ; i<=lastpage; i++){ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=i %>" class="page-link"> <%=i %> </a> </li>
					<%} %>
					<%if(currentpage == lastpage){ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=currentpage%>" class="page-link"> 이전 </a> </li>
					<%}else{ %>
						<li class="page-item"><a href="notelist.jsp?pagenum=<%=currentpage+1 %>" class="page-link"> 이전 </a> </li>
					<%} %>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>