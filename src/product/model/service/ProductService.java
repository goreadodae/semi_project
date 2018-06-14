package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import product.model.dao.ProductDao;
import product.model.vo.Product;
import recipe.model.dao.RecipeDao;

public class ProductService {
	//모든 제품 정보
	public ArrayList<Product> getAllProduct(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new ProductDao().getAllProduct(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	//프로젝트 상세 정보
	public Product getProduct(int product_no) {
		Connection conn = JDBCTemplate.getConnection();
		Product productInfo = new ProductDao().getProduct(conn,product_no);
		JDBCTemplate.close(conn);
		return productInfo;
	} 
	
	public ArrayList<Product> getThisMonthProduct(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new ProductDao().getThisMonthProduct(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
