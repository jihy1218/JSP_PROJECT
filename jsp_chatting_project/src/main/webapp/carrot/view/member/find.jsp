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
			<div class="card offset-3 col-md-6" style="max-width: 350px; margin:0 auto;">
				<div>
					<img alt="" src="로고">
				</div>
				<div style="text-align: center; ">
					<h3>아이디/비밀번호 찾기</h3>
				</div>
				<div class="my-3">
					<input type="text" placeholder="이름" class="form-control">			
				</div>
				<div class="my-3">
					<input type="text" placeholder="이메일" class="form-control">			
				</div>
				<div class="my-3">
					<button class="btn btn-lg btn-primary btn-block">아이디 찾기</button>
				</div>
				<div style="text-align: center; padding-bottom: 10px;">
					<a href="login.jsp" style="font-size: 1px;">로그인</a> | <a href="signup.jsp" style="font-size: 1px;">회원가입</a> 
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	
	<%@include file="../footer.jsp" %>

</body>
</html>