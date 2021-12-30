<%@page import="dto.Room"%>
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
	<%
		request.setCharacterEncoding("UTF-8");
		String folderpath = request.getSession().getServletContext().getRealPath("carrot/upload/");
		String roomname = "자유방";
		if(request.getParameter("roomname")!=null){
			roomname = request.getParameter("roomname");
		}
		String keyword = request.getParameter("keyword");
		ArrayList<Room> roomlist = MemberDao.getmMemberDao().getroom(keyword);
		//차단목록 문자열
		String blocknames = ",";
		//차단목록
		ArrayList<Friend> arrayList2 = FriendDao.getFriendDao().getfriendelist(m_no, 2);
		for(Friend friend : arrayList2){
			
			blocknames += MemberDao.getmMemberDao().getmemberid(friend.getM_no1())+",";
		}
		String userid =  (String)session.getAttribute("userid"); 
		System.out.print(blocknames);
	%>
	<input type="hidden" value="<%=logininfo.getM_id()%>" id="m_id"> <input type="hidden" value="<%=roomname%>" id="roomname">
	<input type="hidden" value="<%=logininfo.getM_grade()%>" id="m_grade"><input type="hidden" value="<%=logininfo.getM_nickname()%>" id="m_nickname">
	<input type="hidden" value="<%=roomname %>" id="thisroom" ><input type="hidden" value="<%=logininfo.getM_img()%>" id="m_img">
	<input type="hidden" id="blocknames" value="<%=blocknames%>">
	<input type="hidden" value="<%=folderpath %>" id="folderpath">
    <div class="background2">
      <div class="window2">
        <div class="popup2">
          <button class="btn btn-danger col-md-1 offset-11" style="border-radius: 9px;" id="close">X</button>
          <p class="text-center" style="font-weight: bold;">바르고 고운말 사용해주세요!<br>무심코 뱉은 말 한마디!<br>상대방에겐 상처입니다.
        </div>
      </div>
    </div>
	<div class="container">
		<div style="border-radius: 28px; border: solid 1px #D9D9D9; height: 750px;" class="text-center">
			<div class="row">
				<div class="col-lg-4" style="">
					<div  style="height: 116px;">
						<form action="chattingmain.jsp?roomname=<%=roomname %>&search=<%=keyword %>" class="text-center" id="room_title">
							<input type="hidden" value="<%=roomname%>" name="roomname">
							<div id="serch"><input type="text" id="makeroom" name="keyword"  class="intput1" placeholder="방제목을입력해주세요!"><input type="submit" id="btn1" value="검색"></div>					
             				<input type="hidden" id="m_grade" value="<%=logininfo.getM_grade()%>">
						</form>
					</div>
					<div class="roomlist" id="roomtable">
						<table class="table table-hover" >
							<tr>
								<td id="td_head" > <div class="td2"  style="color: #222222;">현재방 :<%=roomname %></div> </td>
							</tr>
							<%
								if(roomlist.size()==0){%>
								<tr>
									<td colspan="2">검색결과가 없습니다.</td>
								</tr>	
							<%
							}
							%>
							<%for(Room room : roomlist){ %>
							<%if(room.getR_count()==2||logininfo.getM_grade()==1||room.getR_name().equals(roomname)){ %>
							<tr>
								<td id="td1"> <div class="td3"><%=room.getR_name() %> 입장불가</div>  </td>
							</tr>
								
							<%}else{ %>
							<tr>
								<td id="td1"> <div class="td1"> <a class="td1" href="javascript:void(0);" onclick="enterroom('<%=room.getR_name()%>','<%=roomname%>')" > <%=room.getR_name() %> 입장가능  </a></div></td>
							</tr>
							<%}} %>
						</table>
						</div>
						<div style="border: solid 1px #E5E5E5; border-radius: 0px 0px 0px 28px; height: 131px;">
							<%if(roomname!=null&&!roomname.equals("자유방")){ %>
							<a href="/jsp_chatting_project/carrot/controller/quickentercontroller.jsp">
							<button id="btn_enter1" onclick="quickenter();" >빠른입장</button></a>
							<button id="btn_enter2" onclick="outroom('<%=roomname%>')"> 방나가기</button>
							<%}else{ %>
							<a href="/jsp_chatting_project/carrot/controller/quickentercontroller.jsp">
							<button id="btn_enter1" onclick="quickenter();" >빠른입장 </button></a>
							<button id="btn_enter2"  onclick="makeroom();" > 방 만들기  </button>
							<%} %>
						</div>
				</div>
				<div class="col-lg-8 col-sm-9" >
					<div class="card chattingmain">
						<div id="nowroom">
							<div id="nowroomname"><%=roomname %> <div id="username"> </div> </div>
						</div>
						<div class="text-center">
							<div id="msgbox">	<!-- 채팅창 -->
								<!-- 채팅 메시지가 추가 되는 위치 -->
								
							</div>
							<div class="row no-gutters" id="chattingserch">	<!-- 채팅입력 창  , 전송버튼 -->
								<div class="col-md-10"><!-- 채팅입력 창 -->
									<input id="msginput" class="form-control" type="text" placeholder="내용 입력" onkeyup="entersend();" maxlength="30">
								</div>
								<div class="col-md-2">	<!-- 전송버튼 -->
									<button id="btnmsginput" class="form-control" onclick="btnsend();">전송</button>
								</div>
								<div class="col-md-2">	<!-- 전송버튼 -->
									<form id="fileForm" method="post" enctype="multipart/form-data">
										<input type="file" name="file">
									</form>
									<button onclick="chattingfile()">파일보내기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br><br><br><br>
	</div>
	<script type="text/javascript">
		var modal = document.getElementById("thisroom").value;
		if(modal!="자유방"){
			document.querySelector(".background2").className = "background2 show2";
		}
		function close () { 
			document.querySelector(".background2").className = "background2";
		}

		document.querySelector("#close").addEventListener('click', close);
		// 방이름
		var count=0;
		// 파일경로
		var folderpath = document.getElementById("folderpath").value;
		var roomname = document.getElementById("roomname").value;
		// 현재아이디
		var loginid = document.getElementById("m_id").value;
		// 현재 닉네임
		var nickname = document.getElementById("m_nickname").value;
		// 보낸사람 프사
		var fromimg = document.getElementById("m_img").value;
		// 채팅창자리
		var msgbox =  document.getElementById("msgbox");
		
		var blocknames = document.getElementById("blocknames").value;
		
		var webSocket = new WebSocket("ws://localhost:8081/jsp_chatting_project/chatting/"+roomname+"/"+loginid+"/"+blocknames);
		
		webSocket.onopen = function( event ) { onOpen(event) }; // 웹소켓 실행시 메소드 
		webSocket.onclose = function( event ) { onClose(event) }; // 웹소켓 종료시 메소드 
		webSocket.onmessage = function( event ) { onMessage(event) }; // 웹소켓 메시지전송 메소드 
		webSocket.onerror = function( event ) { onError(event) }; // 웹소켓 오류 메소드 
		
		function onOpen(event) {
			alert(roomname + " 에 접속 되었습니다.");
		}
		function onClose(event) { 
			alert("퇴장 했습니다.");
		}
		function onError(event) { alert( "에러사유 :"+event.data +"[관리자에게문의]" );}
		
		function block(){
			
		}
				
		function btnsend() {
			// 1. 입력창에 입력된 데이터를 가져온다
			var msginput = document.getElementById("msginput").value;
				// 입력이 없을때 유효성검사 [ 전송 막기 ]
				if( msginput == ""){  return; }
			// 날짜 
			let today = new Date(); // js에서 현재 날짜/시간 객체 
			var time = today.toLocaleTimeString(); // 시간만 가져오기 
			// 누가 보냈는지 메시지에 포함 하기  	// 언제 보냈는지 시간도 메시지에 포함 하기 
			var msg = nickname +","+time+","+msginput+","+fromimg;
			// 입력된 문자 와 날짜를 채팅발 div 에 추가
			msgbox.innerHTML += "<div class='d-flex justify-content-end mx-2 my-2'><span class='msgtime d-flex align-items-end'>"+time+"</span><span class='from mx-1'>"+msginput+"</span></div>";
			webSocket.send( msg );	 // *****************서버로 부터 메시지 전송 
			document.getElementById("msginput").value = "";	// 전송후 입력창 내용물 지우기 [ 초기화 ]
			// 스크롤 있을경우 스크롤 위치를 가장 아래로 이동 
			msgbox.scrollTop = msgbox.scrollHeight; // 현 스크롤 위치 =  스크롤 전체높이[ 바닥 ] */
			
		}
		function entersend() {
			// 1. 입력창에 입력된 데이터를 가져온다
			if(window.event.keyCode == 13){
				var msginput = document.getElementById("msginput").value;
					// 입력이 없을때 유효성검사 [ 전송 막기 ]
					if( msginput == ""){  return; }
				// 날짜 
				let today = new Date(); // js에서 현재 날짜/시간 객체 
				var time = today.toLocaleTimeString(); // 시간만 가져오기 
				// 누가 보냈는지 메시지에 포함 하기  	// 언제 보냈는지 시간도 메시지에 포함 하기 
				var msg = nickname +","+time+","+msginput+","+fromimg;
				// 입력된 문자 와 날짜를 채팅발 div 에 추가
				msgbox.innerHTML += "<div class='d-flex justify-content-end mx-2 my-2'><span class='msgtime d-flex align-items-end'>"+time+"</span><span class='from mx-1'>"+msginput+"</span></div>";
				webSocket.send( msg );	 // *****************서버로 부터 메시지 전송 
				document.getElementById("msginput").value = "";	// 전송후 입력창 내용물 지우기 [ 초기화 ]
				// 스크롤 있을경우 스크롤 위치를 가장 아래로 이동 
				msgbox.scrollTop = msgbox.scrollHeight; // 현 스크롤 위치 =  스크롤 전체높이[ 바닥 ] */
			}
		}
		function onMessage(event) {
			var from = event.data.split(",")[0];	// , 기준으로 문자열 분리해서 첫번째 문자열
			var time = event.data.split(",")[1];	// , 기준으로 문자열 분리해서 두번째 문자열
			var msg = event.data.split(",")[2];		// , 기준으로 문자열 분리해서 세번째 문자열
			var img = event.data.split(",")[3];	
			var love = event.data.split(",")[4];
			
			if(love!=null){
				msg=love
			}
			
			if(msg=="enter"){
				msgbox.innerHTML +=	"<div class='d-flex justify-content-center mx-2 my-2'><span class='openroom'>"+from+"님이 입장했습니다.</span></div>"
			}
			else if(msg=="out"){
				msgbox.innerHTML +=	"<div class='d-flex justify-content-center mx-2 my-2'><span class='openroom'>"+from+"님이 퇴장했습니다.</span></div>"
			}
			else{
				msgbox.innerHTML += "<div class='row' style='text-align: justify; width:682px;'><div class='d-flex justify-content-start profileimg'><img src='/jsp_chatting_project/carrot/upload/"+img+"'></div><div class='align-middle'><a href='#none' class='my-2 mx-2' style='color : black;' id='you' onclick='blockuser()'>"+from+"</a><div class='d-flex justify-content-start mx-2 my-2'><span class='to mx-1'>"+msg+"</span><span class='msgtime d-flex align-items-end'>"+time+"</span></div></div></div>"
			}
			msgbox.scrollTop = msgbox.scrollHeight; // 현 스크롤 위치 =  스크롤 전체높이 [ 바닥 ]

		}
		
	</script>


										
	
	<%@include file="../footer.jsp" %>
	<script type="text/javascript">
	
	
	</script>
</body>
</html>


























