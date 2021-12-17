<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@page import="dao.NoteDao"%>
<%@page import="dto.Note"%>
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
	<%
		//노트 번호
		int n_no = Integer.parseInt(request.getParameter("n_no"));
		//노트 정보 찾기
		Note note = NoteDao.getNoteDao().getnote(n_no);
		//보낸사람 정보
		Member member = MemberDao.getmMemberDao().getinfo(note.getN_from());
		
	%>
	<!-- 쪽지 확인 -->
	<br><br><br>
	<div class="container">
		<div class="row">
			<div class="card offset-3 col-md-6" style="height: 350px;">
				<div>
					<p class="text-center">메시지</p>
				</div>
				<div style="border-bottom: 1px #000000 solid;">
					<p><%=member.getM_name() %> </p>
				</div>
				<div style="border-bottom: 1px #000000 solid;">
					<p><%=note.getN_date() %></p>
				</div>
				<div>
					<p><%=note.getN_contents() %></p>
				</div>
				<br><br><br><br>
			</div>
			<div style="position: absolute; bottom : 700px; right : 800px;">
				<a href="/jsp_chatting_project/carrot/view/note/notelist.jsp">뒤로가기</a>
				</div>
		</div>
	</div>
	<br><br><br><br><br>
</body>
</html>