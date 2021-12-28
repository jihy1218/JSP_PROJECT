package dao;

import java.util.ArrayList;

import dto.Board;
import dto.Reply;

public class BoardDao extends DB {
	public static BoardDao boardDao = new BoardDao();
	public static BoardDao getboardDao() {return boardDao;}
	
	// 게시물 작성
	public boolean boardwrite(Board board) {
		String sql="insert into board(b_title, b_contents, m_no) values(?,?,?)";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, board.getB_title());
			preparedStatement.setString(2, board.getB_contents());
			preparedStatement.setInt(3, board.getM_no());
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("게시물 작성 오류:"+e);} return false;
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
	
	

	// 게시불 번호의 해당 게시물 가져오기
	public Board getboard(int b_no) {
		String sql="select * from board where b_no=?";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, b_no);
			resultSet=preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				Board board = new Board(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getInt(5), resultSet.getString(6), resultSet.getInt(7), resultSet.getInt(8));
				return board;
			}
		} catch (Exception e) {System.out.println("게시물 번호 해당 게시물 가져오기 오류");} return null;
	}
	
	// 조회수 증가
	public boolean boardcount(int b_no) {
		String sql="update board set b_view = b_view+1 where b_no=?";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, b_no);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("조회수 증가 오류");} return false;
	}
	
	// 댓글 등록 메소드
	public boolean replywrite(Reply reply) {
		String sql="insert into reply(r_contents, m_no, b_no) values(?,?,?)";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, reply.getR_contents());
			preparedStatement.setInt(2, reply.getM_no());
			preparedStatement.setInt(3, reply.getB_no());
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("댓글 등록 오류");} return false;
	}
	
	// 댓글 삭제
	public boolean replydelete(int r_no) {
		String sql="delete from reply where r_no=?";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, r_no);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("댓글 삭제 오류");} return false;
	}
	
	// 현재 게시물의 댓글만 가져오기
	public ArrayList<Reply> replylist(int b_no) {
		ArrayList<Reply> replist = new ArrayList<Reply>();
		String sql = "select * from reply where b_no=?";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, b_no);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				Reply reply = new Reply(
						resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
						resultSet.getString(4), resultSet.getInt(5));
				replist.add(reply);
			} return replist;
		} catch (Exception e) {System.out.println("현재 게시물 댓글 불러오기 오류");} return null;
	}
	
	// 게시물 삭제
	public boolean boaderdelete(int b_no) {
		String sql = "delete from board where b_no=?";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, b_no);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("게시물 삭제 오류");} return false;
	}
	
	// 게시물 수정
	public boolean boardupdate(Board board) {
		String sql = "update board set b_title = ?, b_contents=? where b_no = ?";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, board.getB_title());
			preparedStatement.setString(2, board.getB_contents());
			preparedStatement.setInt(3, board.getB_no());
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("게시물 수정 오류");} return false;
	}
	
	
	

	

	
	
	
}