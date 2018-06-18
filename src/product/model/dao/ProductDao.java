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
				pro.setProductNo(rset.getInt("product_no"));
				pro.setProductQuantity(rset.getInt("product_quantity"));
				pro.setProductName(rset.getString("product_name"));
				pro.setProductPrice(rset.getInt("product_price"));
				pro.setProduct1stPic(rset.getString("product_1st_pic"));
				pro.setProductSpecPic(rset.getString("product_spec_pic"));
				pro.setProductIntro(rset.getString("product_intro"));
				pro.setProductInfo(rset.getString("product_info"));
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

	public Product getProduct(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product productInfo = null;
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("productSelectOne");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				productInfo = new Product();
				productInfo.setProductNo(rset.getInt("product_no"));
				productInfo.setProductQuantity(rset.getInt("product_quantity"));
				productInfo.setProductName(rset.getString("product_name"));
				productInfo.setProductPrice(rset.getInt("product_price"));
				productInfo.setProduct1stPic(rset.getString("product_1st_pic"));
				productInfo.setProductSpecPic(rset.getString("product_spec_pic"));
				productInfo.setProductIntro(rset.getString("product_intro"));
				productInfo.setProductInfo(rset.getString("product_info"));
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
	
	public ArrayList<Basket> getMyBasket(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Basket> bList = new ArrayList<Basket>();
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("basketSelect");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Basket b = new Basket();
				b.setBasketNo(rset.getInt("bascket_no"));
				b.setProductName(rset.getString("product_name"));
				b.setProduct1stPic(rset.getString("product_1st_pic"));
				b.setBasketQuantity(rset.getInt("bascket_quantity"));
				b.setProductPrice(rset.getInt("product_price"));
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

	public int deleteBasket(Connection conn, int basketNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
	
		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketDelete");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basketNo);
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
	
	public int insertBasket(Connection conn, int basketQuantity,int memberNo,int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
	
		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketInsert");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basketQuantity);
			pstmt.setInt(2, memberNo);
			pstmt.setInt(3, productNo);
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

	public int updateBasket(Connection conn, int basketQuantity, int basketNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
	
		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketUpdate");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basketQuantity);
			pstmt.setInt(2, basketNo);

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
	
	
	public int insertBuying(Connection conn, int basketNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
	
		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("buyingInsert");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basketNo);
			pstmt.setInt(2, basketNo);
			pstmt.setInt(3, basketNo);
			
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
