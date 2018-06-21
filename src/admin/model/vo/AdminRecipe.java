package admin.model.vo;

import java.sql.Date;

public class AdminRecipe {
	private int recipeNo;
	private String recipeTitle;
	private int recipeViews;
	private Date postedDate;
	private String memberId;
	
	public AdminRecipe() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public int getRecipeViews() {
		return recipeViews;
	}
	public void setRecipeViews(int recipeViews) {
		this.recipeViews = recipeViews;
	}
	public Date getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
