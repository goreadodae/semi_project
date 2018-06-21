package main.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import main.model.dao.MainDao;
import main.model.vo.MainProduct;
import main.model.vo.MainRecipe;
import main.model.vo.SearchRecipe;
import main.model.vo.SearchRecipePageData;

public class MainService {
	
	// 등록된 레시피 카운트
	public String getTotalRecipe() {
		Connection conn = JDBCTemplate.getConnection();
		String totalRecipe= new MainDao().getTotalRecipe(conn);
		JDBCTemplate.close(conn);
		
		return totalRecipe;
	}
	
	// 이 주의 레시피
	public ArrayList<MainRecipe> getRecipe() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<MainRecipe> list = new MainDao().getRecipe(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	// 이 달의 레시피 
	public ArrayList<MainRecipe> getMonthlyRecipe() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<MainRecipe> list = new MainDao().getMonthlyRecipe(conn);
		JDBCTemplate.close(conn);
		
		return list;
	}

	// 사용자가 레시피 클릭 시 조회수 증가
	public int upViews(int num) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MainDao().upViews(conn, num);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	// 초특가
	public ArrayList<MainProduct> getProduct() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<MainProduct> list = new MainDao().getProduct(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	// 뉴상품
	public ArrayList<MainProduct> getNewProduct() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<MainProduct> list = new MainDao().getNewProduct(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	// 매진임박
	public ArrayList<MainProduct> getImminentProduct() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<MainProduct> list = new MainDao().getImminentProduct(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	// 시즌상품
	public ArrayList<MainProduct> getSeasonProduct() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<MainProduct> list = new MainDao().getSeasonProduct(conn);
		JDBCTemplate.close(conn);
		return list;
	}
}
