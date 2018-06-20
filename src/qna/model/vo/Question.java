package qna.model.vo;

import java.sql.Timestamp;

public class Question {
	private int queNo;
	private String queTitle;
	private Timestamp queTime;
	private String queContents;
	private String memberNo;
	private String queYn;
	
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Question(int queNo, String queTitle, Timestamp queTime, String queContents, String memberNo, String queYn) {
		super();
		this.queNo = queNo;
		this.queTitle = queTitle;
		this.queTime = queTime;
		this.queContents = queContents;
		this.memberNo = memberNo;
		this.queYn = queYn;
	}

	public int getQueNo() {
		return queNo;
	}
	public void setQueNo(int queNo) {
		this.queNo = queNo;
	}
	public String getQueTitle() {
		return queTitle;
	}
	public void setQueTitle(String queTitle) {
		this.queTitle = queTitle;
	}
	public Timestamp getQueTime() {
		return queTime;
	}
	public void setQueTime(Timestamp queTime) {
		this.queTime = queTime;
	}
	public String getQueContents() {
		return queContents;
	}
	public void setQueContents(String queContents) {
		this.queContents = queContents;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getQueYn() {
		return queYn;
	}
	public void setQueYn(String queYn) {
		this.queYn = queYn;
	}
	
	
	
	
	
	
	
	
	
	

}
