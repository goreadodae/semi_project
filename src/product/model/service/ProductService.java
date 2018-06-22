package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import product.model.dao.ProductDao;
import product.model.vo.Basket;
import product.model.vo.Buying;
import product.model.vo.Ordercall;
import product.model.vo.Product;
import recipe.model.dao.RecipeDao;

public class ProductService {
	//모든 상품 정보
	public ArrayList<Product> getAllProduct(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Product> list = new ProductDao().getAllProduct(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	//상품 상세 정보
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


	//바로 구매하기 버튼을 누를시의 상품 정보(제일 마지막에 담긴 장바구니 정보 가져옴)
	public ArrayList<Basket> getLastBasket(int memberNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Basket> list = new ProductDao().getLastBasket(conn, memberNo);
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

	//1.구매내역 테이블 추가
	public int insertBuying(int basketNo,int orderNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().insertBuying(conn, basketNo, orderNo);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	//3.상품의 남은 수량 감소
	public int updateProduct(int productNo, int basketQuantity) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().updateProduct(conn, productNo, basketQuantity);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	//4.수량초과인 장바구니 모두 삭제
	public int deleteBasketOver(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().deleteBasketOver(conn, productNo);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	//0.주문내역 추가
	public int insertOrdercall(Ordercall oc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ProductDao().insertOrdercall(conn, oc);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}
	
	//0.5 주문내역의 주문번호 받아오기
	public Ordercall getOrderNo(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Ordercall ordercall = new ProductDao().getOrderNo(conn, memberNo);
		JDBCTemplate.close(conn);
		return ordercall;
	}

	//방금 구매한 내역 정보 보기
	public ArrayList<Buying> selectBuyingRecent(int memberNo, int rowCount){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Buying> list = new ProductDao().selectBuyingRecent(conn, memberNo, rowCount);
		JDBCTemplate.close(conn);
		return list;
	}

	//로그인 계정의 전체 주문내역 보기
	public ArrayList<Ordercall> selectOrdercallAll(int memberNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Ordercall> list = new ProductDao().selectOrdercallAll(conn, memberNo);
		JDBCTemplate.close(conn);
		return list;
	}

	//로그인 계정의 전체 구매내역 보기
	public ArrayList<Buying> selectBuyingAll(int memberNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Buying> list = new ProductDao().selectBuyingAll(conn, memberNo);
		JDBCTemplate.close(conn);
		return list;
	}

}
