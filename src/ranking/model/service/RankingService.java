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

	public ArrayList<Ranking> todayMoveRecipeRanking(String datepicker) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Ranking> todayList = new RankingDao().todayMoveRecipeRanking(conn, datepicker);
 
		JDBCTemplate.close(conn);
		return todayList;
	}

	public ArrayList<Ranking> todayMoveNextRecipeRanking(String datepicker) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Ranking> todayList = new RankingDao().todayMoveNextRecipeRanking(conn, datepicker);
 
		JDBCTemplate.close(conn);
		return todayList;
	}

	public ArrayList<Ranking> monthChefRankingRecipeList(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Ranking> userIdList = new RankingDao().monthChefRankingRecipeList(conn, userId);
 
		JDBCTemplate.close(conn);
		return userIdList;
		
	}

	public ArrayList<Ranking> recipeList() {
Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Ranking> recipeList = new RankingDao().monthChefRankingRecipeList(conn);
 
		JDBCTemplate.close(conn);
		return recipeList;
	}

}
