package dao;

import java.util.ArrayList;

import dto.Board;

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
		ArrayList<Board>boards= new ArrayList<Board>();
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
	 // 모든 게시물 출력
    public ArrayList<Board> boardlist(int startrow, int listsize, String key, String keyword){
        ArrayList<Board>boards= new ArrayList<Board>();
        String sql = null;
        if(key ==null && keyword ==null) {// 검색이 없을경우
       sql = "select* from board order by b_no DESC limit ?, ?";
        }else {// 검색이 있을경우
       if(key.equals("m_no")) {
           int m_no = MemberDao.getmMemberDao().getm_no(keyword);
           sql = "select * from board where m_num ="+m_no+" order by b_no desc limit ? , ?";
       }else if(key.equals("b_no")) {// 반호 검색 일치한 값만 검색
           sql ="select * from board where b_num ="+ keyword+ "order by b_bnum desc limit ? , ?";
       }else {                           //제목 혹은 내용 검색 : 포함된 값검색
           sql ="select * from board where "+key+"like'%"+keyword+"%' order by b_no desc limit ? , ?";
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
        } catch (Exception e) {System.out.println(e);}
       
        return null;
        
    }
	
}