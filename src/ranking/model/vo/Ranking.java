package ranking.model.vo;

import java.sql.Date;

public class Ranking {

	private int recipeNo;
	private String recipeTitle;
	private String recipeIntro;
	private String recipePic;
	private String completePic;
	private int recipeViews;
	private int recipeMonthViews;
	private int recipeTodayViews;
	private String recipeTag;
	private String video;
	private Date postedDate;
	private int memberNo;
	private String memberName;
	private String memberId;
	
	public Ranking() {}

	public Ranking(int recipeNo, String recipeTitle, String recipeIntro, String recipePic, String completePic,
			int recipeViews, int recipeMonthViews, int recipeTodayViews, String recipeTag, String video,
			Date postedDate, int memberNo, String memberName, String memberId) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.recipePic = recipePic;
		this.completePic = completePic;
		this.recipeViews = recipeViews;
		this.recipeMonthViews = recipeMonthViews;
		this.recipeTodayViews = recipeTodayViews;
		this.recipeTag = recipeTag;
		this.video = video;
		this.postedDate = postedDate;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberId = memberId;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Ranking [recipeNo=" + recipeNo + ", recipeTitle=" + recipeTitle + ", recipeIntro=" + recipeIntro
				+ ", recipePic=" + recipePic + ", completePic=" + completePic + ", recipeViews=" + recipeViews
				+ ", recipeMonthViews=" + recipeMonthViews + ", recipeTodayViews=" + recipeTodayViews + ", recipeTag="
				+ recipeTag + ", video=" + video + ", postedDate=" + postedDate + ", memberNo=" + memberNo
				+ ", memberName=" + memberName + ", memberId=" + memberId + "]";
	}


	
	
	
}






/*recipe

RECIPE_NO	NUMBER
RECIPE_TITLE	VARCHAR2(500 BYTE)
RECIPE_INTRO	VARCHAR2(1000 BYTE)
RECIPE_PIC	VARCHAR2(500 BYTE)
INGREDIENT	VARCHAR2(2000 BYTE)
TIP	VARCHAR2(2000 BYTE)
COMPLETE_PIC	VARCHAR2(500 BYTE)
RECIPE_VIEWS	NUMBER
RECIPE_MONTH_VIEWS	NUMBER
RECIPE_TODAY_VIEWS	NUMBER
RECIPE_TAG	VARCHAR2(500 BYTE)
VIDEO	VARCHAR2(1000 BYTE)
POSTED_DATE	DATE
CLASS_NO	NUMBER
SITUATION_NO	NUMBER
METHOD_NO	NUMBER
INGRE_NO	NUMBER
MEMBER_NO	NUMBER
*/

/*recipe_ranking

RANKING_NO	NUMBER
RECIPE_NO	NUMBER
*/


