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
	
	// 종류별
	public HashMap<Integer, String> getClassCategory() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<Integer, String> classList = new MainDao().getCategoryClass(conn);
		JDBCTemplate.close(conn);
		
		return classList;
	}

	// 상황별
	public HashMap<Integer, String> getSituationCategory() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<Integer, String> situationList = new MainDao().getCategorySituation(conn);
		JDBCTemplate.close(conn);
		return situationList;
	}

	// 방법별
	public HashMap<Integer, String> getMethodCategory() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<Integer, String> methodList = new MainDao().getCategoryMethod(conn);
		JDBCTemplate.close(conn);
		
		return methodList;
	}

	// 재료별
	public HashMap<Integer, String> getIngreCategory() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<Integer, String> ingredientList = new MainDao().getCategoryIngredient(conn);
		JDBCTemplate.close(conn);
		
		return ingredientList;
	}

	// 레시피 페이지
	public SearchRecipePageData recipeAll(int page, String cate1, String cate2, String cate3, String cate4, String order, String searchVal) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		// 한 페이지 레시피 수
		int recordCountPerPage = 12;
		
		// 페이징 처리
		int naviCountPerPage = 5;
		
		// 전체 레시피
		ArrayList<SearchRecipe> list = new MainDao().getCurrentPage(conn, page, recordCountPerPage, cate1, cate2, cate3, cate4, order, searchVal);
		
		// 레시피 페이지 수 
		String pageNavi = new MainDao().getPageNavi(conn, page, recordCountPerPage, naviCountPerPage, cate1, cate2, cate3, cate4, order, searchVal);
		
		JDBCTemplate.close(conn);
		
		SearchRecipePageData sRPD = null;
		
		if(!list.isEmpty() && !pageNavi.isEmpty()) {
			sRPD = new SearchRecipePageData();
			sRPD.setDataList(list);
			sRPD.setPageNavi(pageNavi);
		}
		
		return sRPD;
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
