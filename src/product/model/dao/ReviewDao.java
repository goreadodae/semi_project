package product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import common.JDBCTemplate;
import product.model.vo.Review;
import ranking.model.dao.RankingDao;

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

}
