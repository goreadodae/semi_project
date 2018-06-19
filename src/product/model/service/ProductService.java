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
	public Product getProduct(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		Product productInfo = new ProductDao().getProduct(conn,productNo);
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
	public ArrayList<Basket> getMyBasket(int memberNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Basket> list = new ProductDao().getMyBasket(conn, memberNo);
		JDBCTemplate.close(conn);
		return list;
	}
	
	
	//장바구니 삭제
	public int deleteBasket(int basketNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().deleteBasket(conn,basketNo);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}
	
	
	//장바구니 추가
	public int insertBasket(int basketQuantity,int memberNo,int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().insertBasket(conn, basketQuantity, memberNo, productNo);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}
	
	//장바구니 수량 변경
	public int updateBasket(int basketQuantity, int basketNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().updateBasket(conn, basketQuantity, basketNo);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int insertBuying(int basketNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().insertBuying(conn, basketNo);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}

}
