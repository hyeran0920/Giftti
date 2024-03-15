package DBConnection;

import static DBConnection.DBCon.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
//			System.out.println("접속 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("클래스가 존재하지 않음");
			e.printStackTrace();
		} 
		return conn;
	}
	
	public static void close(ResultSet rs, Statement stmt,Connection conn) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("rs이 닫히지 않음");
			}
		}
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println("stmt이 닫히지 않음");
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("conn이 닫히지 않음");
			}
		}
	}
}
