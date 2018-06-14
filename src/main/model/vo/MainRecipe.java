package main.model.vo;

public class MainRecipe {
	private int recipeNo;
	private String recipeTitle;
	private int recipeMonthViews;
	private int recipeTodayViews;
	private String recipePic;
	
	public MainRecipe(){
		
	}
	
	public MainRecipe(int recipeNo, String recipeTitle, int recipeMonthViews, int recipeTodayViews, String recipePic) {
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeMonthViews = recipeMonthViews;
		this.recipeTodayViews = recipeTodayViews;
		this.recipePic = recipePic;
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
}
