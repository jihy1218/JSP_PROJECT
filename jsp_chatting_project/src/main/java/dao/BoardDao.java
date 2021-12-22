package dao;

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
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("게시물 작성 오류");} return false;
	}
	
	// 
	
}