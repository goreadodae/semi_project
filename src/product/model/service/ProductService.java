package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import product.model.dao.ProductDao;
import product.model.vo.Basket;
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
	
	//이달의 레시피 정보
	public ArrayList<Product> getThisMonthProduct(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new ProductDao().getThisMonthProduct(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	//로그인계정의 장바구니 정보
	public ArrayList<Basket> getMyBasket(int member_no){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Basket> list = new ProductDao().getMyBasket(conn, member_no);
		JDBCTemplate.close(conn);
		return list;
	}
	
	
	//장바구니 삭제
	public int deleteBasket(int basket_no) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().deleteBasket(conn,basket_no);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}
	
	
	//장바구니 추가
	public int insertBasket(int basket_quantity,int member_no,int product_no) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().insertBasket(conn, basket_quantity, member_no, product_no);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}
	
	//장바구니 수량 변경
	public int updateBasket(int basket_quantity, int basket_no) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().updateBasket(conn, basket_quantity, basket_no);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}
	
	

}
