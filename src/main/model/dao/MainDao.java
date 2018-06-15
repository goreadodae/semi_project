package main.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import main.model.vo.MainRecipe;

public class MainDao {

	public String getTotalRecipe(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String totalRecipe = "";
		
		Properties prop = new Properties();
		
		String path = MainDao.class.getResource("../../..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/mainQuery.properties"));
			
			String query = prop.getProperty("totalRecipe");
			
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalRecipe = rset.getString("totalRecipe");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalRecipe;
	}

	
	public ArrayList<MainRecipe> getRecipe(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MainRecipe mr = null;
		ArrayList<MainRecipe> list = new ArrayList<MainRecipe>();
		
		Properties prop = new Properties();
		
		String path = MainDao.class.getResource("../../..").getPath();
		
		try {
			// 로드
			prop.load(new FileReader(path+"resources/mainQuery.properties"));
			
			String query = prop.getProperty("selectWeek");
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				mr = new MainRecipe();
				
				mr.setRecipeNo(rset.getInt("recipe_no"));
				mr.setRecipeTitle(rset.getString("recipe_title"));
				mr.setRecipePic(rset.getString("recipe_pic"));
				mr.setRecipeTodayViews(rset.getInt("recipe_today_views"));
				mr.setRecipeMonthViews(rset.getInt("recipe_month_views"));
				
				list.add(mr);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

}
