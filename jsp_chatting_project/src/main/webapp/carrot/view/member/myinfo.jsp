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
			<div class="offset-3 col-md-6">
				<div style="text-align: center;">
					<h3>내정보</h3>
					<br><br><br>
				</div>
				<table class="table text-center">
					<tr>
						<td>아이디</td><td>아이디</td><td> <button class="form-control">수정하기</button> </td>
					</tr>
					<tr>
						<td>닉네임</td><td>닉네임</td><td><button class="form-control">수정하기</button></td>
					</tr>
					<tr>
						<td>이름</td><td>이름</td><td><button class="form-control">수정하기</button></td>
					</tr>
					<tr>
						<td>이메일</td><td>이메일</td><td><button class="form-control">수정하기</button></td>
					</tr>
					<tr>
						<td>핸드폰번호</td><td>핸드폰번호</td><td><button class="form-control">수정하기</button></td>
					</tr>
					<tr>
						<td>회원등급</td><td>회원등급</td><td><button class="form-control">수정하기</button></td>
					</tr>
				</table>
				<br>
				<div>
					<div class="row">
						<button class="offset-7 col-md-2 form-control">수정하기</button>
						<button class="offset-1 col-md-2 form-control">차단목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>