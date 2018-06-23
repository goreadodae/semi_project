package admin.model.vo;

import java.sql.Timestamp;

public class Answer {
	private int ansNo;
	private Timestamp ansTime;
	private String ansContents;
	private int queNo;
	private int memberNo;
	
	
	
	public Answer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Answer(int ansNo, Timestamp ansTime, String ansContents,int queNo, int memberNo) {
		super();
		this.ansNo = ansNo;
		this.ansTime = ansTime;
		this.ansContents = ansContents;
		this.queNo = queNo;
		this.memberNo = memberNo;
	}

	public int getAnsNo() {
		return ansNo;
	}
	public void setAnsNo(int ansNo) {
		this.ansNo = ansNo;
	}
	public Timestamp getAnsTime() {
		return ansTime;
	}
	public void setAnsTime(Timestamp ansTime) {
		this.ansTime = ansTime;
	}
	public String getAnsContents() {
		return ansContents;
	}
	public void setAnsContents(String ansContents) {
		this.ansContents = ansContents;
	}

	public int getQueNo() {
		return queNo;
	}

	public void setQueNo(int queNo) {
		this.queNo = queNo;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	

}
