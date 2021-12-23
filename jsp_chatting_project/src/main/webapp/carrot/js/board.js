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