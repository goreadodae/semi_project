package admin.model.vo;

import java.util.ArrayList;

public class MemberPageData {
	private ArrayList<Member> dataList;
	private String pageNavi;
	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberPageData(ArrayList<Member> dataList, String pageNavi) {
		super();
		this.dataList = dataList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Member> getDataList() {
		return dataList;
	}
	public void setDataList(ArrayList<Member> dataList) {
		this.dataList = dataList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
	
}
