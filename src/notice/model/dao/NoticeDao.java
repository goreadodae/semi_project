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
				sb.append("<li class=\'page-item\'><a style='text-color:black; background-color:#795b8f;' class=\'page-link\'");
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


	public ArrayList<Notice> getSearchCurrentPage(Connection conn, int currentPage, int recordCountPerPage, String searchByName, String searchByTitle, String searchByContents, String inputWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		StringBuffer query = new StringBuffer();

		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);

		int end = currentPage * recordCountPerPage;
		
		
		System.out.println(searchByName);
		System.out.println(searchByTitle);
		System.out.println(searchByContents);
		System.out.println(inputWord);

		ArrayList<Notice> list = new ArrayList<Notice>();

		try {
			
			if(searchByName.equals("") && searchByTitle.equals("") && searchByContents.equals(""))
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
			else if(searchByName.equals("searchName")&&searchByTitle.equals("")&&searchByContents.equals(""))
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
			
			else if(searchByContents.equals("searchContents")&& searchByName.equals("")&&  searchByTitle.equals(""))
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
			else if(searchByTitle.equals("searchTitle")&&searchByName.equals("")&&searchByContents.equals(""))
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
			else if(searchByName.equals("searchName")&&searchByContents.equals("searchContents")&&searchByTitle.equals(""))
			{
				query.append("select*from");
				query.append("(select notice.*, row_number() ");
				query.append("over(order by notice_no desc) as num from notice where notice_writer like ? or notice_contents like ? ) ");
				query.append("where num between ? and ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, '%'+inputWord+'%');
				pstmt.setString(2, '%'+inputWord+'%');
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				
				query.delete(0, toString().length());
				
			}
			else if(searchByTitle.equals("searchTitle")&&searchByName.equals("searchName")&&searchByContents.equals(""))
			{
				query.append("select*from");
				query.append("(select notice.*, row_number() ");
				query.append("over(order by notice_no desc) as num fro(m notice where notice_title like ? or notice_writer like ? )");
				query.append("where num between ? and ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, '%'+inputWord+'%');
				pstmt.setString(2, '%'+inputWord+'%');
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				
				query.delete(0, toString().length());
				
			}
			else if(searchByContents.equals("searchContents")&&searchByTitle.equals("searchTitle")&&searchByName.equals(""))
			{
				query.append("select*from");
				query.append("(select notice.*,row_number() ");
				query.append("over(order by notice_no desc) as num from notice where notice_title like ? or notice_Contents like ? )");
				query.append("where num between ? and ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, '%'+inputWord+'%');
				pstmt.setString(2, '%'+inputWord+'%');
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				
				query.delete(0, toString().length());
				
			}
			else if(searchByContents.equals("searchContents")&&searchByName.equals("searchName")&&searchByTitle.equals(""))
			{
				query.append("select*from");
				query.append("(select notice.*,row_number() ");
				query.append("over(order by notice_no desc as num from notice where notice_contents like ? or notice_writer like ? )");
				query.append("where num between ? and ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1,'%'+inputWord+'%');
				pstmt.setString(2, '%'+inputWord+'%');
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				
				query.delete(0, toString().length());
			}
			else if(searchByName.equals("searchName")&&searchByTitle.equals("searchTitle")&&searchByContents.equals("searchContents"))
			{
				query.append("select*from");
				query.append("(select notice.*,row_number() ");
				query.append("over(order by notice_no desc as num from notice where notice_writer like ? or notice_title like ? or notice_contents like ? )");
				query.append("where num between ? and ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1,'%'+inputWord+'%');
				pstmt.setString(2, '%'+inputWord+'%');
				pstmt.setString(3, '%'+inputWord+'%');
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				
				query.delete(0, toString().length());
			}
			else
			{
				System.out.println("아예 안들어옴");
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


	public String searchGetPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,String searchByName, String searchByTitle, String searchByContents, String inputWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int recordTotalCount = 0;
		String query = "select count(*)as totalCount from notice";

		try {
			
				if(searchByName.equals("") && searchByTitle.equals("") && searchByContents.equals(""))
				{
					
					pstmt = conn.prepareStatement(query);
					
					
				}
				else if(searchByName.equals("searchName"))
				{
					
					System.out.println("이름이 같을때 페이징처리");
					query+=" where notice_writer like ? ";
					
					pstmt= conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					
					
				}
				else if(searchByTitle.equals("searchTitle"))
				{
					query+=" where notice_title like ? ";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					
					
				}
				else if(searchByContents.equals("searchContents"))
				{
					query+=" where notice_contents like ? ";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					
				}
				else if(searchByName.equals("searchName")&&searchByTitle.equals("searchTitle"))
				{
					query+= " where notice_writer like ? or notice_title like ? ";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					pstmt.setString(2, '%'+inputWord+'%');
					
				
				}
				else if(searchByName.equals("searchName")&&searchByContents.equals("searchContents"))
				{
					query += " where notice_writer like ? or notice_Conetents like ? ";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					pstmt.setString(2, '%'+inputWord+'%');
					
					
				}
				else if(searchByTitle.equals("searchTitle")&&searchByName.equals("searchName"))
				{
					query += " where notice_title like ? or notice_writer like ? ";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					pstmt.setString(2, '%'+inputWord+'%');
					
					
				}
				else if(searchByContents.equals("searchContents")&&searchByTitle.equals("searchTitle"))
				{
					query += " where notice_contents like ? or notice_title like ? ";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					pstmt.setString(2, '%'+inputWord+'%');
					
					
				}
				else if(searchByContents.equals("searchContents")&&searchByName.equals("searchName"))
				{
					query += " where notice_contents like ?  or notice_writer like ? ";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					pstmt.setString(2, '%'+inputWord+'%');
					
				}
				else if(searchByName.equals("searchName")&&searchByTitle.equals("searchTitle")&&searchByContents.equals("searchContents"))
				{
					query += " where notice_writer like ? or notice_title like ? notice_contents like ?";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, '%'+inputWord+'%');
					pstmt.setString(2, '%'+inputWord+'%');
					pstmt.setString(3, '%'+inputWord+'%');
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
			sb.append("<a class='page-link' href='/searchNotice?currentPage="+(startNavi-1)+" aria-label='previous'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("<span class='sr-only'>Previous</span></a></li>");
		}
		for(int i =startNavi; i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<li class=\'page-item\'><a style='text-color:black; background-color:#795b8f;' class=\'page-link\'");
				sb.append(" href='/searchNotice?currentPage="+i+"'>"+i+"</a>");			
			}
			else
			{
				sb.append("<li class=\'page-item\'><a class=\'page-link\'");
				sb.append(" href='/searchNotice?currentPage="+i+"'>"+i+"</a>");
			}
		}
		if(needNext)
		{
			sb.append("<li class=\'page-item\'>");
			sb.append("<a class='page-link' href='/searchNotice?currentPage="+(endNavi+1)+" aria-label='Next'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("<span class='sr-only'>Next</span></a></li>");
		}



		return sb.toString();
		
	}











}
