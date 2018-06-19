package recipe.model.vo;

import java.util.ArrayList;

public class CommentPageData {
	private ArrayList<RecipeComment> dataList;
	private String pageNavi;
	public CommentPageData() {}
	public CommentPageData(ArrayList<RecipeComment> dataList, String pageNavi) {
		super();
		this.dataList = dataList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<RecipeComment> getDataList() {
		return dataList;
	}
	public void setDataList(ArrayList<RecipeComment> dataList) {
		this.dataList = dataList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
