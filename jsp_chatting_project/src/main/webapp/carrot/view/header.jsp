<%@page import="dao.MemberDao"%>
<%@page import="dao.FriendDao"%>
<%@page import="dto.Friend"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심심해? 들어와! 당근</title>
	<!-- 부트스트랩 설정 4.0 버전 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<!-- css호출 -->
	<link rel="stylesheet" href="/jsp_chatting_project/carrot/css/main.css">
	<link href="/jsp_chatting_project/carrot/css/simple-sidebar.css" rel="stylesheet"> <!-- 친구목록 사이드바 css -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"> <!-- 아이콘 불러오는 css -->
		<!-- 글쓰기 호출 -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  
</head>
<body>
	<%	
		int m_no =0;
		int m_grade=0;
		Member logininfo = (Member)session.getAttribute("login");
		// 로그인 하면 세션에 그 사람 정보가 로그인 인포에 다 들어간다
		if(session.getAttribute("login")!=null){
			m_no =	logininfo.getM_no();
			m_grade = logininfo.getM_grade();
		}
		
		
	%>
	<!-- jquery js -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- 부트스트랩 js설정 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- js 호출 -->
	<script type="text/javascript" src="/jsp_chatting_project/carrot/js/main.js"></script>
	
	<!-- 멤버 js 호출 -->
	<script type="text/javascript" src="/jsp_chatting_project/carrot/js/member.js"></script>
	<!-- 노트 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/note.js"></script>
	<!-- 채팅 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/chatting.js"></script>
	<!-- 친구목록 사이드바 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/simple-sidebar.js"></script> 
	<!-- 친구목록 js 호출 -->
	<script src="/jsp_chatting_project/carrot/js/friendbar.js"></script>
	<!-- 글쓰기 js 호출 -->
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<!-- 글쓰기 js 호출 -->
  	<script src="/jsp_chatting_project/carrot/js/board.js"></script>
  	
	
	<div class="container">
		<div class="row justify-content-between align-items-center">
			<div class="col-3 offset-4 text-center mt-2">
				<%if(logininfo!=null){ %>
				<a href="/jsp_chatting_project/carrot/view/chatting/chattingmain.jsp"><img src="/jsp_chatting_project/carrot/img/당근후보3.png" style="max-width: 100%"></a>
				<%}else{ %>
				<img src="/jsp_chatting_project/carrot/img/당근후보3.png" style="max-width: 100%">
				<%} %>
			</div>
			<div class="col-5 d-flex justify-content-end align-items-center">
				<ul class="nav header-topmenu">	<!-- 로그인 했을때 랑 안했을때 구별해서 해야합니다. 나중에 수정해야함 (12.15 15:58)-->
					<%
						if(session.getAttribute("login")!=null) {
					%>
					<li style="color : #ff7915; " ><%
						String grade;
						if(logininfo.getM_grade()==1){
								grade = "일반회원";%>
						<%=grade %>
						<%}else if(logininfo.getM_grade()==2){
							grade = "프리미엄회원";%>
						<%=grade %>
						<%}	%>
					</li>
					<li class="text-success mx-1"><%=logininfo.getM_nickname() %>님<span style="color: black;"> | </span></li>
					<li><a href="/jsp_chatting_project/carrot/view/board/boardlist.jsp" class="text-success mx-1">게시판</a>|</li>
					<li><a href="/jsp_chatting_project/carrot/view/member/myinfo.jsp" class="text-success mx-1">내정보</a>|</li>
					<li><a href="/jsp_chatting_project/carrot/view/note/notelist.jsp" class="text-success mx-1">쪽지</a>|</li>
					<li><a href="/jsp_chatting_project/carrot/controller/logoutcontroller.jsp" class="text-success mx-1">로그아웃</a>|</li>
					<% }else{ %>
					<li><a href="/jsp_chatting_project/carrot/view/member/login.jsp" class="text-success mx-1">로그인</a>|</li>
					<li><a href="/jsp_chatting_project/carrot/view/member/signup.jsp" class="text-success mx-1">회원가입</a></li>
					<%} %>
				</ul>
			</div>	
		</div>
	<br>
	</div>
	<!-- 세션에서 받아온 회원의 grade가 1이면 표시 아니면 표시안함 -->
	<%
		if(m_grade==1){
	%>
	<div id="sidead" style="position: absolute; top :200px; left: 20px;" class="col-md-2 col-sm-4 sidead">
	    <button data-toggle="sidead" id="adtoggle" onclick="sideadtoggle();" class="btn" style="background-color :#ffffff;  margin: auto; position: absolute ; top: 0px; left:180px;"><span id="adtext" class="text-danger">X</span></button>
		<img src="/jsp_chatting_project/carrot/img/당근광고.png" style="max-width: 80%;">
	</div>
	<%} %>
</body>
</html>