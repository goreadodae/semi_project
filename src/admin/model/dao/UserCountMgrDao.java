package admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.vo.Notice;

public class UserCountMgrDao {

	public int userCount(Connection conn) {

		PreparedStatement pstmt = null;
		  ResultSet rset = null;
		  int result =0;
	      String query = "select count(*) as memcount from member";

	      try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt("memcount");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	    	 JDBCTemplate.close(rset);
	         JDBCTemplate.close(pstmt);
	     }
	      
	      return result;
		
	}

	public int recipeCount(Connection conn) {
		PreparedStatement pstmt = null;
		  ResultSet rset = null;
		  int result =0;
	      String query = "select count(*) as recipeCount from recipe";

	      try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt("recipeCount");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	    	 JDBCTemplate.close(rset);
	         JDBCTemplate.close(pstmt);
	     }
	      
	      return result;
		
	}

	public int todayBuyProductCount(Connection conn) {

		PreparedStatement pstmt = null;
		  ResultSet rset = null;
		  int result =0;
	      String query = "select count(*) from buying where buying_date=sysdate";

	      try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt("recipeCount");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	    	 JDBCTemplate.close(rset);
	         JDBCTemplate.close(pstmt);
	     }
	      
	      return result;
		
	}

	public ArrayList<Notice> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);

		int end = currentPage * recordCountPerPage;

		String query="select*from"+"(select notice.*,row_number() "
				+"over(order by notice_no desc)as num from notice)"
				+ "where num between ? and ?";
		ArrayList<Notice> list = new ArrayList<Notice>();

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeContents(rset.getString("notice_contents"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setReportingDate(rset.getDate("reporting_date"));
				n.setNoticeViews(rset.getInt("notice_views"));
				list.add(n);
			}
			
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}
	
	

}
