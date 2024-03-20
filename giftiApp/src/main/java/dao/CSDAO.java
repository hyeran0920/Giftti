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
	private final String SELECT_FAQ="select * from question_tbl";

	//카테고리별 출력
	private final String SELECT_QCATEGORY="select faquestion, answer from question_tbl where qcategory=?";

	//수정
	//삭제


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

}