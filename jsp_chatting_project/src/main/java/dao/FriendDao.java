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
	public ArrayList<Friend> getfriendelist(int m_no) {
		ArrayList<Friend> arrayList = new ArrayList<Friend>();
		String sql = "select * from friend where f_type=1 and (m_no1=? or m_no2=?)";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, m_no);
			preparedStatement.setInt(2, m_no);
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
	
	

}
