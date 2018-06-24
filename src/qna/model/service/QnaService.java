package qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.vo.Answer;
import common.JDBCTemplate;
import qna.model.dao.QnaDao;
import qna.model.vo.InquiryOrder;
import qna.model.vo.Qna;
import qna.model.vo.Question;

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

	public ArrayList<Question> questionList(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Question> qList = new QnaDao().questionList(conn,memberNo);
		
		JDBCTemplate.close(conn);
		
		return qList;
		
		
	}

	public int updateQuestion(int queNo, String queTitle, int buyingNo, int memberNo, String queContents) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaDao().updateQuestion(conn,queNo,queTitle,buyingNo,memberNo,queContents);
		
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

	public int deleteQuestion(int queNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaDao().deleteQuestion(conn,queNo);
		
		if(result>0)
		{
			JDBCTemplate.commit(conn);
		}
		else
		{
			JDBCTemplate.rollback(conn);
		}
		return result;
		
		
	}

	public ArrayList<Answer> answerCheck(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Answer>ansList = new QnaDao().answerCheck(conn,memberNo);
		
		JDBCTemplate.close(conn);
		
		return ansList;
		
		
	}

	public ArrayList<Qna> qnaList(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Qna> qnaList = new QnaDao().qnaList(conn,memberNo);
		
		JDBCTemplate.close(conn);
		return qnaList;
		
	}

}
