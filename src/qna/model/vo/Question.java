package qna.model.vo;

import java.sql.Timestamp;

public class Question {
	private int queNo;
	private String queTitle;
	private Timestamp queTime;
	private String queContents;
	private int memberNo;
	private String responseYn;
	private int buyingNo;
	private String memberId;
	

	public Question() {
		super();
	}
	
	public Question(int queNo, String queTitle, Timestamp queTime, String queContents, int memberNo,
			String responseYn, int buyingNo, String memberId) {
		super();
		this.queNo = queNo;
		this.queTitle = queTitle;
		this.queTime = queTime;
		this.queContents = queContents;
		this.memberNo = memberNo;
		this.responseYn = responseYn;
		this.buyingNo = buyingNo;
		this.memberId = memberId;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getResponseYn() {
		return responseYn;
	}
	public void setResponseYn(String responseYn) {
		this.responseYn = responseYn;
	}
	public int getBuyingNo() {
		return buyingNo;
	}
	public void setBuyingNo(int buyingNo) {
		this.buyingNo = buyingNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
	
	
	
	
	
	
	
	

}
