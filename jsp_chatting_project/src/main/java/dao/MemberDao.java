package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import dto.Member;

public class MemberDao extends DB {
    
	public MemberDao() {super();}
	public static MemberDao memberDao = new MemberDao();
    public static MemberDao getmMemberDao() {return memberDao;}
    
    //아이디로 회원번호 빼오기
    public int getm_no(String m_id){
    	String sql = "select m_no from member where m_id=?";
    	try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, m_id);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				return  resultSet.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getm_no db오류");
		}
    	return 0;
    }
    
}
