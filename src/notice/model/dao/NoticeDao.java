package notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import notice.model.vo.Notice;

public class NoticeDao {

	public ArrayList<Notice> viewNotice(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		Notice n = null;
		ArrayList<Notice> noticeList = new ArrayList<Notice>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/noticeQuery.properties"));
			String query = prop.getProperty("viewNotice");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next())
			{
				n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeContents(rset.getString("notice_contents"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setReportingDate(rset.getDate("reporting_date"));
				n.setNoticeViews(rset.getInt("notice_views"));
				noticeList.add(n);
			}
			
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
			
			
		}
		
		
		
		return noticeList;
	}

	public Notice viewDetailNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/noticeQuery.properties"));
			String query = prop.getProperty("viewAllNotice");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				n= new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeContents(rset.getString("notice_contents"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setReportingDate(rset.getDate("reporting_date"));
				n.setNoticeViews(rset.getInt("notice_views"));
			}
			
			
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return n;
		
		
	}
	
	
	

}
