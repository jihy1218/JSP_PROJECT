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
			<img src="../../img/당근프리미엄.png" style="max-width: 100%"> <!-- 이미지 좀더 큰거로 해야할거같음 -->
			<div class="row">
				<h3 class="col-md-2 offset-3">방 제목 : </h3>
				<input type="text" class="form-control col-md-4">
			</div>
			<br>
			<a href="#"><button class="btn btn-info my-4 p-3">방 만들기</button></a>
			<br>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3 offset-1">
				<a href=""><button class="btn btn-info p-3">빠른 입장</button></a>
			</div>
			<div class="col-md-3 offset-1">
				<a href="/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp"><button class="btn btn-info p-3">이전으로</button></a>
			</div>
			<div class="col-md-3 offset-1">
				<a href="/jsp_chatting_project/carrot/view/chatting/chooseroom.jsp"><button class="btn btn-info p-3">방 선택</button></a>
			</div>
		</div>
	</div>
</body>
</html>