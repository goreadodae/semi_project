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

}
