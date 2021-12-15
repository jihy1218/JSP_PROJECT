package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class MemberDao {

    
    public MemberDao() {
	try {
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp?serverTimezone=UTC" , "root","1234");
	} catch (Exception e) {System.out.println("[연동실패]");} 
	  
	
	public static MemberDao memberDao = new MemberDao();
	public static MemberDao getmemberDao() {return memberDao;}
	    
	
    }
}
