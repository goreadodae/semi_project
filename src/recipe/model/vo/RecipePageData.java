package recipe.model.vo;

import java.util.ArrayList;

public class RecipePageData {
	private ArrayList<Recipe> dataList;
	private String pageNavi;
	public RecipePageData() {}
	public RecipePageData(ArrayList<Recipe> dataList, String pageNavi) {
		super();
		this.dataList = dataList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Recipe> getDataList() {
		return dataList;
	}
	public void setDataList(ArrayList<Recipe> dataList) {
		this.dataList = dataList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
