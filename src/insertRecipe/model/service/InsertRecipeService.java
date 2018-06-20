package insertRecipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import insertRecipe.model.dao.InsertRecipeDao;
import insertRecipe.model.vo.InsertRecipe;
import recipe.model.vo.Process;
import recipe.model.vo.Recipe;

public class InsertRecipeService {

	public int insertRecipe(Recipe ir, ArrayList<Process> stepValuelist, String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result =0;

		int maxNum = new InsertRecipeDao().insertRecipeMaxNum(conn);
		int insertRecipeResult = new InsertRecipeDao().insertRecipe(conn,ir,maxNum,userId);
		int insertProcessResult = new InsertRecipeDao().insertRecipeProcess(conn,stepValuelist,maxNum);
		
		if(insertRecipeResult>0 && insertProcessResult>0) {
			JDBCTemplate.commit(conn);
			result = 1;
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	

	

}
