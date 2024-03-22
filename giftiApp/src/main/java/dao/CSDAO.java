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

    private final String SELECT_FAQ = "SELECT * FROM question_tbl;";
    
    private final String SELECT_QCATEGORY = "SELECT faquestion, answer, q_id FROM question_tbl WHERE qcategory=?;";

    private final String SELECT_QUESTION = "SELECT faquestion, answer, qcategory, q_id FROM question_tbl WHERE q_id=?;";
    
    private final String UPDATE_FAQ = "UPDATE question_tbl SET faquestion=?, answer=? WHERE q_id=?;";
    
    private final String DELETE_FAQ = "DELETE FROM question_tbl WHERE q_id=?;";
    
    private final String INSERT_FAQ = "INSERT INTO question_tbl (qcategory, faquestion, answer) VALUES (?,?,?);";

    public List<CSDTO> getAllQuestions() {
        List<CSDTO> questions = new ArrayList<>();

        try {
            con = DBConnection.getConnection();
            pstmt = con.prepareStatement(SELECT_FAQ);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CSDTO dto = new CSDTO();
                dto.setQuestionId(rs.getInt("q_id"));
                dto.setQcategory(rs.getString("qcategory"));
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

    public List<CSDTO> findByCategory(String category) {
        List<CSDTO> questions = new ArrayList<>();

        try {
            con = DBConnection.getConnection();
            pstmt = con.prepareStatement(SELECT_QCATEGORY);
            pstmt.setString(1, category);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CSDTO dto = new CSDTO();
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
    
    public CSDTO findquestion(int qestionId) {
		CSDTO question = null;
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_QUESTION);
			pstmt.setInt(1, qestionId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				question = new CSDTO();
				question.setQuestionId(rs.getInt("q_id"));
				question.setFaquestion(rs.getString("faquestion"));
				question.setAnswer(rs.getString("answer"));
				question.setQcategory(rs.getString("qcategory"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		return question;
	}

    public String updateFAQ(CSDTO question) {
        String message = "업데이트를 실패하였습니다.";

        try {
            con = DBConnection.getConnection();
            pstmt = con.prepareStatement(UPDATE_FAQ);
            pstmt.setString(1, question.getFaquestion());
            pstmt.setString(2, question.getAnswer());
            pstmt.setInt(3, question.getQuestionId());

            int success = pstmt.executeUpdate();

            if (success > 0) {
                message = "업데이트를 성공하였습니다!";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, pstmt, con);
        }
        return message;
    }

    public String deleteFAQ(int questionId) {
        String message = "삭제를 실패하였습니다.";

        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false); // Start transaction
            pstmt = con.prepareStatement(DELETE_FAQ);
            pstmt.setInt(1, questionId);

            int success = pstmt.executeUpdate();

            if (success > 0) {
                con.commit(); // Commit transaction if successful
                message = "삭제를 성공하였습니다!";
            } else {
                con.rollback(); // Rollback transaction if failed
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.setAutoCommit(true); // Reset auto-commit mode
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close(rs, pstmt, con);
        }
        return message;
    }

    public String insertFAQ(CSDTO question) {
    	String message = "입력을 실패하였습니다.";

        try {
            con = DBConnection.getConnection();
            pstmt = con.prepareStatement(INSERT_FAQ);
            pstmt.setString(1, question.getQcategory());
            pstmt.setString(2, question.getFaquestion());
            pstmt.setString(3, question.getAnswer());


            int success = pstmt.executeUpdate();

            if (success > 0) {
                message = "입력을 성공하였습니다!";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, pstmt, con);
        }
        return message;
    }
}