package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project.Driverdb.Driverdb;
import project.dto.User;

public class Udao {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void uUpdate(User u) {
		
		try {
			
			Driverdb dbcon = new Driverdb();
			conn = dbcon.dbconn();
			
			pstmt = conn.prepareStatement("UPDATE user SET user_pw=?,user_level=?,user_name=?,user_gender=?,user_email=?,user_home=?,user_phone=?,user_addr=? WHERE user_id=?");
			
			pstmt.setString(1, u.getUser_pw());
			pstmt.setString(2, u.getUser_level());
			pstmt.setString(3, u.getUser_name());
			pstmt.setString(4, u.getUser_gender());
			pstmt.setString(5, u.getUser_email());
			pstmt.setString(6, u.getUser_home());
			pstmt.setString(7, u.getUser_phone());
			pstmt.setString(8, u.getUser_addr());
			pstmt.setString(9, u.getUser_id());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
	}
	
	public User uSelectForUpdate(String u_id) {
		
		Driverdb dbcon = new Driverdb();
		User u = new User();
		
		try {
			
			
			
			conn = dbcon.dbconn();
			
			pstmt = conn.prepareStatement("SELECT * FROM user WHERE user_id=?");
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				u.setUser_id(rs.getString("user_id"));
				u.setUser_pw(rs.getString("user_pw"));
				u.setUser_level(rs.getString("user_level"));
				u.setUser_name(rs.getString("user_name"));
				u.setUser_gender(rs.getString("user_gender"));
				u.setUser_email(rs.getString("user_email"));
				u.setUser_home(rs.getString("user_home"));
				u.setUser_phone(rs.getString("user_phone"));
				u.setUser_addr(rs.getString("user_addr"));
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return u;
	}

	public void uinsert(User u) {
		
		try {
			
			Driverdb dbcon = new Driverdb();
			conn = dbcon.dbconn();
			
			pstmt = conn.prepareStatement("INSERT INTO user VALUES (?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pw());
			pstmt.setString(3, u.getUser_level());
			pstmt.setString(4, u.getUser_name());
			pstmt.setString(5, u.getUser_gender());
			pstmt.setString(6, u.getUser_email());
			pstmt.setString(7, u.getUser_home());
			pstmt.setString(8, u.getUser_phone());
			pstmt.setString(9, u.getUser_addr());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	
}
}
