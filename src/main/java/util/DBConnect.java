package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {

		String dbUrl = System.getenv("DB_URL");
		String username = System.getenv("DB_USER");
		String password = System.getenv("DB_PASSWORD");

		if (dbUrl == null || dbUrl.isEmpty()) {
			dbUrl = "jdbc:mysql://localhost:3306/gamudalk?characterEncoding=utf8";
		}
		if (username == null || username.isEmpty()) {
			username = "root";
		}
		if (password == null || password.isEmpty()) {
			password = "DEShV*0202*";
		}

		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection(dbUrl, username, password);

		return con;
	}

}