package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DBConnection;
import dto.TransDTO;
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
				
				users.setUserId(rs.getString("user_id"));
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



	private String SELECT_GET = "SELECT * FROM user_tbl WHERE user_id =?";
	
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
				user.setUserId(rs.getString("user_id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setNickname(rs.getString("nickname"));
				user.setGender(rs.getString("gender"));
				user.setPhone(rs.getString("phone"));
				user.setAge(rs.getInt("age"));
				user.setAddress(rs.getString("address"));
				user.setStatus(rs.getString("status"));
			}
			
		}catch (SQLException e) { //예외 발생
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, pstmt, con);
		}	
		
		
		return user;
		
	}
	
	
	private final String SELECT_GET_TRANS = 
    "SELECT U.*, S.*, G.* " +
    "FROM user_tbl AS U " +
    "INNER JOIN sale_tbl AS S ON U.user_id = S.user_id " +
    "INNER JOIN gifticon_tbl AS G ON G.item_id = S.item_id " +
    "WHERE U.user_id = ?";


	public List<TransDTO> find2(String userid){
	    List<TransDTO> user = new ArrayList<>();

	    try {
	        con = DBConnection.getConnection();
	        pstmt = con.prepareStatement(SELECT_GET_TRANS);
	        pstmt.setString(1, userid);
	        rs = pstmt.executeQuery();
	        while(rs.next()) {
	            TransDTO users = new TransDTO();
	            users.setCategory(rs.getString("category"));
	            users.setPrice(rs.getInt("price"));
	            users.setInDate(rs.getDate("inDate"));
	            users.setItemId(rs.getInt("item_id"));
	            
	            
				users.setUserId(rs.getString("user_id"));
	            users.setRegisterId(rs.getInt("register_id"));
	            users.setItemName(rs.getString("item_name"));
	            users.setSalePrice(rs.getInt("sale_price"));
	            String sale = rs.getString("isSale");
	            if(sale.equals("Available")) {
	                users.setIsSale("false");
	            } else {
	                users.setIsSale("true");
	            }
	            users.setInDate(rs.getDate("indate"));

	            user.add(users);
	        }
	    } catch (SQLException e) { //예외 발생
	        e.printStackTrace();
	    } finally {
	        DBConnection.close(rs, pstmt, con);
	    }   

	    return user;

	
	}
	
	String USER_UPDATE ="update user_tbl set status=? where user_id=?;";
	public void updateStatus(UserDTO user) {
	    try {
	        con = DBConnection.getConnection();
	        pstmt = con.prepareStatement(USER_UPDATE);
	        pstmt.setString(1, user.getStatus());
	        pstmt.setString(2, user.getUserId());
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBConnection.close(rs, pstmt, con);
	    }
	}




	private final String SELECT_STATUS = "SELECT DISTINCT status FROM user_tbl;";

	public List<String> findAllStatus() {
	    List<String> statuses = new ArrayList<>();

	    try {
	        con = DBConnection.getConnection();
	        pstmt = con.prepareStatement(SELECT_STATUS);
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            String status = rs.getString("status");
	            statuses.add(status);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBConnection.close(rs, pstmt, con);
	    }

	    return statuses;
	}

	
	
}
