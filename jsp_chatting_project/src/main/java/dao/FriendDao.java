package dao;

import java.util.ArrayList;

import dto.Friend;

public class FriendDao extends DB {
	
	public FriendDao() {
		super();
	}
	
	public static FriendDao friendDao = new FriendDao();
	public static FriendDao getFriendDao() {
		return friendDao;
	}
	
	//친구 목록 불러오기
	public ArrayList<Friend> getfriendelist(int m_no ,int type) {
		ArrayList<Friend> arrayList = new ArrayList<Friend>();
		
			String sql = "select * from friend where f_type=1 and (m_no1="+m_no+" or m_no2="+m_no+")";
			if(type==2) {
				sql = "select * from friend where f_type=2 and m_no1="+m_no;
			}
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Friend friend = new Friend(resultSet.getInt(1),resultSet.getInt(2),
						resultSet.getInt(3),resultSet.getInt(4));
						arrayList.add(friend);
			}
			return arrayList;
		} catch (Exception e) {
			System.out.println("getfriendelist db 오류");
		}
		return arrayList;
	}
	
	//친구 목록 삭제
	public boolean deletefriende(int f_no) {
		String sql = "delete from friend where f_no="+f_no;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println(" deletefriende db 오류");
		}
			return false;
	}
	
	

}


















