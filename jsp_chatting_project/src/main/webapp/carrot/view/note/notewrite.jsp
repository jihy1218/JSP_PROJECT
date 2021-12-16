<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<!-- 쪽지 페이지 -->
	<br><br><br><br><br>
	<div class="container">
		<%
			//로그인 회원 번호		
			int n_from = 1;
		%>
		<input type="hidden" id="n_from" value="<%=n_from%>">
		<div class="row">
			<div class="offset-3 col-md-6" style="height: 600px;">
				<div class="bg-secondary text-white p-1" style="padding-left: 3px;">
					<p class="px-2"> 새 쪽지 </p>
				</div>
				<div style="border-bottom: solid 1px #000000;">
					<input class="form-control" type="text" id="n_to" placeholder="수신자">
				</div>
				<div>
					<textarea rows="18" cols="" id="n_contents" class="form-control" placeholder="내용"></textarea>
				</div>
				<div>
					<button class="btn btn-primary float-right" onclick="notesend()"> 보내기 </button>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
</body>
</html>