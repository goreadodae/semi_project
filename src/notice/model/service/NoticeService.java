package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.PageData;

public class NoticeService {
	
	public PageData noticeAll(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage=10;
		int naviCountPerPage=5;
		
		ArrayList<Notice> list = new NoticeDao().getCurrentPage(conn,currentPage,recordCountPerPage);
		String pageNavi = new NoticeDao().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);
		
		PageData pd = null;
		if(!list.isEmpty()&&!pageNavi.isEmpty())
		{
			pd = new PageData();
			pd.setNoticeList(list);
			pd.setPageNavi(pageNavi);
		}
		JDBCTemplate.close(conn);
		
		
		return pd;
		
		
	}
	
	public Notice viewDetailNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = new NoticeDao().viewDetailNotice(conn,noticeNo);
		JDBCTemplate.close(conn);
		
		return n;
	}



	public PageData searchNotice(int currentPage, String searchBy, String inputWord) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage=10;
		int naviCountPerPage=5;
		PageData pd = null;
		
	
		ArrayList<Notice> list = new NoticeDao().getSearchCurrentPage(conn,currentPage,recordCountPerPage,searchBy,inputWord);
		String pageNavi = new NoticeDao().searchGetPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,searchBy,inputWord);
		if(!list.isEmpty()&&!pageNavi.isEmpty())
		{
			pd = new PageData();
			pd.setNoticeList(list);
			pd.setPageNavi(pageNavi);
		}
		JDBCTemplate.close(conn);
		
		return pd;
		
	}

	public String previousNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		String preNotice =new NoticeDao().previousNotice(conn,noticeNo);
		
		JDBCTemplate.close(conn);
		
		
		return preNotice;
	}

	public String nextNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		String nexNotice = new NoticeDao().nextNotice(conn,noticeNo);
		
		JDBCTemplate.close(conn);
		
		return nexNotice;
	}

	public int viewCount(int noticeNo) {
		System.out.println("쿠키가 없당");
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().viewCount(conn,noticeNo);
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

	public Notice noticeSelect(int noticeNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Notice notice = new NoticeDao().noticeSelect(conn,noticeNo);
		
		JDBCTemplate.close(conn);
		
		return notice;
	}

	public int updateNotice(Notice n) {

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().updateNotice(conn,n);
		
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

	public int noticeInsert(Notice n) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().noticeInsert(conn,n);
		
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
