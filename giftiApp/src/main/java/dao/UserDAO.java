package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DBConnection;
import dto.UserDTO;


public class UserDAO {
   private Connection con = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;

   //회원 상세조회
   private String USER_GET = "select * from user_tbl where id=?";
   //회원 삭제
   private String USER_DELETE = "delete from user_tbl where id=?";
   //회원목록 조회
   private String USER_LIST = "select * from user_tbl";
   //회원등록
   private String USER_INSERT = "insert into user_tbl values(?,?,?,?,?,?,?,?,?,?)";
   //회원 수정
   private String USER_UPDATE = "update user_tbl set  name=?,password=?,"
         + "email=?,phone=?,gender=?,age=?,address=?,status=?, nickname=? where id=?";

    //회원 상태 업데이트   
    private final String STATUS_UPDATE="update user_tbl set status=?, where userid=?";
      
      
    //거래내역 조회
    private final String GET_TOTALTRANS="select * from trans_tbl where buyid=?";//buy id로 검색해서 찾아오기
     //구매내역 조회
     private final String GET_TOTALSALE="select * from trans_tbl where sellid=?";//sell id로 검색해서 찾아오기
      

         
         
         
         
         
   //회원 관련 CRUD(create, read, update, delete )
   //1. 회원 상세 조회   // private String USER_GET = "select * from users where id=?";
   public UserDTO getUser(String user_id) { //DispacherServlet 수정
      UserDTO user = null;
      
        try {
         con = DBConnection.getConnection();
         pstmt = con.prepareStatement(USER_GET);
         pstmt.setString(1, user_id);
         
         rs=pstmt.executeQuery();
                  
            if(rs.next()){
               user = new UserDTO();
               user.setUserId(rs.getString("user_id"));
               user.setName(rs.getString("name"));
               user.setPassword(rs.getString("password"));
               user.setEmail(rs.getString("email"));
               user.setPhone(rs.getString("phone"));
               user.setGender(rs.getString("gender"));
               user.setAge(rs.getInt("age"));
               user.setAddress(rs.getString("address"));
               user.setStatus(rs.getBoolean("status"));
               user.setNickname(rs.getString("nickname"));
            }
      } catch (SQLException e) {
         e.printStackTrace();//프로그램 작성후 삭제, 각주
      }catch(Exception e) {
         
      }finally {
         DBConnection.close(rs, pstmt, con);
      }

       return user;
   }
   
   //회원 체크 --> 회원가입할때 쓸 거 
   public int registerCheck(String user_id) { 
      UserDTO user = null;
      
        try {
         con = DBConnection.getConnection();
         pstmt = con.prepareStatement(USER_GET);
         pstmt.setString(1, user_id);
         
         rs=pstmt.executeQuery();
                  
            if(rs.next()|| user_id.equals("")){
               return 0; //이미 존재하는 회원 아이디
            }else {
               return 1; // 가입 가능한 회원 아이디
            }
      } catch (SQLException e) {
         e.printStackTrace();
      }catch(Exception e) {
         
      }finally {
         DBConnection.close(rs, pstmt, con);
      }

       return -1; //데이터 베이스 오류 알려주기
   }
   
   
   //2. 회원 삭제    private String USER_DELETE = "delete from usertbl where id=?";
   public void deleteUser(String user_id) {
      
      try {
         con = DBConnection.getConnection();
         pstmt = con.prepareStatement(USER_DELETE);
         pstmt.setString(1, user_id);
         pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         DBConnection.close(rs, pstmt, con);
      }
   }
   // 3. 회원 수정
   public void updateUser(UserDTO dto) {

      try {
         con = DBConnection.getConnection();
         pstmt = con.prepareStatement(USER_UPDATE);
         pstmt.setString(1, dto.getName());
         pstmt.setString(2, dto.getPassword());         
         pstmt.setString(3, dto.getEmail());
         pstmt.setString(4, dto.getPhone());
         pstmt.setString(5, dto.getGender());      
         pstmt.setInt(6, dto.getAge());      
         pstmt.setString(7, dto.getAddress());
         pstmt.setBoolean(8, dto.isStatus());
         pstmt.setString(9, dto.getNickname());

         pstmt.executeUpdate();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(rs, pstmt, con);
      }
      
   }
   
//회원 등록 
   public int insertUser(UserDTO dto) {
      
      try {
         con = DBConnection.getConnection();
         pstmt = con.prepareStatement(USER_INSERT);
         
         pstmt.setString(1,dto.getUserId() );
         pstmt.setString(2, dto.getName());
         pstmt.setString(3, dto.getPassword());         
         pstmt.setString(4, dto.getEmail());
         pstmt.setString(5, dto.getPhone());
         pstmt.setString(6, dto.getGender());      
         pstmt.setInt(7, dto.getAge());      
         pstmt.setString(8, dto.getAddress());
         pstmt.setBoolean(9, dto.isStatus());
         pstmt.setString(10, dto.getNickname());
         
      

         return pstmt.executeUpdate(); //insert 성공하면 1 반환
         
      } catch (SQLException e) {
         e.printStackTrace();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(rs, pstmt, con);
      }
      return -1; //db오류
   }
   

   
   
   
//   private String USER_LIST = "select * from users";
   //5. 회원 목록 조회
   public List<UserDTO> getUserList(){
      List<UserDTO> userList = new ArrayList<UserDTO>();
      
      try {
         con = DBConnection.getConnection();
         pstmt = con.prepareStatement(USER_LIST);         
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            UserDTO user = new UserDTO();
            
            user.setUserId(rs.getString("user_id"));
            user.setName(rs.getString("name"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setPhone(rs.getString("phone"));
            user.setGender(rs.getString("gender"));
            user.setAge(rs.getInt("age"));
            user.setAddress(rs.getString("address"));
            user.setStatus(rs.getBoolean("status"));
            user.setNickname(rs.getString("nickname"));
            
            
            userList.add(user);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(rs, pstmt, con);
      }   
      return userList;
   }   
}
