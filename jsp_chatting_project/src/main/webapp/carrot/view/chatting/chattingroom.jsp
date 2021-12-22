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
		<div style="border-radius: 15px; border: solid 2px #ff7915;" class="text-center">
			<div class="row">
				<div class="col-md-4">
					<div class="card m-2" style="border: solid 2px #ff7915; ">
						<div class="text-center">
							<input type="hidden" id="m_grade" value="<%=logininfo.getM_grade()%>">
							<input type="text" id="title" class="col-md-8 offset-2 form-control mt-2" value="받아온채팅방이름">						
							<a href="chattingmain.jsp"><button class="btn btn-success" style="margin: 10px 0 10px 0;">메인 이동</button></a>
							<button class="btn btn-outline-danger" style="margin: 10px 0 10px 0;">차단하기</button>
						</div>
					</div>
					<div class="card m-2" style="border: solid 2px #ff7915;">
						<br><br><br><br><br><br><br><br><br><br><br>채팅방들어갈공간<br><br><br><br><br><br><br><br><br><br><br><br><br>
					</div>
				</div>
				<div class="col-md-8 col-sm-9" >
					<div class="card m-2 chattingmain">
						<div style="max-width: 100%" class="carousel slide col-d" data-ride="carousel" data-interval="5000">
							<div class="carousel-inner">
								<div class="carousel-item active"><img src="/jsp_chatting_project/carrot/img/유의사항1.png"></div>
								<div class="carousel-item"><img src="/jsp_chatting_project/carrot/img/유의사항2.png"></div>
								<div class="carousel-item"><img src="/jsp_chatting_project/carrot/img/유의사항3.png"></div>
							</div>
						</div>
						<div id="msgbox2"> <!-- 채팅창 -->
						</div>
						<div class="row no-gutters"> <!-- 채팅입렵 -->
							<div class="col-md-10">
								<input class="form-control" type="text" id="msginput" onkeyup="entersend();" placeholder="내용을 입력하세요.">
							</div>
							<div class="col-md-2">
								<button class="form-control" onclick="send();">전송</button>				
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<br><br><br><br>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>