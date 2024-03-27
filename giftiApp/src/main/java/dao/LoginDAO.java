package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DBConnection.DBConnection;
import dto.UserDTO;

public class LoginDAO {

	
	private Connection con; //db 연결
	private PreparedStatement pstmt; //sql문 실행
	private ResultSet rs; //db 결과 검색
	private String LOGIN = "SELECT user_id FROM user_tbl WHERE user_id = ? ";
	private final String INSERT_USER = "INSERT INTO user_tbl(user_id, name, password, email, phone, gender, age, address, nickname) VALUES(?,?,?,?,?,?,?,?,?);";
	


	public int registerCheck(String id) { 
		
	     try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(LOGIN);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			         
			   if(rs.next()|| id.equals("")){
				   return 0; //이미 존재하는 회원 아이디
			   }else {
				  return 1; // 가입 가능한 회원 아이디
			   }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(Exception e) {
			
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	     return -1;
	}
	
	
	public int insertUser(UserDTO dto) {
		int result;
		try {
			
			con = DBConnection.getConnection();			
			pstmt = con.prepareStatement(INSERT_USER);
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPassword());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getGender());
			pstmt.setInt(7, dto.getAge());
			pstmt.setString(8, dto.getAddress());
			pstmt.setString(9, dto.getNickname());			
			pstmt.executeUpdate();
		}catch (SQLException e) { //예외 발생
			e.printStackTrace();
			result =-1; //데이터베이스 오류
		}finally {
			DBConnection.close(rs, pstmt, con);
		}	
		result=1;
		
		return result;
		
	}

}