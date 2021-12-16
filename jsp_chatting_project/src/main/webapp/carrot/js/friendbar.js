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




