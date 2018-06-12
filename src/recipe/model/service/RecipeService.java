package recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import recipe.model.dao.RecipeDao;
import recipe.model.vo.Recipe;
import recipe.model.vo.RecipePageData;

public class RecipeService {

	public HashMap<Integer, String> getClassCategory() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<Integer, String> classList = new RecipeDao().getCategoryClass(conn);
		JDBCTemplate.close(conn);
		return classList;
	}

	public HashMap<Integer, String> getSituationCategory() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<Integer, String> situationList = new RecipeDao().getCategorySituation(conn);
		JDBCTemplate.close(conn);
		return situationList;
	}

	public HashMap<Integer, String> getMethodCategory() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<Integer, String> methodList = new RecipeDao().getCategoryMethod(conn);
		JDBCTemplate.close(conn);
		return methodList;
	}

	public HashMap<Integer, String> getIngreCategory() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<Integer, String> ingredientList = new RecipeDao().getCategoryIngredient(conn);
		JDBCTemplate.close(conn);
		return ingredientList;
	}

	public RecipePageData recipeAll(int page, String cate1, String cate2, String cate3, String cate4, String order) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		ArrayList<Recipe> list = new RecipeDao().getCurrentPage(conn, page, recordCountPerPage, cate1, cate2, cate3, cate4, order);
		String pageNavi = new RecipeDao().getPageNavi(conn, page, recordCountPerPage, naviCountPerPage, cate1, cate2, cate3, cate4, order);
		JDBCTemplate.close(conn);
		RecipePageData rpd = null;
		if(!list.isEmpty() && !pageNavi.isEmpty()) {
			rpd = new RecipePageData();
			rpd.setDataList(list);
			rpd.setPageNavi(pageNavi);
		}
		return rpd;
	}
	
}
