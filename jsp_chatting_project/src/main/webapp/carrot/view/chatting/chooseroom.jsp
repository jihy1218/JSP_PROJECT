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
		<div style="border-radius: 15px; border: solid 2px black;" class="text-center row">
			<div class="col-md-6 my-2">
				<div class="card">
					<table class="table">
						<tr>
							<td>방번호</td><td>1</td>
						</tr>
						<tr>
							<td colspan="2"><h2>방 제목</h2></td>
						</tr>
						<tr>
							<td>닉네임</td><td>곽두팔</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-6 my-2">
				<div class="card">
					<table class="table">
						<tr>
							<td>방번호</td><td>2</td>
						</tr>
						<tr>
							<td colspan="2"><h2>방 제목</h2></td>
						</tr>
						<tr>
							<td>닉네임</td><td>곽두팔</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-6 my-2">
				<div class="card">
					<table class="table">
						<tr>
							<td>방번호</td><td>3</td>
						</tr>
						<tr>
							<td colspan="2"><h2>방 제목</h2></td>
						</tr>
						<tr>
							<td>닉네임</td><td>곽두팔</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-6 my-2">
				<div class="card">
					<table class="table">
						<tr>
							<td>방번호</td><td>4</td>
						</tr>
						<tr>
							<td colspan="2"><h2>방 제목</h2></td>
						</tr>
						<tr>
							<td>닉네임</td><td>곽두팔</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-6 my-2">
				<div class="card">
					<table class="table">
						<tr>
							<td>방번호</td><td>5</td>
						</tr>
						<tr>
							<td colspan="2"><h2>방 제목</h2></td>
						</tr>
						<tr>
							<td>닉네임</td><td>곽두팔</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-6 my-2">
				<div class="card">
					<table class="table">
						<tr>
							<td>방번호</td><td>6</td>
						</tr>
						<tr>
							<td colspan="2"><h2>방 제목</h2></td>
						</tr>
						<tr>
							<td>닉네임</td><td>곽두팔</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="text-center">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="">Previous</a></li>
					<li class="page-item"><a class="page-link" href="">1</a></li>
					<li class="page-item"><a class="page-link" href="">2</a></li>
					<li class="page-item"><a class="page-link" href="">3</a></li>
					<li class="page-item"><a class="page-link" href="">4</a></li>
					<li class="page-item"><a class="page-link" href="">5</a></li>
					<li class="page-item"><a class="page-link" href="">Next</a></li>
				</ul>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3 offset-1">
				<a href=""><button class="btn btn-info p-3">빠른 입장</button></a>
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