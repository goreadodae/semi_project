package admin.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import admin.model.vo.AdminRecipe;
import common.JDBCTemplate;
import recipe.model.vo.Recipe;

public class AdminDao {

	public ArrayList<AdminRecipe> getCurrentPage(Connection conn, int page, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int start = (page - 1)*recordCountPerPage + 1;
		int end = page*recordCountPerPage;
		String query = "";
		ArrayList<AdminRecipe> list = new ArrayList<AdminRecipe>();
		try {
			query = "select recipe_no,recipe_title,recipe_views,posted_date,m.member_id as id from (select recipe.*, row_number() over(order by recipe_no desc) as num from recipe) join member m using(member_no) where num between ? and ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				AdminRecipe ar = new AdminRecipe();
				ar.setRecipeNo(rset.getInt("recipe_no"));
				ar.setRecipeTitle(rset.getString("recipe_title"));
				ar.setRecipeViews(rset.getInt("recipe_views"));
				ar.setPostedDate(rset.getDate("posted_date"));
				ar.setMemberId((rset.getString("id")));
				list.add(ar);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public String getPageNavi(Connection conn, int page, int recordCountPerPage, int naviCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int recordTotalCount = 0; //총 게시물 개수 저장 변수
		String query = "select count(*) as totalcount from recipe";
		try {
			
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
		if(needPrev) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/recipeMgt?page=1\"> << </a></li>");
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/recipeMgt?page="+(startNavi-1)+"\"> < </a></li>");
		}
		for(int i=startNavi;i<=endNavi;i++) {
			if(i==page) {
				sb.append("<li class=\"page-item active\"><a class=\"page-link\"  href=\"/recipeMgt?page="+i+"\"><B>"+i+"</B></a></li>");
			}
			else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\"  href=\"/recipeMgt?page="+i+"\">"+i+"</a></li>");
			}
		}
		if(needNext) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\"  href=\"/recipeMgt?page="+(endNavi+1)+"\"> > </a></li>");
			sb.append("<li class=\"page-item\"><a class=\"page-link\"  href=\"/recipeMgt?page="+pageTotalCount+"\"> >> </a></li>");
		}
		return sb.toString();
	}

}
