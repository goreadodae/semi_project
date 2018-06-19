package recipe.model.dao;

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
import recipe.model.vo.Recipe;
import recipe.model.vo.RecipeComment;
import recipe.model.vo.Process;

public class RecipeDao {

	public HashMap<Integer, String> getCategoryClass(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("classSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.put(rset.getInt("CLASS_NO"), rset.getString("CLASS_NAME"));
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
		}
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}

	public HashMap<Integer, String> getCategorySituation(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("situationSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.put(rset.getInt("situation_NO"),rset.getString("situation_name"));
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
		}
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}

	public HashMap<Integer, String> getCategoryMethod(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("methodSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.put(rset.getInt("method_no"), rset.getString("method_name"));
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
		}
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}

	public HashMap<Integer, String> getCategoryIngredient(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("ingredientSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.put(rset.getInt("ingre_no"), rset.getString("ingre_name"));
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
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}

	public ArrayList<Recipe> getCurrentPage(Connection conn, int page, int recordCountPerPage, String cate1, String cate2,
			String cate3, String cate4, String order) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int start = (page - 1)*recordCountPerPage + 1;
		int end = page*recordCountPerPage;
		boolean first = true;
		String query = "";
		String where = "";
		ArrayList<Recipe> list = new ArrayList<Recipe>();
		try {
			if(!(cate1.equals("0")&&cate2.equals("0")&&cate3.equals("0")&&cate4.equals("0"))) {
				where+="where ";
			}
			if(!cate1.equals("0")) {
				if(first) {	first=false; }
				else {where+=" and ";}
				where+="class_no="+cate1;
			} 
			if(!cate2.equals("0")) {
				if(first) {	first=false; }
				else {where+=" and ";}
				where+="situation_no="+cate2;
			}
			if(!cate3.equals("0")) {
				if(first) {	first=false; }
				else {where+=" and ";}
				where+="method_no="+cate3;
			}
			if(!cate4.equals("0")) {
				if(first) {	first=false; }
				else {where+=" and ";}
				where+="ingre_no="+cate4;
			}
			query = "select recipe_no,recipe_title,recipe_intro,recipe_views,posted_date,recipe_pic from (select recipe.*, row_number() over(order by "+order+" desc) as num from recipe "+where+") where num between ? and ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Recipe r = new Recipe();
				r.setRecipeNo(rset.getInt("recipe_no"));
				r.setRecipeTitle(rset.getString("recipe_title"));
				r.setRecipeIntro(rset.getString("recipe_intro"));
				r.setRecipeViews(rset.getInt("recipe_views"));
				r.setPostedDate(rset.getDate("posted_date"));
				r.setRecipePic(rset.getString("recipe_pic"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public String getPageNavi(Connection conn, int page, int recordCountPerPage, int naviCountPerPage, String cate1,
			String cate2, String cate3, String cate4, String order) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int recordTotalCount = 0; //총 게시물 개수 저장 변수
		boolean first = true;
		String query = "";
		String where = "";
		if(!(cate1.equals("0")&&cate2.equals("0")&&cate3.equals("0")&&cate4.equals("0"))) {
			where+="where ";
		}
		if(!cate1.equals("0")) {
			if(first) {	first=false; }
			else {where+=" and ";}
			where+="class_no="+cate1;
		} 
		if(!cate2.equals("0")) {
			if(first) {	first=false; }
			else {where+=" and ";}
			where+="situation_no="+cate2;
		}
		if(!cate3.equals("0")) {
			if(first) {	first=false; }
			else {where+=" and ";}
			where+="method_no="+cate3;
		}
		if(!cate4.equals("0")) {
			if(first) {	first=false; }
			else {where+=" and ";}
			where+="ingre_no="+cate4;
		}
		try {
			query = "select count(*) as totalcount from recipe " + where;
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				recordTotalCount = rset.getInt("totalcount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		int pageTotalCount = 0;//navi 토탈 카운트
		if(recordTotalCount%recordCountPerPage!=0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}
		else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(page<1) {
			page=1;
		}
		else if(page>pageTotalCount) {
			page=pageTotalCount;
		}
		int startNavi = ((page-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;

		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext=false;
		}
		
		StringBuilder sb = new StringBuilder();
		if(order==null) {
			order="posted_date";
		}
		if(needPrev) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/recipeList?cate1="+cate1
					+"&cate2="+cate2+"&cate3="+cate3+"&cate4="+cate4+"&order="+order+"&search=&page="+(startNavi-1)+"'> < </a></li>");
			
		}
		for(int i=startNavi;i<=endNavi;i++) {
			if(i==page) {
				sb.append("<li class=\"page-item active\"><a class=\"page-link\" href='/recipeList?cate1="+cate1
						+"&cate2="+cate2+"&cate3="+cate3+"&cate4="+cate4+"&order="+order+"&search=&page="+i+"'><B>"+i+"</B></a></li>");
			}
			else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/recipeList?cate1="+cate1
						+"&cate2="+cate2+"&cate3="+cate3+"&cate4="+cate4+"&order="+order+"&search=&page="+i+"'>"+i+"</a></li>");
			}
		}
		if(needNext) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/recipeList?cate1="+cate1
					+"&cate2="+cate2+"&cate3="+cate3+"&cate4="+cate4+"&order="+order+"&search=&page="+(endNavi+1)+"'> > </a></li>");
		}
		return sb.toString();
	}

	public Recipe recipeSelect(Connection conn, int recipeNo) {
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Recipe r = null;
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("recipeSelect");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Recipe();
				r.setRecipeNo(rset.getInt("RECIPE_NO"));
				r.setRecipeTitle(rset.getString("RECIPE_TITLE"));
				r.setRecipeIntro(rset.getString("RECIPE_INTRO"));
				r.setRecipePic(rset.getString("RECIPE_PIC"));
				r.setCookServing(rset.getString("COOK_SERVING"));
				r.setCookTime(rset.getString("COOK_TIME"));
				r.setCookLevel(rset.getString("COOK_LEVEL"));
				r.setIngredient(rset.getString("INGREDIENT"));
				r.setTip(rset.getString("TIP"));
				r.setCompletePic(rset.getString("COMPLETE_PIC"));
				r.setRecipeViews(rset.getInt("RECIPE_VIEWS"));
				r.setRecipeMonthViews(rset.getInt("RECIPE_MONTH_VIEWS"));
				r.setRecipeTodayViews(rset.getInt("RECIPE_TODAY_VIEWS"));
				r.setRecipeTag(rset.getString("RECIPE_TAG"));
				r.setVideo(rset.getString("VIDEO"));
				r.setPostedDate(rset.getDate("POSTED_DATE"));
				r.setClassNo(rset.getInt("CLASS_NO"));
				r.setMethodNo(rset.getInt("METHOD_NO"));
				r.setIngreNo(rset.getInt("INGRE_NO"));
				r.setMemberNo(rset.getInt("MEMBER_NO"));
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
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
	}

	public ArrayList<Process> processSelect(Connection conn, int recipeNo) {
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList <Process> list = new ArrayList<Process>();
		Process p = null;
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("processSelect");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				p = new Process();
				p.setProcessNo(rset.getInt("PROCESS_NO"));
				p.setProcessOrder(rset.getInt("PROCESS_ORDER"));
				p.setProcessExplain(rset.getString("PROCESS_EXPLAIN"));
				p.setProcessPic(rset.getString("PROCESS_PIC"));
				p.setIngre(rset.getString("INGRE"));
				p.setTools(rset.getString("TOOLS"));
				p.setFireLevel(rset.getString("FIRE_LEVEL"));
				p.setTip(rset.getString("TIP"));
				p.setRecipeNo(rset.getInt("RECIPE_NO"));
				list.add(p);
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
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<RecipeComment> getCurrentPage(Connection conn, int page, int recordCountPerPage, int recipeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		int start = (page - 1)*recordCountPerPage + 1;
		int end = page*recordCountPerPage;
		boolean first = true;
		String query = "";
		String where = "";
		ArrayList<RecipeComment> list = new ArrayList<RecipeComment>();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			query = prop.getProperty("recipeComment");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				RecipeComment rc = new RecipeComment();
				rc.setCommentNo(rset.getInt("comment_no"));
				rc.setCommentContents(rset.getString("comment_contents"));
				rc.setEnrollDate(rset.getDate("enroll_date"));
				rc.setRecipeNo(rset.getInt("recipe_no"));
				rc.setMemberNo(rset.getInt("member_no"));
				//rc.setMemberPic(rset.getString("member_pic"));
				//rc.setMemberNickName(rset.getString("member_nick_name"));
				list.add(rc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public String getPageNavi(Connection conn, int page, int recordCountPerPage, int naviCountPerPage, int recipeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int recordTotalCount = 0; //총 게시물 개수 저장 변수
		boolean first = true;
		String query = "";
		String where = "";
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			query = prop.getProperty("recipeCommentAll");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				recordTotalCount = rset.getInt("totalcount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		int pageTotalCount = 0;//navi 토탈 카운트
		if(recordTotalCount%recordCountPerPage!=0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}
		else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(page<1) {
			page=1;
		}
		else if(page>pageTotalCount) {
			page=pageTotalCount;
		}
		int startNavi = ((page-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;

		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext=false;
		}
		
		StringBuilder sb = new StringBuilder();
		if(needPrev) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" onclick='showComment("+(startNavi-1)+");'> < </a></li>");
			
		}
		for(int i=startNavi;i<=endNavi;i++) {
			if(i==page) {
				sb.append("<li class=\"page-item active\"><a class=\"page-link\"  onclick='showComment("+i+");'><B>"+i+"</B></a></li>");
			}
			else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\"  onclick='showComment("+i+");'>"+i+"</a></li>");
			}
		}
		if(needNext) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\"  onclick='showComment("+(endNavi+1)+");'> > </a></li>");
		}
//		if(needPrev) {
//			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/recipeComment?search=&page="+(startNavi-1)+"'> < </a></li>");
//			
//		}
//		for(int i=startNavi;i<=endNavi;i++) {
//			if(i==page) {
//				sb.append("<li class=\"page-item active\"><a class=\"page-link\" href='/recipeComment?page="+i+"'><B>"+i+"</B></a></li>");
//			}
//			else {
//				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/recipeComment?page="+i+"'>"+i+"</a></li>");
//			}
//		}
//		if(needNext) {
//			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/recipeComment?page="+(endNavi+1)+"'> > </a></li>");
//		}
		return sb.toString();
	}

	public int writeRecipeComment(Connection conn, int recipeNo, int memberNo, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("writeComment");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, content);
			pstmt.setInt(2, recipeNo);
			pstmt.setInt(3, memberNo);
			result = pstmt.executeUpdate();
			return result;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return 0;
	}

}
