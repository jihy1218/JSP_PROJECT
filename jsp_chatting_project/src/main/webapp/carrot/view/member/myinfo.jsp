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

	<div class="container">
		<div class="row">
			<div class="offset-3 col-md-6" style="max-width: 700px; margin:0 auto;">
				<div style="text-align: center;">
					<h3>내정보</h3>
					<br><br><br>
				</div>
				<table class="table text-center">
					<tr>
						<td>아이디</td><td><input class="form-control" type="text" placeholder="닉네임"> </td><td> <button class="btn btn-secondary">수정하기</button> </td>
					</tr>
					<tr>
						<td>닉네임</td><td> <input class="form-control" type="text" placeholder="닉네임"> </td><td><button class="btn btn-secondary">수정하기</button></td>
					</tr>
					<tr>
						<td>이름</td><td><input class="form-control" type="text" placeholder="닉네임"> </td><td><button class="btn btn-secondary">수정하기</button></td>
					</tr>
					<tr>
						<td>이메일</td><td><input class="form-control" type="text" placeholder="닉네임"> </td><td><button class="btn btn-secondary">수정하기</button></td>
					</tr>
					<tr>
						<td>핸드폰번호</td><td><input class="form-control" type="text" placeholder="닉네임"> </td><td><button class="btn btn-secondary">수정하기</button></td>
					</tr>
					<tr>
						<td>회원등급</td><td><input class="form-control" type="text" placeholder="닉네임"> </td><td><button class="btn btn-secondary">수정하기</button></td>
					</tr>
				</table>
				<br>
				<div>
					<div class="row">
						<button class="btn btn-secondary ">차단목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	
	<%@include file="../footer.jsp" %>
	
</body>
</html>