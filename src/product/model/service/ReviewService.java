package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.dao.ReviewDao;
import product.model.vo.Review;
import ranking.model.dao.RankingDao;
import ranking.model.vo.Ranking;

public class ReviewService {

	public int updateReview(Review r) {
		Connection conn = JDBCTemplate.getConnection();
	
		int result = new ReviewDao().updateReview(conn, r);
		
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Review> reviewBuyCheckList(String userId, int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Review> reviewBuyList = new ReviewDao().reviewBuyCheckList(conn, userId,productNo);
		
		JDBCTemplate.close(conn);
		return reviewBuyList;
	}

	public int deleteReview(String userId, int reviewNo, int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().deleteReview(conn, userId ,reviewNo,productNo);
		
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int modifyReview(int reviewNo, int rating, String buyingAfterText) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().modifyReview(conn, reviewNo ,rating ,buyingAfterText);
		
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

}
