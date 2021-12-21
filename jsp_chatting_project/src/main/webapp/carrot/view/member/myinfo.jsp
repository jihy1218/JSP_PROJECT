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
	<%@include file="../friendbar.jsp" %>
	<%
		//친구 목록
		friends = FriendDao.getFriendDao().getfriendelist(m_no,2);
		//친구목록 받아와서
		ArrayList<Member> blocklist = new ArrayList<>();
		for(Friend temp : friends){
			Member member = MemberDao.getmMemberDao().getinfo(temp.getM_no2());
			blocklist.add(member);
		}
	
	%>
	<div class="container">
		<div class="row">
			<div class="offset-3 col-md-6" style="max-width: 700px; margin:0 auto;">
				<div style="text-align: center;">
					<h3>내정보</h3>
					<br>
				</div>
				<table class="table text-center">
					<tr>
						<td>아이디</td><td><%=logininfo.getM_id() %> </td><td></td>
					</tr>
					<tr>
						<td>닉네임</td><td> <input class="form-control" type="text" placeholder=<%=logininfo.getM_nickname() %>> </td><td><button class="btn btn-secondary">수정하기</button></td>
					</tr>
					<tr>
						<td>비밀번호</td><td> <input class="form-control" type="password" > </td><td><button class="btn btn-secondary">수정하기</button></td>
					</tr>
					<tr>
						<td>이름</td><td><%=logininfo.getM_name() %> </td><td></td>
					</tr>
					<tr>
						<td>이메일</td><td><%=logininfo.getM_email() %> </td><td></td>
					</tr>
					<tr>
						<td>핸드폰번호</td><td><%=logininfo.getM_phone() %> </td><td></td>
					</tr>
					<tr>
						<td>회원등급</td><td> <%=logininfo.getM_grade()%> </td><td></td>
					</tr>
				</table>
				<br>
				<button class="btn btn-secondary" onclick="blocktablebtn();">차단목록</button>
				<table class="table text-center table-hover" id="blocktable" style="display: none;">
					<tr class="table-warning">
						<th>차단한닉네임</th><th>삭제하기</th>
					</tr>
					<%for(int i = 0 ; i<blocklist.size();i++){ %>
					<tr>
						<td><%=blocklist.get(i).getM_nickname() %></td>
						<td><button class="btn" onclick="frienddelete()">
						<span class="text-danger">X</span></button>
						<input type="hidden" id="f_no" value=<%=friends.get(i).getF_no()%>>
						</td>
					</tr>
					<%} %>
				</table>
				
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>