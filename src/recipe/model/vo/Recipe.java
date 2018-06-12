package recipe.model.vo;

import java.sql.Date;

public class Recipe {
	private int recipeNo;
	private String recipeTitle;
	private String recipeIntro;
	private String recipePic;
	private String ingredient;
	private String tip;
	private String completePic;
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
	public Recipe() {}
	public Recipe(int recipeNo, String recipeTitle, String recipeIntro, String recipePic, String ingredient, String tip,
			String completePic, int recipeViews, int recipeMonthViews, int recipeTodayViews, String recipeTag,
			String video, Date postedDate, int classNo, int situationNo, int methodNo, int ingreNo, int memberNo) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.recipePic = recipePic;
		this.ingredient = ingredient;
		this.tip = tip;
		this.completePic = completePic;
		this.recipeViews = recipeViews;
		this.recipeMonthViews = recipeMonthViews;
		this.recipeTodayViews = recipeTodayViews;
		this.recipeTag = recipeTag;
		this.video = video;
		this.postedDate = postedDate;
		this.classNo = classNo;
		this.situationNo = situationNo;
		this.methodNo = methodNo;
		this.ingreNo = ingreNo;
		this.memberNo = memberNo;
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
	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", recipeTitle=" + recipeTitle + ", recipeIntro=" + recipeIntro
				+ ", recipePic=" + recipePic + ", ingredient=" + ingredient + ", tip=" + tip + ", completePic="
				+ completePic + ", recipeViews=" + recipeViews + ", recipeMonthViews=" + recipeMonthViews
				+ ", recipeTodayViews=" + recipeTodayViews + ", recipeTag=" + recipeTag + ", video=" + video
				+ ", postedDate=" + postedDate + ", classNo=" + classNo + ", situationNo=" + situationNo + ", methodNo="
				+ methodNo + ", ingreNo=" + ingreNo + ", memberNo=" + memberNo + "]";
	}
	
}