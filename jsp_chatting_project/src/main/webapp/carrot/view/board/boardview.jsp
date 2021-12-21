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
	<div class ="container">
		<form class="form-control" >
			<div class ="form-group">
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
			<a href="boardupdate.jsp" ><button class="btn btn-primary" >수정하기</button></a>
	</div>





<%@include file="../footer.jsp" %>




</body>
</html>