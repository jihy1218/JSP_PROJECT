<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="/carrot/view/friendbar.jsp" %>
	<div class="container">
		<div style="border-radius: 15px; border: solid 2px black;" class="text-center">
			<br><br><br><br><br><br>
			<h1>채팅방입니다!!!!!!</h1>
			<br><br><br><br><br><br>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3 offset-1">
				<a href="/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp"><button class="btn btn-info p-3">친구추가</button></a>
			</div>
			<div class="col-md-3 offset-1">
				<a href="/jsp_chatting_project/carrot/view/chatting/makeroom.jsp"><button class="btn btn-info p-3">신고하기</button></a>
			</div>
			<div class="col-md-3 offset-1">
				<a href="/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp"><button class="btn btn-info p-3">나가기</button></a>
			</div>
		</div>
	</div>
</body>
</html>