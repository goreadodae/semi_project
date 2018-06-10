package recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import recipe.model.dao.RecipeDao;

public class RecipeService {

	public HashMap<String, ArrayList<String>> getCategory() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<String, ArrayList<String>> categoryList = new HashMap<String, ArrayList<String>>();
		ArrayList<String> classList = new RecipeDao().getCategoryClass(conn);
		ArrayList<String> situationList = new RecipeDao().getCategorySituation(conn);
		ArrayList<String> methodList = new RecipeDao().getCategoryMethod(conn);
		ArrayList<String> ingredientList = new RecipeDao().getCategoryIngredient(conn);
		categoryList.put("class", classList);
		categoryList.put("situation", situationList);
		categoryList.put("method", methodList);
		categoryList.put("ingredient", ingredientList);
		JDBCTemplate.close(conn);
		return categoryList;
	}
	
}
