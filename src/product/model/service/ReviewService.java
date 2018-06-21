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

}
