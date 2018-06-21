package admin.model.vo;

import java.util.ArrayList;

public class AdminRecipePageData {
	private ArrayList<AdminRecipe> dataList;
	private String pageNavi;
	public AdminRecipePageData() {}
	public AdminRecipePageData(ArrayList<AdminRecipe> dataList, String pageNavi) {
		super();
		this.dataList = dataList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<AdminRecipe> getDataList() {
		return dataList;
	}
	public void setDataList(ArrayList<AdminRecipe> dataList) {
		this.dataList = dataList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
