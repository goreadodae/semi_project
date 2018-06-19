package main.model.vo;

import java.util.ArrayList;

public class SearchRecipePageData {
	
	private ArrayList<SearchRecipe> dataList;
	private String pageNavi;
	
	public SearchRecipePageData() {}
	
	public SearchRecipePageData(ArrayList<SearchRecipe> dataList, String pageNavi) {
		this.dataList = dataList;
		this.pageNavi = pageNavi;
	}
	
	public ArrayList<SearchRecipe> getDataList() {
		return dataList;
	}
	
	public void setDataList(ArrayList<SearchRecipe> dataList) {
		this.dataList = dataList;
	}
	
	public String getPageNavi() {
		return pageNavi;
	}
	
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
