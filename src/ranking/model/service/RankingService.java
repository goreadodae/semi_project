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

}
