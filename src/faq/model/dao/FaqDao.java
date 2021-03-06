package faq.model.dao;

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
import faq.model.vo.Faq;

public class FaqDao {

	public ArrayList<Faq> viewfaqList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		Faq f = null;
		ArrayList<Faq> list = new ArrayList<Faq>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path+"resources/faqQuery.properties"));
			String query = prop.getProperty("viewFaq");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next())
			{
				f= new Faq();
				f.setFaqNo(rset.getInt("faq_No"));
				f.setFaqCategory(rset.getString("faq_category"));
				f.setFaqTitle(rset.getString("faq_title"));
				f.setFaqContents(rset.getString("faq_Contents"));
				list.add(f);

			}


		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return list;
	}

	public ArrayList<Faq> viewByCategory(Connection conn, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Faq faq = null;
		ArrayList<Faq> faqList = new ArrayList<Faq>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		
		try {
			prop.load(new FileReader(path+"resources/faqQuery.properties"));
			String query = prop.getProperty("byCategory");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				faq= new Faq();
				faq.setFaqNo(rset.getInt("faq_no"));
				faq.setFaqCategory(rset.getString("faq_category"));
				faq.setFaqTitle(rset.getString("faq_title"));
				faq.setFaqContents(rset.getString("faq_contents"));
				faqList.add(faq);
			}
			
			
			
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		
		return faqList;
	}

}
