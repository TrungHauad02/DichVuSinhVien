package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	public static Connection getConnection()
	{
		Connection conn = null;
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			/*
			 * String url = System.getenv("jdbc:mysql://localhost:3306/qlsv"); String
			 * username = System.getenv("root"); String password = System.getenv("1234");
			 */
			String url = "jdbc:mysql://localhost:3306/dichvusinhvien";
			String username = "root";
			String password = "1234";
			
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("Connection Successfully!");
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void closeConnection(Connection conn)
	{
		try 
		{
			if (conn != null)
			{
				conn.close();
			}
		} catch (SQLException e)
		{
			System.out.println("Connection Error...");
			e.printStackTrace();
		}
	}
	public static void main(String args[])
	{
		getConnection();
	}
}