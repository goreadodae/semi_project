package product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import common.JDBCTemplate;
import product.model.vo.Product;

public class ProductDao {
	
	public ArrayList<Product>  getAllProduct(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("productSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				Product pro = new Product();
				pro.setProduct_no(rset.getInt("product_no"));
				pro.setProduct_quantity(rset.getInt("product_quantity"));
				pro.setProduct_name(rset.getString("product_name"));
				pro.setProduct_price(rset.getInt("product_price"));
				pro.setProduct_1st_pic(rset.getString("product_1st_pic"));
				pro.setProduct_spec_pic(rset.getString("product_spec_pic"));
				pro.setProduct_intro(rset.getString("product_intro"));
				pro.setProduct_info(rset.getString("product_info"));
				list.add(pro);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return list;
	}

	public Product getProduct(Connection conn, int product_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product productInfo = null;
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("productSelectOne");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, product_no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				productInfo = new Product();
				productInfo.setProduct_no(rset.getInt("product_no"));
				productInfo.setProduct_quantity(rset.getInt("product_quantity"));
				productInfo.setProduct_name(rset.getString("product_name"));
				productInfo.setProduct_price(rset.getInt("product_price"));
				productInfo.setProduct_1st_pic(rset.getString("product_1st_pic"));
				productInfo.setProduct_spec_pic(rset.getString("product_spec_pic"));
				productInfo.setProduct_intro(rset.getString("product_intro"));
				productInfo.setProduct_info(rset.getString("product_info"));
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return productInfo;
	}

	public ArrayList<Product> getThisMonthProduct(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

}
