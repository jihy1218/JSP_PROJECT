function boardwrite() {
	alert("글을 작성했습니다");
	
	var b_title = document.getElementById("title").value;
	var b_contents = document.getElementById("contents").value;
	var b_file = document.getElementById("file").value;
	var m_no = document.getElementById("m_no").value;
	
	$.ajax({
		url: "../../controller/boardwirtecontroller.jsp",
		data:{title:b_title, contents:b_contents, }
	});
}
	
function boarddelete(b_no) {
	var b_no = b_no;
	
	if(confirm("삭제 하시겠습니까?")==true){
		$.ajax({
			url : "../../controller/boarddeletecontroller.jsp",
			data: {b_no:b_no} ,
			success: function(result){
				if(result==1) {
					alert("게시물이 삭제 되었습니다.");
					location.href="boardlist.jsp";
				} else {
					alert("[게시물 삭제 오류] 관리자에게 문의 해 주세요");
				}
			}
		});
	}
	
	
}

