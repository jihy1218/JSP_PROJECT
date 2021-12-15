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
	<!-- 쪽지 페이지 -->
	<br><br><br><br><br>
	<div class="container">
		<div class="row">
			<div class="offset-3 col-md-6" style="height: 600px;">
				<div class="bg-secondary text-white p-1" style="padding-left: 3px;">
					<p class="px-2"> 새 쪽지 </p>
				</div>
				<div style="border-bottom: solid 1px #000000;">
					<input class="form-control" type="text" placeholder="수신자">
				</div>
				<div>
					<textarea rows="18" cols="" class="form-control" placeholder="내용"></textarea>
				</div>
				<div>
					<button class="btn btn-primary"> 보내기 </button>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
</body>
</html>