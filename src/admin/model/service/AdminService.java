package admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import admin.model.vo.AdminQuestionPageData;
import admin.model.vo.AdminProduct;

import admin.model.vo.AdminRecipe;
import admin.model.vo.AdminRecipePageData;
import common.JDBCTemplate;
import qna.model.vo.Question;

public class AdminService {

	public AdminRecipePageData recipeAll(int page) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 12;
		int naviCountPerPage = 5;
		ArrayList<AdminRecipe> list = new AdminDao().getCurrentPage(conn, page, recordCountPerPage);
		String pageNavi = new AdminDao().getPageNavi(conn, page, recordCountPerPage, naviCountPerPage);
		JDBCTemplate.close(conn);
		AdminRecipePageData arpd = null;
		if(!list.isEmpty() && !pageNavi.isEmpty()) {
			arpd = new AdminRecipePageData();
			arpd.setDataList(list);
			arpd.setPageNavi(pageNavi);
		}
		return arpd;
	}

	public AdminQuestionPageData questionList(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 12;
		int naviCountPerPage = 5;
		
		
		ArrayList<Question> list = new AdminDao().getQuestionCurrentPage(conn,currentPage,recordCountPerPage);
		String pageNavi = new AdminDao().getQuestionPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);
		
		AdminQuestionPageData aqpd = null;
		
		if(!list.isEmpty()&&!pageNavi.isEmpty())
		{
			aqpd = new AdminQuestionPageData();
			aqpd.setDataList(list);
			aqpd.setPageNavi(pageNavi);
		}
		JDBCTemplate.close(conn);
		
		return aqpd;
	}
		
	public ArrayList<AdminProduct> getProductList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<AdminProduct> list = new AdminDao().getProductList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public Question questionDetail(int queNo) {
		Connection conn = JDBCTemplate.getConnection();
		Question qt = new AdminDao().questionDetail(conn,queNo);
		JDBCTemplate.close(conn);
		
		
		return qt;
	}

}
