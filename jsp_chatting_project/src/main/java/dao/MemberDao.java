package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

import dto.Member;

public class MemberDao extends DB {
    
	public MemberDao() {super();}
	public static MemberDao memberDao = new MemberDao();
    public static MemberDao getmMemberDao() {return memberDao;}
    
    // 로그인 확인
    public boolean login(String m_id, String m_password) { 
    	String sql = "select * from member where m_id=? and m_password=?";
    	//아이디, 패스워드를 확인 하기 위해서
    	try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, m_id);
			preparedStatement.setString(2, m_password);
			resultSet = preparedStatement.executeQuery(); // resultSet=검색한 값을 담는다
			if(resultSet.next()) { // resultSet 비어있는지 확인
				return true; // // 값(=resultSet)이 있으면 로그인 성공
			} else {
				return false; // 값이 비어 있으면 로그인 실패
			}
		} catch (Exception e) {System.out.println("로그인 Db 오류");} return false;
    }
    
    // m_id, m_pw로 회원정보 빼오기
    public Member getmemberinfo(String m_id, String m_password) {
    	String sql = "select * from member where m_id=? and m_password=?";
    	try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, m_id);
			preparedStatement.setString(2, m_password);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				Member member = new Member(resultSet.getInt(1), // 검색 된 값의 1번째 값
						resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getString(5),
						resultSet.getString(6), resultSet.getString(7),
						resultSet.getInt(8), resultSet.getInt(9), resultSet.getInt(10));
				return member;
			} else {
				return null;
			}
		} catch (Exception e) {System.out.println("로그인 Db 오류");} return null;
    }
    
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
    
    
    

}


































