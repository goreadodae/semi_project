package recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import recipe.model.dao.RecipeDao;
import recipe.model.vo.CommentPageData;
import recipe.model.vo.Process;
import recipe.model.vo.Recipe;
import recipe.model.vo.RecipeComment;
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
		int recordCountPerPage = 12;
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

	public Recipe recipeSelect(int recipeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Recipe recipe = new RecipeDao().recipeSelect(conn, recipeNo);
		JDBCTemplate.close(conn);
		return recipe;
	}

	public ArrayList<Process> processSelect(int recipeNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Process> list = new RecipeDao().processSelect(conn, recipeNo);
		JDBCTemplate.close(conn);
		return list;
	}

	public CommentPageData commentAll(int page, int recipeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 5;
		int naviCountPerPage = 5;
		ArrayList<RecipeComment> list = new RecipeDao().getCurrentPage(conn, page, recordCountPerPage, recipeNo);
		String pageNavi = new RecipeDao().getPageNavi(conn, page, recordCountPerPage, naviCountPerPage, recipeNo);
		JDBCTemplate.close(conn);
		CommentPageData cpd = null;
		if(!list.isEmpty() && !pageNavi.isEmpty()) {
			cpd = new CommentPageData();
			cpd.setDataList(list);
			cpd.setPageNavi(pageNavi);
		}
		return cpd;
	}

	public int writeRecipeComment(int recipeNo, int memberNo, String content) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new RecipeDao().writeRecipeComment(conn, recipeNo, memberNo, content);
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateComment(int commentNo, String content) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new RecipeDao().updateComment(conn, commentNo, content);
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteComment(int commentNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result1 = new RecipeDao().insertDeleteComment(conn, commentNo);
		int result2 = new RecipeDao().deleteComment(conn, commentNo);
		if(result1>0&&result2>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result1*result2;
	}
	
}
