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
				location.reload();
			}
		})
	}
}