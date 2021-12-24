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
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		Board board = BoardDao.getboardDao().getboard(b_no);
	%>
	<br>
	
	<div class="container">
	<form action="/jsp_chatting_project/carrot/view/board/boardview.jsp" method="POST">
		<div class="form-group">
			<label for="title">Title: </label>
			<input type="text" class="form-control" placeholder="<%=board.getB_title() %>" id="title" name="title">
		</div>
		<div class="form-group">
			<label for="content">Content:</label>
			<textarea class="form-control" rows="5" id="summernote" name="content"></textarea>
		</div>
		<div class ="text-right">
			<button type="submit" class="btn btn-primary">수정 완료</button>
		</div>
	</form>
	<input type="hidden" value="<%= board.getB_contents()%>">
</div>

  <script>
    $('#summernote').summernote({
      placeholder:'내용을 작성해주세요',
      tabsize:2, //탭 두번
      height:400
    });
  </script>



	
<%@include file="../footer.jsp" %>


</body>
</html>