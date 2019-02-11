package main.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Locale;
import java.util.ResourceBundle;

public class ConnectionUtils {
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Connection conn = null;
		
		ResourceBundle rb = ResourceBundle.getBundle("db", Locale.getDefault());
		String hostName = rb.getString("hostname");
		String dbName = rb.getString("dbName");
		String user = rb.getString("username");
		String pwd = rb.getString("password");
		String connURL = "jdbc:mysql://"+hostName+":3306/"+dbName;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(connURL, user, pwd);
		return conn;
	}
	
	public static void closeQuietly(Connection conn) {
		try {
			conn.close();
		}catch(Exception e) {}
	}
	
	public static void rollBack(Connection conn) {
		try {
			conn.rollback();
		}catch(Exception e) {}
	}
}
