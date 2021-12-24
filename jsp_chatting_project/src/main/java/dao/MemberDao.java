package dao;

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
    
	// 회원번호 검색 메소드 
	public int getmembernum( String id) {
		
		String sql ="select m_no from member where m_id=?";
		try {
		    preparedStatement =connection.prepareStatement(sql); preparedStatement.setString(1, id);
		    resultSet = preparedStatement.executeQuery(); 
			if( resultSet.next() ) { return resultSet.getInt(1); }
		}catch (Exception e) {} return 0;
		
	}
	//회원번호로 회원아이디 검색 메소드
	public String getmemberid(int m_no) {
	    String sql = "select m_id from member where m_no=?";
	    try {
		preparedStatement =connection.prepareStatement(sql);
		preparedStatement.setInt(1, m_no);
		resultSet=preparedStatement.executeQuery();
		if(resultSet.next()) {
		    return resultSet.getString(1);
		}
	    } catch (Exception e) {}return null;
		
	  
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
    	String sql ="update member set m_grade =2  where m_no=?";
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
	//맴버 닉네임 가져오기
	public String getnickname(int m_no) {
		String sql = "select m_nickname from member where m_no="+m_no;
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			if(resultSet.next()) {
				return resultSet.getString(1);
			}else {
				return null;
			}
		} catch (Exception e) {
			System.out.println("getnickname db오류");
		}
		return null;
	}
  public boolean signup(Member member) {
    	String sql = "insert into member(m_id,m_nickname,m_password,m_name,m_email,m_phone,m_grade,m_logincheck,m_enter)values(?,?,?,?,?,?,?,?,?)";
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


































