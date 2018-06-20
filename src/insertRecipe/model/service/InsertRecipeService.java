package insertRecipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import insertRecipe.model.dao.InsertRecipeDao;
import insertRecipe.model.vo.InsertRecipe;
import recipe.model.vo.Process;

public class InsertRecipeService {

	public int insertRecipe(ArrayList<Process> stepValuelist) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result =0;

		int MaxNum = new InsertRecipeDao().insertRecipeMaxNum(conn);
		/*int insertRecipeResult = new InsertRecipeDao().insertRecipe(conn,ir,MaxNum);*/
		int insertProcessResult = new InsertRecipeDao().insertRecipeProcess(conn,stepValuelist,MaxNum);
		
		if(insertProcessResult>0) {
			JDBCTemplate.commit(conn);
			result = 1;
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	

	

}
