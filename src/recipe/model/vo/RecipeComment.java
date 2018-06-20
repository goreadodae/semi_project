package recipe.model.vo;

import java.sql.Time;
import java.sql.Timestamp;

public class RecipeComment {
	private int commentNo;
	private String commentContents;
	private Timestamp commentEnrollDate;
	private int recipeNo;
	private int memberNo;
	private String profile;
	private String nickname;
	private String gender;
	public RecipeComment() {
		// TODO Auto-generated constructor stub
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
	public Timestamp getCommentEnrollDate() {
		return commentEnrollDate;
	}
	public void setCommentEnrollDate(Timestamp commentEnrollDate) {
		this.commentEnrollDate = commentEnrollDate;
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
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "RecipeComment [commentNo=" + commentNo + ", commentContents=" + commentContents + ", commentEnrollDate="
				+ commentEnrollDate + ", recipeNo=" + recipeNo + ", memberNo=" + memberNo + ", profile=" + profile
				+ ", nickname=" + nickname + ", gender=" + gender + "]";
	}
	
};