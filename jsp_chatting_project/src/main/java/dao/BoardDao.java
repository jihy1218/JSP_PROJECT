package dao;

import java.util.ArrayList;

import dto.Board;

public class BoardDao extends DB {
	public static BoardDao boardDao = new BoardDao();
	public static BoardDao getboardDao() {return boardDao;}
	
	// 게시물 작성
	public boolean boardwrite(Board board) {
		String sql="insert into board(b_title, b_contents, b_file, m_no) values(?,?,?,?)";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, board.getB_title());
			preparedStatement.setString(2, board.getB_contents());
			preparedStatement.setString(3, board.getB_file());
			preparedStatement.setInt(4, board.getM_no());
			preparedStatement.executeQuery();
			return true;
		} catch (Exception e) {System.out.println("게시물 작성오류");} return false;
	}
	
//	// 모든 게시물 출력
//
//	public ArrayList<Board> boardlist(){
//	    ArrayList<Board>boards= new ArrayList<Board>();
//	    String sql = "select * from board order by b_no DESC";
//	    try {
//		preparedStatement = connection.prepareStatement(sql);
//		resultSet = preparedStatement.executeQuery();
//		while(resultSet.next()) {
//		    Board board2 = new Board(
//			    resultSet.getInt(1),
//			    resultSet.getString(2),
//			    resultSet.getString(3),
//			    resultSet.getString(4),
//			    resultSet.getInt(5),
//			    resultSet.getString(6),
//			    resultSet.getInt(7),
//			    resultSet.getInt(8));
//		    boards.add(board2);
//			   
//		}
//		return boards;
//	    } catch (Exception e) { 
//		System.out.println(e);
//	    }
//	    return null;  
//	}
	
	
	
	
	
	
	
	
	// 모든 게시물 출력

		public ArrayList<Board> boardlist(int startrow, int listsize, String key, String keyword){
		    ArrayList<Board>boards= new ArrayList<Board>();
		    String sql = null;
		    if(key ==null && keyword ==null) {// 검색이 없을경우
			sql = "select* from board order by b_no DESC limit ?, ?";
		    }else {// 검색이 있을경우
			if(key.equals("b_writer")) {
			  int  m_no = MemberDao.getmMemberDao().getmembernum(keyword); 			  
			    sql = "select * from board where m_no ="+m_no+" order by b_no desc limit ? , ?";
			}else if(key.equals(keyword)) {// 반호 검색 일치한 값만 검색
			    sql ="select * from board where b_no ="+keyword;
			}else {									//제목 혹은 내용 검색 : 포함된 값검색
			    sql ="select * from board where "+key+" like '%"+keyword+"%' order by b_no desc limit ? , ?";
			}
		    }
		    try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, startrow); preparedStatement.setInt(2, listsize);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
			    Board board = new Board(
				    resultSet.getInt(1),
				    resultSet.getString(2),
				    resultSet.getString(3),
				    resultSet.getString(4),
				    resultSet.getInt(5),
				    resultSet.getString(6),
				    resultSet.getInt(7),
				    resultSet.getInt(8));
				boards.add(board);
			}
			return boards;
		    } catch (Exception e) {System.out.println("boardlist123");}
			
		    return null;
		    
		}
	//게시물 개수 반환 메소드
	public int boardcount1(String key, String keyword) {
	    String sql = null;
	    if(key !=null && keyword !=null) {//검색이 있을떄 [조건 레코드 개수세기]
		if(key.equals("b_writer")) {
		    int m_no = MemberDao.getmMemberDao().getm_no(keyword);
		    sql="select count(*) from board where m_no ="+m_no;
		}else if(key.equals("b_no")){ // 번호 검색 : 일치한 값만 검색
		    sql="select count(*) from board where b_no ="+keyword;
		}else {								//제목 혹은 내용 검색 포함된값 검색
		    sql="select count(*) from board where "+key+" like '%"+keyword+"%'";
		}
	    }else {// 검색이 없을떄
		sql ="select count(*) from board";
	    }
	    try {
		 preparedStatement = connection.prepareStatement(sql);
		 resultSet = preparedStatement.executeQuery();
		 if(resultSet.next()) { return resultSet.getInt(1);
		     
		 }
	    } catch (Exception e) {System.out.println("boardcount1 이에오");}
	    return 0;
	}
	
	

	

}
