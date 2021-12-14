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
	<br><br><br><br><br><br><br><br>
	<div class="divbox">
		<a href="#"><button class="btn btn-warning p-3" style="position: relative;">친구목록</button></a>
	</div>
	<div class="container">
		<div style="border-radius: 15px; border: solid 2px black;" class="text-center">
			<img src="../../img/메인이미지.png">
		</div>
		<br>
		<div class="row">
			<div class="col-md-3 offset-1">
				<a href="/jsp_chatting_project/carrot/view/chatting/chattingroom.jsp"><button class="btn btn-info p-3">빠른 입장</button></a>
			</div>
			<div class="col-md-3 offset-1">
				<a href="/jsp_chatting_project/carrot/view/chatting/makeroom.jsp"><button class="btn btn-info p-3">방 만들기</button></a>
			</div>
			<div class="col-md-3 offset-1">
				<a href="/jsp_chatting_project/carrot/view/chatting/chooseroom.jsp"><button class="btn btn-info p-3">방 선택</button></a>
			</div>
		</div>
	</div>
</body>
</html>