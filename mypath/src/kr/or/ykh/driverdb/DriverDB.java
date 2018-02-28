package kr.or.ykh.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	Connection conn = null;
	public Connection driverDB() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");

		String jdbcDriver = "jdbc:mysql://localhost:3306/dbdayyu?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbdayid";
		String dbPass = "dbdaypw";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		return conn;
	}
}
