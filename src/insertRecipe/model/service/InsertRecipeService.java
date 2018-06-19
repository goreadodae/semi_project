package insertRecipe.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import insertRecipe.model.dao.InsertRecipeDao;
import insertRecipe.model.vo.InsertRecipe;

public class InsertRecipeService {

	public int insertRecipe(InsertRecipe ir) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new InsertRecipeDao().insertRecipe(conn,ir);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
