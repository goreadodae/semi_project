package qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import qna.model.dao.QnaDao;
import qna.model.vo.InquiryOrder;

public class QnaService {

	public ArrayList<InquiryOrder> inquiryOrder(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<InquiryOrder> list = new QnaDao().inquiryOrder(conn,userNo);
		
		JDBCTemplate.close(conn);
		return list;
		
		
		
		
		
		
		
	}

	public int insertQuestion(String queTitle, String queContents, int memberNo, int buyingNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaDao().insertQuestion(conn,queTitle,queContents,memberNo,buyingNo);
		
		if(result>0)
		{
			JDBCTemplate.commit(conn);
		}
		else
		{
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}

}
