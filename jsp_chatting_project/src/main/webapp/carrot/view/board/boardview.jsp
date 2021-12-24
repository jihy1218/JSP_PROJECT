<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Reply"%>
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
<%
	int b_no = Integer.parseInt( request.getParameter("b_no"));
	
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
		<form class="form-control" >
			<div class="form-group">
				<label for="title">Title:</label>
				<input type="text" class="form-control" placeholder="title" id="title" name="title">
			</div>
			<div class="form-grop">
				<label for="content">Content : </label>
				<textarea class="form-control" rows="5" id="summernote" name="content"></textarea>
			</div>
			<div class ="text-right">
				<button type="submit" class="btn btn-primary">삭제</button>
			</div>
		</form>
		<a href="boardupdate.jsp" ><button class="btn btn-primary">수정하기</button></a>
		<br><br><br>
		<form action="../../controller/replywritecontroller.jsp" method="post" class="row">
			<input type="hidden" name="b_no" value="">
				<div>
					<h6> 댓글 작성 </h6>
				</div>
				
				<div class="col-md-8">
					<input type="text" class="form-control" name="contents">
				</div>
				<div class="col-md-2">
					<input type="submit" value="등록" class="form-control">
				</div>
		</form>
		<table class="table m-3">
			<tr>
				<th>작성자</th><th>내용</th><th>작성일</th>
			</tr>
		</table>
	</div>
<%@include file="../footer.jsp" %>




</body>
</html>