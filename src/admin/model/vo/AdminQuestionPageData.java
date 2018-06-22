package admin.model.vo;

import java.util.ArrayList;

import qna.model.vo.Question;

public class AdminQuestionPageData {
	private ArrayList<Question> dataList;
	private String pageNavi;
	public AdminQuestionPageData() {}
	public AdminQuestionPageData(ArrayList<Question> dataList, String pageNavi) {
		super();
		this.dataList = dataList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Question> getDataList() {
		return dataList;
	}
	public void setDataList(ArrayList<Question> dataList) {
		this.dataList = dataList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
