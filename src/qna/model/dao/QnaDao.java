package qna.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import qna.model.vo.InquiryOrder;

public class QnaDao {

	public ArrayList<InquiryOrder> inquiryOrder(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT BUYING_NO,buying_date,PRODUCT_NAME,BUYING_QUANTITY,PRODUCT_PRICE FROM (SELECT * FROM BUYING WHERE member_NO=?) A " + 
						"JOIN PRODUCT P  ON (A.PRODUCT_NO=P.PRODUCT_NO)";
		ArrayList<InquiryOrder> list = new ArrayList<InquiryOrder>(); 
		InquiryOrder iO = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				iO = new InquiryOrder();
				iO.setBuyingNo(rset.getInt("buying_no"));
				iO.setOrderDate(rset.getDate("buying_date"));
				iO.setProductName(rset.getString("product_Name"));
				iO.setBuyingQuantity(rset.getInt("buying_quantity"));
				iO.setProductPrice(rset.getInt("product_price"));
				list.add(iO);
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
