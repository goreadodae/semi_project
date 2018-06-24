package qna.model.vo;

import java.sql.Timestamp;

public class Qna {
	private int ansNo;
	private Timestamp ansTime;
	private String ansContents;
	private int queNo;
	private int memberNo;
	private String queTitle;
	private String queContents;
	private String responseYn;
	private int buyingNo;
	private Timestamp queTime;
	private String memberId;






	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Qna(int ansNo, Timestamp ansTime, String ansContents, int queNo, int memberNo, String queTitle,
			String queContents, String responseYn, int buyingNo, Timestamp queTime, String memberId) {
		super();
		this.ansNo = ansNo;
		this.ansTime = ansTime;
		this.ansContents = ansContents;
		this.queNo = queNo;
		this.memberNo = memberNo;
		this.queTitle = queTitle;
		this.queContents = queContents;
		this.responseYn = responseYn;
		this.buyingNo = buyingNo;
		this.queTime = queTime;
		this.memberId = memberId;
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





	public String getQueTitle() {
		return queTitle;
	}





	public void setQueTitle(String queTitle) {
		this.queTitle = queTitle;
	}





	public String getQueContents() {
		return queContents;
	}





	public void setQueContents(String queContents) {
		this.queContents = queContents;
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





	public Timestamp getQueTime() {
		return queTime;
	}





	public void setQueTime(Timestamp queTime) {
		this.queTime = queTime;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	








}
