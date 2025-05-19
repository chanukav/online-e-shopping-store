package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String username = "root";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamudalk?characterEncoding=utf8",username,password);
		
		return con;
	}

}
