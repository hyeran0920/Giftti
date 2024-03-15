package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String SELECT_USERS="select user_id,name,password,email,phone,gender,age,address,status,nickname from user_tbl";
	
	private final String INSERT_USER="insert into user_tbl values(?,?,?,?,?,?,?,?,?,?)";
	private final String SELECT_USER="select name,password,email,phone,gender,age,address,status,nickname from user_tbl where user_id=?";
	private final String UPDATE_USER="update user_tbl set status=?, where user_id=?";
	private final String GET_TOTALTRANS="select from trans_tbl where buy_id=?";//buy id로 검색해서 찾아오기
	private final String GET_TOTALSALE="select from trans_tbl where sell_id=?";//sell id로 검색해서 찾아오기

}
