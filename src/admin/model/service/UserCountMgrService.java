package admin.model.service;

import java.sql.Connection;

import admin.model.dao.UserCountMgrDao;
import common.JDBCTemplate;

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

}
