<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="../header.jsp" %>
	
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	System.out.println(b_no);
	
	String boardviews = logininfo.getM_id()+" : " + b_no;
	
	if(session.getAttribute(boardviews)==null) {
		BoardDao.getboardDao().boardcount(b_no);
			String boardview = logininfo.getM_id()+" : " + b_no;
				session.setAttribute(boardview, true);
				session.setMaxInactiveInterval(60*60*24);
	}
	
	Board board = BoardDao.getboardDao().getboard(b_no);
%>

	<%@include file="../friendbar.jsp" %>
	<div class ="container">
		<div class="row">
			<div class="m-2"><a href="boardlist.jsp"><button class="form-control">목록</button></a></div>
			<div class="m-2"><a href="boardupdate.jsp?b_no=<%=b_no %>"><button class="btn btn-primary">수정</button></a></div>
			<div class="m-2"><button class="form-control">목록</button></div>
			<div class="m-2"><a href="boardupdate.jsp?b_num=<%=b_no %>"><button class="btn btn-primary">수정</button></a></div>
			<div class="m-2"><button class="btn btn-danger" onclick="boarddelete(<%=b_no%>)">삭제</button></div>
		</div>
		
		<table class="table">
			<tr>
				<td style="width: 20%"> 작성자 : <%=board.getM_no() %></td>
				<td> 작성일 : <%=board.getB_date() %></td>
				<td> 조회수 : <%=board.getB_view()%></td>
			</tr>
		
			<tr>
				<td>제목 <%=board.getB_title() %></td>
				<td colspan="2"></td>
			</tr>
		
			<tr>
				<td style="height: 300px;">내용 <%=board.getB_contents() %></td>
				<td colspan="2"></td>
			</tr>
		</table>
		<br><br><br>
		<form action="../../controller/replywritecontroller.jsp" method="post" class="row">
			<input type="hidden" name="b_no" value="<%=b_no%>">
				<div>
					<h6> 댓글 작성 </h6>
				</div>
				
				<div class="col-md-8">
					<input type="text" class="form-control" name="r_contents">
				</div>
				<div class="col-md-2">
					<input type="submit" value="등록" class="form-control">
				</div>
		</form>
		<table class="table m-3">
			<tr>
				<th>작성자</th><th>내용</th><th>작성일</th>
			</tr>
			<%
				ArrayList<Reply> replist = BoardDao.getboardDao().replylist(b_no);
				for(Reply reply : replist) {
			%>
			<tr>
				<th><%=reply.getM_no() %>
				<th><%=reply.getR_contents() %>
				<th><%=reply.getR_date() %>
				<th>
				<a href="../../controller/replydeletecontroller.jsp?r_no=<%=reply.getR_no()%>&b_no=<%=reply.getB_no()%>">
				<button class="btn btn-danger">삭제</button>
				</a>
			</tr>
			<% } %>
		</table>
	</div>
<%@include file="../footer.jsp" %>
</body>
</html>