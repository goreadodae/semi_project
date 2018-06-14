package ranking.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import ranking.model.vo.Ranking;

public class RankingDao {

	public ArrayList<Ranking> todayRecipeRanking(Connection conn, String datepicker) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Ranking> todayList = new ArrayList<Ranking>();
		
		Properties prop = new Properties();
		String path = RankingDao.class.getResource("").getPath();
			
		
		try {
			prop.load(new FileReader(path+"rankingQuery.properties"));
			String query = prop.getProperty("rankingTodayRecipe");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+datepicker+'%');
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Ranking r = new Ranking();
				r.setRecipeNo(rset.getInt("recipe_no"));
				r.setRecipeTitle(rset.getString("recipe_title"));
				r.setRecipeIntro(rset.getString("recipe_intro"));
				r.setRecipePic(rset.getString("recipe_pic"));
				r.setCompletePic(rset.getString("complete_pic"));
				r.setRecipeViews(rset.getInt("recipe_views"));
				r.setRecipeMonthViews(rset.getInt("recipe_month_views"));
				r.setRecipeTodayViews(rset.getInt("recipe_today_views"));
				r.setRecipeTag(rset.getString("recipe_tag"));
				r.setVideo(rset.getString("video"));
				r.setPostedDate(rset.getDate("posted_date"));
				r.setMemberNo(rset.getInt("member_no"));
				
				todayList.add(r);
				
			}
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return todayList;		
	}

}
