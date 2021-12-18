package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

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
    
    public boolean signup(Member member) {
    	String sql = "insert into member(m_id,m_nickname,m_password,m_name,m_email,m_phone,m_grade,m_logincheck,m_enter) value(?,?,?,?,?,?,?,?,?)";
    	try {
			preparedStatement= connection.prepareStatement(sql);
			preparedStatement.setString(1, member.getM_id());
			preparedStatement.setString(2, member.getM_nickname());
			preparedStatement.setString(3, member.getM_password());
			preparedStatement.setString(4, member.getM_name());
			preparedStatement.setString(5, member.getM_email());
			preparedStatement.setString(6, member.getM_phone());
			preparedStatement.setInt(7, member.getM_grade());
			preparedStatement.setInt(8, member.getM_logincheck());
			preparedStatement.setInt(9, member.getM_enter());
			preparedStatement.executeUpdate();
			return true;
			
		} catch (Exception e) {
			System.out.println("signup DB오류");
		}return false;
    }
    

}


































