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


	public ArrayList<Notice> getSearchCurrentPage(Connection conn, int currentPage, int recordCountPerPage, String searchBy, String inputWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		StringBuffer query = new StringBuffer();

		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);

		int end = currentPage * recordCountPerPage;
		
		

		ArrayList<Notice> list = new ArrayList<Notice>();

		try {
			//체크에 따라 쿼리문이 다르게 해야 함 
			if(searchBy.equals(""))
			{
				query.append( "select*from");
				query.append("(select notice.*,row_number() ");
				query.append("over(order by notice_no desc)as num from notice)");
				query.append("where num between ? and ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				query.delete(0, query.toString().length());
			}
			else if(searchBy.equals("searchName"))
			{ 
				
				query.append("select*from");
				query.append("(select notice.*,row_number() ");
				query.append("over(order by notice_no desc) as num from notice where notice_writer like ? )");
				query.append("where num between ? and ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, '%'+inputWord+'%');
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
	
				query.delete(0,query.toString().length());
	
			} 
			
			else if(searchBy.equals("searchContents"))
			{
				query.append("select*from");
				query.append("(select notice.*,row_number() ");
				query.append("over(order by notice_no desc) as num from notice where notice_contents like ? )");
				query.append("where num between ? and ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, '%'+inputWord+'%');
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);	
				
				query.delete(0,query.toString().length());
			}
			else if(searchBy.equals("searchTitle"))
			{
				query.append("select*from");
				query.append("(select notice.*,row_number() ");
				query.append("over(order by notice_no desc) as num from notice where notice_writer like ? or notice_title like ? )");
				query.append("where num between ? and ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, '%'+inputWord+'%');
				pstmt.setString(2, '%'+inputWord+'%');
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				
				query.delete(0,query.toString().length());
	
			}
			
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


	public String searchGetPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,String searchBy, String inputWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int recordTotalCount = 0;
		String query = "select count(*)as totalCount from notice";

		try {
			
				if(searchBy.equals(""))
				{
					
					pstmt = conn.prepareStatement(query);
					
					
				}
				else if(searchBy.equals("searchName"))
				{
					query+=" where notice_writer like ? ";
					
					pstmt= conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					
					
				}
				else if(searchBy.equals("searchTitle"))
				{
					query+=" where notice_title like ? ";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					
					
				}
				else if(searchBy.equals("searchContents"))
				{
					query+=" where notice_contents like ? ";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					
				}
				
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
			sb.append("<a class='page-link' href='/searchNotice?searchBy="+searchBy+"&inputWord="+inputWord+"&currentPage="+(startNavi-1)+" aria-label='previous'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("<span class='sr-only'>Previous</span></a></li>");
		}
		for(int i =startNavi; i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<li class=\'page-item active\'><a class=\'page-link\'");
				sb.append(" href='/searchNotice?searchBy="+searchBy+"&inputWord="+inputWord+"&currentPage="+i+"'>"+i+"</a>");			
			}
			else
			{
				sb.append("<li class=\'page-item\'><a class=\'page-link\'");
				sb.append(" href='/searchNotice?searchBy="+searchBy+"&inputWord="+inputWord+"&currentPage="+i+"'>"+i+"</a>");
			}
		}
		if(needNext)
		{
			sb.append("<li class=\'page-item\'>");
			sb.append("<a class='page-link' href='/searchNotice?searchBy="+searchBy+"&inputWord="+inputWord+"&currentPage="+(endNavi+1)+" aria-label='Next'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("<span class='sr-only'>Next</span></a></li>");
		}



		return sb.toString();
		
	}


	public String previousNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String preNotice = "";
	
		
		try {
			//이전글 쿼리
			String query = "select notice_title from notice where notice_no=(select max(notice_no) from notice where notice_no < ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				
			
				preNotice =rset.getString("notice_title");
		
			}
			
		} catch ( SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return preNotice;
		
		
		
		
		
		
				
		
	}


	public String nextNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String nexNotice = "";
		
		try {
			//다음글쿼리
			String query = "select notice_title from notice where notice_no=(select min(notice_no) from notice where notice_no > ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				nexNotice = rset.getString("notice_title");
			}
			
			
		} catch ( SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return nexNotice;
	}


	public int viewCount(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update notice set notice_views = notice_views+1 where notice_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
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


	public Notice noticeSelect(Connection conn, int noticeNo) {
		
		PreparedStatement pstmt = null;
		  ResultSet rset = null;
	      String query = "select * from notice where notice_no=?";
	      Notice notice = null;
	      
	      try {
	          pstmt = conn.prepareStatement(query);
	          
	          pstmt.setInt(1, noticeNo);
	          rset = pstmt.executeQuery();
	          
	          if(rset.next()) {
	             notice = new Notice();
	             
	             notice.setNoticeNo(rset.getInt("notice_no"));
	             notice.setNoticeTitle(rset.getString("notice_title"));
	             notice.setNoticeContents(rset.getString("notice_contents"));
	             notice.setNoticeWriter(rset.getString("notice_writer"));
	             notice.setReportingDate(rset.getDate("reporting_date"));
	             notice.setNoticeViews(rset.getInt("notice_views"));
	             
	          }
	          
	       } catch (SQLException e) {
	          // TODO Auto-generated catch block
	          e.printStackTrace();
	       }finally {
	    	 JDBCTemplate.close(rset);
	         JDBCTemplate.close(pstmt);
	       }
	       
	       return notice;
	}


	public int updateNotice(Connection conn, Notice n) {
		
		PreparedStatement pstmt = null;
		int result =0;
		String query ="update notice set notice_title=?, notice_contents=? where notice_no=?";
		
		 try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, n.getNoticeTitle());
	         pstmt.setString(2, n.getNoticeContents());
	         pstmt.setInt(3,n.getNoticeNo());
	         
	         result = pstmt.executeUpdate();
	         
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	         JDBCTemplate.close(pstmt);
	       }
         
		return result;
	}


	public int noticeInsert(Connection conn, Notice n) {
		
		PreparedStatement pstmt = null;
		int result =0;
		String query ="insert into notice values(NOTICE_SEQ.NEXTVAL,?,?,?,sysdate,0)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContents());
			pstmt.setString(3, n.getNoticeWriter());
			
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
