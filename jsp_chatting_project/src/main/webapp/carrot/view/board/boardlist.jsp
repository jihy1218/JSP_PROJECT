<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="../friendbar.jsp" %>
	<%	
		//검색처리 :키워드 입력하고 검색 버튼을 눌렀을떄
		String key =request.getParameter("key");
		String keyword = request.getParameter("keyword");
		
		ArrayList<Board> boards = BoardDao.getboardDao().boardlist(); 
	%>
	
	<div class=container>
		<h3> 자유 게시판 </h3>
		<br><br>
		<div class="row">
			<button class="mr-2 ml-3 btn btn-outline-danger"> 전체글 </button>		
			<button class="btn btn-outline-success"> 인기글 </button>
		</div><br>
			<a href="boardwrite.jsp"><button class="btn btn-outline-success"> 등록 </button></a>
		
	<table class="table">
		<tr style="border-top: solid 2px navy; border-bottom: solid 1.5px navy;">
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>추천</th>
		</tr>
		<%
			for(Board board : boards){%>
			<tr>
				<td><%=board.getB_no() %></td>
				<td><a href ="boardview.jsp?b_num=<%=board.getB_no()%>"><%=board.getB_title() %></a></td>
				<td><%=board.getM_no() %></td>
				<td><%=board.getB_date() %></td>
				<td><%=board.getB_view() %></td>
				<td><%=board.getB_like() %></td>
			</tr>
		
		<%} %>
		
	</table>
	</div>
	
	
</body>
</html>