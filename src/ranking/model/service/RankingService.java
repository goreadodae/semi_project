package ranking.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import ranking.model.dao.RankingDao;
import ranking.model.vo.Ranking;

public class RankingService {

	public ArrayList<Ranking> todayRecipeRanking(String datepicker) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Ranking> todayList = new RankingDao().todayRecipeRanking(conn, datepicker);

		System.out.println(todayList+"12221111");
		JDBCTemplate.close(conn);
		return todayList;
	}

	public void monthRecipeRanking(String year, String month) {
		Connection conn = JDBCTemplate.getConnection();
		
		new RankingDao().monthRecipeRanking(conn,year,month);
		
	}

}
