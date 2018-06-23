package product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import common.JDBCTemplate;
import product.model.vo.Review;
import ranking.model.dao.RankingDao;
import ranking.model.vo.Ranking;

public class ReviewDao {

	public int updateReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = ReviewDao.class.getResource("").getPath();
		
		
		try {
			prop.load(new FileReader(path+"reviewQuery.properties"));
			String query = prop.getProperty("reviewUpdate");
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, r.getReviewContents());
			pstmt.setInt(2, r.getReviewSatisfied());
			pstmt.setInt(3, r.getProductNo());
			pstmt.setString(4, r.getMemberId());
			
			result = pstmt.executeUpdate();
			
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
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<Review> reviewBuyCheckList(Connection conn, String userId, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> reviewBuyList = new ArrayList<Review>();
		
		Properties prop = new Properties();
		String path = ReviewDao.class.getResource("").getPath();
		
		try {
			prop.load(new FileReader(path+"reviewQuery.properties"));
			String query = prop.getProperty("buyCheck");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Review r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setMemberId(rset.getString("member_id"));
				r.setMemberNo(rset.getInt("member_no"));
				r.setProductNo(rset.getInt("product_no"));
				r.setNickName(rset.getString("nickname"));
				r.setBuyingNo(rset.getInt("buying_no"));
				r.setBuyingPayYN(rset.getString("buying_pay_yn"));
				reviewBuyList.add(r);
				
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
		return reviewBuyList;	
	}

	public int deleteReview(Connection conn, String userId, int reviewNo, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = ReviewDao.class.getResource("").getPath();
		

			try {
				prop.load(new FileReader(path+"reviewQuery.properties"));
				String query = prop.getProperty("reviewDelete");
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				pstmt.setInt(2, productNo);
				pstmt.setInt(3, reviewNo);
				
				
				result = pstmt.executeUpdate();
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
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int modifyReview(Connection conn, int reviewNo, int rating, String buyingAfterText) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = ReviewDao.class.getResource("").getPath();
		

			try {
				prop.load(new FileReader(path+"reviewQuery.properties"));
				String query = prop.getProperty("reviewModify");
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, buyingAfterText);
				pstmt.setInt(2, rating);
				pstmt.setInt(3, reviewNo);
				
				
				result = pstmt.executeUpdate();
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
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
