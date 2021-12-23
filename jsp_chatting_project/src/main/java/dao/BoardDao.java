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
		} catch (Exception e) {System.out.println("게시물 작성 오류");} return false;
	}
	
	// 모든 게시물 출력
	public ArrayList<Board> boardlist(){
		ArrayList<Board> boards= new ArrayList<Board>();
		String sql = "select * from board order by b_no DESC";
			try {
				preparedStatement = connection.prepareStatement(sql);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					Board board2 = new Board(
						resultSet.getInt(1),
						resultSet.getString(2),
						resultSet.getString(3),
						resultSet.getString(4),
						resultSet.getInt(5),
						resultSet.getString(6),
						resultSet.getInt(7),
						resultSet.getInt(8));
						boards.add(board2);}
						return boards;
	       } catch (Exception e) { } return null;  
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
		try {
			String sql="insert into reply(r_contents, m_no, b_no) values(?, ?, ?)";
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, reply.getR_contents());
			preparedStatement.setInt(2, reply.getM_no());
			preparedStatement.setInt(3, reply.getB_no());
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("댓글 등록 오류");} return false;
	}
	
	// 현재 게시물의 댓글만 가져오기
	public ArrayList<Reply> replylist(int b_no) {
		ArrayList<Reply> replist = new ArrayList<Reply>();
		try {
			String sql = "select * from reply where b_no="+b_no;
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				Reply reply = new Reply(
						resultSet.getInt(1), resultSet.getString(2),
						resultSet.getString(3), resultSet.getInt(4), resultSet.getInt(5));
				replist.add(reply);
			} return replist;
		} catch (Exception e) {System.out.println("현재 게시물 댓글 불러오기 오류");} return null;
	}
}