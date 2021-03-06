package main.model.vo;

public class MainRecipe {
	private int recipeNo;
	private int userNo;
	private String recipeTitle;
	private int recipeMonthViews;
	private int recipeTodayViews;
	private String recipePic;
	private String cookTime;
	private String cookLevel;
	private String memberId;
	
	public MainRecipe(int recipeNo, String recipeTitle, int recipeMonthViews, int userNo, int recipeTodayViews, String recipePic,
			String cookTime, String cookLevel, String memberId) {
		super();	
		this.setUserNo(userNo);
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeMonthViews = recipeMonthViews;
		this.recipeTodayViews = recipeTodayViews;
		this.recipePic = recipePic;
		this.cookTime = cookTime;
		this.cookLevel = cookLevel;
		this.memberId = memberId;
	}

	public MainRecipe(){
		
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
	
	public int getRecipeMonthViews() {
		return recipeMonthViews;
	}
	
	public void setRecipeMonthViews(int recipeMonthViews) {
		this.recipeMonthViews = recipeMonthViews;
	}
	
	public int getRecipeTodayViews() {
		return recipeTodayViews;
	}
	
	public void setRecipeTodayViews(int recipeTodayViews) {
		this.recipeTodayViews = recipeTodayViews;
	}
	
	public String getRecipePic() {
		return recipePic;
	}
	
	public void setRecipePic(String recipePic) {
		this.recipePic = recipePic;
	}

	public String getCookTime() {
		return cookTime;
	}

	public void setCookTime(String cookTime) {
		this.cookTime = cookTime;
	}

	public String getCookLevel() {
		return cookLevel;
	}

	public void setCookLevel(String cookLevel) {
		this.cookLevel = cookLevel;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
}
