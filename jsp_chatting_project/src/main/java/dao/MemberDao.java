package dao;

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
    
    //회원번호로 전체정보 빼오기
    public Member getinfo(int m_no){
    	String sql = "select * from member where m_no="+m_no;
    	Member member = new Member();
    	try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				member = new Member(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), 
						resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7),
						resultSet.getInt(8), resultSet.getInt(9), resultSet.getInt(10));
				return member;
			}
		} catch (Exception e) {
			System.out.println("getm_no db오류");
		}
    	return member;
    }
    
    //친구 정보 가져오기
    public Member getlogin(int m_no ,int m_logincheck){
    	String sql = "select * from member where m_no="+m_no+" and m_logincheck="+m_logincheck;
    	Member member = new Member();
    	try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				member = new Member(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), 
						resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7),
						resultSet.getInt(8), resultSet.getInt(9), resultSet.getInt(10));
				return member;
			}
		} catch (Exception e) {
			System.out.println("getm_no db오류");
		}
    	return member;
    }
    // 결제 업데이트
    public boolean gradeupdate(int m_no) {
    	String sql ="update member set m_grade = m_grade+1 where m_no=?";
    	try {
    		preparedStatement =connection.prepareStatement(sql);
    		preparedStatement.setInt(1, m_no);
    		preparedStatement.executeUpdate();
    		return true;
    	} catch (Exception e) {} return false;
    }
    // 아이디 찾기 메소드
    public String findid(String m_name , String m_email) {
		String sql = "select m_id from member where m_name=? and m_email=?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, m_name);
			preparedStatement.setString(2, m_email);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {return resultSet.getString(1);}	
		} catch (Exception e) {} return null;
	}
    // 비밀번호 찾기 메소드
    public String findpassword(String m_id , String m_email) {
    	String sql = "select m_password from member where m_id=? and m_email=?";
    	try {
    		preparedStatement = connection.prepareStatement(sql);
    		preparedStatement.setString(1, m_id);
    		preparedStatement.setString(2, m_email);
    		resultSet = preparedStatement.executeQuery();
    		if(resultSet.next()) {return resultSet.getString(1);}	
    	} catch (Exception e) {} return null;
    }
    
    
    

}


































