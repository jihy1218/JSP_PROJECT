<%@page import="dao.NoteDao"%>
<%@page import="dao.FriendDao"%>
<%@page import="dto.Friend"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		Member logininfo = (Member)session.getAttribute("login");
		int m_no =	logininfo.getM_no();
		//친구 목록
		ArrayList<Friend> friends = FriendDao.getFriendDao().getfriendelist(m_no);
		//친구 정보
		ArrayList<Member> friendsinfolist = new ArrayList<>();
		//친구목록 받아와서
		for(Friend temp : friends){
			if(temp.getM_no1()==m_no){
				Member member = MemberDao.getmMemberDao().getinfo(temp.getM_no2());
				friendsinfolist.add(member);
			}else if (temp.getM_no2()==m_no){
				Member member = MemberDao.getmMemberDao().getinfo(temp.getM_no1());
				friendsinfolist.add(member);
			}
		}
	%>
	<div class="sidebar">
    <span class="sidebar-brand">
    	<br><br><br><br>
        <a href="javascript:void(0)" data-toggle="sidebar"><i class="glyphicon glyphicon-arrow-left"></i> HIDE</a><br>
        <span>친구 목록 </span>
    </span>
    <ul class="sidebar-nav">
        <li>
            <a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-1">로그인된 친구</a>
            <ul id="menu-collapse-1" class="collapse in">
            	<%for(Member loginM : friendsinfolist) {%>
            	<%if(loginM.getM_logincheck()==1){ %>
                <li>
                	<div class="row">
	                	<div class="col-md-4 offset-1">
	                		<span><%=loginM.getM_name() %></span><span style="color: #3BA55D;"><i class="fas fa-circle"></i></span>
	                	</div>
	                	<div class="col-md-5">
	                		<a class="message" href="/jsp_chatting_project/carrot/view/note/notelist.jsp?n_from=<%=loginM.getM_no()%>">
	                		<button class="form-control"><i class="far fa-sticky-note"></i><span class="text-danger">
	                		<%if(NoteDao.getNoteDao().countN_check(loginM.getM_no(), m_no)!=0)out.print(NoteDao.getNoteDao().countN_check(loginM.getM_no(), m_no)); %> 
	                		</span></button></a>
	                	</div>
                	</div>
                </li>
                <%}} %>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-2">
               로그아웃 친구
            </a>
            <ul id="menu-collapse-2" class="collapse in">
            	<%for(Member logoutM : friendsinfolist) {%>
            	<%if(logoutM.getM_logincheck()==2){ %>
                <li>
                	<div class="row">
	                	<div class="col-md-4 offset-1">
	                		<span><%=logoutM.getM_name() %></span><span style="color: #747F8D;"><i class="far fa-circle"></i></span>
	                	</div>
	                	<div class="col-md-5">
	                		<a class="message" href="/jsp_chatting_project/carrot/view/note/notelist.jsp?n_from=<%=logoutM.getM_no()%>">
	                		<button class="form-control"><i class="far fa-sticky-note"></i><span class="text-danger">
	                		<%if(NoteDao.getNoteDao().countN_check(logoutM.getM_no(), m_no)!=0)out.print(NoteDao.getNoteDao().countN_check(logoutM.getM_no(), m_no)); %> 
	                		</span></button></a>
	                	</div>
                	</div>
                </li>
                <%} }%>
            </ul>
        </li>
        <li>
       		<img src="/jsp_chatting_project/carrot/img/당근친구만들기.png">
        </li>
    </ul>
</div>

<!-- 사이드바 열기 버튼 -->
<!-- 결제한 사람이면 바로 친구목록 아니면 결제페이지 이동 --> 
<a href="javascript:void(0)" data-toggle="sidebar" style="margin: auto; position: fixed; top: 120px; right:180px;">
	<button class="btn"><i class="fas fa-users fa-2x" style="color: #3f7d1b;"></i></button>
</a>
 

</body>

</html>