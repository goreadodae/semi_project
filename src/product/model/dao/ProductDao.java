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
import product.model.vo.Basket;
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
	
	public ArrayList<Basket> getMyBasket(Connection conn, int member_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Basket> bList = new ArrayList<Basket>();
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("basketSelect");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, member_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Basket b = new Basket();
				b.setBasket_no(rset.getInt("bascket_no"));
				b.setProduct_name(rset.getString("product_name"));
				b.setProduct_1st_pic(rset.getString("product_1st_pic"));
				b.setBasket_quantity(rset.getInt("bascket_quantity"));
				b.setProduct_price(rset.getInt("product_price"));
				bList.add(b);
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
		
		return bList;
	}

	public int deleteBasket(Connection conn, int basket_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
	
		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketDelete");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basket_no);
			result = pstmt.executeUpdate();
			
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
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public int insertBasket(Connection conn, int basket_quantity,int member_no,int product_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
	
		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketInsert");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basket_quantity);
			pstmt.setInt(2, member_no);
			pstmt.setInt(3, product_no);
			result = pstmt.executeUpdate();
			
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
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateBasket(Connection conn, int basket_quantity, int basket_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
	
		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketUpdate");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basket_quantity);
			pstmt.setInt(2, basket_no);

			result = pstmt.executeUpdate();
			
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
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	

}
