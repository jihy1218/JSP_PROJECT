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
	<form id ="signupform" action="../../controller/signupcontroller.jsp" method="post" onsubmit="return signupcheck()">
		<div class="row">
			<div class="card offset-3 col-md-6" style="max-width: 350px; margin:0 auto;">
				<div>
					<img alt="" src="로고">
				</div>
				<div style="text-align: center;">
					<h3>당근 회원가입</h3>
				</div>
				<div class="my-3">
					<input type="text" placeholder="사용하실 ID를 입력해주세요." class="form-control" id="id" onchange="signupcheck();" name="id" >			
				</div>
					<div>
						<span id="idresult"></span>
					</div>
				<div class="my-3">
					<input type="password" placeholder="사용하실 비밀번호를 입력해주세요." class="form-control" id="password" onchange="signupcheck();" name="password">			
				</div>
				<div class="my-3">
					<input type="password" placeholder="패스워드를 다시 입력해주세요." class="form-control" id="passwordconfirm" onchange="signupcheck();" name="passwordconfirm">			
				</div>

				 	<div>
                  		<span id="pwresult"></span>
               		</div>
               	<div class="my-3">
					<input type="text" placeholder="사용하실 nickname를 입력해주세요." class="form-control" id="nickname" onchange="signupcheck();" name="nickname" >			

				</div>
					<div>
						<span id="nicknameresult"></span>
					</div>	
				<div class="my-3">

					<input type="text" placeholder="이름." class="form-control" id="name" onchange="signupcheck();" name="name">			

				</div>
				 <div>
                  <span id="nameresult"></span>
               </div>
				<div class="my-3">

					<input type="text" placeholder="email 형식으로 입력해주세요." class="form-control" id="email" onchange="signupcheck();" name="email" >			

				</div>
				<div>
                  <span id="emailresult"></span>
               </div>
				<div class="my-3">

					<input type="text" placeholder="000-0000-0000." class="form-control" id="phone" onchange="signupcheck();" name="phone" >			
				</div>
				 <div>
                  <span id="phoneresult"></span>
               </div>
				<div class="p-3 my-3">
					<input type="submit" value="가입 하기" >
				</div>
			</div>
		</div>
	</form>
</div>


</body>
</html>