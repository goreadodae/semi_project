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
			pstmt.setString(1, "%"+datepicker+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Ranking r = new Ranking();
				r.setRecipeNo(rset.getInt("recipe_no"));
				System.out.println(rset.getInt("recipe_no"));
				r.setRecipeTitle(rset.getString("recipe_title"));
				r.setRecipeIntro(rset.getString("recipe_intro"));
				r.setRecipePic(rset.getString("recipe_pic"));
				r.setCookServing(rset.getString("cook_serving"));
				r.setCookTime(rset.getString("cook_time"));
				r.setIngredient(rset.getString("ingredient"));
				r.setTip(rset.getString("tip"));
				r.setCompletePic(rset.getString("complete_pic"));
				r.setRecipeViews(rset.getInt("recipe_views"));
				r.setRecipeMonthViews(rset.getInt("recipe_month_views"));
				r.setRecipeTodayViews(rset.getInt("recipe_today_views"));
				r.setRecipeTag(rset.getString("recipe_tag"));
				r.setVideo(rset.getString("video"));
				r.setPostedDate(rset.getDate("posted_date"));
				r.setClassNo(rset.getInt("class_no"));
				r.setMemberNo(rset.getInt("member_no"));
				r.setIngreNo(rset.getInt("ingre_no"));
				r.setMethodNo(rset.getInt("method_no"));
				/*System.out.println(rset.getString(19)+"5654564564654");*/
/*				r.setMemberName(rset.getString("member_name"));
				r.setMemberId(rset.getString("member_id"));*/
				r.setRanking(rset.getInt("ranking"));
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

	public ArrayList<Ranking> monthRecipeRanking(Connection conn, String year, String month) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Ranking> monthRecipeList = new ArrayList<Ranking>();
		
		Properties prop = new Properties();
		String path = RankingDao.class.getResource("").getPath();
		
		try {
			prop.load(new FileReader(path+"rankingQuery.properties"));
			String query = prop.getProperty("rankingMonthRecipe");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, '%'+year+"/"+month+'%');
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Ranking r = new Ranking();
				r.setRecipeNo(rset.getInt("recipe_no"));
				r.setRecipeTitle(rset.getString("recipe_title"));
				r.setRecipeIntro(rset.getString("recipe_intro"));
				r.setRecipePic(rset.getString("recipe_pic"));
				r.setCookServing(rset.getString("cook_serving"));
				r.setCookTime(rset.getString("cook_time"));
				r.setIngredient(rset.getString("ingredient"));
				r.setTip(rset.getString("tip"));
				r.setCompletePic(rset.getString("complete_pic"));
				r.setRecipeViews(rset.getInt("recipe_views"));
				r.setRecipeMonthViews(rset.getInt("recipe_month_views"));
				r.setRecipeTodayViews(rset.getInt("recipe_today_views"));
				r.setRecipeTag(rset.getString("recipe_tag"));
				r.setVideo(rset.getString("video"));
				r.setPostedDate(rset.getDate("posted_date"));
				r.setClassNo(rset.getInt("class_no"));
				r.setMemberNo(rset.getInt("member_no"));
				r.setIngreNo(rset.getInt("ingre_no"));
				r.setMethodNo(rset.getInt("method_no"));
				/*System.out.println(rset.getString(19)+"5654564564654");*/
/*				r.setMemberName(rset.getString("member_name"));
				r.setMemberId(rset.getString("member_id"));*/
				r.setRanking(rset.getInt("ranking"));
				monthRecipeList.add(r);

				
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
		return monthRecipeList;		
		
	}

	public ArrayList<Ranking> monthChefRanking(Connection conn, String year, String month) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Ranking> monthChefList = new ArrayList<Ranking>();
		
		Properties prop = new Properties();
		String path = RankingDao.class.getResource("").getPath();
		
		try {
			prop.load(new FileReader(path+"rankingQuery.properties"));
			String query = prop.getProperty("rankingMonthChef");
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, '%'+year+"/"+month+'%');
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Ranking r = new Ranking();
/*				r.setRecipeNo(rset.getInt("recipe_no"));
				r.setRecipeTitle(rset.getString("recipe_title"));
				r.setRecipeIntro(rset.getString("recipe_intro"));
				r.setRecipePic(rset.getString("recipe_pic"));
				r.setCookServing(rset.getString("cook_serving"));
				r.setCookTime(rset.getString("cook_time"));
				r.setIngredient(rset.getString("ingredient"));
				r.setTip(rset.getString("tip"));
				r.setCompletePic(rset.getString("complete_pic"));
				r.setRecipeViews(rset.getInt("recipe_views"));
				r.setRecipeMonthViews(rset.getInt("recipe_month_views"));
				r.setRecipeTodayViews(rset.getInt("recipe_today_views"));
				r.setRecipeTag(rset.getString("recipe_tag"));
				r.setVideo(rset.getString("video"));
				r.setPostedDate(rset.getDate("posted_date"));
				r.setClassNo(rset.getInt("class_no"));
				r.setIngreNo(rset.getInt("ingre_no"));
				r.setMethodNo(rset.getInt("method_no"));*/
				r.setRecipePic(rset.getString("recipe_pic"));
				r.setRecipeNo(rset.getInt("recipe_no"));
				r.setRecipeTitle(rset.getString("recipe_title"));
				r.setPostedDate(rset.getDate("posted_date"));
				r.setMemberNo(rset.getInt("member_no"));
				r.setMemberName(rset.getString("member_name"));
				r.setMemberId(rset.getString("member_id"));
				
				
				//r.setRanking(rset.getInt("ranking"));
				monthChefList.add(r);

				
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
		return monthChefList;		
	}

}
