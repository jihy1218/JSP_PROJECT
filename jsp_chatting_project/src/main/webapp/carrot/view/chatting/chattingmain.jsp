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
		String roomname = "자유방";
		if(request.getParameter("roomname")!=null){
			roomname = request.getParameter("roomname");
		}
		ArrayList<Room> roomlist = MemberDao.getmMemberDao().getroom();
	%>
	<input type="hidden" value="<%=logininfo.getM_id()%>" id="m_id"> <input type="hidden" value="<%=roomname%>" id="roomname">
	<input type="hidden" value="<%=logininfo.getM_grade()%>" id="m_grade">
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
		<div style="border-radius: 15px; border: solid 2px #ff7915;" class="text-center">
			<div class="row">
				<div class="col-md-4">
					<div class="card m-2" style="border: solid 2px #ff7915; ">
						<div class="text-center">
							<%if(roomname!=null&&!roomname.equals("자유방")){ %>
							<div class="text-center">
								<button >친구추가</button>
								<button >차단하기</button>
							</div>
							<button onclick="outroom('<%=roomname%>')">방나가기</button>
							<%}else{ %>
								<input type="text" id="makeroom" class="col-md-8 offset-2 form-control mt-2" placeholder="방제목을입력해주세요!">						
             				<input type="hidden" id="m_grade" value="<%=logininfo.getM_grade()%>">
							<button class="btn btn-success" onclick="makeroom();" style="margin: 10px 0 10px 0;">방 만들기</button>
							<a href="/jsp_chatting_project/carrot/controller/quickentercontroller.jsp"><button class="btn btn-outline-success" style="margin: 10px 0 10px 0;">빠른입장</button></a>
							<%} %>
						</div>
					</div>
					<div class="card m-2 roomlist" style="border: solid 2px #ff7915;">
						<table class="table table-hover">
							<tr>
								<th style="color : #ff7915">현재방 : <span id="thisroom"><%=roomname %></span></th>
							</tr>
							<%for(Room room : roomlist){ %>
							<%if(room.getR_count()==2||logininfo.getM_grade()==1||room.getR_name().equals(roomname)){ %>
							<tr>
								<td><a style="color :#A39699;"> <%=room.getR_name() %> 입장불가 </a></td>
							</tr>
								
							<%}else{ %>
							<tr>
								<td><a class="text-info" href="javascript:void(0);" onclick="enterroom('<%=room.getR_name()%>','<%=roomname%>');" > <%=room.getR_name() %> 입장가능 </a></td>
							</tr>
							<%}} %>
						</table>
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
						<div class="text-center">
							<div id="msgbox">	<!-- 채팅창 -->
								<!-- 채팅 메시지가 추가 되는 위치 -->
							</div>
							<div class="row no-gutters">	<!-- 채팅입력 창  , 전송버튼 -->
								<div class="col-md-10"><!-- 채팅입력 창 -->
									<input id="msginput" class="form-control" type="text" placeholder="내용 입력" onkeyup="entersend();">
								</div>
								<div class="col-md-2">	<!-- 전송버튼 -->
									<button class="form-control" onclick="btnsend()">전송</button>
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
		// 채팅창자리
		var msgbox =  document.getElementById("msgbox");
		var webSocket = new WebSocket("ws://localhost:8081/jsp_chatting_project/chatting/"+roomname+"/"+loginid);
		if(roomname!="null"){
			webSocket = new WebSocket("ws://localhost:8081/jsp_chatting_project/chatting/"+roomname+"/"+loginid);
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
			var msg = loginid +","+time+","+msginput;
			// 입력된 문자 와 날짜를 채팅발 div 에 추가
			if(count=="0"){
				msgbox.innerHTML += "<div class='d-flex justify-content-center mx-2 my-2'><span class='openroom'>"+loginid+"님이 입장했습니다.</span></div>";
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
			var msg = loginid +","+time+","+msginput;
			// 입력된 문자 와 날짜를 채팅발 div 에 추가
			if(count=="0"){
				msgbox.innerHTML += "<div class='d-flex justify-content-center mx-2 my-2'><span class='openroom'>"+loginid+"님이 입장했습니다.</span></div>";
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
			if(count=="0"){
				msgbox.innerHTML += "<div class='d-flex justify-content-center mx-2 my-2'><span class='openroom'>"+from+"님이 입장했습니다.</span></div>";
				count++;
			}
			msgbox.innerHTML += "<div class='profile d-flex justify-content-start mx-2 my-2'>"+from+"</div>"
			msgbox.innerHTML += "<div class='d-flex justify-content-start mx-2 my-2'><span class='to mx-1'>"+msg+"</span><span class='msgtime d-flex align-items-end'>"+time+"</span></div>"
			msgbox.scrollTop = msgbox.scrollHeight; // 현 스크롤 위치 =  스크롤 전체높이 [ 바닥 ]
		}
		
	</script>
	
	
	<%@include file="../footer.jsp" %>
	<script type="text/javascript">
	
	
	</script>
</body>
</html>


























