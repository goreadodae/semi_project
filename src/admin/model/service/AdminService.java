package admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import admin.model.vo.AdminQuestionPageData;
import admin.model.vo.AdminProduct;

import admin.model.vo.AdminRecipe;
import admin.model.vo.AdminRecipePageData;
import admin.model.vo.Answer;
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

	public int insertAnsInfo(Answer ans) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDao().insertAnsInfo(conn,ans);
		if(result>0)
		{
			JDBCTemplate.commit(conn);
		}
		else
		{
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public int completeAns(Answer ans) {
		Connection conn = JDBCTemplate.getConnection();
		int comAns = new AdminDao().completeAns(conn,ans);
		
		if(comAns>0)
		{
			JDBCTemplate.commit(conn);
		}
		else
		{
			JDBCTemplate.rollback(conn);
		}
		
		return comAns;
	}

	public int sendMoney(int productNo, int memberNo, int totalSales) {
		Connection conn = JDBCTemplate.getConnection();
		int result1 = new AdminDao().sendMoneyProduct(conn, productNo, totalSales);
		int result2 = new AdminDao().sendMoneyMember(conn, memberNo, totalSales);
		if(result1>0&&result2>0)
		{
			JDBCTemplate.commit(conn);
		}
		else
		{
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result1*result2;
	}



}
