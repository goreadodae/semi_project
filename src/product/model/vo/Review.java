package product.model.vo;

import java.sql.Date;

public class Review {

	private int reviewNo;	//후기번호
	private String reviewContents;	//후기내용
	private String reviewPic;	//후기사진
	private int reviewSatisfied;	//후기만족도
	private Date enrollDate;	//등록시간
	private int memberNo;	//회원 번호
	private int productNo;	//상품 번호
	private String nickName; //회원 닉네임
	private String memberId; //회원 아이디
	private int buyingNo;	// 구매 번호
	private String buyingPayYN;	//결제 여부
	
	
	public Review() {}


	public Review(int reviewNo, String reviewContents, String reviewPic, int reviewSatisfied, Date enrollDate,
			int memberNo, int productNo, String nickName, String memberId, int buyingNo, String buyingPayYN) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContents = reviewContents;
		this.reviewPic = reviewPic;
		this.reviewSatisfied = reviewSatisfied;
		this.enrollDate = enrollDate;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.nickName = nickName;
		this.memberId = memberId;
		this.buyingNo = buyingNo;
		this.buyingPayYN = buyingPayYN;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public String getReviewContents() {
		return reviewContents;
	}


	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}


	public String getReviewPic() {
		return reviewPic;
	}


	public void setReviewPic(String reviewPic) {
		this.reviewPic = reviewPic;
	}


	public int getReviewSatisfied() {
		return reviewSatisfied;
	}


	public void setReviewSatisfied(int reviewSatisfied) {
		this.reviewSatisfied = reviewSatisfied;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getBuyingNo() {
		return buyingNo;
	}


	public void setBuyingNo(int buyingNo) {
		this.buyingNo = buyingNo;
	}


	public String getBuyingPayYN() {
		return buyingPayYN;
	}


	public void setBuyingPayYN(String buyingPayYN) {
		this.buyingPayYN = buyingPayYN;
	}


	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContents=" + reviewContents + ", reviewPic=" + reviewPic
				+ ", reviewSatisfied=" + reviewSatisfied + ", enrollDate=" + enrollDate + ", memberNo=" + memberNo
				+ ", productNo=" + productNo + ", nickName=" + nickName + ", memberId=" + memberId + ", buyingNo="
				+ buyingNo + ", buyingPayYN=" + buyingPayYN + "]";
	}


	
	
	
}
