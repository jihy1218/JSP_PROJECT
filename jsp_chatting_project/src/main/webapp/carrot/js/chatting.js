function makeroom(){
	var m_grade = document.getElementById("m_grade").value;
	var title = document.getElementById("title").value;
	if(m_grade==1){
		if(confirm("프리미엄이되시면 누리실수있습니다. 가입하시겠습니까?")==true){
			location.href="/jsp_chatting_project/carrot/view/payment.jsp";
		}
	}else{
		$.ajax({
			url : "/jsp_chatting_project/carrot/controller/makeroomcontroller.jsp",
			data : {title : title},
			success : function(result){
				alert("채팅방개설완료");
				location.href="chattingroom.jsp";
			}
		})
	}
}


function makeroom(){
	var makeroom = document.getElementById("makeroom").value;
	var m_grade = document.getElementById("m_grade").value*1;
	if(m_grade==1){
		alert("등급을 올려주세요");
		return;
	}
	if(makeroom==""){
		alert("방제목을 입력해주세요");
		return;
	}
	if(confirm("방을 팔까요?")==true){
		$.ajax({
			url : "/jsp_chatting_project/carrot/controller/makeroomcontroller.jsp",
			data : {
				makeroom : makeroom
				},
			success : function(result){
				if(result==1){
					alert("방이만들어졌습니다");
					location.href="chattingmain.jsp?roomname="+makeroom;
				}else{
					alert("동일한 이름의 방이 존재합니다");
					location.href="chattingmain.jsp";
				}
				
				
			}
		})
	}	
}
	
	function enterroom(enter,close){
		
		if(confirm("입장할까요?")==true){
			$.ajax({
				url : "/jsp_chatting_project/carrot/controller/enterroomcontroller.jsp",
				data : {
					enter : enter,
					close : close
					},
				success : function(result){
					if(result==1){
						alert("입장했습니다");
						location.href="chattingmain.jsp?roomname="+enter;
					}else{
						alert("방이 가득찼습니다");
						location.href="chattingmain.jsp";
					}
					
					
				}
			})
	}
	}
	
	function outroom(makeroom){
		if(confirm("나갈까요?")==true){
			$.ajax({
				url : "/jsp_chatting_project/carrot/controller/outroomcontroller.jsp",
				data : {
					makeroom : makeroom
					},
				success : function(result){
					if(result==1){
						alert("나갔습니다");
						location.href="chattingmain.jsp";
					}else{
						alert("나가기 오류");
						location.href="chattingmain.jsp";
					}
					
					
				}
			})
	}
	}




































