package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DBConnection.DBConnection;
import dto.ProductDTO;
import dto.UserDTO;

public class LoginDAO {

	
	private Connection con; //db 연결
	private PreparedStatement pstmt; //sql문 실행
	private ResultSet rs; //db 결과 검색
	 String LOGIN = "SELECT password FROM user_tbl WHERE user_id = ? ";
	int result =0;
	public int registerCheck(String id) { 
		UserDTO user = null;
		
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

	    return -1; //데이터 베이스 오류 알려주기
	}

}