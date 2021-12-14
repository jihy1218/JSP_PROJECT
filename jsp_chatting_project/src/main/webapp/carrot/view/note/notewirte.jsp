<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<!-- 쪽지 페이지 -->
	<div class="container">
		<form>
  			<div class="form-row">
    			<div class="form-group col-md-1">
     				 <input type="text" class="form-control" id="nid" placeholder="아이디">
   			 	</div>
    			<div class="form-group col-md-3">
      				<input type="text" class="form-control" id="nwirte" placeholder="받으실 아이디를 입력해주세요.">
    			</div>
    		</div>
    		<div>
    			<div class="form-group col-md-7">
      				<textarea rows="20" cols="100" name="ncontents" placeholder="보낼 내용을 입력해주세요."></textarea><br>
    			</div>
    			<div class="form-group col-md-7 text-center">
    			<input type="submit" class="btn btn-success" value="보내기">
    			</div>
  			</div>
  		</form>
	</div>
</body>
</html>