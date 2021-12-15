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
	<br><br><br><br><br>
	<!-- 쪽지 리스트 페이지 -->
	<div class="container">
		<table class="table" style="max-width: 1000px; margin: 0 auto;">
			<tr>
				<th> No. </th> <th> 제목 </th> <th> 작성자 </th> <th> 작성일 </th> <th> 삭제 </th>
			</tr>
			<tr>
				<td> 1 </td> <td><a href="noteview.jsp">안녕하세요</a></td> <td> 홍길동 </td> <td> 2021.12.15. </td> <td><button class="btn btn-danger">X</button></td>
			</tr>
			<tr>
				<td> 2 </td> <td> 안녕하세요 </td> <td> 홍길동 </td> <td> 2021.12.15. </td> <td><button class="btn btn-danger">X</button></td>
			</tr>
			<tr>
				<td> 3 </td> <td> 안녕하세요 </td> <td> 홍길동 </td> <td> 2021.12.15. </td> <td><button class="btn btn-danger">X</button></td>
			</tr>
			<tr>
				<td> 4 </td> <td> 안녕하세요 </td> <td> 홍길동 </td> <td> 2021.12.15. </td> <td><button class="btn btn-danger">X</button></td>
			</tr>
			<tr>
				<td> 5 </td> <td> 안녕하세요 </td> <td> 홍길동 </td> <td> 2021.12.15. </td> <td><button class="btn btn-danger">X</button></td>
			</tr>
		</table>
		<div class="row">
			<div class="col-md-4 offset-4">
				<ul class="pagination">
					<li><button class="btn">이전</button></li>
					<li><button class="btn">1</button></li><li><button class="btn">2</button></li><li><button class="btn">3</button></li>
					<li><button class="btn">4</button></li><li><button class="btn">5</button></li><li>
					<button class="btn">다음</button></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>