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

		JDBCTemplate.close(conn);
		return todayList;
	}

	public ArrayList<Ranking> monthRecipeRanking(String year, String month) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Ranking> monthRecipeList = new RankingDao().monthRecipeRanking(conn,year,month);
		JDBCTemplate.close(conn);
		return monthRecipeList;
	}

	public ArrayList<Ranking> monthChefRanking(String year, String month) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Ranking> monthChefList = new RankingDao().monthChefRanking(conn,year,month);
		JDBCTemplate.close(conn);
		return monthChefList;
	}

}
