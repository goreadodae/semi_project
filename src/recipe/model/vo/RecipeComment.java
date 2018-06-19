package recipe.model.vo;

import java.sql.Date;

public class RecipeComment {
	private int commentNo;
	private String commentContents;
	private Date enrollDate;
	private int recipeNo;
	private int memberNo;
	private String memberPic;
	private String memberNickName;
	public RecipeComment() {
		// TODO Auto-generated constructor stub
	}
	public RecipeComment(int commentNo, String commentContents, Date enrollDate, int recipeNo, int memberNo,
			String memberPic, String memberNickName) {
		super();
		this.commentNo = commentNo;
		this.commentContents = commentContents;
		this.enrollDate = enrollDate;
		this.recipeNo = recipeNo;
		this.memberNo = memberNo;
		this.memberPic = memberPic;
		this.memberNickName = memberNickName;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(String memberPic) {
		this.memberPic = memberPic;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
};