/**
 * 
 */
	
	function go(){
		setInterval(dbload, 2000);
	}
	
	function dbload(){
		$.ajax({ 
			
			url :  "/jsp_chatting_project/carrot/view/friendbar.jsp" ,
			success : function( result ){
				
			}
	});
	}
	
	function frienddelete(){
		var f_no = document.getElementById("f_no").value;
		if(confirm("차단을 취소할까요?")==true){
		$.ajax({
			url : "../../controller/frienddeletecontroller.jsp",
			data : {
				f_no : f_no
			},
		
			success : function(result){
				if(result==1){
					alert("삭제 되었습니다");
					location.reload();	
				}else{
					alert("삭제 오류");
					location.reload();
				}
				
				
			}
		})
		}
	}
	




