package main.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import common.JDBCTemplate;
import main.model.vo.MainRecipe;
import main.model.vo.searchRecipe;

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
			// 로드
			prop.load(new FileReader(path + "resources/mainQuery.properties"));

			String query = prop.getProperty("selectWeek");

			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
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

	// 메인 검색창에서 검색하면 레시피 받아오는 메소드
	public void searchRecipe(String userValue) {
		// TODO Auto-generated method stub

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

	// 종류별 카테고리 받아옴
	public HashMap<Integer, String> getCategoryClass(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		
		Properties prop = new Properties();
		
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path + "resources/recipeQuery.properties"));
			
			String query = prop.getProperty("classSelectAll");
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				list.put(rset.getInt("CLASS_NO"), rset.getString("CLASS_NAME"));
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return list;
	}

	// 상황별 카테고리 받아옴
	public HashMap<Integer, String> getCategorySituation(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		
		Properties prop = new Properties();
		
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path + "resources/recipeQuery.properties"));
			
			String query = prop.getProperty("situationSelectAll");
			
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				list.put(rset.getInt("situation_NO"), rset.getString("situation_name"));
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return list;
	}
	
	// 재료별 카테고리 받아옴
	public HashMap<Integer, String> getCategoryMethod(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		
		Properties prop = new Properties();
		
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path + "resources/recipeQuery.properties"));
			
			String query = prop.getProperty("methodSelectAll");
			
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				list.put(rset.getInt("method_no"), rset.getString("method_name"));
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return list;
	}

	// 방법별 카테고리 받아옴
	public HashMap<Integer, String> getCategoryIngredient(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		
		Properties prop = new Properties();
		
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path + "resources/recipeQuery.properties"));
			
			String query = prop.getProperty("ingredientSelectAll");
			
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				list.put(rset.getInt("ingre_no"), rset.getString("ingre_name"));
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return list;
	}
	

	// 페이지 받아옴
	public ArrayList<searchRecipe> getCurrentPage(Connection conn, int page, int recordCountPerPage, String cate1,
			String cate2, String cate3, String cate4, String order, String searchVal) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int start = (page - 1) * recordCountPerPage + 1;
		int end = page * recordCountPerPage;
		
		boolean first = true;
		
		String query = "";
		String where = "";
		
		ArrayList<searchRecipe> list = new ArrayList<searchRecipe>();
		try {
			
			// 카테고리가 전부 클릭이 안된 상태이면서 search 값이 없으면
			if (!(cate1.equals("0") && cate2.equals("0") && cate3.equals("0") && cate4.equals("0") && (searchVal.length()==0))) {
				where += "where ";
			}
			
			// 첫 번째 카테고리가 클릭이 된 상태이면
			if (!cate1.equals("0")) 
			{
				if (first) {
					first = false;
				} else {
					where += " and ";
				}
				where += "class_no=" + cate1;
			}
			
			//
			if (!cate2.equals("0")) {
				if (first) {
					first = false;
				} else {
					where += " and ";
				}
				where += "situation_no=" + cate2;
			}
			
			//
			if (!cate3.equals("0")) {
				if (first) {
					first = false;
				} else {
					where += " and ";
				}
				where += "method_no=" + cate3;
			}
			
			// 
			if (!cate4.equals("0")) {
				if (first) {
					first = false;
				} else {
					where += " and ";
				}
				where += "ingre_no=" + cate4;
			}
			
			// 
			if (!(searchVal.length()==0)) {
				if (first) {
					first = false;
				} else {
					where += " and ";
				}
				where += "ingredient like '%" + searchVal +"%' or recipe_intro like '%" +  searchVal + "%'";
			}
			
			query = "select recipe_no,recipe_title,recipe_intro,recipe_views,posted_date,recipe_pic from (select recipe.*, row_number() over(order by "
					+ order + " desc) as num from recipe " + where + ") where num between ? and ?";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				searchRecipe sR = new searchRecipe();
				
				sR.setRecipeNo(rset.getInt("recipe_no"));
				sR.setRecipeTitle(rset.getString("recipe_title"));
				sR.setRecipeIntro(rset.getString("recipe_intro"));
				sR.setRecipeViews(rset.getInt("recipe_views"));
				sR.setPostedDate(rset.getDate("posted_date"));
				sR.setRecipePic(rset.getString("recipe_pic"));
				
				list.add(sR);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	
	// 해야 됨
	// 페이지 네비
	public String getPageNavi(Connection conn, int page, int recordCountPerPage, int naviCountPerPage, String cate1,
			String cate2, String cate3, String cate4, String order, String searchVal) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int recordTotalCount = 0; // 총 게시물 개수 저장 변수
		
		boolean first = true;
		
		String query = "";
		String where = "";
		
		if (!(cate1.equals("0") && cate2.equals("0") && cate3.equals("0") && cate4.equals("0") && searchVal.length()==0)) {
			where += "where ";
		}
		
		if (!cate1.equals("0")) {
			if (first) {
				first = false;
			} else {
				where += " and ";
			}
			where += "class_no=" + cate1;
		}
		
		if (!cate2.equals("0")) {
			if (first) {
				first = false;
			} else {
				where += " and ";
			}
			where += "situation_no=" + cate2;
		}
		
		if (!cate3.equals("0")) {
			if (first) {
				first = false;
			} else {
				where += " and ";
			}
			where += "method_no=" + cate3;
		}
		
		if (!cate4.equals("0")) {
			if (first) {
				first = false;
			} else {
				where += " and ";
			}
			where += "ingre_no=" + cate4;
		}
		
		if (!(searchVal.length()==0)) {
			if (first) {
				first = false;
			} else {
				where += " and ";
			}
			where += "ingredient like '%" + searchVal +"%' or recipe_intro like '%" +  searchVal + "%'";
		}
		
		try {
			query = "select count(*) as totalcount from recipe " + where;
			
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				recordTotalCount = rset.getInt("totalcount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		int pageTotalCount = 0;// navi 토탈 카운트
		
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (page < 1) {
			page = 1;
		} else if (page > pageTotalCount) {
			page = pageTotalCount;
		}
		
		int startNavi = ((page - 1) / naviCountPerPage) * naviCountPerPage + 1;
		
		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;
		
		if (startNavi == 1) {
			needPrev = false;
		}
		
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();
		if (order == null) {
			order = "posted_date";
		}
		
		if (needPrev) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/recipeList?cate1=" + cate1 + "&cate2="
					+ cate2 + "&cate3=" + cate3 + "&cate4=" + cate4 + "&order=" + order + "&search=&page="
					+ (startNavi - 1) + "'> < </a></li>");

		}
		
		for (int i = startNavi; i <= endNavi; i++) {
			if (i == page) {
				sb.append("<li class=\"page-item active\"><a class=\"page-link\" href='/recipeList?cate1=" + cate1
						+ "&cate2=" + cate2 + "&cate3=" + cate3 + "&cate4=" + cate4 + "&order=" + order
						+ "&search=&page=" + i + "'><B>" + i + "</B></a></li>");
			} else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/recipeList?cate1=" + cate1 + "&cate2="
						+ cate2 + "&cate3=" + cate3 + "&cate4=" + cate4 + "&order=" + order + "&search=&page=" + i
						+ "'>" + i + "</a></li>");
			}
		}
		
		if (needNext) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/recipeList?cate1=" + cate1 + "&cate2="
					+ cate2 + "&cate3=" + cate3 + "&cate4=" + cate4 + "&order=" + order + "&search=&page="
					+ (endNavi + 1) + "'> > </a></li>");
		}
		
		return sb.toString();
	}
}
