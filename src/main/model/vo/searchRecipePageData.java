package main.model.vo;

import java.util.ArrayList;

public class searchRecipePageData {
	
	private ArrayList<searchRecipe> dataList;
	private String pageNavi;
	
	public searchRecipePageData() {}
	
	public searchRecipePageData(ArrayList<searchRecipe> dataList, String pageNavi) {
		this.dataList = dataList;
		this.pageNavi = pageNavi;
	}
	
	public ArrayList<searchRecipe> getDataList() {
		return dataList;
	}
	
	public void setDataList(ArrayList<searchRecipe> dataList) {
		this.dataList = dataList;
	}
	
	public String getPageNavi() {
		return pageNavi;
	}
	
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
