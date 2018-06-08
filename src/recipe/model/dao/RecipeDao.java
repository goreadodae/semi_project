package recipe.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;

public class RecipeDao {

	public HashMap<String, ArrayList<String>> getCategory(Connection conn) {
		HashMap<String, ArrayList<String>> categoryList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "";
		
		
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return null;
	}

}
