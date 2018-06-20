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

	public int insertQuestion(Connection conn, String queTitle, String queContents, int memberNo, int buyingNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query ="";
		
		try {
			if(buyingNo!=0)
			{
				query ="insert into question values(seq_que.nextval,?,sysdate,?,?,default,?)";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, queTitle);
				pstmt.setString(2, queContents);
				pstmt.setInt(3,memberNo);
				pstmt.setInt(4, buyingNo);
			}
			else
			{
				query ="insert into question values(seq_que.nextval,?,sysdate,?,?,default,null)";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, queTitle);
				pstmt.setString(2, queContents);
				pstmt.setInt(3,memberNo);
				
			}
			result = pstmt.executeUpdate();
			
	
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
		
	}

}
