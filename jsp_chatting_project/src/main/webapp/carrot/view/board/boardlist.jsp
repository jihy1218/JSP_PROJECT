<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
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
   <%   
      //검색처리 :키워드 입력하고 검색 버튼을 눌렀을떄
      String key =request.getParameter("key");
      String keyword = request.getParameter("keyword");
      
      //페이지 처리
      String pagenum = request.getParameter("pagenum"); // 클릭한 페이지번호
         if(pagenum==null){// 클릭한 페이지번호가 없으면 [게시판 첫화면]
             pagenum="1"; // 고것을 1페이지로 설정
         }
      int lastrow =BoardDao.getboardDao().boardcount(key, keyword); // 총게시물수
      int listsize = 10; //페이지당 화면에 표시될 게시물수

      int lastpage =0; //3. 마지막 페이지
      if(lastrow%listsize==0){ // 만약에 총게시물 페이지당 게시물 나머지가 없으면 
          lastpage=lastrow/listsize;   // 총게시물 페이지당 게시물
      }else{
          lastpage=lastrow/listsize+1;// 총게시물 페이지당 게시물~!~!
      }
      int currentpage = Integer.parseInt(pagenum); // 현재 페이지 번호 입니다
      int startrow =(currentpage-1)*listsize;// 현재 페이지의 시작번호 입니다
      // 등록 시 
      ArrayList<Board> boards = BoardDao.getboardDao().boardlist(startrow, listsize, key, keyword);
   %>
   
   <div class=container>
      <h3> 자유 게시판 </h3>
      <br><br>
      <div class="row">
         <button class="mr-2 ml-3 btn btn-outline-danger"> 전체글 </button>      
         <button class="btn btn-outline-success"> 인기글 </button>
         <a href="boardwrite.jsp" ><button style="background-color:green;">글쓰기</button></a>
      
      </div><br>
      
      
   <table class="table">
      <tr style="border-top: solid 2px navy; border-bottom: solid 1.5px navy;">
         <th>번호</th>
         <th>제목</th>
         <th>글쓴이</th>
         <th>작성일</th>
         <th>조회수</th>
         <th>추천</th>
      </tr>
      <%
         for(Board board : boards){%>
         <tr>
            <td><%=board.getB_no() %></td>
            <td><a href ="boardview.jsp?b_num=<%=board.getB_no()%>"><%=board.getB_title() %></a></td>
            <td><%=board.getM_no() %></td>
            <td><%=board.getB_date() %></td>
            <td><%=board.getB_view() %></td>
            <td><%=board.getB_like() %></td>
         </tr>
      
      <%} %>
   
   </table>
   <!-- 페이징 시작 -->
      <div class="row">
         <div class ="col-md-4 offset-4 my-3">
         <ul class="pagination">
               <% if( currentpage == 1){ %>
               <%if(keyword==null){ %>
               <li class="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage%>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 이전 </a> </li>
               <%}else{%>
               <li class="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage%>" class="page-link"> 이전 </a> </li>   
               <%} %>
            <%}else{ %>   
               <li class ="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage-1%>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"></a></li>
            <%} %>      
            
            <!-- 게시물 의 수만큼 페이지 번호를 생성합니다 -->
            <%for(int i =1 ; i<=5; i++) {%>
               <li class="page-item"><a href="boardlist.jsp?pagenum=<%=i%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link"><%=i %></a></li>
            <%} %>      
            <!-- 마지막 페이지에서 다음버튼 눌렀을떄 마지막페이를 고정해야만해오 -->
            <% if(currentpage == lastpage) {%>
               <li class ="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage%>&key=<%=key%>&keyword=<%=keyword%>"class="page-link">다음</a></li>
            <%}else{ %>
               <li class="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage+1 %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 다음 </a> </li>   
            <%} %>
         </ul>
         </div>
      </div>
   <!-- 검색 -->
   <form action ="boardlist.jsp?pagenum=<%=currentpage %>"method="get" class="col-md-5 offset-3 input-group my-3">
      <select class="custom-select col-cmd-3" name="key">
         <option value="b_title">제목</option>
         <option value="b_no">번호</option>
         <option value="m_no">작성자</option>
      </select>
      <input type="text" class="form-control" name="keyword"><!-- keyword 검색대상~! -->
      <input type="submit"class=btn-outline-info value="검색">
   </form>
</div>
   
   
   
   
</body>
</html>