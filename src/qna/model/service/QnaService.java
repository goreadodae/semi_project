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

}
