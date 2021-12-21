<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/carrot/view/header.jsp" %>
	<%@include file="/carrot/view/friendbar.jsp" %>
	<br>
	<div class="container">
	<form action="#" method="POST">
		<div class="form-group">
			<label for="title">Title:</label>
			<input type="text" class="form-control" placeholder="title" id="title" name="title">
		</div>
		<div class="form-group">
			<label for="content">Content:</label>
			<textarea class="form-control" rows="5" id="summernote" name="content"></textarea>
		</div>
			<button type="submit" class="btn btn-primary">등록</button>
		<br>
	</form>
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
