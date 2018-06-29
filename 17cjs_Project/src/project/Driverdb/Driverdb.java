package project.Driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Driverdb {

	public Connection dbconn() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/17cjs_projectdb?useUnicode=true&characterEncoding=euckr";
		String dbUser = "17cjsdbid";
		String dbPass = "17cjsdbpw";
		
		Connection reconn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		return reconn;
		
	}
}
