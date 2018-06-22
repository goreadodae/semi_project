package admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.model.vo.AdminProduct;
import admin.model.vo.AdminRecipe;
import common.JDBCTemplate;
import qna.model.vo.Question;

public class AdminDao {

	public ArrayList<AdminRecipe> getCurrentPage(Connection conn, int page, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int start = (page - 1) * recordCountPerPage + 1;
		int end = page * recordCountPerPage;
		String query = "";
		ArrayList<AdminRecipe> list = new ArrayList<AdminRecipe>();
		try {
			query = "select recipe_no,recipe_title,recipe_views,posted_date,m.member_id as id from (select recipe.*, row_number() over(order by recipe_no desc) as num from recipe) join member m using(member_no) where num between ? and ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
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
		int recordTotalCount = 0; // 총 게시물 개수 저장 변수
		String query = "select count(*) as totalcount from recipe";
		try {

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
		if (needPrev) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/recipeMgt?page=1\"> << </a></li>");
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/recipeMgt?page=" + (startNavi - 1)
					+ "\"> < </a></li>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			if (i == page) {
				sb.append("<li class=\"page-item active\"><a class=\"page-link\"  href=\"/recipeMgt?page=" + i
						+ "\"><B>" + i + "</B></a></li>");
			} else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\"  href=\"/recipeMgt?page=" + i + "\">" + i
						+ "</a></li>");
			}
		}
		if (needNext) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\"  href=\"/recipeMgt?page=" + (endNavi + 1)
					+ "\"> > </a></li>");
			sb.append("<li class=\"page-item\"><a class=\"page-link\"  href=\"/recipeMgt?page=" + pageTotalCount
					+ "\"> >> </a></li>");
		}
		return sb.toString();
	}

	public ArrayList<Question> getQuestionCurrentPage(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Question q = null;

		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;

		String query = "select que_no,que_title,que_time,que_contents,member_no,member_id,buying_no,response_yn "
				+ "from(select question.*,row_number()over(order by que_no desc) as num from question) "
				+ "left join member using(member_no) where num between ? and ? ";

		ArrayList<Question> list = new ArrayList<Question>();

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				q = new Question();
				q.setQueNo(rset.getInt("que_no"));
				q.setQueTitle(rset.getString("que_title"));
				q.setQueTime(rset.getTimestamp("que_time"));
				q.setQueContents(rset.getString("que_contents"));
				q.setMemberNo(rset.getInt("member_no"));
				q.setMemberId(rset.getString("member_id"));
				q.setBuyingNo(rset.getInt("buying_no"));
				q.setResponseYn(rset.getString("response_yn"));
				list.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public ArrayList<AdminProduct> getProductList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select recipe_title, product_name, member.NICKNAME, product_price, sell_quantity, product_price*sell_quantity as total_sales, product_no, recipe_no\r\n"
				+ "from product join recipe using (recipe_no)\r\n" + "join member using(member_no)\r\n"
				+ "left join (select product_no, sum(buying_quantity) as sell_quantity\r\n" + "from buying\r\n"
				+ "group by product_no) using (product_no)";
		ArrayList<AdminProduct> list = new ArrayList<AdminProduct>();
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				AdminProduct ap = new AdminProduct();
				ap.setRecipeTitle(rset.getString("recipe_title"));
				ap.setProductName(rset.getString("product_name"));
				ap.setRecipeWriter(rset.getString("nickname"));
				ap.setPrice(rset.getInt("product_price"));
				ap.setSellQuantity(rset.getInt("sell_quantity"));
				ap.setTotalSales(rset.getInt("total_sales"));
				ap.setProductNo(rset.getInt("product_no"));
				ap.setRecipeNo(rset.getInt("recipe_no"));
				list.add(ap);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public String getQuestionPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int recordTotalCount = 0;
		String query = "select count(*)as totalCount from question";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				recordTotalCount = rset.getInt("totalCount");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		int pageTotalCount = 0;

		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;

		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;

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
		if (needPrev) {
			sb.append("<li class=\'page-item\'>");
			sb.append("<a class='page-link' href='/qnaMgt?currentPage=" + (startNavi - 1) + " aria-label='previous'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("<span class='sr-only'>Previous</span></a></li>");

		}
		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class=\'page-item active\'><a class=\'page-link\'");
				sb.append(" href='/qnaMgt?currentPage=" + i + "'>" + i + "</a>");
			} else {
				sb.append("<li class=\'page-item\'><a class=\'page-link\'");
				sb.append(" href='/qnaMgt?currentPage=" + i + "'>" + i + "</a>");
			}
		}
		if (needNext) {
			sb.append("<li class=\'page-item\'>");
			sb.append("<a class='page-link' href='/qnaMgt?currentPage=" + (endNavi + 1) + " aria-label='Next'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("<span class='sr-only'>Next</span></a></li>");
		}

		return sb.toString();

	}

	public Question questionDetail(Connection conn, int queNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select que_no,que_title,que_time,que_contents,member_no,member_id,buying_no" 
					  + " from question left join member using(member_no) where que_No= ? ";
		Question qt = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, queNo);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				qt = new Question();
				qt.setQueNo(rset.getInt("que_no"));
				qt.setQueTitle(rset.getString("que_title"));
				qt.setQueTime(rset.getTimestamp("que_time"));
				qt.setQueContents(rset.getString("que_contents"));
				qt.setMemberNo(rset.getInt("member_no"));
				qt.setMemberId(rset.getString("member_id"));
				qt.setBuyingNo(rset.getInt("buying_no"));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		
		
		return qt;
	}

}
