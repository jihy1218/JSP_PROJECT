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
	<br><br><br><br><br><br>
	<div class="divbox">
		<a href="#"><button class="btn btn-warning p-3" style="position: relative;">친구목록</button></a>
	</div>
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