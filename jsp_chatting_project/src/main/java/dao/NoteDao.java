package dao;

import java.util.ArrayList;

import dto.Note;

public class NoteDao extends DB {

	
	public NoteDao() {
		super();
	}
	public static NoteDao noteDao = new NoteDao();
	public static NoteDao getNoteDao() {
		return noteDao;
	}
	
	// 쪽지 보내기
	public boolean notewrite(Note note) {
		String sql = "insert into note(n_contents,n_from,n_to,n_check) value(?,?,?,?)";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, note.getN_contents());
			preparedStatement.setInt(2, note.getN_from());
			preparedStatement.setInt(3, note.getN_to());
			preparedStatement.setInt(4, note.getN_check());
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("notewrite db 오류");
		}
		return false;
	}
	
	//쪽지 총 개수 반환 
	public int notecount() {
		String sql="select count(*) from note";
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet= preparedStatement.executeQuery();
			if(resultSet.next()) {
				return resultSet.getInt(1);
			}else {
				return 0;
			}
		} catch (Exception e) {
			System.out.println("notecount db 오류");
		}
		return 0;
	}
	
	// 쪽지 출력
	public ArrayList<Note> notelist(int startrow, int listsize ,int m_no){
		
		ArrayList<Note> notes = new ArrayList<Note>();
		String sql ="select * from note where n_from="+m_no+" order by n_no DESC limit ? , ?";
		
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, startrow);
			preparedStatement.setInt(2, listsize);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Note note = new Note(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
						resultSet.getInt(4), resultSet.getInt(5), resultSet.getString(6));
				notes.add(note);
			}
			return notes;
		} catch (Exception e) {
			System.out.println("notelist db 출력");
		}
		return notes;
	}
	
	//쪽지 삭제
	public boolean notedelete(int n_no) {
		String sql = "delete from note where n_no="+n_no;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
}






