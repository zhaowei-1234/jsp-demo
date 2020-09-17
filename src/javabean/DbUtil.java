package javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DbUtil {
	Statement stmt=null;
	ResultSet rs=null;
	int i=0;
	String url = "";	
	
	public DbUtil(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e) {
			System.out.print(e);
			}
	    try {
	    	Connection conn = DriverManager.getConnection(url, "", "");
	    	if(conn!=null) {
	    		System.out.println("Á¬½ÓÊý¾Ý¿â³É¹¦");}
	    		stmt=conn.createStatement();  
	    }catch(SQLException e) {
	    	System.out.print(e);
	    	}
	}
    public ResultSet executeQuery(String sql) {
    	try{
    		rs=stmt.executeQuery(sql);
       	}
    	catch(SQLException e) {
    		System.out.print(e);
    	}
    	return rs;
    }
    public int executeUpdate(String sql) {
    	try {
    		i=stmt.executeUpdate(sql);
    	}
    	catch(SQLException e) {
    		System.out.print(e);
    	}
    	return i;
    }

}
