package admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.UserCountMgrDao;
import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.PageData;

public class UserCountMgrService {

	public int[] boardCount() {
		
		Connection conn = JDBCTemplate.getConnection();
			
		int userCount = new UserCountMgrDao().userCount(conn);
		int recipeCount = new UserCountMgrDao().recipeCount(conn);
		int todayBuyProductCount = new UserCountMgrDao().todayBuyProductCount(conn);
		
		int boardCount [] = new int [3];
		
		boardCount[0] = userCount;
		boardCount[1] = recipeCount;
		boardCount[2] = todayBuyProductCount;
		
	
		JDBCTemplate.close(conn);
		
		
		return boardCount;
		
	}
	
	public PageData noticeAll(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage=10;
		int naviCountPerPage=5;
		
		ArrayList<Notice> list = new NoticeDao().getCurrentPage(conn,currentPage,recordCountPerPage);
		String pageNavi = new NoticeDao().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);
		
		PageData pd = null;
		if(!list.isEmpty()&&!pageNavi.isEmpty())
		{
			pd = new PageData();
			pd.setNoticeList(list);
			pd.setPageNavi(pageNavi);
		}
		JDBCTemplate.close(conn);
		
		
		return pd;
		
		
	}

}
