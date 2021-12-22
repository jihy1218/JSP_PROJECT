<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp" %>
<%@include file="../friendbar.jsp" %>
	<div class=container>
		<h3> 자유 게시판 </h3>
		<br><br>
		<div class="row">
			<button class="mr-2 ml-3 btn btn-outline-danger"> 전체글 </button>		
			<button class="btn btn-outline-success"> 인기글 </button>
		</div><br>
		
	<table class="table">
		<tr style="border-top: solid 2px navy; border-bottom: solid 1.5px navy;">
			<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th><th>추천</th>
		</tr>
		<tr>
			<td>1</td><td>안녕하세요</td><td>홍길동</td><td>2021-12-20</td><td>0</td><td>1</td>
		</tr>
		<tr>
			<td>2</td><td>안녕하세요</td><td>홍길동</td><td>2021-12-20</td><td>1</td><td>2</td>
		</tr>
	</table>
	<div class="row">
		<div class="col-md-2 offset-10">
			<a href="boardwrite.jsp"><button type="button" class="form-control">글 등록</button></a>
		</div>
		
		<nav aria-label="...">
		  <ul class="pagination">
		    <li class="page-item disabled">
		      <span class="page-link">Previous</span>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item">
		      <span class="page-link"> 2
		        <span class="sr-only">(current)</span>
		      </span>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">Next</a>
		    </li>
		  </ul>
		</nav>
		
		<form action="" method="get" class="col-md-5 offset-3 input-group my-3">
			<select class="custom-select col-cmd-3" name="key">
				<option value="b_title"> 제목 </option>
				<option value="b_contents"> 내용 </option>
				<option value="m_no"> 작성자 </option>
				<option value="r_no"> 댓글 </option>
			</select>
			<input type="text" class="form-control" name="keyword">
			<input type="submit" class="btn btn-outline-info" value="검색">
		</form>
	</div>
	</div>
	<br><br><br><br><br><br><br>
</body>
</html>