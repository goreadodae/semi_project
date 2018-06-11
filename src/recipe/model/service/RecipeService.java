package recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import recipe.model.dao.RecipeDao;

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
	
}
