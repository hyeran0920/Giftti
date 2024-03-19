package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import DBConnection.DBConnection;
import dto.UserDTO;


public class UserDAO {

	private Connection con; //db 연결
	private PreparedStatement pstmt; //sql문 실행
	private ResultSet rs; //db 결과 검색
	
	
	
	//userlist에서 먼저 회원 조회를 해야한다

	private final String SELECT_USER = 
			"SELECT *, (SELECT COUNT(*) FROM sale_tbl AS S WHERE S.user_id = U.user_id AND isSale = 'Available') AS sale_count FROM user_tbl AS U ORDER BY user_id;";
//	private final String SELECT_USER = "select * from user_tbl;";
	
	public List<UserDTO> findAll(){
		List<UserDTO> user = new ArrayList<>();
		
		//번호	회원 ID	닉네임	이름	성별	핸드폰	나이	지역	상태	판매상품 개수	총 거래 수
		
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_USER);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserDTO users = new UserDTO();
				
				users.setId(rs.getString("user_id"));
				users.setName(rs.getString("name"));
				users.setNickname(rs.getString("nickname"));
				users.setGender(rs.getString("gender"));
				users.setPhone(rs.getString("phone"));
				users.setAge(rs.getInt("age"));
				users.setAddress(rs.getString("address"));
				users.setStatus(rs.getString("status"));
				users.setCount(rs.getInt("sale_count"));

				user.add(users);//userList안에 users다 넣기
				
			}
		
		
		}catch (SQLException e) { //예외 발생
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, pstmt, con);
		}		
		return user; //값을 user로 넘긴다
		
	}
	
	//상세 조회
//	private final String SELECT_TRANSACTIONS = "(SELECT * FROM sale_tbl AS S INNER JOIN gifticon_tbl AS G ON G.item_id = S.item_id)";

	private final String SELECT_GET = 
		    "SELECT U.*, S.*, G.* " +
		    "FROM user_tbl AS U " +
		    "INNER JOIN sale_tbl AS S ON U.user_id = S.user_id " +
		    "INNER JOIN gifticon_tbl AS G ON G.item_id = S.item_id " +
		    "WHERE U.user_id = ?";



//	private String SELECT_GET = "SELECT * FROM user_tbl WHERE user_id =?";
	
	public UserDTO find(String userid) {
		UserDTO user = null;
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_GET);
			//?가 있으니까 ?를 담을 변수 하나 추가
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserDTO();
				user.setId(rs.getString("user_id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setNickname(rs.getString("nickname"));
				user.setGender(rs.getString("gender"));
				user.setPhone(rs.getString("phone"));
				user.setAge(rs.getInt("age"));
				user.setAddress(rs.getString("address"));
				user.setStatus(rs.getString("status"));


				user.setRegisterId(rs.getInt("register_id"));
				user.setItemName(rs.getString("item_name"));
				user.setSalePrice(rs.getInt("sale_price"));
				String sale = rs.getString("isSale");
				if(sale.equals("Available")) {
					user.setSale(false);
				} else {
					user.setSale(true);
				}
				user.setInDate(rs.getDate("indate"));
				
			}
			
			
			
		}catch (SQLException e) { //예외 발생
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, pstmt, con);
		}	
		
		
		return user;
		
	}




	
	
	
	
}
