package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> viewNotice() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Notice> noticeList = new NoticeDao().viewNotice(conn);
		JDBCTemplate.close(conn);
		

		return noticeList;
	}

	public Notice viewDetailNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = new NoticeDao().viewDetailNotice(conn,noticeNo);
		JDBCTemplate.close(conn);
		
		return n;
	}

}
