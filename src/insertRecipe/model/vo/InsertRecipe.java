package insertRecipe.model.vo;

import java.sql.Date;

public class InsertRecipe {
	
	private int recipeNo;
	private String recipeTitle;
	private String recipeIntro;
	private String recipePic;
	private String cookServing; //인분
	private String cookTime;
	private String cookLevel;
	private String ingredient; //재료
	private String tip;
	private String completePic; //완성사진
	private int recipeViews;
	private int recipeMonthViews;
	private int recipeTodayViews;
	private String recipeTag;
	private String video;
	private Date postedDate;
	private int classNo;
	private int situationNo;
	private int methodNo;
	private int ingreNo;
	private int memberNo;
	public InsertRecipe() {}
	
	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", recipeTitle=" + recipeTitle + ", recipeIntro=" + recipeIntro
				+ ", recipePic=" + recipePic + ", cookServing=" + cookServing + ", cookTime=" + cookTime
				+ ", cookLevel=" + cookLevel + ", ingredient=" + ingredient + ", tip=" + tip + ", completePic="
				+ completePic + ", recipeViews=" + recipeViews + ", recipeMonthViews=" + recipeMonthViews
				+ ", recipeTodayViews=" + recipeTodayViews + ", recipeTag=" + recipeTag + ", video=" + video
				+ ", postedDate=" + postedDate + ", classNo=" + classNo + ", situationNo=" + situationNo + ", methodNo="
				+ methodNo + ", ingreNo=" + ingreNo + ", memberNo=" + memberNo + "]";
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
	public String getRecipeIntro() {
		return recipeIntro;
	}
	public void setRecipeIntro(String recipeIntro) {
		this.recipeIntro = recipeIntro;
	}
	public String getRecipePic() {
		return recipePic;
	}
	public void setRecipePic(String recipePic) {
		this.recipePic = recipePic;
	}
	public String getCookServing() {
		return cookServing;
	}
	public void setCookServing(String cookServing) {
		this.cookServing = cookServing;
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
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getCompletePic() {
		return completePic;
	}
	public void setCompletePic(String completePic) {
		this.completePic = completePic;
	}
	public int getRecipeViews() {
		return recipeViews;
	}
	public void setRecipeViews(int recipeViews) {
		this.recipeViews = recipeViews;
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
	public String getRecipeTag() {
		return recipeTag;
	}
	public void setRecipeTag(String recipeTag) {
		this.recipeTag = recipeTag;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public Date getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public int getSituationNo() {
		return situationNo;
	}
	public void setSituationNo(int situationNo) {
		this.situationNo = situationNo;
	}
	public int getMethodNo() {
		return methodNo;
	}
	public void setMethodNo(int methodNo) {
		this.methodNo = methodNo;
	}
	public int getIngreNo() {
		return ingreNo;
	}
	public void setIngreNo(int ingreNo) {
		this.ingreNo = ingreNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

}
