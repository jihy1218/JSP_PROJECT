
//



////////////////  쪽지 보내기  //////////////
	function notesend(){
		var n_from = document.getElementById("n_from").value;
		var n_to = document.getElementById("n_to").value;
		var n_contents = document.getElementById("n_contents").value;
		if(n_to==""){
			alert("수신자를 입력해주세요");
			return;
		}
		if(n_contents==""){
			alert("내용을를 입력해주세요");
			return;
		}
		$.ajax({
			url:"../../controller/notewirtecontroller.jsp",
			data:{
				n_from: n_from,
				n_to : n_to,
				n_contents : n_contents
			},
			success : function(result){
				if(result==1){
					alert("쪽지 보냈습니다");
					location.reload;
				}else{
					alert("수신인을 확인해주세요");
					location.reload;
				}
			}
		})
	}
////////////////  쪽지 보내기 끝 //////////////



////////////////  쪽지 삭제 //////////////////

	function notedelete(n_no){
		var n_no = n_no*1;
		$.ajax({
			url:"../../controller/notedeletecontroller.jsp",
			data:{
				n_no:n_no
			},
			success : function(re){
				if(re==1){
					alert("삭제 되었습니다");
					location.href="notelist.jsp";
				}else{
					alert("삭제 되었습니다");
					location.href="notelist.jsp";
				}
			}
		})
	}
























