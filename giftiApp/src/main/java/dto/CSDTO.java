package dto;

public class CSDTO {
	private String qcategory; //질문 카테고리
	private String faquestion; //질문내용
	private String answer; //답변내용
	private int questionId;



	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getQcategory() {
		return qcategory;
	}
	public void setQcategory(String qcategory) {
		this.qcategory = qcategory;
	}


	public String getFaquestion() {
		return faquestion;
	}
	public void setFaquestion(String faquestion) {
		this.faquestion = faquestion;
	}


	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}




}