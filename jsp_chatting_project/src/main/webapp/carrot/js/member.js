/*차단목록 온오프버튼 start*/
function blocktablebtn(){
	document.getElementById("blocktable").style.display="";
}
/*차단목록 온오프버튼 end*/
/*차단목록 삭제버튼 start*/
function blockdeletebtn(){
	// 나중에 추가해도될듯
}
/*차단목록 삭제버튼 end*/
/*아이디 비번찾기 유효성 검사 start*/
function findidcheck(){
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var emailj = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;//이메일 정규 표현식
	//이메일
	if(!emailj.test(email)){
		document.getElementById("emailresult").innerHTML="이메일 형식으로 재입력해주세요.";
		document.getElementById("emailresult").style.color="red";
		return false;
	}else{
		document.getElementById("emailresult").innerHTML="사용 가능한 이메일입니다.";
		document.getElementById("emailresult").style.color="green";
	}
}
function findpasswordcheck(){
	var id = document.getElementById("id").value;
	var email = document.getElementById("email").value;
	var emailj = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;//이메일 정규 표현식
	//이메일
	if(!emailj.test(email)){
		document.getElementById("emailresult").innerHTML="이메일 형식으로 재입력해주세요.";
		document.getElementById("emailresult").style.color="red";
		return false;
	}else{
		document.getElementById("emailresult").innerHTML="사용 가능한 이메일입니다.";
		document.getElementById("emailresult").style.color="green";
	}
}
/*아이디 비번찾기 유효성 검사 end*/
/*아이디 비번찾기 start*/
function findid(){
		
}
/*아이디 비번찾기 end*/