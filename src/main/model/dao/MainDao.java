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
import main.model.vo.MainProduct;
import main.model.vo.MainRecipe;

public class MainDao {
	public String getTotalRecipe(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String totalRecipe = "";

		Properties prop = new Properties();

		String path = MainDao.class.getResource("../../..").getPath();

		try {
			prop.load(new FileReader(path + "resources/mainQuery.properties"));

			String query = prop.getProperty("totalRecipe");

			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			if (rset.next()) {
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

			prop.load(new FileReader(path+"resources/mainQuery.properties"));
			
			String query = prop.getProperty("selectWeek");

			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				mr = new MainRecipe();

				mr.setRecipeNo(rset.getInt("recipe_no"));
				mr.setRecipeTitle(rset.getString("recipe_title"));
				mr.setRecipePic(rset.getString("recipe_pic"));
				mr.setRecipeTodayViews(rset.getInt("recipe_week"));
				mr.setRecipeMonthViews(rset.getInt("recipe_month"));
				mr.setCookLevel(rset.getString("cook_level"));
				mr.setCookTime(rset.getString("cook_time"));
				mr.setMemberId(rset.getString("member_id"));

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

	
	// 이달의 레시피 사진 받아오는 메소드
	public ArrayList<MainRecipe> getMonthlyRecipe(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MainRecipe mr = null;
		
		ArrayList<MainRecipe> list = new ArrayList<MainRecipe>();

		Properties prop = new Properties();

		String path = MainDao.class.getResource("../../..").getPath();

		try {

			prop.load(new FileReader(path + "resources/mainQuery.properties"));

			String query = prop.getProperty("selectMonth");

			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				mr = new MainRecipe();

				mr.setRecipeNo(rset.getInt("recipe_no"));
				mr.setRecipeTitle(rset.getString("recipe_title"));
				mr.setRecipePic(rset.getString("recipe_pic"));
				mr.setRecipeTodayViews(rset.getInt("recipe_week"));
				mr.setRecipeMonthViews(rset.getInt("recipe_month"));
				mr.setCookLevel(rset.getString("cook_level"));
				mr.setCookTime(rset.getString("cook_time"));
				mr.setMemberId(rset.getString("member_id"));
					
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

	// 사진 클릭 시 뷰가 증가하는 메소드
	public int upViews(Connection conn, int num) {

		PreparedStatement pstmt = null;
		int result = 0;

		Properties prop = new Properties();

		String path = MainDao.class.getResource("../../..").getPath();
		try {

			prop.load(new FileReader(path + "resources/mainQuery.properties"));

			String query = prop.getProperty("upView");

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();

		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	// 초특가 상품
	public ArrayList<MainProduct> getProduct(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MainProduct mp = null;
		
		ArrayList<MainProduct> list = new ArrayList<MainProduct>();

		Properties prop = new Properties();

		String path = MainDao.class.getResource("../../..").getPath();

		try {

			prop.load(new FileReader(path + "resources/mainQuery.properties"));

			String query = prop.getProperty("selectProduct");

			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				mp = new MainProduct();

				mp.setProduct_no(rset.getInt("product_no"));
				mp.setProduct_quantity(rset.getInt("product_quantity"));
				mp.setProduct_name(rset.getString("product_name"));
				mp.setProduct_price(rset.getInt("product_price"));
				mp.setProduct_1st_pic(rset.getString("product_1st_pic"));
				mp.setEnroll_date(rset.getDate("enroll_date"));
				
				list.add(mp);
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

	// 새 상품 
	public ArrayList<MainProduct> getNewProduct(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MainProduct mp = null;
		
		ArrayList<MainProduct> list = new ArrayList<MainProduct>();

		Properties prop = new Properties();

		String path = MainDao.class.getResource("../../..").getPath();

		try {

			prop.load(new FileReader(path + "resources/mainQuery.properties"));

			String query = prop.getProperty("selectNewProduct");

			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				mp = new MainProduct();

				mp.setProduct_no(rset.getInt("product_no"));
				mp.setProduct_quantity(rset.getInt("product_quantity"));
				mp.setProduct_name(rset.getString("product_name"));
				mp.setProduct_price(rset.getInt("product_price"));
				mp.setProduct_1st_pic(rset.getString("product_1st_pic"));
				mp.setEnroll_date(rset.getDate("enroll_date"));
				
				list.add(mp);
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
	
	// 매진임박
	public ArrayList<MainProduct> getImminentProduct(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MainProduct mp = null;
		
		ArrayList<MainProduct> list = new ArrayList<MainProduct>();

		Properties prop = new Properties();

		String path = MainDao.class.getResource("../../..").getPath();

		try {

			prop.load(new FileReader(path + "resources/mainQuery.properties"));

			String query = prop.getProperty("selectImminentSoldOut");

			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				mp = new MainProduct();

				mp.setProduct_no(rset.getInt("product_no"));
				mp.setProduct_quantity(rset.getInt("product_quantity"));
				mp.setProduct_name(rset.getString("product_name"));
				mp.setProduct_price(rset.getInt("product_price"));
				mp.setProduct_1st_pic(rset.getString("product_1st_pic"));
				mp.setEnroll_date(rset.getDate("enroll_date"));
				
				list.add(mp);
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

	// 시즌상품
	public ArrayList<MainProduct> getSeasonProduct(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MainProduct mp = null;
		
		ArrayList<MainProduct> list = new ArrayList<MainProduct>();

		Properties prop = new Properties();

		String path = MainDao.class.getResource("../../..").getPath();

		try {
			prop.load(new FileReader(path + "resources/mainQuery.properties"));

			String query = prop.getProperty("selectSeasonProduct");

			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "SUMMER");

			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				mp = new MainProduct();

				mp.setProduct_no(rset.getInt("product_no"));
				mp.setProduct_quantity(rset.getInt("product_quantity"));
				mp.setProduct_name(rset.getString("product_name"));
				mp.setProduct_price(rset.getInt("product_price"));
				mp.setProduct_1st_pic(rset.getString("product_1st_pic"));
				mp.setEnroll_date(rset.getDate("enroll_date"));

				list.add(mp);
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
