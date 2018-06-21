package qna.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import qna.model.vo.InquiryOrder;
import qna.model.vo.Question;

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

	public ArrayList<Question> questionList(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select que_no,que_title,que_time,que_contents,member_id "+ 
				"from question left join member on question.member_no = member.member_no " + 
				"where question.member_no = ?";
		Question qst = null;
		ArrayList<Question> qList = new ArrayList<Question>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();	
			
			while(rset.next())
			{
				qst = new Question();
				qst.setQueNo(rset.getInt("que_no"));
				qst.setQueTitle(rset.getString("que_title"));
				qst.setQueTime(rset.getTimestamp("que_time"));
				qst.setQueContents(rset.getString("que_Contents"));
				qst.setMemberId(rset.getString("member_id"));
				qList.add(qst);		
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return qList;
		
		
		
		
		
		
	}

	public int updateQuestion(Connection conn, int queNo, String queTitle, int buyingNo, int memberNo, String queContents) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query  = "";
		
		try {
			
			if(buyingNo==0)
			{
				query="update question set que_title=?, que_contents = ?, buying_no=null where que_no= ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, queTitle);
				pstmt.setString(2, queContents);
				pstmt.setInt(3, queNo);
			}
			else
			{
				query="update question set que_title=?, que_contents = ?, buying_no=? where que_no= ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, queTitle);
				pstmt.setString(2, queContents);
				pstmt.setInt(3, buyingNo);
				pstmt.setInt(4, queNo);
			}
			
			result = pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally
		{
			JDBCTemplate.close(pstmt);
		}
		return result;
		
		
		
		

		
		
		
	}

	public int deleteQuestion(Connection conn, int queNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from question where que_No=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, queNo);
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		
		
		
		
		
		
		return result;
	}

}
