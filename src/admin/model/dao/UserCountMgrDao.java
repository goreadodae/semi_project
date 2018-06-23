package admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	

}
