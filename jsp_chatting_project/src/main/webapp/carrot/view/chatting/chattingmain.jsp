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
		System.out.print(folderpath+logininfo.getM_img());
	%>
	<input type="hidden" value="<%=logininfo.getM_id()%>" id="m_id"> <input type="hidden" value="<%=roomname%>" id="roomname">
	<input type="hidden" value="<%=logininfo.getM_grade()%>" id="m_grade"><input type="hidden" value="<%=logininfo.getM_nickname()%>" id="m_nickname">
	<input type="hidden" value="<%=roomname %>" id="thisroom" ><input type="hidden" value="<%=logininfo.getM_img()%>" id="m_img">
	<div class="background">
		<div class="window">
			<div class="popup">
				<button id="close" class="btn btn-light" style="float: right; display: block;"><span class="text-danger">X</span></button>
				<div style=" margin: 35px 0 33px 0;">
					<p style="font-weight: bold; text-align: center"> 채팅방 이용시 바르고 고운말부탁드립니다.<br>
					비속어,욕설 사용시 이용이 제한 될 수 있습니다.<br>
					즐거운 이용되세요.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div style="border-radius: 28px; border: solid 1px #D9D9D9; height: 750px;" class="text-center">
			<div class="row">
				<div class="col-lg-4" style="">
					<div  style="height: 116px;">
						<form action="chattingmain.jsp?search=<%=keyword %>" class="text-center" id="room_title">
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
							<div id="nowroomname"><%=roomname %></div>
						</div>
						<div class="text-center">
							<div id="msgbox">	<!-- 채팅창 -->
								<!-- 채팅 메시지가 추가 되는 위치 -->
								
							</div>
							<div class="row no-gutters" id="chattingserch">	<!-- 채팅입력 창  , 전송버튼 -->
								<div class="col-md-9"><!-- 채팅입력 창 -->
									<input id="msginput" class="form-control" type="text" placeholder="내용 입력" onkeyup="entersend();" maxlength="30">
								</div>
								<form class="col-md-1" id="emoji" action="">
									<a class="nav-link dropdonw-toggle text-dark" href="#" id="navbarDropdown" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false" ><i class="far fa-smile-beam"></i></a>
									<select class="dropdown-menu"><!-- 드랍다운메뉴 -->
										<a class="dropdown-item"><i class="far fa-smile-beam"></i></a><!-- 드랍다운 아이템 -->
										<a class="dropdown-item"><i class="far fa-surprise"></i></a>
										<a class="dropdown-item"><i class="far fa-sad-cry"></i></a>
										<a class="dropdown-item"><i class="far fa-grin-squint-tears"></i></a>	
									</select> <!-- 버튼들을a태그로 할지 생각해봐야함 -->
								</form>
								<div class="col-md-2">	<!-- 전송버튼 -->
									<button id="btnmsginput" class="form-control" onclick="btnsend();">전송</button>
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
		var modal = document.getElementById("thisroom").innerHTML;
		if(modal!="자유방"){
		  document.querySelector(".background").className = "background show";
			
		}
		function close () { // modal 닫기
		  document.querySelector(".background").className = "background";
		}	// 백그라운드의 클래스 이름을 background show 에서 background로 바꿔서 modal이 닫히게

		document.querySelector("#close").addEventListener('click', close);	
			// querySelector는 구체적인 그룹과 일치하는 문서 안의 첫번째 엘리먼트를 반환 없으면 null 반환
			// 설명 :  id값이라서 #show 를 클릭하면 클릭시 이벤트를 show로 설정 
			// addEventListener은 이벤트를 등록하는 가장 권장되는 방식
		// 방이름
		var count=0;
		var roomname = document.getElementById("roomname").value;
		// 현재아이디
		var loginid = document.getElementById("m_id").value;
		// 현재 닉네임
		var nickname = document.getElementById("m_nickname").value;
		// 보낸사람 프사
		var fromimg = document.getElementById("m_img").value;
		// 채팅창자리
		var msgbox =  document.getElementById("msgbox");
		var webSocket = new WebSocket("ws://localhost:8082/jsp_chatting_project/chatting/"+roomname+"/"+loginid);
		if(roomname!="null"){
			webSocket = new WebSocket("ws://localhost:8082/jsp_chatting_project/chatting/"+roomname+"/"+loginid);
		}
		
		
		webSocket.onopen = function( event ) { onOpen(event) }; // 웹소켓 실행시 메소드 
		webSocket.onclose = function( event ) { onClose(event) }; // 웹소켓 종료시 메소드 
		webSocket.onmessage = function( event ) { onMessage(event) }; // 웹소켓 메시지전송 메소드 
		webSocket.onerror = function( event ) { onError(event) }; // 웹소켓 오류 메소드 
		
		function onOpen(event) {
			alert(roomname + " 에 접속 되었습니다.");
			msgbox.innerHTML += "<div class='d-flex justify-content-center mx-2 my-2'><span class='openroom'>"+roomname+"에 입장했습니다.</span></div>";
		}
		function onClose(event) { 
			alert("퇴장 했습니다.");
			count==0;
		}
		function onError(event) { alert( "에러사유 :"+event.data +"[관리자에게문의]" );}
		
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
			if(count=="0"){
				msgbox.innerHTML += "<div class='d-flex justify-content-center mx-2 my-2'><span class='openroom'>"+nickname+"님이 입장했습니다.</span></div>";
				count++;
			}
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
				if(count=="0"){
					msgbox.innerHTML += "<div class='d-flex justify-content-center mx-2 my-2'><span class='openroom'>"+nickname+"님이 입장했습니다.</span></div>";
					count++;
				}
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
			if(count=="0"){
				msgbox.innerHTML += "<div class='d-flex justify-content-center mx-2 my-2'><span class='openroom'>"+from+"님이 입장했습니다.</span></div>";
				count++;
			}
			msgbox.innerHTML += "<div class='row' style='text-align: justify;'><div class='d-flex justify-content-start profileimg'><img src='../../upload/곰.jpg'></div><div class='align-middle'><span class='my-2 mx-2'>"+from+"</span><div class='d-flex justify-content-start mx-2 my-2'><span class='to mx-1'>"+msg+"</span><span class='msgtime d-flex align-items-end'>"+time+"</span></div></div></div>"
			msgbox.scrollTop = msgbox.scrollHeight; // 현 스크롤 위치 =  스크롤 전체높이 [ 바닥 ]
		}
		
	</script>


										
	
	<%@include file="../footer.jsp" %>
	<script type="text/javascript">
	
	
	</script>
</body>
</html>


























