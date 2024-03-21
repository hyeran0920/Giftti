package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DBConnection;
import dto.CSDTO;

public class CSDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;


	//전체 출력
	private final String SELECT_FAQ="select * from question_tbl;";

	//카테고리별 출력
	private final String SELECT_QCATEGORY="select faquestion, answer from question_tbl where qcategory=?;";

	//수정	
	private final String UPDATE_FAQ = "update question_tbl set faquestion=?, answer =? where q_id=?;";

	
	//삭제
	private final String DELETE_FAQ = "delete from question_tbl where q_id=?;";

	//추가등록
	private final String INSERT_FAQ = "insert into question_tbl values(?,?,?);";


	public List<CSDTO> allQuestion(){
		List<CSDTO> questions = new ArrayList<>();

		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_FAQ);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				CSDTO dto = new CSDTO();
				dto.setQcategory(rs.getString("qcategory"));
				dto.setFaquestion(rs.getString("faquestion"));
				dto.setAnswer(rs.getString("answer"));
				dto.setQuestionId(rs.getInt("q_id"));

				questions.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}

		return questions;
	}

	//카테고리별 질문 검색
		public List<CSDTO> findByqcategory(String qcategory){
			List<CSDTO> questions = new ArrayList<>();

			try {
				con = DBConnection.getConnection();
				pstmt = con.prepareStatement(SELECT_QCATEGORY);
				pstmt.setString(1, qcategory);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					CSDTO dto = new CSDTO();
					dto.setFaquestion(rs.getString("faquestion"));
					dto.setAnswer(rs.getString("answer"));

					questions.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnection.close(rs, pstmt, con);
			}

			return questions;
		}
		
		
		
		public String updateFAQ(CSDTO questions) {
			String message = "업데이트를 실패하였습니다.";
			try {
				con = DBConnection.getConnection();
				pstmt = con.prepareStatement(UPDATE_FAQ);
				pstmt.setString(1, questions.getFaquestion());
				pstmt.setString(2, questions.getAnswer());
				pstmt.setInt(3, questions.getQuestionId());
				
				int success = pstmt.executeUpdate();
				
				
				if(success > 0) {
					message = "업데이트를 성공하였습니다!";
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnection.close(rs, pstmt, con);
			}
			return message;
		}
		
		
		public String deleteFAQ(int qestionId) {
			String message = "삭제를 실패하였습니다.";
			try {
				con = DBConnection.getConnection();
				pstmt = con.prepareStatement(DELETE_FAQ);
				pstmt.setInt(1, qestionId);
				
				int success = pstmt.executeUpdate();
				
				if(success > 0) {
					message = "삭제를 성공하였습니다!";
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnection.close(rs, pstmt, con);
			}
			
			return message;
			
		}
		
		public void insertFAQ(CSDTO questions) {
			try {
				con = DBConnection.getConnection();
				
				pstmt = con.prepareStatement(INSERT_FAQ);
				pstmt.setString(1, questions.getQcategory());
				pstmt.setString(2, questions.getFaquestion());
				pstmt.setString(3, questions.getAnswer());
				
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnection.close(rs, pstmt, con);
			}
		}
		
		

}