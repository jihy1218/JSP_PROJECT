<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

	<%
		String nickname = request.getParameter("you");
		String id = MemberDao.getmMemberDao().getidfromnick(nickname);
	%>

	<div class="container">
		<div class="" style="height: 450px; width: 450px;">
			<div>
				대상 : <%=nickname %>
			</div>
			<div class="row">
				<div>
					<button onclick="friendinvite('<%=id%>')">친구추가</button>			
				</div>
				<div>
					<button onclick="block('<%=id%>')">차단하기</button>			
				</div>
			</div>
		</div>	
	</div>

		<!-- jquery js -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- 부트스트랩 js설정 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    	<!-- 노트 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/chatting.js"></script>
		
</body>
</html>