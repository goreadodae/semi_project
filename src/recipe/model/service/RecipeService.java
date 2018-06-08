package recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
import recipe.model.dao.RecipeDao;

public class RecipeService {

	public HashMap<String, ArrayList<String>> getCategory() {
		Connection conn = JDBCTemplate.getConnection();
		System.out.println(conn);
		HashMap<String, ArrayList<String>> categoryList = null;
		categoryList = new RecipeDao().getCategory(conn);
		JDBCTemplate.close(conn);
		return categoryList;
	}
	
}
