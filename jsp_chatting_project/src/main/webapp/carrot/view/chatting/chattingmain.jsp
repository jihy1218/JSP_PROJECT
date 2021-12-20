<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="../friendbar.jsp" %>
	<div class="container">
		<div style="border-radius: 15px; border: solid 2px #ff7915;" class="text-center">
			<div class="row">
				<div class="col-md-4">
					<div class="card m-2" style="border: solid 2px #ff7915; ">
						<div class="text-center">
							<input type="text" class="col-md-8 offset-2 form-control mt-2" placeholder="방제목을입력해주세요!">						
							<button class="btn" style="background-color: #3f7d1b; color : white; margin: 10px 0 10px 0;">방만들기</button>
						</div>
					</div>
					<div class="card m-2" style="border: solid 2px #ff7915;">
						<br><br><br><br><br><br><br><br><br><br><br>채팅방들어갈공간<br><br><br><br><br><br><br><br><br><br><br><br><br>
					</div>
				</div>
				<div class="col-md-8">
					<div>
					</div>
					<img src="/jsp_chatting_project/carrot/img/메인이미지.png">
				</div>
			
			</div>
		</div>
		
		<br><br><br><br>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>