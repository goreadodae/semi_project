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
	
	
	public ArrayList<Notice> getCurrentPage(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		
		int end = currentPage * recordCountPerPage;
		
		String query="select*from"+"(select notice.*,row_number() "
					+"over(order by notice_no desc)as num from notice)"
							+ "where num between ? and ?";
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeContents(rset.getString("notice_contents"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setReportingDate(rset.getDate("reporting_date"));
				n.setNoticeViews(rset.getInt("notice_views"));
				list.add(n);
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
	
	
	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int recordTotalCount = 0;
		String query="select count(*)as totalCount from notice";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				recordTotalCount = rset.getInt("totalCount");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		int pageTotalCount=0;
		
		if(recordTotalCount%recordCountPerPage!=0)
		{
			pageTotalCount = recordTotalCount /recordCountPerPage+1;
			
		}
		else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		if(currentPage<1)
		{
			currentPage=1;
		}
		else if(currentPage>pageTotalCount)
		{
			currentPage = pageTotalCount;
		}
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		
		int endNavi = startNavi + naviCountPerPage-1;
		
		if(endNavi>pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1)
		{
			needPrev=false;
		}
		if(endNavi==pageTotalCount)
		{
			needNext=false;
		}
		StringBuilder sb = new StringBuilder();
		if(needPrev)
		{
			sb.append("<li class=\'page-item\'>");
			sb.append("<a class='page-link' href='/noticeList?currentPage="+(startNavi-1)+" aria-label='previous'>");
		    sb.append("<span aria-hidden='true'>&laquo;</span>");
		    sb.append("<span class='sr-only'>Previous</span></a></li>");
		}
		for(int i =startNavi; i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<li class=\'page-item active\'><a class=\'page-link\'");
				sb.append(" href='/noticeList?currentPage="+i+"'>"+i+"</a>");			
			}
			else
			{
				sb.append("<li class=\'page-item\'><a class=\'page-link\'");
				sb.append(" href='/noticeList?currentPage="+i+"'>"+i+"</a>");
			}
		}
		if(needNext)
		{
			sb.append("<li class=\'page-item\'>");
			sb.append("<a class='page-link' href='/noticeList?currentPage="+(endNavi+1)+" aria-label='Next'>");
		    sb.append("<span aria-hidden='true'>&laquo;</span>");
		    sb.append("<span class='sr-only'>Next</span></a></li>");
		}

		
		
		return sb.toString();
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
